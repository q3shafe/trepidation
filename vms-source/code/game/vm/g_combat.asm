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
proc TeamCP 8 8
line 22
;19:
;20:
;21:void TeamCP(char *msg, int team)
;22:{
line 24
;23:	int			i;
;24:	for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 25
;25:	{
line 26
;26:		if ( level.clients[i].pers.connected == CON_CONNECTED ) 
CNSTI4 3464
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
line 27
;27:		{
line 28
;28:			if (g_entities[i].client->sess.sessionTeam == team ) 
CNSTI4 916
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
line 29
;29:			{
line 31
;30:				//ent = g_entities[i].client;
;31:				trap_SendServerCommand( i, va("cp \"^9%s\n\"", msg) );
ADDRGP4 $71
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 33
;32:				
;33:			}
LABELV $68
line 34
;34:		}
LABELV $66
line 35
;35:	}
LABELV $62
line 24
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
line 36
;36:}
LABELV $60
endproc TeamCP 8 8
export ScorePlum
proc ScorePlum 12 8
line 51
;37:
;38:/*====================================================
;39:
;40:		MOVE THE STUFF ABOVE TO SOME UTILITY AREA
;41:
;42:*/
;43:
;44:
;45:
;46:/*
;47:============
;48:ScorePlum
;49:============
;50:*/
;51:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 54
;52:	gentity_t *plum;
;53:
;54:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 71
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 56
;55:	// only send this temp entity to a single client
;56:	plum->r.svFlags |= SVF_SINGLECLIENT;
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
line 57
;57:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 59
;58:	//
;59:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 60
;60:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 61
;61:}
LABELV $72
endproc ScorePlum 12 8
export AddScore
proc AddScore 12 12
line 70
;62:
;63:/*
;64:============
;65:AddScore
;66:
;67:Adds score to both the client and his team
;68:============
;69:*/
;70:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 72
;71:
;72:		if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $74
line 73
;73:			return;
ADDRGP4 $73
JUMPV
LABELV $74
line 76
;74:		}
;75:		// no scoring during pre-match warmup
;76:		if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $76
line 77
;77:			return;
ADDRGP4 $73
JUMPV
LABELV $76
line 80
;78:		}
;79:		// show score plum
;80:		ScorePlum(ent, origin, score);
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
line 82
;81:		//
;82:		ent->client->ps.persistant[PERS_SCORE] += score;
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
line 83
;83:		ent->client->pers.TrueScore = ent->client->ps.persistant[PERS_SCORE];
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
line 85
;84:
;85:	if (g_GameMode.integer != 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $79
line 86
;86:	{
line 87
;87:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $82
line 88
;88:			level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
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
line 90
;89:	
;90:	}
LABELV $79
line 91
;91:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 92
;92:}
LABELV $73
endproc AddScore 12 12
export TossClientItems
proc TossClientItems 32 12
line 101
;93:
;94:/*
;95:=================
;96:TossClientItems
;97:
;98:Toss the weapon and powerups for the killed player
;99:=================
;100:*/
;101:void TossClientItems( gentity_t *self ) {
line 109
;102:	gitem_t		*item;
;103:	int			weapon;
;104:	float		angle;
;105:	int			i;
;106:	gentity_t	*drop;
;107:
;108:	// drop the weapon if not a gauntlet or machinegun
;109:	weapon = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 117
;110:
;111:	// make a special check to see if they are changing to a new
;112:	// weapon that isn't the mg or gauntlet.  Without this, a client
;113:	// can pick up a weapon, be killed, and not drop the weapon because
;114:	// their weapon change hasn't completed yet and they are still holding the MG.
;115:	
;116:
;117:		if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) 
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $89
ADDRLP4 16
INDIRI4
CNSTI4 10
NEI4 $87
LABELV $89
line 118
;118:		{
line 119
;119:			if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
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
line 120
;120:				weapon = self->client->pers.cmd.weapon;
ADDRLP4 16
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
line 121
;121:			}
LABELV $90
line 122
;122:			if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 16
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $92
line 123
;123:				weapon = WP_NONE;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 124
;124:			}
LABELV $92
line 125
;125:		}
LABELV $87
line 128
;126:
;127:	// Shafe - Trep - Dont drop weapons In Instagib -- 
;128:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $94
line 129
;129:	{
line 131
;130:		
;131:		if ( weapon > WP_GAUNTLET && weapon != WP_GRAPPLING_HOOK && self->client->ps.ammo[ weapon ] ) 
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $97
ADDRLP4 16
INDIRI4
CNSTI4 10
EQI4 $97
ADDRLP4 16
INDIRI4
CNSTI4 2
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
line 132
;132:		{
line 134
;133:			// find the item type for this weapon
;134:			item = BG_FindItemForWeapon( weapon );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 137
;135:	
;136:			// spawn the item
;137:			Drop_Item( self, item, 0 );
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
line 138
;138:		} else 
ADDRGP4 $98
JUMPV
LABELV $97
line 139
;139:		{
line 141
;140:			// Else if it's arsenal or survival drop it anyway.
;141:			if (g_GameMode.integer == 2 || g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $103
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $99
LABELV $103
line 142
;142:			{
line 144
;143:				// find the item type for this weapon
;144:				item = BG_FindItemForWeapon( weapon );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 147
;145:	
;146:				// spawn the item
;147:				Drop_Item( self, item, 0 );
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
line 149
;148:
;149:			}
LABELV $99
line 150
;150:		}
LABELV $98
line 151
;151:	} // End Shafe - Trep instagib
LABELV $94
line 158
;152:
;153:
;154:	
;155:	// Shafe - Always drop everything
;156:	// drop all the powerups if not in teamplay
;157:	//if ( g_gametype.integer != GT_TEAM && g_GameMode.integer != 3 ) {
;158:		angle = 45;
ADDRLP4 12
CNSTF4 1110704128
ASGNF4
line 159
;159:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $104
line 160
;160:			if ( self->client->ps.powerups[ i ] > level.time ) {
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
LEI4 $108
line 161
;161:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 162
;162:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 163
;163:					continue;
ADDRGP4 $105
JUMPV
LABELV $111
line 165
;164:				}
;165:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 167
;166:				// decide how many seconds it has left
;167:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
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
line 168
;168:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
GEI4 $114
line 169
;169:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 170
;170:				}
LABELV $114
line 171
;171:				angle += 45;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 172
;172:			}
LABELV $108
line 173
;173:		}
LABELV $105
line 159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $104
line 175
;174:	//}
;175:}
LABELV $86
endproc TossClientItems 32 12
export LookAtKiller
proc LookAtKiller 52 4
line 265
;176:
;177:#ifdef MISSIONPACK
;178:
;179:/*
;180:=================
;181:TossClientCubes
;182:=================
;183:*/
;184:extern gentity_t	*neutralObelisk;
;185:
;186:void TossClientCubes( gentity_t *self ) {
;187:	gitem_t		*item;
;188:	gentity_t	*drop;
;189:	vec3_t		velocity;
;190:	vec3_t		angles;
;191:	vec3_t		origin;
;192:
;193:	self->client->ps.generic1 = 0;
;194:
;195:	// this should never happen but we should never
;196:	// get the server to crash due to skull being spawned in
;197:	if (!G_EntitiesFree()) {
;198:		return;
;199:	}
;200:
;201:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;202:		item = BG_FindItem( "Red Cube" );
;203:	}
;204:	else {
;205:		item = BG_FindItem( "Blue Cube" );
;206:	}
;207:
;208:	angles[YAW] = (float)(level.time % 360);
;209:	angles[PITCH] = 0;	// always forward
;210:	angles[ROLL] = 0;
;211:
;212:	AngleVectors( angles, velocity, NULL, NULL );
;213:	VectorScale( velocity, 150, velocity );
;214:	velocity[2] += 200 + crandom() * 50;
;215:
;216:	if( neutralObelisk ) {
;217:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;218:		origin[2] += 44;
;219:	} else {
;220:		VectorClear( origin ) ;
;221:	}
;222:
;223:	drop = LaunchItem( item, origin, velocity );
;224:
;225:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;226:	drop->think = G_FreeEntity;
;227:	drop->spawnflags = self->client->sess.sessionTeam;
;228:}
;229:
;230:
;231:/*
;232:=================
;233:TossClientPersistantPowerups
;234:=================
;235:*/
;236:void TossClientPersistantPowerups( gentity_t *ent ) {
;237:	gentity_t	*powerup;
;238:
;239:	if( !ent->client ) {
;240:		return;
;241:	}
;242:
;243:	if( !ent->client->persistantPowerup ) {
;244:		return;
;245:	}
;246:
;247:	powerup = ent->client->persistantPowerup;
;248:
;249:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;250:	powerup->s.eFlags &= ~EF_NODRAW;
;251:	powerup->r.contents = CONTENTS_TRIGGER;
;252:	trap_LinkEntity( powerup );
;253:
;254:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;255:	ent->client->persistantPowerup = NULL;
;256:}
;257:#endif
;258:
;259:
;260:/*
;261:==================
;262:LookAtKiller
;263:==================
;264:*/
;265:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 269
;266:	vec3_t		dir;
;267:	vec3_t		angles;
;268:
;269:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $117
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $117
line 270
;270:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
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
line 271
;271:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $118
JUMPV
LABELV $117
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $121
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $121
line 272
;272:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
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
line 273
;273:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 274
;274:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
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
line 275
;275:		return;
ADDRGP4 $116
JUMPV
LABELV $122
LABELV $118
line 278
;276:	}
;277:
;278:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
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
line 280
;279:
;280:	angles[YAW] = vectoyaw ( dir );
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
line 281
;281:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 282
;282:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 283
;283:}
LABELV $116
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 0 12
line 291
;284:
;285:/*
;286:==================
;287:GibEntity
;288:==================
;289:*/
;290:void GibEntity( gentity_t *self, int killer ) 
;291:{
line 310
;292:
;293:	//if this entity still has kamikaze
;294:	/*
;295:	if (self->s.eFlags & EF_KAMIKAZE) {
;296:		// check if there is a kamikaze timer around for this owner
;297:		for (i = 0; i < MAX_GENTITIES; i++) {
;298:			ent = &g_entities[i];
;299:			if (!ent->inuse)
;300:				continue;
;301:			if (ent->activator != self)
;302:				continue;
;303:			if (strcmp(ent->classname, "kamikaze timer"))
;304:				continue;
;305:			G_FreeEntity(ent);
;306:			break;
;307:		}
;308:	}
;309:	*/
;310:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 311
;311:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 312
;312:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 313
;313:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 314
;314:}
LABELV $127
endproc GibEntity 0 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 318
;315:
;316:
;317:// Shafe - Trep - Headshot Function
;318:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 319
;319:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 69
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 320
;320:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 1
ASGNI4
line 321
;321:}
LABELV $128
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 329
;322:// Shafe - Trep - End Headshot Function
;323:
;324:/*
;325:==================
;326:body_die
;327:==================
;328:*/
;329:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 330
;330:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $130
line 331
;331:		return;
ADDRGP4 $129
JUMPV
LABELV $130
line 333
;332:	}
;333:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $132
line 334
;334:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 335
;335:		return;
ADDRGP4 $129
JUMPV
LABELV $132
line 338
;336:	}
;337:
;338:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 339
;339:}
LABELV $129
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 342
;340:
;341:// Shafe - Trep - Arsenal Mod
;342:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 344
;343:
;344:	if (g_GameMode.integer != 1) { return qfalse; } // Do nothing unless it's arsenal
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $136
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $136
line 346
;345:
;346:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $139
line 347
;347:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $141
line 348
;348:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $143
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $143
line 349
;349:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $145
line 350
;350:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $147
line 351
;351:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $149
line 352
;352:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $151
line 353
;353:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $153
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $153
line 354
;354:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $155
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $155
line 356
;355:
;356:	return qtrue;
CNSTI4 1
RETI4
LABELV $135
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
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
address $175
address $176
address $177
address $178
address $179
address $180
address $181
address $182
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 431
;357:}
;358:
;359:
;360:// these are just for logging, the client prints its own messages
;361:char	*modNames[] = {
;362:	"MOD_UNKNOWN",
;363:	"MOD_SHOTGUN",
;364:	"MOD_GAUNTLET",
;365:	"MOD_MACHINEGUN",
;366:	"MOD_GRENADE",
;367:	"MOD_GRENADE_SPLASH",
;368:	"MOD_ROCKET",
;369:	"MOD_ROCKET_SPLASH",
;370:	"MOD_PLASMA",
;371:	"MOD_PLASMA_SPLASH",
;372:	"MOD_RAILGUN",
;373:	"MOD_LIGHTNING",
;374:	"MOD_BFG",
;375:	"MOD_BFG_SPLASH",
;376:	"MOD_WATER",
;377:	"MOD_SLIME",
;378:	"MOD_LAVA",
;379:	"MOD_CRUSH",
;380:	"MOD_TELEFRAG",
;381:	"MOD_FALLING",
;382:	"MOD_SUICIDE",
;383:	"MOD_TARGET_LASER",
;384:	"MOD_TRIGGER_HURT",
;385:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;386:	"MOD_TURRET",
;387:#ifdef MISSIONPACK
;388:	"MOD_NAIL",
;389:	"MOD_CHAINGUN",
;390:	"MOD_PROXIMITY_MINE",
;391:#endif
;392:	"MOD_GRAPPLE"
;393:};
;394:
;395:#ifdef MISSIONPACK
;396:/*
;397:==================
;398:Kamikaze_DeathActivate
;399:==================
;400:*/
;401:void Kamikaze_DeathActivate( gentity_t *ent ) {
;402:	G_StartKamikaze(ent);
;403:	G_FreeEntity(ent);
;404:}
;405:
;406:/*
;407:==================
;408:Kamikaze_DeathTimer
;409:==================
;410:*/
;411:void Kamikaze_DeathTimer( gentity_t *self ) {
;412:	gentity_t *ent;
;413:
;414:	ent = G_Spawn();
;415:	ent->classname = "kamikaze timer";
;416:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;417:	ent->r.svFlags |= SVF_NOCLIENT;
;418:	ent->think = Kamikaze_DeathActivate;
;419:	ent->nextthink = level.time + 5 * 1000;
;420:
;421:	ent->activator = self;
;422:}
;423:
;424:#endif
;425:
;426:/*
;427:==================
;428:CheckAlmostCapture
;429:==================
;430:*/
;431:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 437
;432:	gentity_t	*ent;
;433:	vec3_t		dir;
;434:	char		*classname;
;435:
;436:	// if this player was carrying a flag
;437:	if ( self->client->ps.powerups[PW_REDFLAG] ||
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
NEI4 $187
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $187
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $184
LABELV $187
line 439
;438:		self->client->ps.powerups[PW_BLUEFLAG] ||
;439:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 441
;440:		// get the goal flag this player should have been going for
;441:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $188
line 442
;442:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $191
line 443
;443:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $193
ASGNP4
line 444
;444:			}
ADDRGP4 $189
JUMPV
LABELV $191
line 445
;445:			else {
line 446
;446:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $194
ASGNP4
line 447
;447:			}
line 448
;448:		}
ADDRGP4 $189
JUMPV
LABELV $188
line 449
;449:		else {
line 450
;450:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
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
line 451
;451:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $194
ASGNP4
line 452
;452:			}
ADDRGP4 $196
JUMPV
LABELV $195
line 453
;453:			else {
line 454
;454:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $193
ASGNP4
line 455
;455:			}
LABELV $196
line 456
;456:		}
LABELV $189
line 457
;457:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $197
line 459
;458:		do
;459:		{
line 460
;460:			ent = G_Find(ent, FOFS(classname), classname);
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
line 461
;461:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $198
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $200
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $197
LABELV $200
line 463
;462:		// if we found the destination flag and it's not picked up
;463:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $201
line 465
;464:			// if the player was *very* close
;465:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 466
;466:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $205
line 467
;467:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 468
;468:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $207
line 469
;469:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 470
;470:				}
LABELV $207
line 471
;471:			}
LABELV $205
line 472
;472:		}
LABELV $201
line 473
;473:	}
LABELV $184
line 474
;474:}
LABELV $183
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 481
;475:
;476:/*
;477:==================
;478:CheckAlmostScored
;479:==================
;480:*/
;481:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 487
;482:	gentity_t	*ent;
;483:	vec3_t		dir;
;484:	char		*classname;
;485:
;486:	// if the player was carrying cubes
;487:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 488
;488:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $212
line 489
;489:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $214
ASGNP4
line 490
;490:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 491
;491:		else {
line 492
;492:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $215
ASGNP4
line 493
;493:		}
LABELV $213
line 494
;494:		ent = G_Find(NULL, FOFS(classname), classname);
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
line 496
;495:		// if we found the destination obelisk
;496:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
line 498
;497:			// if the player was *very* close
;498:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 499
;499:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $220
line 500
;500:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 501
;501:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
line 502
;502:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 503
;503:				}
LABELV $222
line 504
;504:			}
LABELV $220
line 505
;505:		}
LABELV $216
line 506
;506:	}
LABELV $210
line 507
;507:}
LABELV $209
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $225
skip 4
align 4
LABELV $399
skip 4
export player_die
code
proc player_die 128 28
line 518
;508:
;509:
;510:
;511:/*
;512:==================
;513:player_die
;514:==================
;515:*/
;516:extern int CountSurvivors();
;517:
;518:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 531
;519:	gentity_t	*ent;
;520:	int			anim;
;521:	int			contents;
;522:	int			killer;
;523:	int			i;
;524:	char		*killerName, *obit;
;525:	// Shafe - Trep - For Arsenal
;526:	int			tmpW;
;527:	int			tmpCnt;
;528:	static		int deathNum;
;529:	//gentity_t	*xte;
;530:	
;531:	gentity_t	*grenades = NULL; // -Vincent
ADDRLP4 4
CNSTP4 0
ASGNP4
line 535
;532:
;533:
;534:
;535:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $226
line 536
;536:		return;
ADDRGP4 $224
JUMPV
LABELV $226
line 539
;537:	}
;538:
;539:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $228
line 540
;540:		return;
ADDRGP4 $224
JUMPV
LABELV $228
line 544
;541:	}
;542:
;543:
;544:	if ((self->client->ps.eFlags & EF_TALK) && (meansOfDeath != MOD_SUICIDE) && (attacker != &g_entities[ENTITYNUM_WORLD]))
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $231
ADDRFP4 16
INDIRI4
CNSTI4 20
EQI4 $231
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+936152
CVPU4 4
EQU4 $231
line 545
;545:	{
line 546
;546:		attacker->InstaChatFrags++;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 856
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 547
;547:	} 
LABELV $231
line 551
;548:	
;549://unlagged - backward reconciliation #2
;550:	// make sure the body shows up in the client's current position
;551:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 555
;552://unlagged - backward reconciliation #2
;553:
;554:	// check for an almost capture
;555:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 557
;556:	// check for a player that almost brought in cubes
;557:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 559
;558:
;559:	if (self->client && self->client->hook)
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $234
ADDRLP4 40
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $234
line 560
;560:		Weapon_HookFree(self->client->hook);
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
LABELV $234
line 568
;561:#ifdef MISSIONPACK
;562:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;563:		self->client->ps.eFlags &= ~EF_TICKING;
;564:		self->activator->think = G_FreeEntity;
;565:		self->activator->nextthink = level.time;
;566:	}
;567:#endif
;568:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 571
;569:
;570:	// Shafe - Trep - Clear out the PDG
;571:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 572
;572:	VectorClear( self->teleloc ); 
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRGP4 $237
JUMPV
LABELV $236
line 575
;573:	 
;574:	while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;575:	{
line 576
;576:		if ( self->client->pdgfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 1
NEI4 $240
line 577
;577:		{ // When a grenade has been fired, let it explode -Vincent
line 578
;578:			if(grenades->r.ownerNum == self->s.clientNum)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $242
line 579
;579:			{ // Confirm owner
line 580
;580:			grenades->nextthink = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 581
;581:			grenades->think = G_ExplodeMissile;
ADDRLP4 4
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 582
;582:			}
LABELV $242
line 583
;583:		self->client->pdgfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 0
ASGNI4
line 584
;584:		}
LABELV $240
line 585
;585:	}
LABELV $237
line 574
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $239
ARGP4
ADDRLP4 56
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 587
;586:	
;587:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
line 588
;588:		killer = attacker->s.number;
ADDRLP4 8
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 589
;589:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $247
line 590
;590:			killerName = attacker->client->pers.netname;
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 591
;591:		} else {
ADDRGP4 $246
JUMPV
LABELV $247
line 592
;592:			killerName = "<non-client>";
ADDRLP4 24
ADDRGP4 $249
ASGNP4
line 593
;593:		}
line 594
;594:	} else {
ADDRGP4 $246
JUMPV
LABELV $245
line 595
;595:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 596
;596:		killerName = "<world>";
ADDRLP4 24
ADDRGP4 $250
ASGNP4
line 597
;597:	}
LABELV $246
line 599
;598:
;599:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $253
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $251
LABELV $253
line 600
;600:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 601
;601:		killerName = "<world>";
ADDRLP4 24
ADDRGP4 $250
ASGNP4
line 602
;602:	}
LABELV $251
line 604
;603:
;604:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 64
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $256
ADDRLP4 64
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $254
LABELV $256
line 605
;605:		obit = "<bad obituary>";
ADDRLP4 28
ADDRGP4 $257
ASGNP4
line 606
;606:	} else {
ADDRGP4 $255
JUMPV
LABELV $254
line 607
;607:		obit = modNames[ meansOfDeath ];
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 608
;608:	}
LABELV $255
line 610
;609:
;610:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $258
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 615
;611:		killer, self->s.number, meansOfDeath, killerName, 
;612:		self->client->pers.netname, obit );
;613:
;614:	// broadcast the death event to everyone
;615:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 62
ARGI4
ADDRLP4 72
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 72
INDIRP4
ASGNP4
line 616
;616:	ent->s.eventParm = meansOfDeath;
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 617
;617:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 618
;618:	ent->s.otherEntityNum2 = killer;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 619
;619:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 12
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 32
ASGNI4
line 621
;620:
;621:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 623
;622:
;623:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 625
;624:
;625:	if (meansOfDeath != MOD_SUICIDE)
ADDRFP4 16
INDIRI4
CNSTI4 20
EQI4 $259
line 626
;626:	{
line 628
;627:		
;628:		if (attacker->client != self->client) 
ADDRLP4 80
CNSTI4 524
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
EQU4 $261
line 629
;629:		{
line 631
;630:
;631:			if (self->client->pers.connected == CON_CONNECTED && attacker->client->pers.connected == CON_CONNECTED)
ADDRLP4 84
CNSTI4 524
ASGNI4
ADDRLP4 88
CNSTI4 468
ASGNI4
ADDRLP4 92
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $263
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $263
line 632
;632:			{
line 634
;633:
;634:				self->InstaStreak = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 635
;635:				attacker->InstaStreak++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 840
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 636
;636:				self->InstaDeaths++;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 637
;637:				self->InstaDeathStreak++;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 638
;638:				attacker->InstaDeathStreak=0;
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 641
;639:				
;640:				// Calculating The Most Kills Without Dying
;641:				attacker->InstaKillsInRowTemp++;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 872
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 642
;642:				if (self->InstaKillsInRowTemp > self->InstaKillsInRow)
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 872
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
CNSTI4 868
ADDP4
INDIRI4
LEI4 $265
line 643
;643:				{
line 644
;644:					self->InstaKillsInRow = self->InstaKillsInRowTemp;
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 868
ADDP4
ADDRLP4 116
INDIRP4
CNSTI4 872
ADDP4
INDIRI4
ASGNI4
line 645
;645:				}
LABELV $265
line 646
;646:				self->InstaKillsInRowTemp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 872
ADDP4
CNSTI4 0
ASGNI4
line 650
;647:
;648:
;649:				// Streak Of 7 Gives them a spree msg :)
;650:				if (attacker->InstaStreak == 7)
ADDRFP4 8
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 7
NEI4 $267
line 651
;651:				{
line 652
;652:						trap_SendServerCommand( -1, va( "print \"" S_COLOR_YELLOW "%s ^7IS ON A KILLING SPREE!\n\"", attacker->client->pers.netname ) );
ADDRGP4 $269
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 653
;653:						trap_SendServerCommand( -1, va("cp \"^7%s IS ON A KILLING SPREE!!\n\"", attacker->client->pers.netname ) );
ADDRGP4 $270
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 655
;654:						//attacker->client->ps.persistant[PERS_SCORE]+=1;
;655:						attacker->InstaMostKillSpree++;
ADDRLP4 124
ADDRFP4 8
INDIRP4
CNSTI4 860
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 656
;656:						attacker->InstaStreak = 0;
ADDRFP4 8
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 659
;657:
;658:				
;659:				}
LABELV $267
line 662
;660:
;661:				// 4 Deaths without scoring makes a Dying spree dieing
;662:				if (self->InstaDeathStreak == 4) 
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
NEI4 $271
line 663
;663:				{
line 664
;664:						trap_SendServerCommand( -1, va( "print \"" S_COLOR_YELLOW "%s ^7IS ON A DYING SPREE!\n\"", self->client->pers.netname ) );
ADDRGP4 $273
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 665
;665:						trap_SendServerCommand( -1, va("cp \"^7%s IS ON A DYING SPREE!!\n\"", self->client->pers.netname ) );
ADDRGP4 $274
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 666
;666:						self->InstaMostDeathSpree++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 864
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 667
;667:						self->InstaDeathStreak = 0;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 669
;668:
;669:				}
LABELV $271
line 672
;670:				
;671:				
;672:			}
LABELV $263
line 673
;673:		}
LABELV $261
line 674
;674:	}
LABELV $259
line 677
;675:
;676:
;677:	if (attacker && attacker->client) {
ADDRLP4 80
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 84
CNSTU4 0
ASGNU4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $275
ADDRLP4 80
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $275
line 678
;678:		attacker->client->lastkilled_client = self->s.number;
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
line 680
;679:
;680:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 88
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRP4
CVPU4 4
EQU4 $279
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $277
LABELV $279
line 681
;681:			AddScore( attacker, self->r.currentOrigin, -1 );
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
line 684
;682:			
;683:
;684:		} else {
ADDRGP4 $276
JUMPV
LABELV $277
line 685
;685:			AddScore( attacker, self->r.currentOrigin, 1 );
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
line 687
;686:
;687:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $280
line 690
;688:				
;689:				// play humiliation on player
;690:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 693
;691:
;692:				// add the sprite over the player's head
;693:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 694
;694:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 695
;695:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 698
;696:
;697:				// also play humiliation on target
;698:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 699
;699:			}
LABELV $280
line 703
;700:
;701:			// check for two kills in a short amount of time
;702:			// if this is close enough to the last kill, give a reward sound
;703:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
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
GEI4 $283
line 705
;704:				// play excellent on player
;705:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 708
;706:
;707:				// add the sprite over the player's head
;708:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 709
;709:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 710
;710:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 711
;711:			}
LABELV $283
line 712
;712:			attacker->client->lastKillTime = level.time;
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
line 714
;713:
;714:		}
line 715
;715:	} else {
ADDRGP4 $276
JUMPV
LABELV $275
line 716
;716:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 717
;717:	}
LABELV $276
line 720
;718:
;719:	// Add team bonuses
;720:	Team_FragBonuses(self, inflictor, attacker);
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
line 723
;721:
;722:	// if I committed suicide, the flag does not fall, it returns.
;723:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $288
line 724
;724:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
line 725
;725:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 726
;726:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 727
;727:		}
ADDRGP4 $291
JUMPV
LABELV $290
line 728
;728:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $292
line 729
;729:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 730
;730:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:		}
ADDRGP4 $293
JUMPV
LABELV $292
line 732
;732:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $294
line 733
;733:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 734
;734:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 735
;735:		}
LABELV $294
LABELV $293
LABELV $291
line 736
;736:	}
LABELV $288
line 739
;737:
;738:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;739:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 88
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 88
INDIRI4
ASGNI4
line 740
;740:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $296
line 741
;741:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 742
;742:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 743
;743:	else {
line 744
;744:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $298
line 745
;745:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 746
;746:		}
ADDRGP4 $299
JUMPV
LABELV $298
line 747
;747:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $300
line 748
;748:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 749
;749:		}
ADDRGP4 $301
JUMPV
LABELV $300
line 750
;750:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $302
line 751
;751:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 752
;752:		}
LABELV $302
LABELV $301
LABELV $299
line 753
;753:	}
LABELV $297
line 762
;754:#ifdef MISSIONPACK
;755:	TossClientPersistantPowerups( self );
;756:	if( g_gametype.integer == GT_HARVESTER ) {
;757:		TossClientCubes( self );
;758:	}
;759:#endif
;760:
;761:	
;762:	if ((level.firstStrike == qfalse) && (!level.warmupTime))
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 level+9236
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $304
ADDRGP4 level+16
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $304
line 763
;763:	{
line 764
;764:		if (self != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $308
line 765
;765:		{
line 766
;766:			level.firstStrike = qtrue;
ADDRGP4 level+9236
CNSTI4 1
ASGNI4
line 767
;767:			BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $311
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 768
;768:			trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $312
ARGP4
ADDRFP4 8
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
line 769
;769:		}
LABELV $308
line 770
;770:	}
LABELV $304
line 772
;771:
;772:	if (level.warmupTime != 0)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $313
line 773
;773:	{
line 774
;774:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 776
;775:		//trap_SendServerCommand( -1, va("print \"%s FS Is FALSE!!\n\"",attacker->client->pers.netname));	
;776:	} 
LABELV $313
line 780
;777:		
;778:	
;779:		// Shafe - Trep - Arsenal Stuff
;780:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 96
INDIRI4
LEI4 $317
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $317
ADDRGP4 level+16
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $317
line 781
;781:		{
line 782
;782:			tmpW = self->s.weapon;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 784
;783:
;784:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $321
line 785
;785:			{
line 786
;786:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 20
INDIRI4
CNSTI4 9
NEI4 $324
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $324
line 787
;787:				if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $326
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $326
line 788
;788:				if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 7
NEI4 $328
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $328
line 789
;789:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 6
NEI4 $330
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $330
line 790
;790:				if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 5
NEI4 $332
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $332
line 791
;791:				if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 4
NEI4 $334
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $334
line 792
;792:				if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $336
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $336
line 793
;793:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $338
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $338
line 794
;794:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $340
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $340
line 796
;795:
;796:			}
LABELV $321
line 799
;797:			
;798:			
;799:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $345
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 IsOutOfWeapons
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $342
LABELV $345
line 800
;800:			{
line 803
;801:				
;802:				// Arsenal Message
;803:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $346
line 804
;804:				{
line 805
;805:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $349
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 806
;806:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $350
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 807
;807:				}
LABELV $346
line 810
;808:
;809:				// LMS Message
;810:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $351
line 811
;811:				{
line 812
;812:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $354
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 813
;813:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $355
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 814
;814:				}
LABELV $351
line 817
;815:				
;816:				// Send them to Spec
;817:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 818
;818:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 819
;819:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $356
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 821
;820:				// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;821:				level.lastClient = attacker->client;
ADDRGP4 level+9244
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 823
;822:
;823:				tmpCnt = (CountSurvivors());
ADDRLP4 108
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 108
INDIRI4
ASGNI4
line 826
;824:
;825:						
;826:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 32
INDIRI4
ADDRGP4 level+9228
INDIRI4
EQI4 $358
line 827
;827:				{
line 829
;828:
;829:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9228
ADDRLP4 32
INDIRI4
ASGNI4
line 832
;830:			
;831:			
;832:					if (tmpCnt == 5) 
ADDRLP4 32
INDIRI4
CNSTI4 5
NEI4 $362
line 833
;833:					{
line 834
;834:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $364
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 835
;835:					}
LABELV $362
line 837
;836:					
;837:					if (tmpCnt == 4) 
ADDRLP4 32
INDIRI4
CNSTI4 4
NEI4 $365
line 838
;838:					{
line 839
;839:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $367
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 840
;840:					}
LABELV $365
line 842
;841:
;842:					if (tmpCnt == 3) 
ADDRLP4 32
INDIRI4
CNSTI4 3
NEI4 $368
line 843
;843:					{
line 844
;844:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $370
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 845
;845:					}
LABELV $368
line 847
;846:
;847:					if (tmpCnt == 2) 
ADDRLP4 32
INDIRI4
CNSTI4 2
NEI4 $371
line 848
;848:					{
line 850
;849:						
;850:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $373
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 851
;851:					}
LABELV $371
line 853
;852:
;853:					if (tmpCnt == 1) 
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $374
line 854
;854:					{
line 855
;855:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $376
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 857
;856:
;857:					}
LABELV $374
line 859
;858:				
;859:				}
LABELV $358
line 860
;860:			} 
LABELV $342
line 862
;861:
;862:		}
LABELV $317
line 865
;863:		// End Arsenal Stuff
;864:
;865:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 868
;866:	// send updated scores to any clients that are following this one,
;867:	// or they would get stale scoreboards
;868:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $377
line 871
;869:		gclient_t	*client;
;870:
;871:		client = &level.clients[i];
ADDRLP4 100
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 872
;872:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 100
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $382
line 873
;873:			continue;
ADDRGP4 $378
JUMPV
LABELV $382
line 875
;874:		}
;875:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 100
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $384
line 876
;876:			continue;
ADDRGP4 $378
JUMPV
LABELV $384
line 878
;877:		}
;878:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 100
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $386
line 879
;879:			Cmd_Score_f( g_entities + i );
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 880
;880:		}
LABELV $386
line 881
;881:	}
LABELV $378
line 868
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $380
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $377
line 883
;882:
;883:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 885
;884:
;885:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 886
;886:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 887
;887:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 889
;888:
;889:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 890
;890:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 891
;891:	LookAtKiller (self, inflictor, attacker);
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
line 893
;892:
;893:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 895
;894:
;895:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 897
;896:
;897:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 3238002688
ASGNF4
line 901
;898:
;899:	// don't allow respawn until the death anim is done
;900:	// g_forcerespawn may force spawning at some later time
;901:	self->client->respawnTime = level.time + 1700;  // This is the real line
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
line 906
;902:	
;903:
;904:
;905:	// remove powerups
;906:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
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
line 908
;907:
;908:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $389
line 909
;909:	{
line 910
;910:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $391
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 911
;911:	}
LABELV $389
line 916
;912:
;913:
;914:
;915:	// never gib in a nodrop
;916:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $398
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $398
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $398
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $395
LABELV $398
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $392
LABELV $395
line 918
;917:		// gib death
;918:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 919
;919:	} else {
ADDRGP4 $393
JUMPV
LABELV $392
line 923
;920:		// normal death
;921:		static int i;
;922:
;923:		switch ( i ) {
ADDRLP4 104
ADDRGP4 $399
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $402
ADDRLP4 104
INDIRI4
CNSTI4 1
EQI4 $403
ADDRLP4 104
INDIRI4
CNSTI4 2
EQI4 $404
ADDRGP4 $400
JUMPV
LABELV $402
line 925
;924:		case 0:
;925:			anim = BOTH_DEATH1;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 926
;926:			break;
ADDRGP4 $401
JUMPV
LABELV $403
line 928
;927:		case 1:
;928:			anim = BOTH_DEATH2;
ADDRLP4 36
CNSTI4 2
ASGNI4
line 929
;929:			break;
ADDRGP4 $401
JUMPV
LABELV $404
LABELV $400
line 932
;930:		case 2:
;931:		default:
;932:			anim = BOTH_DEATH3;
ADDRLP4 36
CNSTI4 4
ASGNI4
line 933
;933:			break;
LABELV $401
line 938
;934:		}
;935:
;936:		// for the no-blood option, we need to prevent the health
;937:		// from going to gib level
;938:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $405
line 939
;939:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 940
;940:		}
LABELV $405
line 942
;941:
;942:		self->client->ps.legsAnim = 
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 76
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
ADDRLP4 36
INDIRI4
BORI4
ASGNI4
line 944
;943:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;944:		self->client->ps.torsoAnim = 
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 120
CNSTI4 128
ASGNI4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
BANDI4
ADDRLP4 120
INDIRI4
BXORI4
ADDRLP4 36
INDIRI4
BORI4
ASGNI4
line 947
;945:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;946:
;947:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $399
INDIRI4
CNSTI4 59
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 950
;948:
;949:		// Shafe - Trep Headshot //////////////////////////////////////////
;950:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $407
line 951
;951:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $408
JUMPV
LABELV $407
line 953
;952:		else
;953:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 0
ASGNI4
LABELV $408
line 957
;954:		// Shafe - Trep - End Headshot /////////////////////////////
;955:
;956:		// the body can still be gibbed
;957:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 960
;958:
;959:		// globally cycle through the different death animations
;960:		i = ( i + 1 ) % 3;
ADDRLP4 124
ADDRGP4 $399
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 969
;961:
;962:
;963:
;964:#ifdef MISSIONPACK
;965:		if (self->s.eFlags & EF_KAMIKAZE) {
;966:			Kamikaze_DeathTimer( self );
;967:		}
;968:#endif
;969:	}
LABELV $393
line 974
;970:
;971:	
;972:
;973:
;974:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 976
;975:
;976:}
LABELV $224
endproc player_die 128 28
export CheckArmor
proc CheckArmor 20 4
line 985
;977:
;978:
;979:/*
;980:================
;981:CheckArmor
;982:================
;983:*/
;984:int CheckArmor (gentity_t *ent, int damage, int dflags)
;985:{
line 990
;986:	gclient_t	*client;
;987:	int			save;
;988:	int			count;
;989:
;990:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $410
line 991
;991:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $409
JUMPV
LABELV $410
line 993
;992:
;993:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 995
;994:
;995:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $412
line 996
;996:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $409
JUMPV
LABELV $412
line 998
;997:
;998:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $414
line 999
;999:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $409
JUMPV
LABELV $414
line 1002
;1000:
;1001:	// armor
;1002:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1003
;1003:	save = ceil( damage * ARMOR_PROTECTION );
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
line 1004
;1004:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $416
line 1005
;1005:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $416
line 1007
;1006:
;1007:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $418
line 1008
;1008:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $409
JUMPV
LABELV $418
line 1010
;1009:
;1010:	client->ps.stats[STAT_ARMOR] -= save;
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
line 1012
;1011:
;1012:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $409
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 1020
;1013:}
;1014:
;1015:/*
;1016:================
;1017:RaySphereIntersections
;1018:================
;1019:*/
;1020:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 1029
;1021:	float b, c, d, t;
;1022:
;1023:	//	| origin - (point + t * dir) | = radius
;1024:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;1025:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;1026:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;1027:
;1028:	// normalize dir so a = 1
;1029:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1030
;1030:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 1031
;1031:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 1036
;1032:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;1033:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;1034:		radius * radius;
;1035:
;1036:	d = b * b - 4 * c;
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
line 1037
;1037:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $421
line 1038
;1038:		t = (- b + sqrt(d)) / 2;
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
line 1039
;1039:		VectorMA(point, t, dir, intersections[0]);
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
line 1040
;1040:		t = (- b - sqrt(d)) / 2;
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
line 1041
;1041:		VectorMA(point, t, dir, intersections[1]);
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
line 1042
;1042:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $420
JUMPV
LABELV $421
line 1044
;1043:	}
;1044:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $423
line 1045
;1045:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1046
;1046:		VectorMA(point, t, dir, intersections[0]);
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
line 1047
;1047:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $420
JUMPV
LABELV $423
line 1049
;1048:	}
;1049:	return 0;
CNSTI4 0
RETI4
LABELV $420
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 1116
;1050:}
;1051:
;1052:#ifdef MISSIONPACK
;1053:/*
;1054:================
;1055:G_InvulnerabilityEffect
;1056:================
;1057:*/
;1058:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;1059:	gentity_t	*impact;
;1060:	vec3_t		intersections[2], vec;
;1061:	int			n;
;1062:
;1063:	if ( !targ->client ) {
;1064:		return qfalse;
;1065:	}
;1066:	VectorCopy(dir, vec);
;1067:	VectorInverse(vec);
;1068:	// sphere model radius = 42 units
;1069:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;1070:	if (n > 0) {
;1071:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;1072:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;1073:		vectoangles(vec, impact->s.angles);
;1074:		impact->s.angles[0] += 90;
;1075:		if (impact->s.angles[0] > 360)
;1076:			impact->s.angles[0] -= 360;
;1077:		if ( impactpoint ) {
;1078:			VectorCopy( intersections[0], impactpoint );
;1079:		}
;1080:		if ( bouncedir ) {
;1081:			VectorCopy( vec, bouncedir );
;1082:			VectorNormalize( bouncedir );
;1083:		}
;1084:		return qtrue;
;1085:	}
;1086:	else {
;1087:		return qfalse;
;1088:	}
;1089:}
;1090:#endif
;1091:/*
;1092:============
;1093:T_Damage
;1094:
;1095:targ		entity that is being damaged
;1096:inflictor	entity that is causing the damage
;1097:attacker	entity that caused the inflictor to damage targ
;1098:	example: targ=monster, inflictor=rocket, attacker=player
;1099:
;1100:dir			direction of the attack for knockback
;1101:point		point at which the damage is being inflicted, used for headshots
;1102:damage		amount of damage being inflicted
;1103:knockback	force to be applied against targ as a result of the damage
;1104:
;1105:inflictor, attacker, dir, and point can be NULL for environmental effects
;1106:
;1107:dflags		these flags are used to control how T_Damage works
;1108:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;1109:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;1110:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;1111:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1112:============
;1113:*/
;1114:
;1115:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1116:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1134
;1117:	gclient_t	*client;
;1118:	int			take;
;1119:	int			save;
;1120:	int			asave;
;1121:	int			knockback;
;1122:	int			max;
;1123:	// Shafe - Trep - Headshot
;1124:	float		z_ratio;
;1125:	float		z_rel;
;1126:	int			height;
;1127:	float		targ_maxs2;
;1128:	// Shafe - Trep - End Headshot
;1129:
;1130:#ifdef MISSIONPACK
;1131:	vec3_t		bouncedir, impactpoint;
;1132:#endif
;1133:
;1134:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $426
line 1135
;1135:		return;
ADDRGP4 $425
JUMPV
LABELV $426
line 1140
;1136:	}
;1137:
;1138:	// the intermission has allready been qualified for, so don't
;1139:	// allow any extra scoring
;1140:	if ( level.intermissionQueued ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
EQI4 $428
line 1141
;1141:		return;
ADDRGP4 $425
JUMPV
LABELV $428
line 1145
;1142:	}
;1143:
;1144:	// Grapple hook cannot be used to damage a buildable
;1145:	if (targ->s.eType ==ET_BUILDABLE && mod == MOD_GRAPPLE && g_GrappleMode.integer == 1)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $431
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $431
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $431
line 1146
;1146:	{
line 1147
;1147:		return;
ADDRGP4 $425
JUMPV
LABELV $431
line 1163
;1148:	}
;1149:
;1150:
;1151:	
;1152:
;1153:#ifdef MISSIONPACK
;1154:	if ( targ->client && mod != MOD_JUICED) {
;1155:		if ( targ->client->invulnerabilityTime > level.time) {
;1156:			if ( dir && point ) {
;1157:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1158:			}
;1159:			return;
;1160:		}
;1161:	}
;1162:#endif
;1163:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $434
line 1164
;1164:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+936152
ASGNP4
line 1165
;1165:	}
LABELV $434
line 1166
;1166:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $437
line 1167
;1167:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+936152
ASGNP4
line 1168
;1168:	}
LABELV $437
line 1173
;1169:
;1170:	
;1171:
;1172:	// shootable doors / buttons don't actually have any health
;1173:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $440
line 1174
;1174:		if ( targ->use && targ->moverState == MOVER_POS1 || targ->moverState == ROTATOR_POS1) {
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
EQU4 $445
ADDRLP4 44
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $444
LABELV $445
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $425
LABELV $444
line 1175
;1175:			targ->use( targ, inflictor, attacker );
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
line 1176
;1176:		}
line 1177
;1177:		return;
ADDRGP4 $425
JUMPV
LABELV $440
line 1181
;1178:	}
;1179:
;1180:	// If we shot a breakable item subtract the damage from its health and try to break it
;1181: 	if ( targ->s.eType == ET_BREAKABLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $446
line 1182
;1182:         targ->health -= damage;
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
line 1183
;1183: 		G_BreakGlass( targ, point, mod );
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
line 1184
;1184: 		return;
ADDRGP4 $425
JUMPV
LABELV $446
line 1193
;1185: 	}
;1186:#ifdef MISSIONPACK
;1187:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1188:		return;
;1189:	}
;1190:#endif
;1191:	// reduce damage by the attacker's handicap value
;1192:	// unless they are rocket jumping
;1193:	if ( attacker->client && attacker != targ ) {
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
EQU4 $448
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $448
line 1194
;1194:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
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
line 1200
;1195:#ifdef MISSIONPACK
;1196:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1197:			max /= 2;
;1198:		}
;1199:#endif
;1200:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1201
;1201:	}
LABELV $448
line 1203
;1202:
;1203:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1205
;1204:
;1205:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
line 1206
;1206:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $452
line 1207
;1207:			return;
ADDRGP4 $425
JUMPV
LABELV $452
line 1209
;1208:		}
;1209:	}
LABELV $450
line 1211
;1210:
;1211:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $454
line 1212
;1212:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1213
;1213:	} else {
ADDRGP4 $455
JUMPV
LABELV $454
line 1214
;1214:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1215
;1215:	}
LABELV $455
line 1217
;1216:
;1217:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1218
;1218:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $456
line 1219
;1219:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1220
;1220:	}
LABELV $456
line 1221
;1221:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $458
line 1222
;1222:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1223
;1223:	}
LABELV $458
line 1224
;1224:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $460
line 1225
;1225:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1226
;1226:	}
LABELV $460
line 1229
;1227:
;1228:	// figure momentum add, even if the damage won't be taken
;1229:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $462
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
line 1233
;1230:		vec3_t	kvel;
;1231:		float	mass;
;1232:
;1233:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1235
;1234:
;1235:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1236
;1236:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
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
line 1240
;1237:
;1238:		// set the timer so that the other client can't cancel
;1239:		// out the movement immediately
;1240:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $471
line 1243
;1241:			int		t;
;1242:
;1243:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1244
;1244:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $473
line 1245
;1245:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1246
;1246:			}
LABELV $473
line 1247
;1247:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $475
line 1248
;1248:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1249
;1249:			}
LABELV $475
line 1250
;1250:			targ->client->ps.pm_time = t;
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
line 1251
;1251:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1252
;1252:		}
LABELV $471
line 1253
;1253:	}
LABELV $462
line 1256
;1254:
;1255:	// check for completely getting out of the damage
;1256:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $477
line 1263
;1257:
;1258:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1259:		// if the attacker was on the same team
;1260:#ifdef MISSIONPACK
;1261:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1262:#else	
;1263:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $479
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
EQI4 $479
line 1265
;1264:#endif
;1265:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $481
line 1266
;1266:				return;
ADDRGP4 $425
JUMPV
LABELV $481
line 1268
;1267:			}
;1268:		}
LABELV $479
line 1282
;1269:
;1270:
;1271:	/*
;1272:	if (mod == MOD_GRAPPLE && g_GrappleMode.integer == 2)
;1273:	{
;1274:		//targ->client->ps.speed = 0;
;1275:		targ->immobilized == qtrue;
;1276:		return;
;1277:	}
;1278:	*/
;1279:
;1280:	
;1281:	// No Team Killing Of MC -  Make this a cvar
;1282:	if ((targ->s.eType ==ET_BUILDABLE) && (targ->s.team == attacker->client->sess.sessionTeam))
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
NEI4 $484
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
NEI4 $484
line 1283
;1283:	{
line 1284
;1284:		if ((!strcmp(targ->classname, "mc")) && (g_PCTeamkills.integer == 0))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $488
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
NEI4 $486
ADDRGP4 g_PCTeamkills+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $486
line 1285
;1285:		{
line 1286
;1286:			return;
ADDRGP4 $425
JUMPV
LABELV $486
line 1288
;1287:		}
;1288:	}
LABELV $484
line 1291
;1289:
;1290:	
;1291:	if ((targ->s.eType ==ET_BUILDABLE) && (targ->health < 1000))
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
NEI4 $490
ADDRLP4 64
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $490
line 1292
;1292:	{
line 1293
;1293:		if (!strcmp(targ->classname, "mc"))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $488
ARGP4
ADDRLP4 68
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $492
line 1294
;1294:		{	
line 1295
;1295:				TeamCP("^9Power Core is Under Attack!",targ->s.team);
ADDRGP4 $494
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
line 1296
;1296:		}
LABELV $492
line 1297
;1297:	}
LABELV $490
line 1300
;1298:	
;1299:	// Debug
;1300:	if (trep_debug.integer) { G_Printf("Class : %s Taking Damage\n", targ->classname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $495
ADDRGP4 $498
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $495
line 1315
;1301:	
;1302:
;1303:#ifdef MISSIONPACK
;1304:		if (mod == MOD_PROXIMITY_MINE) {
;1305:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1306:				return;
;1307:			}
;1308:			if (targ == attacker) {
;1309:				return;
;1310:			}
;1311:		}
;1312:#endif
;1313:
;1314:		// check for godmode
;1315:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $499
line 1316
;1316:			return;
ADDRGP4 $425
JUMPV
LABELV $499
line 1318
;1317:		}
;1318:	}
LABELV $477
line 1322
;1319:
;1320:	// battlesuit protects from all radius damage (but takes knockback)
;1321:	// and protects 50% against all damage
;1322:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
line 1323
;1323:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1324
;1324:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $505
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $503
LABELV $505
line 1325
;1325:			return;
ADDRGP4 $425
JUMPV
LABELV $503
line 1327
;1326:		}
;1327:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1328
;1328:	}
LABELV $501
line 1331
;1329:
;1330:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1331:	if ( attacker->client && targ != attacker && targ->health > 0
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
EQU4 $506
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
EQU4 $506
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
LEI4 $506
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
EQI4 $506
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $506
line 1333
;1332:			&& targ->s.eType != ET_MISSILE
;1333:			&& targ->s.eType != ET_GENERAL) {
line 1334
;1334:		if ( OnSameTeam( targ, attacker ) ) {
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
EQI4 $508
line 1335
;1335:			attacker->client->ps.persistant[PERS_HITS]--;
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
line 1336
;1336:		} else {
ADDRGP4 $509
JUMPV
LABELV $508
line 1337
;1337:			attacker->client->ps.persistant[PERS_HITS]++;
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
line 1338
;1338:		}
LABELV $509
line 1339
;1339:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
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
line 1340
;1340:	}
LABELV $506
line 1344
;1341:
;1342:	// always give half damage if hurting self
;1343:	// calculated after knockback, so rocket jumping works
;1344:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $510
line 1345
;1345:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1346
;1346:	}
LABELV $510
line 1348
;1347:
;1348:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $512
line 1349
;1349:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1350
;1350:	}
LABELV $512
line 1351
;1351:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1352
;1352:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1355
;1353:
;1354:	// save some from armor
;1355:	asave = CheckArmor (targ, take, dflags);
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
line 1356
;1356:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1358
;1357:
;1358:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $514
line 1359
;1359:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $517
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
line 1361
;1360:			targ->health, take, asave );
;1361:	}
LABELV $514
line 1366
;1362:
;1363:	// add to the damage inflicted on a player this frame
;1364:	// the total will be turned into screen blends and view angle kicks
;1365:	// at the end of the frame
;1366:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $519
line 1367
;1367:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
line 1368
;1368:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1369
;1369:		} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 1370
;1370:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1371
;1371:		}
LABELV $522
line 1372
;1372:		client->damage_armor += asave;
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
line 1373
;1373:		client->damage_blood += take;
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
line 1374
;1374:		client->damage_knockback += knockback;
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
line 1375
;1375:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1376
;1376:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1377
;1377:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 1378
;1378:		} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 1379
;1379:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
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
line 1380
;1380:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 1
ASGNI4
line 1381
;1381:		}
LABELV $524
line 1382
;1382:	}
LABELV $519
line 1388
;1383:
;1384:	// See if it's the player hurting the emeny flag carrier
;1385:#ifdef MISSIONPACK
;1386:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1387:#else	
;1388:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $525
line 1390
;1389:#endif
;1390:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1391
;1391:	}
LABELV $525
line 1393
;1392:
;1393:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $528
line 1395
;1394:		// set the last client who damaged the target
;1395:		targ->client->lasthurt_client = attacker->s.number;
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
line 1396
;1396:		targ->client->lasthurt_mod = mod;
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
line 1397
;1397:	}
LABELV $528
line 1400
;1398:
;1399:	// Shafe - Trep - Headshots
;1400:	if (targ->client && attacker->client && targ->health > 0)
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
EQU4 $530
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $530
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
LEI4 $530
line 1401
;1401:	{   
line 1403
;1402:		// let's say only railgun can do head shots
;1403:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $532
line 1404
;1404:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ASGNF4
line 1407
;1405:	
;1406:			// handling crouching
;1407:			if(targ->client->ps.pm_flags & PMF_DUCKED){
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
EQI4 $534
line 1408
;1408:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
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
line 1409
;1409:			}
ADDRGP4 $535
JUMPV
LABELV $534
line 1411
;1410:			else
;1411:				height = abs(targ->r.mins[2]) + targ_maxs2; 
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
LABELV $535
line 1416
;1412:				
;1413:			// project the z component of point 
;1414:			// onto the z component of the model's origin
;1415:			// this results in the z component from the origin at 0
;1416:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
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
line 1417
;1417:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1419
;1418:		
;1419:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $536
line 1420
;1420:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1421
;1421:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1422
;1422:			}
LABELV $536
line 1423
;1423:		}
LABELV $532
line 1424
;1424:	}
LABELV $530
line 1429
;1425:	// Shafe - Trep - End Headshot Code
;1426:
;1427:
;1428:	// do the damage
;1429:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $538
line 1430
;1430:		targ->health = targ->health - take;
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
line 1431
;1431:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $540
line 1432
;1432:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
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
line 1433
;1433:		}
LABELV $540
line 1435
;1434:			
;1435:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $542
line 1436
;1436:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $544
line 1437
;1437:				targ->flags |= FL_NO_KNOCKBACK;
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
LABELV $544
line 1439
;1438:
;1439:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $546
line 1440
;1440:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -999
ASGNI4
LABELV $546
line 1442
;1441:
;1442:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1443
;1443:			targ->die (targ, inflictor, attacker, take, mod);
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
line 1444
;1444:			return;
ADDRGP4 $425
JUMPV
LABELV $542
line 1445
;1445:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $548
line 1446
;1446:			targ->pain (targ, attacker, take);
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
line 1447
;1447:		}
LABELV $548
line 1448
;1448:	}
LABELV $538
line 1450
;1449:
;1450:}
LABELV $425
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1461
;1451:
;1452:
;1453:/*
;1454:============
;1455:CanDamage
;1456:
;1457:Returns qtrue if the inflictor can directly damage the target.  Used for
;1458:explosions and melee attacks.
;1459:============
;1460:*/
;1461:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1468
;1462:	vec3_t	dest;
;1463:	trace_t	tr;
;1464:	vec3_t	midpoint;
;1465:
;1466:	// use the midpoint of the bounds instead of the origin, because
;1467:	// bmodels may have their origin is 0,0,0
;1468:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
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
line 1469
;1469:	VectorScale (midpoint, 0.5, midpoint);
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
line 1471
;1470:
;1471:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1472
;1472:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1473
;1473:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $561
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $557
LABELV $561
line 1474
;1474:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $557
line 1478
;1475:
;1476:	// this should probably check in the plane of projection, 
;1477:	// rather than in world coordinate, and also include Z
;1478:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1479
;1479:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1480
;1480:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1481
;1481:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1482
;1482:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $563
line 1483
;1483:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $563
line 1485
;1484:
;1485:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1486
;1486:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1487
;1487:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1488
;1488:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1489
;1489:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $567
line 1490
;1490:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $567
line 1492
;1491:
;1492:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1493
;1493:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1494
;1494:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1495
;1495:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1496
;1496:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $571
line 1497
;1497:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $571
line 1499
;1498:
;1499:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1500
;1500:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1501
;1501:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1502
;1502:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1503
;1503:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $575
line 1504
;1504:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $550
JUMPV
LABELV $575
line 1507
;1505:
;1506:
;1507:	return qfalse;
CNSTI4 0
RETI4
LABELV $550
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1517
;1508:}
;1509:
;1510:
;1511:/*
;1512:============
;1513:G_RadiusDamage
;1514:============
;1515:*/
;1516:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1517:					 gentity_t *ignore, int mod) {
line 1526
;1518:	float		points, dist;
;1519:	gentity_t	*ent;
;1520:	int			entityList[MAX_GENTITIES];
;1521:	int			numListedEntities;
;1522:	vec3_t		mins, maxs;
;1523:	vec3_t		v;
;1524:	vec3_t		dir;
;1525:	int			i, e;
;1526:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1528
;1527:
;1528:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $579
line 1529
;1529:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1530
;1530:	}
LABELV $579
line 1532
;1531:
;1532:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $581
line 1533
;1533:		mins[i] = origin[i] - radius;
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
line 1534
;1534:		maxs[i] = origin[i] + radius;
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
line 1535
;1535:	}
LABELV $582
line 1532
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $581
line 1537
;1536:
;1537:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1539
;1538:
;1539:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $585
line 1540
;1540:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 916
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
line 1542
;1541:
;1542:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $589
line 1543
;1543:			continue;
ADDRGP4 $586
JUMPV
LABELV $589
line 1544
;1544:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $591
line 1545
;1545:			continue;
ADDRGP4 $586
JUMPV
LABELV $591
line 1548
;1546:
;1547:		// find the distance from the edge of the bounding box
;1548:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $593
line 1549
;1549:			if ( origin[i] < ent->r.absmin[i] ) {
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
GEF4 $597
line 1550
;1550:				v[i] = ent->r.absmin[i] - origin[i];
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
line 1551
;1551:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $598
JUMPV
LABELV $597
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
LEF4 $599
line 1552
;1552:				v[i] = origin[i] - ent->r.absmax[i];
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
line 1553
;1553:			} else {
ADDRGP4 $600
JUMPV
LABELV $599
line 1554
;1554:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1555
;1555:			}
LABELV $600
LABELV $598
line 1556
;1556:		}
LABELV $594
line 1548
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $593
line 1558
;1557:
;1558:		dist = VectorLength( v );
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
line 1559
;1559:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $601
line 1560
;1560:			continue;
ADDRGP4 $586
JUMPV
LABELV $601
line 1563
;1561:		}
;1562:
;1563:		points = damage * ( 1.0 - dist / radius );
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
line 1565
;1564:
;1565:		if( CanDamage (ent, origin) ) {
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
EQI4 $603
line 1566
;1566:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $605
line 1567
;1567:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1568
;1568:			}
LABELV $605
line 1569
;1569:			VectorSubtract (ent->r.currentOrigin, origin, dir);
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
line 1572
;1570:			// push the center of mass higher than the origin so players
;1571:			// get knocked into the air more
;1572:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1573
;1573:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1574
;1574:		}
LABELV $603
line 1575
;1575:	}
LABELV $586
line 1539
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $588
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $585
line 1577
;1576:
;1577:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $578
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
LABELV $517
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
LABELV $498
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 84
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $494
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
LABELV $488
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $391
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
LABELV $376
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
LABELV $373
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
LABELV $370
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
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $364
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
LABELV $356
byte 1 115
byte 1 0
align 1
LABELV $355
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
LABELV $354
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
LABELV $350
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
LABELV $349
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
LABELV $312
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
LABELV $311
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
LABELV $274
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 73
byte 1 83
byte 1 32
byte 1 79
byte 1 78
byte 1 32
byte 1 65
byte 1 32
byte 1 68
byte 1 89
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 83
byte 1 80
byte 1 82
byte 1 69
byte 1 69
byte 1 33
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $273
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 73
byte 1 83
byte 1 32
byte 1 79
byte 1 78
byte 1 32
byte 1 65
byte 1 32
byte 1 68
byte 1 89
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 83
byte 1 80
byte 1 82
byte 1 69
byte 1 69
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $270
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 73
byte 1 83
byte 1 32
byte 1 79
byte 1 78
byte 1 32
byte 1 65
byte 1 32
byte 1 75
byte 1 73
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 83
byte 1 80
byte 1 82
byte 1 69
byte 1 69
byte 1 33
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $269
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 73
byte 1 83
byte 1 32
byte 1 79
byte 1 78
byte 1 32
byte 1 65
byte 1 32
byte 1 75
byte 1 73
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 83
byte 1 80
byte 1 82
byte 1 69
byte 1 69
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $258
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
LABELV $257
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
LABELV $250
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $249
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
LABELV $239
byte 1 112
byte 1 100
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $215
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
LABELV $214
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
LABELV $194
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
LABELV $193
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
LABELV $182
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
LABELV $181
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
LABELV $180
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
LABELV $179
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
LABELV $178
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
LABELV $177
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
LABELV $176
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
LABELV $175
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
LABELV $174
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
LABELV $173
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
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $164
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
LABELV $163
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
LABELV $162
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
LABELV $161
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
LABELV $160
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
LABELV $159
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
LABELV $158
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
LABELV $157
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
