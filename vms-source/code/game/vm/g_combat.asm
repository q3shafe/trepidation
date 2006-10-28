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
export TeamCP
proc TeamCP 12 8
line 22
;19:
;20:
;21:void TeamCP(char *msg, int team)
;22:{
line 26
;23:	int			i;
;24:	gentity_t	*ent;
;25:
;26:	for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 27
;27:	{
line 28
;28:		if ( level.clients[i].pers.connected == CON_CONNECTED ) 
CNSTI4 3452
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $66
line 29
;29:		{
line 30
;30:			if (g_entities[i].client->sess.sessionTeam == team ) 
CNSTI4 876
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $68
line 31
;31:			{
line 33
;32:				//ent = g_entities[i].client;
;33:				trap_SendServerCommand( i, va("cp \"^9%s\n\"", msg) );
ADDRGP4 $71
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 35
;34:				
;35:			}
LABELV $68
line 36
;36:		}
LABELV $66
line 37
;37:	}
LABELV $62
line 26
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $61
line 38
;38:}
LABELV $60
endproc TeamCP 12 8
export ScorePlum
proc ScorePlum 12 8
line 53
;39:
;40:/*====================================================
;41:
;42:		MOVE THE STUFF ABOVE TO SOME UTILITY AREA
;43:
;44:*/
;45:
;46:
;47:
;48:/*
;49:============
;50:ScorePlum
;51:============
;52:*/
;53:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 56
;54:	gentity_t *plum;
;55:
;56:	plum = G_TempEntity( origin, EV_SCOREPLUM );
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
line 58
;57:	// only send this temp entity to a single client
;58:	plum->r.svFlags |= SVF_SINGLECLIENT;
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
line 59
;59:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 61
;60:	//
;61:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 62
;62:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 63
;63:}
LABELV $72
endproc ScorePlum 12 8
export AddScore
proc AddScore 12 12
line 72
;64:
;65:/*
;66:============
;67:AddScore
;68:
;69:Adds score to both the client and his team
;70:============
;71:*/
;72:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 74
;73:
;74:		if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $74
line 75
;75:			return;
ADDRGP4 $73
JUMPV
LABELV $74
line 78
;76:		}
;77:		// no scoring during pre-match warmup
;78:		if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $76
line 79
;79:			return;
ADDRGP4 $73
JUMPV
LABELV $76
line 82
;80:		}
;81:		// show score plum
;82:		ScorePlum(ent, origin, score);
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
line 84
;83:		//
;84:		ent->client->ps.persistant[PERS_SCORE] += score;
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
line 85
;85:		ent->client->pers.TrueScore = ent->client->ps.persistant[PERS_SCORE];
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
line 87
;86:
;87:	if (g_GameMode.integer != 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $79
line 88
;88:	{
line 89
;89:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $82
line 90
;90:			level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
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
LABELV $82
line 92
;91:	
;92:	}
LABELV $79
line 93
;93:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 94
;94:}
LABELV $73
endproc AddScore 12 12
export TossClientItems
proc TossClientItems 36 12
line 103
;95:
;96:/*
;97:=================
;98:TossClientItems
;99:
;100:Toss the weapon and powerups for the killed player
;101:=================
;102:*/
;103:void TossClientItems( gentity_t *self ) {
line 111
;104:	gitem_t		*item;
;105:	int			weapon;
;106:	float		angle;
;107:	int			i;
;108:	gentity_t	*drop;
;109:
;110:	// drop the weapon if not a gauntlet or machinegun
;111:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 119
;112:
;113:	// make a special check to see if they are changing to a new
;114:	// weapon that isn't the mg or gauntlet.  Without this, a client
;115:	// can pick up a weapon, be killed, and not drop the weapon because
;116:	// their weapon change hasn't completed yet and they are still holding the MG.
;117:	
;118:
;119:		if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) 
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $89
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $87
LABELV $89
line 120
;120:		{
line 121
;121:			if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $90
line 122
;122:				weapon = self->client->pers.cmd.weapon;
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
line 123
;123:			}
LABELV $90
line 124
;124:			if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
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
NEI4 $92
line 125
;125:				weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 126
;126:			}
LABELV $92
line 127
;127:		}
LABELV $87
line 130
;128:
;129:	// Shafe - Trep - Dont drop weapons In Instagib -- 
;130:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $94
line 131
;131:	{
line 133
;132:		
;133:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && self->client->ps.ammo[ weapon ] ) 
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $97
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $97
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
EQI4 $97
line 134
;134:		{
line 136
;135:			// find the item type for this weapon
;136:			item = BG_FindItemForWeapon( weapon );
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
line 139
;137:	
;138:			// spawn the item
;139:			Drop_Item( self, item, 0 );
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
line 140
;140:		} else 
ADDRGP4 $98
JUMPV
LABELV $97
line 141
;141:		{
line 143
;142:			// Else if it's arsenal or survival drop it anyway.
;143:			if (g_GameMode.integer == 2 || g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $103
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $99
LABELV $103
line 144
;144:			{
line 146
;145:				// find the item type for this weapon
;146:				item = BG_FindItemForWeapon( weapon );
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
line 149
;147:	
;148:				// spawn the item
;149:				Drop_Item( self, item, 0 );
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
line 151
;150:
;151:			}
LABELV $99
line 152
;152:		}
LABELV $98
line 153
;153:	} // End Shafe - Trep instagib
LABELV $94
line 159
;154:
;155:
;156:	
;157:
;158:	// drop all the powerups if not in teamplay
;159:	if ( g_gametype.integer != GT_TEAM && g_GameMode.integer != 3 ) {
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $104
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $104
line 160
;160:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 161
;161:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $108
line 162
;162:			if ( self->client->ps.powerups[ i ] > level.time ) {
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
LEI4 $112
line 163
;163:				item = BG_FindItemForPowerup( i );
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
line 164
;164:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 165
;165:					continue;
ADDRGP4 $109
JUMPV
LABELV $115
line 167
;166:				}
;167:				drop = Drop_Item( self, item, angle );
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
line 169
;168:				// decide how many seconds it has left
;169:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
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
line 170
;170:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
GEI4 $118
line 171
;171:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 172
;172:				}
LABELV $118
line 173
;173:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 174
;174:			}
LABELV $112
line 175
;175:		}
LABELV $109
line 161
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $108
line 176
;176:	}
LABELV $104
line 177
;177:}
LABELV $86
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 52 4
line 267
;178:
;179:#ifdef MISSIONPACK
;180:
;181:/*
;182:=================
;183:TossClientCubes
;184:=================
;185:*/
;186:extern gentity_t	*neutralObelisk;
;187:
;188:void TossClientCubes( gentity_t *self ) {
;189:	gitem_t		*item;
;190:	gentity_t	*drop;
;191:	vec3_t		velocity;
;192:	vec3_t		angles;
;193:	vec3_t		origin;
;194:
;195:	self->client->ps.generic1 = 0;
;196:
;197:	// this should never happen but we should never
;198:	// get the server to crash due to skull being spawned in
;199:	if (!G_EntitiesFree()) {
;200:		return;
;201:	}
;202:
;203:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;204:		item = BG_FindItem( "Red Cube" );
;205:	}
;206:	else {
;207:		item = BG_FindItem( "Blue Cube" );
;208:	}
;209:
;210:	angles[YAW] = (float)(level.time % 360);
;211:	angles[PITCH] = 0;	// always forward
;212:	angles[ROLL] = 0;
;213:
;214:	AngleVectors( angles, velocity, NULL, NULL );
;215:	VectorScale( velocity, 150, velocity );
;216:	velocity[2] += 200 + crandom() * 50;
;217:
;218:	if( neutralObelisk ) {
;219:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;220:		origin[2] += 44;
;221:	} else {
;222:		VectorClear( origin ) ;
;223:	}
;224:
;225:	drop = LaunchItem( item, origin, velocity );
;226:
;227:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;228:	drop->think = G_FreeEntity;
;229:	drop->spawnflags = self->client->sess.sessionTeam;
;230:}
;231:
;232:
;233:/*
;234:=================
;235:TossClientPersistantPowerups
;236:=================
;237:*/
;238:void TossClientPersistantPowerups( gentity_t *ent ) {
;239:	gentity_t	*powerup;
;240:
;241:	if( !ent->client ) {
;242:		return;
;243:	}
;244:
;245:	if( !ent->client->persistantPowerup ) {
;246:		return;
;247:	}
;248:
;249:	powerup = ent->client->persistantPowerup;
;250:
;251:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;252:	powerup->s.eFlags &= ~EF_NODRAW;
;253:	powerup->r.contents = CONTENTS_TRIGGER;
;254:	trap_LinkEntity( powerup );
;255:
;256:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;257:	ent->client->persistantPowerup = NULL;
;258:}
;259:#endif
;260:
;261:
;262:/*
;263:==================
;264:LookAtKiller
;265:==================
;266:*/
;267:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 271
;268:	vec3_t		dir;
;269:	vec3_t		angles;
;270:
;271:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $121
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $121
line 272
;272:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
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
line 273
;273:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $122
JUMPV
LABELV $121
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $125
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $125
line 274
;274:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
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
line 275
;275:	} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 276
;276:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
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
line 277
;277:		return;
ADDRGP4 $120
JUMPV
LABELV $126
LABELV $122
line 280
;278:	}
;279:
;280:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
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
line 282
;281:
;282:	angles[YAW] = vectoyaw ( dir );
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
line 283
;283:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 284
;284:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 285
;285:}
LABELV $120
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 8 12
line 292
;286:
;287:/*
;288:==================
;289:GibEntity
;290:==================
;291:*/
;292:void GibEntity( gentity_t *self, int killer ) {
line 313
;293:	gentity_t *ent;
;294:	int i;
;295:
;296:	//if this entity still has kamikaze
;297:	/*
;298:	if (self->s.eFlags & EF_KAMIKAZE) {
;299:		// check if there is a kamikaze timer around for this owner
;300:		for (i = 0; i < MAX_GENTITIES; i++) {
;301:			ent = &g_entities[i];
;302:			if (!ent->inuse)
;303:				continue;
;304:			if (ent->activator != self)
;305:				continue;
;306:			if (strcmp(ent->classname, "kamikaze timer"))
;307:				continue;
;308:			G_FreeEntity(ent);
;309:			break;
;310:		}
;311:	}
;312:	*/
;313:	G_AddEvent( self, EV_GIB_PLAYER, killer );
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
line 314
;314:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 315
;315:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 316
;316:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 317
;317:}
LABELV $131
endproc GibEntity 8 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 321
;318:
;319:
;320:// Shafe - Trep - Headshot Function
;321:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 322
;322:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
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
line 323
;323:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 324
;324:}
LABELV $132
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 332
;325:// Shafe - Trep - End Headshot Function
;326:
;327:/*
;328:==================
;329:body_die
;330:==================
;331:*/
;332:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 333
;333:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $134
line 334
;334:		return;
ADDRGP4 $133
JUMPV
LABELV $134
line 336
;335:	}
;336:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $136
line 337
;337:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 338
;338:		return;
ADDRGP4 $133
JUMPV
LABELV $136
line 341
;339:	}
;340:
;341:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 342
;342:}
LABELV $133
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 345
;343:
;344:// Shafe - Trep - Arsenal Mod
;345:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 347
;346:
;347:	if (g_GameMode.integer != 1) { return qfalse; } // Do nothing unless it's arsenal
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $140
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $140
line 349
;348:
;349:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $143
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $143
line 350
;350:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $145
line 351
;351:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $147
line 352
;352:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $149
line 353
;353:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $151
line 354
;354:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $153
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $153
line 355
;355:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $155
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $155
line 356
;356:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $157
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $157
line 357
;357:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $159
CNSTI4 0
RETI4
ADDRGP4 $139
JUMPV
LABELV $159
line 359
;358:
;359:	return qtrue;
CNSTI4 1
RETI4
LABELV $139
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
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
address $175
address $176
address $177
address $178
address $179
address $180
address $181
address $182
address $183
address $184
address $185
address $186
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 434
;360:}
;361:
;362:
;363:// these are just for logging, the client prints its own messages
;364:char	*modNames[] = {
;365:	"MOD_UNKNOWN",
;366:	"MOD_SHOTGUN",
;367:	"MOD_GAUNTLET",
;368:	"MOD_MACHINEGUN",
;369:	"MOD_GRENADE",
;370:	"MOD_GRENADE_SPLASH",
;371:	"MOD_ROCKET",
;372:	"MOD_ROCKET_SPLASH",
;373:	"MOD_PLASMA",
;374:	"MOD_PLASMA_SPLASH",
;375:	"MOD_RAILGUN",
;376:	"MOD_LIGHTNING",
;377:	"MOD_BFG",
;378:	"MOD_BFG_SPLASH",
;379:	"MOD_WATER",
;380:	"MOD_SLIME",
;381:	"MOD_LAVA",
;382:	"MOD_CRUSH",
;383:	"MOD_TELEFRAG",
;384:	"MOD_FALLING",
;385:	"MOD_SUICIDE",
;386:	"MOD_TARGET_LASER",
;387:	"MOD_TRIGGER_HURT",
;388:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;389:	"MOD_TURRET",
;390:#ifdef MISSIONPACK
;391:	"MOD_NAIL",
;392:	"MOD_CHAINGUN",
;393:	"MOD_PROXIMITY_MINE",
;394:#endif
;395:	"MOD_GRAPPLE"
;396:};
;397:
;398:#ifdef MISSIONPACK
;399:/*
;400:==================
;401:Kamikaze_DeathActivate
;402:==================
;403:*/
;404:void Kamikaze_DeathActivate( gentity_t *ent ) {
;405:	G_StartKamikaze(ent);
;406:	G_FreeEntity(ent);
;407:}
;408:
;409:/*
;410:==================
;411:Kamikaze_DeathTimer
;412:==================
;413:*/
;414:void Kamikaze_DeathTimer( gentity_t *self ) {
;415:	gentity_t *ent;
;416:
;417:	ent = G_Spawn();
;418:	ent->classname = "kamikaze timer";
;419:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;420:	ent->r.svFlags |= SVF_NOCLIENT;
;421:	ent->think = Kamikaze_DeathActivate;
;422:	ent->nextthink = level.time + 5 * 1000;
;423:
;424:	ent->activator = self;
;425:}
;426:
;427:#endif
;428:
;429:/*
;430:==================
;431:CheckAlmostCapture
;432:==================
;433:*/
;434:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 440
;435:	gentity_t	*ent;
;436:	vec3_t		dir;
;437:	char		*classname;
;438:
;439:	// if this player was carrying a flag
;440:	if ( self->client->ps.powerups[PW_REDFLAG] ||
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
NEI4 $191
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $191
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $188
LABELV $191
line 442
;441:		self->client->ps.powerups[PW_BLUEFLAG] ||
;442:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 444
;443:		// get the goal flag this player should have been going for
;444:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $192
line 445
;445:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $195
line 446
;446:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $197
ASGNP4
line 447
;447:			}
ADDRGP4 $193
JUMPV
LABELV $195
line 448
;448:			else {
line 449
;449:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $198
ASGNP4
line 450
;450:			}
line 451
;451:		}
ADDRGP4 $193
JUMPV
LABELV $192
line 452
;452:		else {
line 453
;453:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $199
line 454
;454:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $198
ASGNP4
line 455
;455:			}
ADDRGP4 $200
JUMPV
LABELV $199
line 456
;456:			else {
line 457
;457:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $197
ASGNP4
line 458
;458:			}
LABELV $200
line 459
;459:		}
LABELV $193
line 460
;460:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $201
line 462
;461:		do
;462:		{
line 463
;463:			ent = G_Find(ent, FOFS(classname), classname);
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
line 464
;464:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $202
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $201
LABELV $204
line 466
;465:		// if we found the destination flag and it's not picked up
;466:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $205
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $205
line 468
;467:			// if the player was *very* close
;468:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 469
;469:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $209
line 470
;470:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 471
;471:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 472
;472:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 473
;473:				}
LABELV $211
line 474
;474:			}
LABELV $209
line 475
;475:		}
LABELV $205
line 476
;476:	}
LABELV $188
line 477
;477:}
LABELV $187
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 484
;478:
;479:/*
;480:==================
;481:CheckAlmostScored
;482:==================
;483:*/
;484:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 490
;485:	gentity_t	*ent;
;486:	vec3_t		dir;
;487:	char		*classname;
;488:
;489:	// if the player was carrying cubes
;490:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
line 491
;491:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $216
line 492
;492:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $218
ASGNP4
line 493
;493:		}
ADDRGP4 $217
JUMPV
LABELV $216
line 494
;494:		else {
line 495
;495:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $219
ASGNP4
line 496
;496:		}
LABELV $217
line 497
;497:		ent = G_Find(NULL, FOFS(classname), classname);
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
line 499
;498:		// if we found the destination obelisk
;499:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $220
line 501
;500:			// if the player was *very* close
;501:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 502
;502:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $224
line 503
;503:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 504
;504:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $226
line 505
;505:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 506
;506:				}
LABELV $226
line 507
;507:			}
LABELV $224
line 508
;508:		}
LABELV $220
line 509
;509:	}
LABELV $214
line 510
;510:}
LABELV $213
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $229
skip 4
align 4
LABELV $375
skip 4
export player_die
code
proc player_die 120 28
line 521
;511:
;512:
;513:
;514:/*
;515:==================
;516:player_die
;517:==================
;518:*/
;519:extern int CountSurvivors();
;520:
;521:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 538
;522:	gentity_t	*ent;
;523:	int			anim;
;524:	int			contents;
;525:	int			killer;
;526:	int			i;
;527:	char		*killerName, *obit;
;528:	// Shafe - Trep - For Arsenal
;529:	int			tmpW;
;530:	int			tmpCnt;
;531:	static		int deathNum;
;532:	//gentity_t	*xte;
;533:
;534:
;535:
;536:
;537:
;538:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $230
line 539
;539:		return;
ADDRGP4 $228
JUMPV
LABELV $230
line 542
;540:	}
;541:
;542:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $232
line 543
;543:		return;
ADDRGP4 $228
JUMPV
LABELV $232
line 552
;544:	}
;545:
;546:
;547:
;548:
;549:
;550://unlagged - backward reconciliation #2
;551:	// make sure the body shows up in the client's current position
;552:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 556
;553://unlagged - backward reconciliation #2
;554:
;555:	// check for an almost capture
;556:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 558
;557:	// check for a player that almost brought in cubes
;558:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 561
;559:
;560:
;561:	if (self->client && self->client->hook)
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
EQU4 $235
ADDRLP4 36
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $235
line 562
;562:		Weapon_HookFree(self->client->hook);
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
LABELV $235
line 570
;563:#ifdef MISSIONPACK
;564:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;565:		self->client->ps.eFlags &= ~EF_TICKING;
;566:		self->activator->think = G_FreeEntity;
;567:		self->activator->nextthink = level.time;
;568:	}
;569:#endif
;570:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 573
;571:
;572:	// Shafe - Trep - Clear out the PDG
;573:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 574
;574:	VectorClear( self->teleloc ); 
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
line 576
;575:
;576:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $237
line 577
;577:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 578
;578:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
line 579
;579:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 580
;580:		} else {
ADDRGP4 $238
JUMPV
LABELV $239
line 581
;581:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $241
ASGNP4
line 582
;582:		}
line 583
;583:	} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 584
;584:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 585
;585:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $242
ASGNP4
line 586
;586:	}
LABELV $238
line 588
;587:
;588:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $245
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $243
LABELV $245
line 589
;589:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 590
;590:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $242
ASGNP4
line 591
;591:	}
LABELV $243
line 593
;592:
;593:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 56
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $248
ADDRLP4 56
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $246
LABELV $248
line 594
;594:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $249
ASGNP4
line 595
;595:	} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 596
;596:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 597
;597:	}
LABELV $247
line 599
;598:
;599:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $250
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
line 604
;600:		killer, self->s.number, meansOfDeath, killerName, 
;601:		self->client->pers.netname, obit );
;602:
;603:	// broadcast the death event to everyone
;604:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
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
line 605
;605:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 606
;606:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 607
;607:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 608
;608:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 32
ASGNI4
line 610
;609:
;610:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 612
;611:
;612:	self->client->ps.persistant[PERS_KILLED]++;
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
line 614
;613:
;614:	if (attacker && attacker->client) {
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
EQU4 $251
ADDRLP4 72
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $251
line 615
;615:		attacker->client->lastkilled_client = self->s.number;
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
line 617
;616:
;617:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
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
EQU4 $255
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
EQI4 $253
LABELV $255
line 618
;618:			AddScore( attacker, self->r.currentOrigin, -1 );
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
line 621
;619:			
;620:
;621:		} else {
ADDRGP4 $252
JUMPV
LABELV $253
line 622
;622:			AddScore( attacker, self->r.currentOrigin, 1 );
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
line 624
;623:
;624:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $256
line 627
;625:				
;626:				// play humiliation on player
;627:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 630
;628:
;629:				// add the sprite over the player's head
;630:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 631
;631:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
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
line 632
;632:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 635
;633:
;634:				// also play humiliation on target
;635:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
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
line 636
;636:			}
LABELV $256
line 640
;637:
;638:			// check for two kills in a short amount of time
;639:			// if this is close enough to the last kill, give a reward sound
;640:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
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
GEI4 $259
line 642
;641:				// play excellent on player
;642:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 645
;643:
;644:				// add the sprite over the player's head
;645:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 646
;646:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
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
line 647
;647:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 648
;648:			}
LABELV $259
line 649
;649:			attacker->client->lastKillTime = level.time;
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
line 651
;650:
;651:		}
line 652
;652:	} else {
ADDRGP4 $252
JUMPV
LABELV $251
line 653
;653:		AddScore( self, self->r.currentOrigin, -1 );
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
line 654
;654:	}
LABELV $252
line 657
;655:
;656:	// Add team bonuses
;657:	Team_FragBonuses(self, inflictor, attacker);
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
line 660
;658:
;659:	// if I committed suicide, the flag does not fall, it returns.
;660:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $264
line 661
;661:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
line 662
;662:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 663
;663:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 664
;664:		}
ADDRGP4 $267
JUMPV
LABELV $266
line 665
;665:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $268
line 666
;666:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 667
;667:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 668
;668:		}
ADDRGP4 $269
JUMPV
LABELV $268
line 669
;669:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 670
;670:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 671
;671:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 672
;672:		}
LABELV $270
LABELV $269
LABELV $267
line 673
;673:	}
LABELV $264
line 676
;674:
;675:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;676:	contents = trap_PointContents( self->r.currentOrigin, -1 );
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
line 677
;677:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $272
line 678
;678:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 679
;679:	}
ADDRGP4 $273
JUMPV
LABELV $272
line 680
;680:	else {
line 681
;681:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $274
line 682
;682:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 683
;683:		}
ADDRGP4 $275
JUMPV
LABELV $274
line 684
;684:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 685
;685:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 686
;686:		}
ADDRGP4 $277
JUMPV
LABELV $276
line 687
;687:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $278
line 688
;688:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 689
;689:		}
LABELV $278
LABELV $277
LABELV $275
line 690
;690:	}
LABELV $273
line 699
;691:#ifdef MISSIONPACK
;692:	TossClientPersistantPowerups( self );
;693:	if( g_gametype.integer == GT_HARVESTER ) {
;694:		TossClientCubes( self );
;695:	}
;696:#endif
;697:
;698:	
;699:	if ((level.firstStrike == qfalse) && (!level.warmupTime))
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 level+9236
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $280
ADDRGP4 level+16
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $280
line 700
;700:	{
line 701
;701:		if (self != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $284
line 702
;702:		{
line 703
;703:			level.firstStrike = qtrue;
ADDRGP4 level+9236
CNSTI4 1
ASGNI4
line 704
;704:			BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $287
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 705
;705:			trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $288
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
line 706
;706:		}
LABELV $284
line 707
;707:	}
LABELV $280
line 709
;708:
;709:	if (level.warmupTime != 0)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $289
line 710
;710:	{
line 711
;711:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 713
;712:		//trap_SendServerCommand( -1, va("print \"%s FS Is FALSE!!\n\"",attacker->client->pers.netname));	
;713:	} 
LABELV $289
line 717
;714:		
;715:	
;716:		// Shafe - Trep - Arsenal Stuff
;717:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $293
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $293
ADDRGP4 level+16
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $293
line 718
;718:		{
line 719
;719:			tmpW = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 721
;720:
;721:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $297
line 722
;722:			{
line 723
;723:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 16
INDIRI4
CNSTI4 9
NEI4 $300
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $300
line 724
;724:				if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 16
INDIRI4
CNSTI4 8
NEI4 $302
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $302
line 725
;725:				if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 7
NEI4 $304
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $304
line 726
;726:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 6
NEI4 $306
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $306
line 727
;727:				if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 5
NEI4 $308
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $308
line 728
;728:				if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 4
NEI4 $310
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $310
line 729
;729:				if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 3
NEI4 $312
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $312
line 730
;730:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $314
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $314
line 731
;731:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $316
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $316
line 733
;732:
;733:			}
LABELV $297
line 736
;734:			
;735:			
;736:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $321
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
EQI4 $318
LABELV $321
line 737
;737:			{
line 740
;738:				
;739:				// Arsenal Message
;740:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $322
line 741
;741:				{
line 742
;742:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $325
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
line 743
;743:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $326
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
line 744
;744:				}
LABELV $322
line 747
;745:
;746:				// LMS Message
;747:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $327
line 748
;748:				{
line 749
;749:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $330
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
line 750
;750:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $331
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
line 751
;751:				}
LABELV $327
line 754
;752:				
;753:				// Send them to Spec
;754:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
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
line 755
;755:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 756
;756:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $332
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 758
;757:				// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;758:				level.lastClient == attacker->client;
line 760
;759:
;760:				tmpCnt = (CountSurvivors());
ADDRLP4 100
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 100
INDIRI4
ASGNI4
line 763
;761:
;762:						
;763:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9228
INDIRI4
EQI4 $334
line 764
;764:				{
line 766
;765:
;766:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9228
ADDRLP4 28
INDIRI4
ASGNI4
line 769
;767:			
;768:			
;769:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $338
line 770
;770:					{
line 771
;771:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $340
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 772
;772:					}
LABELV $338
line 774
;773:					
;774:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $341
line 775
;775:					{
line 776
;776:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $343
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 777
;777:					}
LABELV $341
line 779
;778:
;779:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $344
line 780
;780:					{
line 781
;781:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $346
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 782
;782:					}
LABELV $344
line 784
;783:
;784:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $347
line 785
;785:					{
line 787
;786:						
;787:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $349
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 788
;788:					}
LABELV $347
line 790
;789:
;790:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $350
line 791
;791:					{
line 792
;792:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $352
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 794
;793:
;794:					}
LABELV $350
line 796
;795:				
;796:				}
LABELV $334
line 797
;797:			} 
LABELV $318
line 799
;798:
;799:		}
LABELV $293
line 802
;800:		// End Arsenal Stuff
;801:
;802:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 805
;803:	// send updated scores to any clients that are following this one,
;804:	// or they would get stale scoreboards
;805:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $356
JUMPV
LABELV $353
line 808
;806:		gclient_t	*client;
;807:
;808:		client = &level.clients[i];
ADDRLP4 92
CNSTI4 3452
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 809
;809:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 92
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $358
line 810
;810:			continue;
ADDRGP4 $354
JUMPV
LABELV $358
line 812
;811:		}
;812:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 92
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $360
line 813
;813:			continue;
ADDRGP4 $354
JUMPV
LABELV $360
line 815
;814:		}
;815:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 92
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $362
line 816
;816:			Cmd_Score_f( g_entities + i );
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
line 817
;817:		}
LABELV $362
line 818
;818:	}
LABELV $354
line 805
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $356
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $353
line 820
;819:
;820:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 822
;821:
;822:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 823
;823:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 824
;824:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 826
;825:
;826:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 827
;827:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 828
;828:	LookAtKiller (self, inflictor, attacker);
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
line 830
;829:
;830:	VectorCopy( self->s.angles, self->client->ps.viewangles );
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
line 832
;831:
;832:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 834
;833:
;834:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 3238002688
ASGNF4
line 838
;835:
;836:	// don't allow respawn until the death anim is done
;837:	// g_forcerespawn may force spawning at some later time
;838:	self->client->respawnTime = level.time + 1700;  // This is the real line
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
line 843
;839:	
;840:
;841:
;842:	// remove powerups
;843:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
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
line 845
;844:
;845:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $365
line 846
;846:	{
line 847
;847:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $367
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 848
;848:	}
LABELV $365
line 853
;849:
;850:
;851:
;852:	// never gib in a nodrop
;853:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $374
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $374
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $374
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $371
LABELV $374
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $368
LABELV $371
line 855
;854:		// gib death
;855:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 856
;856:	} else {
ADDRGP4 $369
JUMPV
LABELV $368
line 860
;857:		// normal death
;858:		static int i;
;859:
;860:		switch ( i ) {
ADDRLP4 96
ADDRGP4 $375
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $378
ADDRLP4 96
INDIRI4
CNSTI4 1
EQI4 $379
ADDRLP4 96
INDIRI4
CNSTI4 2
EQI4 $380
ADDRGP4 $376
JUMPV
LABELV $378
line 862
;861:		case 0:
;862:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 863
;863:			break;
ADDRGP4 $377
JUMPV
LABELV $379
line 865
;864:		case 1:
;865:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 866
;866:			break;
ADDRGP4 $377
JUMPV
LABELV $380
LABELV $376
line 869
;867:		case 2:
;868:		default:
;869:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 870
;870:			break;
LABELV $377
line 875
;871:		}
;872:
;873:		// for the no-blood option, we need to prevent the health
;874:		// from going to gib level
;875:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $381
line 876
;876:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 877
;877:		}
LABELV $381
line 879
;878:
;879:		self->client->ps.legsAnim = 
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
line 881
;880:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;881:		self->client->ps.torsoAnim = 
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
line 884
;882:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;883:
;884:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
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
line 887
;885:
;886:		// Shafe - Trep Headshot //////////////////////////////////////////
;887:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $383
line 888
;888:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $384
JUMPV
LABELV $383
line 890
;889:		else
;890:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
LABELV $384
line 894
;891:		// Shafe - Trep - End Headshot /////////////////////////////
;892:
;893:		// the body can still be gibbed
;894:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 897
;895:
;896:		// globally cycle through the different death animations
;897:		i = ( i + 1 ) % 3;
ADDRLP4 116
ADDRGP4 $375
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
line 906
;898:
;899:
;900:
;901:#ifdef MISSIONPACK
;902:		if (self->s.eFlags & EF_KAMIKAZE) {
;903:			Kamikaze_DeathTimer( self );
;904:		}
;905:#endif
;906:	}
LABELV $369
line 911
;907:
;908:	
;909:
;910:
;911:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 913
;912:
;913:}
LABELV $228
endproc player_die 120 28
export CheckArmor
proc CheckArmor 20 4
line 922
;914:
;915:
;916:/*
;917:================
;918:CheckArmor
;919:================
;920:*/
;921:int CheckArmor (gentity_t *ent, int damage, int dflags)
;922:{
line 927
;923:	gclient_t	*client;
;924:	int			save;
;925:	int			count;
;926:
;927:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $386
line 928
;928:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $385
JUMPV
LABELV $386
line 930
;929:
;930:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 932
;931:
;932:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $388
line 933
;933:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $385
JUMPV
LABELV $388
line 935
;934:
;935:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $390
line 936
;936:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $385
JUMPV
LABELV $390
line 939
;937:
;938:	// armor
;939:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 940
;940:	save = ceil( damage * ARMOR_PROTECTION );
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
line 941
;941:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $392
line 942
;942:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $392
line 944
;943:
;944:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $394
line 945
;945:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $385
JUMPV
LABELV $394
line 947
;946:
;947:	client->ps.stats[STAT_ARMOR] -= save;
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
line 949
;948:
;949:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $385
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 957
;950:}
;951:
;952:/*
;953:================
;954:RaySphereIntersections
;955:================
;956:*/
;957:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 966
;958:	float b, c, d, t;
;959:
;960:	//	| origin - (point + t * dir) | = radius
;961:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;962:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;963:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;964:
;965:	// normalize dir so a = 1
;966:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 967
;967:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 968
;968:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 973
;969:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;970:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;971:		radius * radius;
;972:
;973:	d = b * b - 4 * c;
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
line 974
;974:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $397
line 975
;975:		t = (- b + sqrt(d)) / 2;
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
line 976
;976:		VectorMA(point, t, dir, intersections[0]);
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
line 977
;977:		t = (- b - sqrt(d)) / 2;
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
line 978
;978:		VectorMA(point, t, dir, intersections[1]);
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
line 979
;979:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $396
JUMPV
LABELV $397
line 981
;980:	}
;981:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $399
line 982
;982:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 983
;983:		VectorMA(point, t, dir, intersections[0]);
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
line 984
;984:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $396
JUMPV
LABELV $399
line 986
;985:	}
;986:	return 0;
CNSTI4 0
RETI4
LABELV $396
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 1053
;987:}
;988:
;989:#ifdef MISSIONPACK
;990:/*
;991:================
;992:G_InvulnerabilityEffect
;993:================
;994:*/
;995:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;996:	gentity_t	*impact;
;997:	vec3_t		intersections[2], vec;
;998:	int			n;
;999:
;1000:	if ( !targ->client ) {
;1001:		return qfalse;
;1002:	}
;1003:	VectorCopy(dir, vec);
;1004:	VectorInverse(vec);
;1005:	// sphere model radius = 42 units
;1006:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;1007:	if (n > 0) {
;1008:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;1009:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;1010:		vectoangles(vec, impact->s.angles);
;1011:		impact->s.angles[0] += 90;
;1012:		if (impact->s.angles[0] > 360)
;1013:			impact->s.angles[0] -= 360;
;1014:		if ( impactpoint ) {
;1015:			VectorCopy( intersections[0], impactpoint );
;1016:		}
;1017:		if ( bouncedir ) {
;1018:			VectorCopy( vec, bouncedir );
;1019:			VectorNormalize( bouncedir );
;1020:		}
;1021:		return qtrue;
;1022:	}
;1023:	else {
;1024:		return qfalse;
;1025:	}
;1026:}
;1027:#endif
;1028:/*
;1029:============
;1030:T_Damage
;1031:
;1032:targ		entity that is being damaged
;1033:inflictor	entity that is causing the damage
;1034:attacker	entity that caused the inflictor to damage targ
;1035:	example: targ=monster, inflictor=rocket, attacker=player
;1036:
;1037:dir			direction of the attack for knockback
;1038:point		point at which the damage is being inflicted, used for headshots
;1039:damage		amount of damage being inflicted
;1040:knockback	force to be applied against targ as a result of the damage
;1041:
;1042:inflictor, attacker, dir, and point can be NULL for environmental effects
;1043:
;1044:dflags		these flags are used to control how T_Damage works
;1045:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;1046:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;1047:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;1048:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1049:============
;1050:*/
;1051:
;1052:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1053:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1071
;1054:	gclient_t	*client;
;1055:	int			take;
;1056:	int			save;
;1057:	int			asave;
;1058:	int			knockback;
;1059:	int			max;
;1060:	// Shafe - Trep - Headshot
;1061:	float		z_ratio;
;1062:	float		z_rel;
;1063:	int			height;
;1064:	float		targ_maxs2;
;1065:	// Shafe - Trep - End Headshot
;1066:
;1067:#ifdef MISSIONPACK
;1068:	vec3_t		bouncedir, impactpoint;
;1069:#endif
;1070:
;1071:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $402
line 1072
;1072:		return;
ADDRGP4 $401
JUMPV
LABELV $402
line 1077
;1073:	}
;1074:
;1075:	// the intermission has allready been qualified for, so don't
;1076:	// allow any extra scoring
;1077:	if ( level.intermissionQueued ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
EQI4 $404
line 1078
;1078:		return;
ADDRGP4 $401
JUMPV
LABELV $404
line 1082
;1079:	}
;1080:
;1081:	// Grapple hook cannot be used to damage a buildable
;1082:	if (targ->s.eType ==ET_TURRET && mod == MOD_GRAPPLE && g_GrappleMode.integer == 1)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $407
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $407
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $407
line 1083
;1083:	{
line 1084
;1084:		return;
ADDRGP4 $401
JUMPV
LABELV $407
line 1100
;1085:	}
;1086:
;1087:
;1088:	
;1089:
;1090:#ifdef MISSIONPACK
;1091:	if ( targ->client && mod != MOD_JUICED) {
;1092:		if ( targ->client->invulnerabilityTime > level.time) {
;1093:			if ( dir && point ) {
;1094:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1095:			}
;1096:			return;
;1097:		}
;1098:	}
;1099:#endif
;1100:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $410
line 1101
;1101:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+895272
ASGNP4
line 1102
;1102:	}
LABELV $410
line 1103
;1103:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $413
line 1104
;1104:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+895272
ASGNP4
line 1105
;1105:	}
LABELV $413
line 1110
;1106:
;1107:	
;1108:
;1109:	// shootable doors / buttons don't actually have any health
;1110:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $416
line 1111
;1111:		if ( targ->use && targ->moverState == MOVER_POS1 || targ->moverState == ROTATOR_POS1) {
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
EQU4 $421
ADDRLP4 44
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
LABELV $421
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $401
LABELV $420
line 1112
;1112:			targ->use( targ, inflictor, attacker );
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
line 1113
;1113:		}
line 1114
;1114:		return;
ADDRGP4 $401
JUMPV
LABELV $416
line 1118
;1115:	}
;1116:
;1117:	// If we shot a breakable item subtract the damage from its health and try to break it
;1118: 	if ( targ->s.eType == ET_BREAKABLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $422
line 1119
;1119:         targ->health -= damage;
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
line 1120
;1120: 		G_BreakGlass( targ, point, mod );
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
line 1121
;1121: 		return;
ADDRGP4 $401
JUMPV
LABELV $422
line 1130
;1122: 	}
;1123:#ifdef MISSIONPACK
;1124:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1125:		return;
;1126:	}
;1127:#endif
;1128:	// reduce damage by the attacker's handicap value
;1129:	// unless they are rocket jumping
;1130:	if ( attacker->client && attacker != targ ) {
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
EQU4 $424
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $424
line 1131
;1131:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
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
line 1137
;1132:#ifdef MISSIONPACK
;1133:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1134:			max /= 2;
;1135:		}
;1136:#endif
;1137:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1138
;1138:	}
LABELV $424
line 1140
;1139:
;1140:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1142
;1141:
;1142:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $426
line 1143
;1143:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 1144
;1144:			return;
ADDRGP4 $401
JUMPV
LABELV $428
line 1146
;1145:		}
;1146:	}
LABELV $426
line 1148
;1147:
;1148:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $430
line 1149
;1149:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1150
;1150:	} else {
ADDRGP4 $431
JUMPV
LABELV $430
line 1151
;1151:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1152
;1152:	}
LABELV $431
line 1154
;1153:
;1154:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1155
;1155:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $432
line 1156
;1156:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1157
;1157:	}
LABELV $432
line 1158
;1158:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $434
line 1159
;1159:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1160
;1160:	}
LABELV $434
line 1161
;1161:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $436
line 1162
;1162:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1163
;1163:	}
LABELV $436
line 1166
;1164:
;1165:	// figure momentum add, even if the damage won't be taken
;1166:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $438
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $438
line 1170
;1167:		vec3_t	kvel;
;1168:		float	mass;
;1169:
;1170:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1172
;1171:
;1172:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1173
;1173:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
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
line 1177
;1174:
;1175:		// set the timer so that the other client can't cancel
;1176:		// out the movement immediately
;1177:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $447
line 1180
;1178:			int		t;
;1179:
;1180:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1181
;1181:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $449
line 1182
;1182:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1183
;1183:			}
LABELV $449
line 1184
;1184:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $451
line 1185
;1185:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1186
;1186:			}
LABELV $451
line 1187
;1187:			targ->client->ps.pm_time = t;
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
line 1188
;1188:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1189
;1189:		}
LABELV $447
line 1190
;1190:	}
LABELV $438
line 1193
;1191:
;1192:	// check for completely getting out of the damage
;1193:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $453
line 1200
;1194:
;1195:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1196:		// if the attacker was on the same team
;1197:#ifdef MISSIONPACK
;1198:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1199:#else	
;1200:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $455
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
EQI4 $455
line 1202
;1201:#endif
;1202:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $457
line 1203
;1203:				return;
ADDRGP4 $401
JUMPV
LABELV $457
line 1205
;1204:			}
;1205:		}
LABELV $455
line 1208
;1206:
;1207:
;1208:	if (targ->s.eType ==ET_TURRET && mod == MOD_GRAPPLE && g_GrappleMode.integer == 2)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $460
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $460
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 2
NEI4 $460
line 1209
;1209:	{
line 1211
;1210:		//targ->client->ps.speed = 0;
;1211:		targ->immobilized == qtrue;
line 1212
;1212:		return;
ADDRGP4 $401
JUMPV
LABELV $460
line 1217
;1213:	}
;1214:
;1215:	
;1216:	// No Team Killing Of MC -  Make this a cvar
;1217:	if ((targ->s.eType ==ET_TURRET) && (targ->s.team == attacker->client->sess.sessionTeam))
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $463
ADDRLP4 60
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
NEI4 $463
line 1218
;1218:	{
line 1219
;1219:		if ((!strcmp(targ->classname, "mc")) && (g_PCTeamkills.integer == 0))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 64
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $465
ADDRGP4 g_PCTeamkills+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $465
line 1220
;1220:		{
line 1221
;1221:			return;
ADDRGP4 $401
JUMPV
LABELV $465
line 1223
;1222:		}
;1223:	}
LABELV $463
line 1226
;1224:
;1225:	
;1226:	if ((targ->s.eType ==ET_TURRET) && (targ->health < 750))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $469
ADDRLP4 64
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 750
GEI4 $469
line 1227
;1227:	{
line 1228
;1228:		if (!strcmp(targ->classname, "mc"))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 68
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $471
line 1229
;1229:		{	
line 1230
;1230:				TeamCP("^9Power Core is Under Attack!",targ->s.team);
ADDRGP4 $473
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRGP4 TeamCP
CALLV
pop
line 1231
;1231:		}
LABELV $471
line 1232
;1232:	}
LABELV $469
line 1248
;1233:	
;1234:
;1235:
;1236:#ifdef MISSIONPACK
;1237:		if (mod == MOD_PROXIMITY_MINE) {
;1238:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1239:				return;
;1240:			}
;1241:			if (targ == attacker) {
;1242:				return;
;1243:			}
;1244:		}
;1245:#endif
;1246:
;1247:		// check for godmode
;1248:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $474
line 1249
;1249:			return;
ADDRGP4 $401
JUMPV
LABELV $474
line 1251
;1250:		}
;1251:	}
LABELV $453
line 1255
;1252:
;1253:	// battlesuit protects from all radius damage (but takes knockback)
;1254:	// and protects 50% against all damage
;1255:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $476
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 1256
;1256:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1257
;1257:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $480
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $478
LABELV $480
line 1258
;1258:			return;
ADDRGP4 $401
JUMPV
LABELV $478
line 1260
;1259:		}
;1260:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1261
;1261:	}
LABELV $476
line 1264
;1262:
;1263:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1264:	if ( attacker->client && targ != attacker && targ->health > 0
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
EQU4 $481
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
EQU4 $481
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
LEI4 $481
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
EQI4 $481
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $481
line 1266
;1265:			&& targ->s.eType != ET_MISSILE
;1266:			&& targ->s.eType != ET_GENERAL) {
line 1267
;1267:		if ( OnSameTeam( targ, attacker ) ) {
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
EQI4 $483
line 1268
;1268:			attacker->client->ps.persistant[PERS_HITS]--;
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
line 1269
;1269:		} else {
ADDRGP4 $484
JUMPV
LABELV $483
line 1270
;1270:			attacker->client->ps.persistant[PERS_HITS]++;
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
line 1271
;1271:		}
LABELV $484
line 1272
;1272:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
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
line 1273
;1273:	}
LABELV $481
line 1277
;1274:
;1275:	// always give half damage if hurting self
;1276:	// calculated after knockback, so rocket jumping works
;1277:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $485
line 1278
;1278:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1279
;1279:	}
LABELV $485
line 1281
;1280:
;1281:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $487
line 1282
;1282:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1283
;1283:	}
LABELV $487
line 1284
;1284:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1285
;1285:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1288
;1286:
;1287:	// save some from armor
;1288:	asave = CheckArmor (targ, take, dflags);
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
line 1289
;1289:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1291
;1290:
;1291:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $489
line 1292
;1292:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $492
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
line 1294
;1293:			targ->health, take, asave );
;1294:	}
LABELV $489
line 1299
;1295:
;1296:	// add to the damage inflicted on a player this frame
;1297:	// the total will be turned into screen blends and view angle kicks
;1298:	// at the end of the frame
;1299:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $494
line 1300
;1300:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $496
line 1301
;1301:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1302
;1302:		} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 1303
;1303:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1304
;1304:		}
LABELV $497
line 1305
;1305:		client->damage_armor += asave;
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
line 1306
;1306:		client->damage_blood += take;
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
line 1307
;1307:		client->damage_knockback += knockback;
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
line 1308
;1308:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 1309
;1309:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1310
;1310:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 1311
;1311:		} else {
ADDRGP4 $499
JUMPV
LABELV $498
line 1312
;1312:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
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
line 1313
;1313:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 1
ASGNI4
line 1314
;1314:		}
LABELV $499
line 1315
;1315:	}
LABELV $494
line 1321
;1316:
;1317:	// See if it's the player hurting the emeny flag carrier
;1318:#ifdef MISSIONPACK
;1319:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1320:#else	
;1321:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $500
line 1323
;1322:#endif
;1323:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1324
;1324:	}
LABELV $500
line 1326
;1325:
;1326:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
line 1328
;1327:		// set the last client who damaged the target
;1328:		targ->client->lasthurt_client = attacker->s.number;
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
line 1329
;1329:		targ->client->lasthurt_mod = mod;
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
line 1330
;1330:	}
LABELV $503
line 1333
;1331:
;1332:	// Shafe - Trep - Headshots
;1333:	if (targ->client && attacker->client && targ->health > 0)
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
EQU4 $505
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $505
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
LEI4 $505
line 1334
;1334:	{   
line 1336
;1335:		// let's say only railgun can do head shots
;1336:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $507
line 1337
;1337:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ASGNF4
line 1340
;1338:	
;1339:			// handling crouching
;1340:			if(targ->client->ps.pm_flags & PMF_DUCKED){
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
EQI4 $509
line 1341
;1341:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
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
line 1342
;1342:			}
ADDRGP4 $510
JUMPV
LABELV $509
line 1344
;1343:			else
;1344:				height = abs(targ->r.mins[2]) + targ_maxs2; 
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
LABELV $510
line 1349
;1345:				
;1346:			// project the z component of point 
;1347:			// onto the z component of the model's origin
;1348:			// this results in the z component from the origin at 0
;1349:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
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
line 1350
;1350:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1352
;1351:		
;1352:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $511
line 1353
;1353:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1354
;1354:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1355
;1355:			}
LABELV $511
line 1356
;1356:		}
LABELV $507
line 1357
;1357:	}
LABELV $505
line 1362
;1358:	// Shafe - Trep - End Headshot Code
;1359:
;1360:
;1361:	// do the damage
;1362:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $513
line 1363
;1363:		targ->health = targ->health - take;
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
line 1364
;1364:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $515
line 1365
;1365:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
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
line 1366
;1366:		}
LABELV $515
line 1368
;1367:			
;1368:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $517
line 1369
;1369:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $519
line 1370
;1370:				targ->flags |= FL_NO_KNOCKBACK;
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
LABELV $519
line 1372
;1371:
;1372:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $521
line 1373
;1373:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -999
ASGNI4
LABELV $521
line 1375
;1374:
;1375:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1376
;1376:			targ->die (targ, inflictor, attacker, take, mod);
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
line 1377
;1377:			return;
ADDRGP4 $401
JUMPV
LABELV $517
line 1378
;1378:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1379
;1379:			targ->pain (targ, attacker, take);
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
line 1380
;1380:		}
LABELV $523
line 1381
;1381:	}
LABELV $513
line 1383
;1382:
;1383:}
LABELV $401
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1394
;1384:
;1385:
;1386:/*
;1387:============
;1388:CanDamage
;1389:
;1390:Returns qtrue if the inflictor can directly damage the target.  Used for
;1391:explosions and melee attacks.
;1392:============
;1393:*/
;1394:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1401
;1395:	vec3_t	dest;
;1396:	trace_t	tr;
;1397:	vec3_t	midpoint;
;1398:
;1399:	// use the midpoint of the bounds instead of the origin, because
;1400:	// bmodels may have their origin is 0,0,0
;1401:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
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
line 1402
;1402:	VectorScale (midpoint, 0.5, midpoint);
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
line 1404
;1403:
;1404:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1405
;1405:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1406
;1406:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $536
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $532
LABELV $536
line 1407
;1407:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $525
JUMPV
LABELV $532
line 1411
;1408:
;1409:	// this should probably check in the plane of projection, 
;1410:	// rather than in world coordinate, and also include Z
;1411:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1412
;1412:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1413
;1413:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1414
;1414:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1415
;1415:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $538
line 1416
;1416:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $525
JUMPV
LABELV $538
line 1418
;1417:
;1418:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1419
;1419:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1420
;1420:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1421
;1421:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1422
;1422:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $542
line 1423
;1423:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $525
JUMPV
LABELV $542
line 1425
;1424:
;1425:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1426
;1426:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1427
;1427:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1428
;1428:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1429
;1429:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $546
line 1430
;1430:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $525
JUMPV
LABELV $546
line 1432
;1431:
;1432:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1433
;1433:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1434
;1434:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1435
;1435:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1436
;1436:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $550
line 1437
;1437:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $525
JUMPV
LABELV $550
line 1440
;1438:
;1439:
;1440:	return qfalse;
CNSTI4 0
RETI4
LABELV $525
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1450
;1441:}
;1442:
;1443:
;1444:/*
;1445:============
;1446:G_RadiusDamage
;1447:============
;1448:*/
;1449:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1450:					 gentity_t *ignore, int mod) {
line 1459
;1451:	float		points, dist;
;1452:	gentity_t	*ent;
;1453:	int			entityList[MAX_GENTITIES];
;1454:	int			numListedEntities;
;1455:	vec3_t		mins, maxs;
;1456:	vec3_t		v;
;1457:	vec3_t		dir;
;1458:	int			i, e;
;1459:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1461
;1460:
;1461:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $554
line 1462
;1462:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1463
;1463:	}
LABELV $554
line 1465
;1464:
;1465:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $556
line 1466
;1466:		mins[i] = origin[i] - radius;
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
line 1467
;1467:		maxs[i] = origin[i] + radius;
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
line 1468
;1468:	}
LABELV $557
line 1465
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $556
line 1470
;1469:
;1470:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1472
;1471:
;1472:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $563
JUMPV
LABELV $560
line 1473
;1473:		ent = &g_entities[entityList[ e ]];
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
line 1475
;1474:
;1475:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $564
line 1476
;1476:			continue;
ADDRGP4 $561
JUMPV
LABELV $564
line 1477
;1477:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $566
line 1478
;1478:			continue;
ADDRGP4 $561
JUMPV
LABELV $566
line 1481
;1479:
;1480:		// find the distance from the edge of the bounding box
;1481:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $568
line 1482
;1482:			if ( origin[i] < ent->r.absmin[i] ) {
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
GEF4 $572
line 1483
;1483:				v[i] = ent->r.absmin[i] - origin[i];
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
line 1484
;1484:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $573
JUMPV
LABELV $572
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
LEF4 $574
line 1485
;1485:				v[i] = origin[i] - ent->r.absmax[i];
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
line 1486
;1486:			} else {
ADDRGP4 $575
JUMPV
LABELV $574
line 1487
;1487:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1488
;1488:			}
LABELV $575
LABELV $573
line 1489
;1489:		}
LABELV $569
line 1481
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $568
line 1491
;1490:
;1491:		dist = VectorLength( v );
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
line 1492
;1492:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $576
line 1493
;1493:			continue;
ADDRGP4 $561
JUMPV
LABELV $576
line 1496
;1494:		}
;1495:
;1496:		points = damage * ( 1.0 - dist / radius );
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
line 1498
;1497:
;1498:		if( CanDamage (ent, origin) ) {
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
EQI4 $578
line 1499
;1499:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $580
line 1500
;1500:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1501
;1501:			}
LABELV $580
line 1502
;1502:			VectorSubtract (ent->r.currentOrigin, origin, dir);
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
line 1505
;1503:			// push the center of mass higher than the origin so players
;1504:			// get knocked into the air more
;1505:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1506
;1506:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1507
;1507:		}
LABELV $578
line 1508
;1508:	}
LABELV $561
line 1472
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $563
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $560
line 1510
;1509:
;1510:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $553
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
LABELV $492
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
LABELV $473
byte 1 94
byte 1 57
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
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 33
byte 1 0
align 1
LABELV $467
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $367
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
LABELV $352
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
LABELV $349
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
LABELV $346
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
LABELV $343
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
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $332
byte 1 115
byte 1 0
align 1
LABELV $331
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
LABELV $330
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
LABELV $326
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
LABELV $325
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
LABELV $288
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
LABELV $287
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
LABELV $250
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
LABELV $249
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
LABELV $242
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $241
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
LABELV $219
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
LABELV $218
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
LABELV $198
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
LABELV $197
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
LABELV $186
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
LABELV $185
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
LABELV $184
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
LABELV $183
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
LABELV $182
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
LABELV $181
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
LABELV $180
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
LABELV $179
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
LABELV $178
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
LABELV $177
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
LABELV $176
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
LABELV $175
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
LABELV $174
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
LABELV $173
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
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
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $164
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
LABELV $163
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
LABELV $162
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
LABELV $161
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
align 1
LABELV $71
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
