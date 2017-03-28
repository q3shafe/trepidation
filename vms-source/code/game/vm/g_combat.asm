export BroadCastSound
code
proc BroadCastSound 36 8
file "../g_combat.c"
line 9
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
CNSTI4 3492
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
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2564
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
CNSTI4 2492
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 85
;84:
;85:	if ((g_GameMode.integer != 3) && (g_GameMode.integer != 999) && (g_GameMode.integer != 5))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $79
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
EQI4 $79
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 5
EQI4 $79
line 86
;86:	{
line 87
;87:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $84
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
LABELV $84
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
EQI4 $91
ADDRLP4 16
INDIRI4
CNSTI4 10
NEI4 $89
LABELV $91
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
NEI4 $92
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
LABELV $92
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
NEI4 $94
line 123
;123:				weapon = WP_NONE;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 124
;124:			}
LABELV $94
line 125
;125:		}
LABELV $89
line 128
;126:
;127:	// Shafe - Trep - Dont drop weapons In Instagib -- 
;128:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $96
line 129
;129:	{
line 131
;130:		
;131:		if ( weapon > WP_GAUNTLET && weapon != WP_GRAPPLING_HOOK && self->client->ps.ammo[ weapon ] ) 
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $99
ADDRLP4 16
INDIRI4
CNSTI4 10
EQI4 $99
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
EQI4 $99
line 132
;132:		{
line 134
;133:			// find the item type for this weapon
;134:			if(weapon) { item = BG_FindItemForWeapon( weapon ); } // github bug 21
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $101
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
LABELV $101
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
ADDRGP4 $100
JUMPV
LABELV $99
line 139
;139:		{
line 141
;140:			// Else if it's arsenal or survival drop it anyway.
;141:			if (g_GameMode.integer == 2 || g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $107
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $103
LABELV $107
line 142
;142:			{
line 144
;143:				// find the item type for this weapon
;144:				if(weapon) { item = BG_FindItemForWeapon( weapon ); }  // github bug 21
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $108
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
LABELV $108
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
LABELV $103
line 150
;150:		}
LABELV $100
line 151
;151:	} // End Shafe - Trep instagib
LABELV $96
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
LABELV $110
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
LEI4 $114
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
NEU4 $117
line 163
;163:					continue;
ADDRGP4 $111
JUMPV
LABELV $117
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
CNSTI4 784
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
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 1
GEI4 $120
line 169
;169:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 1
ASGNI4
line 170
;170:				}
LABELV $120
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
LABELV $114
line 173
;173:		}
LABELV $111
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
LTI4 $110
line 175
;174:	//}
;175:}
LABELV $88
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
EQU4 $123
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $123
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
ADDRGP4 $124
JUMPV
LABELV $123
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $127
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $127
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
ADDRGP4 $128
JUMPV
LABELV $127
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
ADDRGP4 $122
JUMPV
LABELV $128
LABELV $124
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
LABELV $122
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
CNSTI4 760
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
LABELV $133
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
CNSTI4 2732
ADDP4
CNSTI4 1
ASGNI4
line 321
;321:}
LABELV $134
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
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $136
line 331
;331:		return;
ADDRGP4 $135
JUMPV
LABELV $136
line 333
;332:	}
;333:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $138
line 334
;334:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 -39
ASGNI4
line 335
;335:		return;
ADDRGP4 $135
JUMPV
LABELV $138
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
LABELV $135
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
EQI4 $142
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $142
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
EQI4 $145
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $145
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
EQI4 $147
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $147
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
EQI4 $149
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $149
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
EQI4 $151
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $151
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
EQI4 $153
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $153
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
EQI4 $155
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $155
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
EQI4 $157
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $157
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
EQI4 $159
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $159
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
EQI4 $161
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $161
line 356
;355:
;356:	return qtrue;
CNSTI4 1
RETI4
LABELV $141
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
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
address $187
address $188
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
NEI4 $193
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $193
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $190
LABELV $193
line 439
;438:		self->client->ps.powerups[PW_BLUEFLAG] ||
;439:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 441
;440:		// get the goal flag this player should have been going for
;441:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $194
line 442
;442:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $197
line 443
;443:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $199
ASGNP4
line 444
;444:			}
ADDRGP4 $195
JUMPV
LABELV $197
line 445
;445:			else {
line 446
;446:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $200
ASGNP4
line 447
;447:			}
line 448
;448:		}
ADDRGP4 $195
JUMPV
LABELV $194
line 449
;449:		else {
line 450
;450:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $201
line 451
;451:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $200
ASGNP4
line 452
;452:			}
ADDRGP4 $202
JUMPV
LABELV $201
line 453
;453:			else {
line 454
;454:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $199
ASGNP4
line 455
;455:			}
LABELV $202
line 456
;456:		}
LABELV $195
line 457
;457:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $203
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
LABELV $204
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $203
LABELV $206
line 463
;462:		// if we found the destination flag and it's not picked up
;463:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $207
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $207
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
GEF4 $211
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
EQU4 $213
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
LABELV $213
line 471
;471:			}
LABELV $211
line 472
;472:		}
LABELV $207
line 473
;473:	}
LABELV $190
line 474
;474:}
LABELV $189
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
EQI4 $216
line 488
;488:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $218
line 489
;489:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $220
ASGNP4
line 490
;490:		}
ADDRGP4 $219
JUMPV
LABELV $218
line 491
;491:		else {
line 492
;492:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $221
ASGNP4
line 493
;493:		}
LABELV $219
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
EQU4 $222
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
GEF4 $226
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
EQU4 $228
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
LABELV $228
line 504
;504:			}
LABELV $226
line 505
;505:		}
LABELV $222
line 506
;506:	}
LABELV $216
line 507
;507:}
LABELV $215
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $231
skip 4
align 4
LABELV $425
skip 4
export player_die
code
proc player_die 136 28
line 521
;508:
;509:
;510:
;511:/*
;512:==================
;513:player_die
;514:==================
;515:*/
;516:extern int CountSurvivors();
;517:extern int CountTeamSurvivors();
;518://extern int CountRedSurvivors();
;519://extern int CountBlueSurvivors();
;520:
;521:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 534
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
;534:	gentity_t	*grenades = NULL; // -Vincent
ADDRLP4 0
CNSTP4 0
ASGNP4
line 538
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
NEI4 $232
line 539
;539:		return;
ADDRGP4 $230
JUMPV
LABELV $232
line 543
;540:	}
;541:
;542:	// freeze
;543:	if ( self->client->pers.Frozen) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $234
line 544
;544:		return;
ADDRGP4 $230
JUMPV
LABELV $234
line 547
;545:	}
;546:
;547:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $236
line 548
;548:		return;
ADDRGP4 $230
JUMPV
LABELV $236
line 552
;549:	}
;550:
;551:
;552:	if ((self->client->ps.eFlags & EF_TALK) && (meansOfDeath != MOD_SUICIDE) && (attacker != &g_entities[ENTITYNUM_WORLD]))
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
EQI4 $239
ADDRFP4 16
INDIRI4
CNSTI4 20
EQI4 $239
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $239
line 553
;553:	{
line 554
;554:		attacker->InstaChatFrags++;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 864
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
line 555
;555:	} 
LABELV $239
line 561
;556:
;557:	
;558:	
;559://unlagged - backward reconciliation #2
;560:	// make sure the body shows up in the client's current position
;561:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 565
;562://unlagged - backward reconciliation #2
;563:
;564:	// check for an almost capture
;565:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 567
;566:	// check for a player that almost brought in cubes
;567:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 569
;568:
;569:	if (self->client && self->client->hook)
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
EQU4 $242
ADDRLP4 40
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $242
line 570
;570:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $242
line 578
;571:#ifdef MISSIONPACK
;572:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;573:		self->client->ps.eFlags &= ~EF_TICKING;
;574:		self->activator->think = G_FreeEntity;
;575:		self->activator->nextthink = level.time;
;576:	}
;577:#endif
;578:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 581
;579:
;580:	// Shafe - Trep - Clear out the PDG
;581:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 582
;582:	VectorClear( self->teleloc ); 
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRGP4 $245
JUMPV
LABELV $244
line 585
;583:	 
;584:	while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;585:	{
line 586
;586:		if ( self->client->pdgfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
CNSTI4 1
NEI4 $248
line 587
;587:		{ // When a grenade has been fired, let it explode -Vincent
line 588
;588:			if(grenades->r.ownerNum == self->s.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $250
line 589
;589:			{ // Confirm owner
line 590
;590:			grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 591
;591:			grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 592
;592:			}
LABELV $250
line 593
;593:		self->client->pdgfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 594
;594:		}
LABELV $248
line 595
;595:	}
LABELV $245
line 584
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $247
ARGP4
ADDRLP4 56
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $244
ADDRGP4 $254
JUMPV
LABELV $253
line 599
;596:
;597:	// Shafe - Trep Clear Out Bombs
;598:	while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
;599:	{
line 600
;600:		if ( self->client->bombfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 1
NEI4 $257
line 601
;601:		{ // When a grenade has been fired, let it explode -Vincent
line 602
;602:			if(grenades->r.ownerNum == self->s.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $259
line 603
;603:			{ // Confirm owner
line 604
;604:			grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 605
;605:			grenades->think = G_ExplodeBomb;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeBomb
ASGNP4
line 606
;606:			}
LABELV $259
line 607
;607:		self->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 608
;608:		}
LABELV $257
line 609
;609:	}
LABELV $254
line 598
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $256
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
NEU4 $253
line 611
;610:	
;611:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $262
line 612
;612:		killer = attacker->s.number;
ADDRLP4 8
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 613
;613:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
line 614
;614:			killerName = attacker->client->pers.netname;
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 615
;615:		} else {
ADDRGP4 $263
JUMPV
LABELV $264
line 616
;616:			killerName = "<non-client>";
ADDRLP4 24
ADDRGP4 $266
ASGNP4
line 617
;617:		}
line 618
;618:	} else {
ADDRGP4 $263
JUMPV
LABELV $262
line 619
;619:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 620
;620:		killerName = "<world>";
ADDRLP4 24
ADDRGP4 $267
ASGNP4
line 621
;621:	}
LABELV $263
line 623
;622:
;623:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $270
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $268
LABELV $270
line 624
;624:		killer = ENTITYNUM_WORLD;
ADDRLP4 8
CNSTI4 1022
ASGNI4
line 625
;625:		killerName = "<world>";
ADDRLP4 24
ADDRGP4 $267
ASGNP4
line 626
;626:	}
LABELV $268
line 628
;627:
;628:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 68
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $273
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $271
LABELV $273
line 629
;629:		obit = "<bad obituary>";
ADDRLP4 28
ADDRGP4 $274
ASGNP4
line 630
;630:	} else {
ADDRGP4 $272
JUMPV
LABELV $271
line 631
;631:		obit = modNames[ meansOfDeath ];
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 632
;632:	}
LABELV $272
line 634
;633:
;634:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $275
ARGP4
ADDRLP4 8
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
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 72
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
line 639
;635:		killer, self->s.number, meansOfDeath, killerName, 
;636:		self->client->pers.netname, obit );
;637:
;638:	// broadcast the death event to everyone
;639:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 62
ARGI4
ADDRLP4 76
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
ASGNP4
line 640
;640:	ent->s.eventParm = meansOfDeath;
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 641
;641:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 642
;642:	ent->s.otherEntityNum2 = killer;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 643
;643:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 12
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 32
ASGNI4
line 645
;644:
;645:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 647
;646:
;647:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 649
;648:
;649:	if (meansOfDeath != MOD_SUICIDE)
ADDRFP4 16
INDIRI4
CNSTI4 20
EQI4 $276
line 650
;650:	{
line 652
;651:		
;652:		if (attacker->client != self->client) 
ADDRLP4 84
CNSTI4 524
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
CVPU4 4
EQU4 $278
line 653
;653:		{
line 655
;654:
;655:			if (self->client->pers.connected == CON_CONNECTED && attacker->client->pers.connected == CON_CONNECTED)
ADDRLP4 88
CNSTI4 524
ASGNI4
ADDRLP4 92
CNSTI4 468
ASGNI4
ADDRLP4 96
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $280
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $280
line 656
;656:			{
line 658
;657:
;658:				self->InstaStreak = 0;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 659
;659:				attacker->InstaStreak++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 848
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
line 660
;660:				self->InstaDeaths++;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 852
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
line 661
;661:				self->InstaDeathStreak++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 856
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
line 662
;662:				attacker->InstaDeathStreak=0;
ADDRFP4 8
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 0
ASGNI4
line 665
;663:				
;664:				// Calculating The Most Kills Without Dying
;665:				attacker->InstaKillsInRowTemp++;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 880
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 666
;666:				if (self->InstaKillsInRowTemp > self->InstaKillsInRow)
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDRLP4 116
INDIRP4
CNSTI4 876
ADDP4
INDIRI4
LEI4 $282
line 667
;667:				{
line 668
;668:					self->InstaKillsInRow = self->InstaKillsInRowTemp;
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 120
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ASGNI4
line 669
;669:				}
LABELV $282
line 670
;670:				self->InstaKillsInRowTemp = 0;
ADDRFP4 0
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 0
ASGNI4
line 674
;671:
;672:
;673:				// Streak Of 7 Gives them a spree msg :)
;674:				if (attacker->InstaStreak == 7)
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 7
NEI4 $284
line 675
;675:				{
line 676
;676:					if((attacker->s.weapon != WP_TURRET) && (meansOfDeath != MOD_UNKNOWN) && (meansOfDeath != MOD_TURRET) && (meansOfDeath != MOD_WATER)&& (meansOfDeath != MOD_LAVA) && (meansOfDeath != MOD_SLIME) && (meansOfDeath != MOD_CRUSH) && (meansOfDeath != MOD_FALLING)) // Turrets dont get killing sprees -- shafe
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
EQI4 $286
ADDRLP4 120
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 24
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 14
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 16
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 15
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 17
EQI4 $286
ADDRLP4 120
INDIRI4
CNSTI4 19
EQI4 $286
line 677
;677:					{
line 679
;678:					
;679:						if(attacker->client->pers.connected == CON_CONNECTED) // Github bug #11
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $288
line 680
;680:						{
line 681
;681:							trap_SendServerCommand( -1, va( "print \"" S_COLOR_YELLOW "%s ^7IS ON A KILLING SPREE!\n\"", attacker->client->pers.netname ) );
ADDRGP4 $290
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 682
;682:							trap_SendServerCommand( -1, va("cp \"^7%s IS ON A KILLING SPREE!!\n\"", attacker->client->pers.netname ) );
ADDRGP4 $291
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 684
;683:							//attacker->client->ps.persistant[PERS_SCORE]+=1;
;684:							attacker->InstaMostKillSpree++;					
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 868
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 685
;685:						}
LABELV $288
line 686
;686:					}
LABELV $286
line 687
;687:						attacker->InstaStreak = 0;
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 690
;688:
;689:				
;690:				}
LABELV $284
line 693
;691:
;692:				// 4 Deaths without scoring makes a Dying spree dieing
;693:				if (self->InstaDeathStreak == 4) 
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 4
NEI4 $292
line 694
;694:				{
line 695
;695:						trap_SendServerCommand( -1, va( "print \"" S_COLOR_YELLOW "%s ^7IS ON A DYING SPREE!\n\"", self->client->pers.netname ) );
ADDRGP4 $294
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
line 696
;696:						trap_SendServerCommand( -1, va("cp \"^7%s IS ON A DYING SPREE!!\n\"", self->client->pers.netname ) );
ADDRGP4 $295
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 697
;697:						self->InstaMostDeathSpree++;
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 872
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 698
;698:						self->InstaDeathStreak = 0;
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 0
ASGNI4
line 700
;699:
;700:				}
LABELV $292
line 703
;701:				
;702:				
;703:			}
LABELV $280
line 704
;704:		}
LABELV $278
line 705
;705:	}
LABELV $276
line 708
;706:
;707:
;708:	if (attacker && attacker->client) {
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
CNSTU4 0
ASGNU4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $296
ADDRLP4 84
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $296
line 709
;709:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2668
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 711
;710:
;711:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 92
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRP4
CVPU4 4
EQU4 $300
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $298
LABELV $300
line 712
;712:			AddScore( attacker, self->r.currentOrigin, -1 );
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
line 715
;713:			
;714:
;715:		} else {
ADDRGP4 $297
JUMPV
LABELV $298
line 716
;716:			AddScore( attacker, self->r.currentOrigin, 1 );
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
line 718
;717:
;718:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $301
line 721
;719:				
;720:				// play humiliation on player
;721:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 300
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
line 724
;722:
;723:				// add the sprite over the player's head
;724:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
CNSTI4 -231497
BANDI4
ASGNI4
line 725
;725:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 726
;726:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 729
;727:
;728:				// also play humiliation on target
;729:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 730
;730:			}
LABELV $301
line 734
;731:
;732:			// check for two kills in a short amount of time
;733:			// if this is close enough to the last kill, give a reward sound
;734:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $304
line 736
;735:				// play excellent on player
;736:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 288
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
line 739
;737:
;738:				// add the sprite over the player's head
;739:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
CNSTI4 -231497
BANDI4
ASGNI4
line 740
;740:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 741
;741:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 742
;742:			}
LABELV $304
line 743
;743:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 745
;744:
;745:		}
line 746
;746:	} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 747
;747:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 748
;748:	}
LABELV $297
line 751
;749:
;750:	// Add team bonuses
;751:	Team_FragBonuses(self, inflictor, attacker);
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
line 754
;752:
;753:	// if I committed suicide, the flag does not fall, it returns.
;754:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $309
line 755
;755:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
line 756
;756:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 757
;757:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 758
;758:		}
ADDRGP4 $312
JUMPV
LABELV $311
line 759
;759:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
line 760
;760:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 761
;761:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 762
;762:		}
ADDRGP4 $314
JUMPV
LABELV $313
line 763
;763:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $315
line 764
;764:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 765
;765:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 766
;766:		}
LABELV $315
LABELV $314
LABELV $312
line 767
;767:	}
LABELV $309
line 770
;768:
;769:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;770:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 92
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 92
INDIRI4
ASGNI4
line 772
;771:		
;772:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $317
line 773
;773:		TossClientItems( self ); // Testing
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 774
;774:	}
ADDRGP4 $318
JUMPV
LABELV $317
line 775
;775:	else {
line 776
;776:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
line 777
;777:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 778
;778:		}
ADDRGP4 $320
JUMPV
LABELV $319
line 779
;779:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $321
line 780
;780:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 781
;781:		}
ADDRGP4 $322
JUMPV
LABELV $321
line 782
;782:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 783
;783:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 784
;784:		}
LABELV $323
LABELV $322
LABELV $320
line 785
;785:	}
LABELV $318
line 794
;786:#ifdef MISSIONPACK
;787:	TossClientPersistantPowerups( self );
;788:	if( g_gametype.integer == GT_HARVESTER ) {
;789:		TossClientCubes( self );
;790:	}
;791:#endif
;792:
;793:	
;794:	if ((level.firstStrike == qfalse) && (!level.warmupTime))
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRGP4 level+9236
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $325
ADDRGP4 level+16
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $325
line 795
;795:	{
line 796
;796:		if (self != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $329
line 797
;797:		{
line 798
;798:			level.firstStrike = qtrue;
ADDRGP4 level+9236
CNSTI4 1
ASGNI4
line 799
;799:			BroadCastSound("sound/misc/laff02.ogg");
ADDRGP4 $332
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 800
;800:			trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $333
ARGP4
ADDRFP4 8
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
line 801
;801:		}
LABELV $329
line 802
;802:	}
LABELV $325
line 804
;803:
;804:	if (level.warmupTime != 0)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $334
line 805
;805:	{
line 806
;806:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 808
;807:		//trap_SendServerCommand( -1, va("print \"%s FS Is FALSE!!\n\"",attacker->client->pers.netname));	
;808:	} 
LABELV $334
line 812
;809:		
;810:	
;811:		// Shafe - Trep - Arsenal Stuff
;812:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 100
INDIRI4
LEI4 $338
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $338
ADDRGP4 level+16
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $338
line 813
;813:		{
line 814
;814:			tmpW = self->s.weapon;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 816
;815:
;816:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $342
line 817
;817:			{
line 818
;818:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 20
INDIRI4
CNSTI4 9
NEI4 $345
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $345
line 819
;819:				if (tmpW == 8) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $347
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $347
line 820
;820:				if (tmpW == 7) { self->client->pers.h_plasma = qfalse;}		
ADDRLP4 20
INDIRI4
CNSTI4 7
NEI4 $349
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $349
line 821
;821:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 6
NEI4 $351
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $351
line 822
;822:				if (tmpW == 5) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 5
NEI4 $353
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $353
line 823
;823:				if (tmpW == 4) { self->client->pers.h_sg = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 4
NEI4 $355
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $355
line 824
;824:				if (tmpW == 3) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $357
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $357
line 825
;825:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $359
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $359
line 826
;826:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $361
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $361
line 828
;827:
;828:			}
LABELV $342
line 832
;829:			
;830:
;831:
;832:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $366
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 IsOutOfWeapons
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $363
LABELV $366
line 833
;833:			{
line 836
;834:				
;835:				// Arsenal Message
;836:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $367
line 837
;837:				{
line 838
;838:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $370
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
line 839
;839:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $371
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 840
;840:				}
LABELV $367
line 843
;841:
;842:				// LMS Message
;843:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $372
line 844
;844:				{
line 845
;845:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $375
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
line 846
;846:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $376
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 847
;847:				}
LABELV $372
line 850
;848:				
;849:				// Send them to Spec
;850:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 2492
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 851
;851:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 852
;852:				self->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 3
ASGNI4
line 853
;853:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 855
;854:				// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;855:				level.lastClient = attacker->client;
ADDRGP4 level+9244
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 857
;856:
;857:				tmpCnt = (CountSurvivors());
ADDRLP4 112
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 112
INDIRI4
ASGNI4
line 860
;858:
;859:						
;860:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 32
INDIRI4
ADDRGP4 level+9228
INDIRI4
EQI4 $379
line 861
;861:				{
line 863
;862:
;863:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9228
ADDRLP4 32
INDIRI4
ASGNI4
line 866
;864:			
;865:			
;866:					if (tmpCnt == 5) 
ADDRLP4 32
INDIRI4
CNSTI4 5
NEI4 $383
line 867
;867:					{
line 868
;868:						BroadCastSound("sound/misc/5.ogg");
ADDRGP4 $385
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 869
;869:					}
LABELV $383
line 871
;870:					
;871:					if (tmpCnt == 4) 
ADDRLP4 32
INDIRI4
CNSTI4 4
NEI4 $386
line 872
;872:					{
line 873
;873:						BroadCastSound("sound/misc/4.ogg");
ADDRGP4 $388
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 874
;874:					}
LABELV $386
line 876
;875:
;876:					if (tmpCnt == 3) 
ADDRLP4 32
INDIRI4
CNSTI4 3
NEI4 $389
line 877
;877:					{
line 878
;878:						BroadCastSound("sound/misc/3.ogg");
ADDRGP4 $391
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 879
;879:					}
LABELV $389
line 881
;880:
;881:					if (tmpCnt == 2) 
ADDRLP4 32
INDIRI4
CNSTI4 2
NEI4 $392
line 882
;882:					{
line 884
;883:						
;884:						BroadCastSound("sound/misc/2.ogg");
ADDRGP4 $394
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 885
;885:					}
LABELV $392
line 887
;886:
;887:					if (tmpCnt == 1) 
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $395
line 888
;888:					{
line 889
;889:						BroadCastSound("sound/misc/laff01.ogg");
ADDRGP4 $397
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 891
;890:
;891:					}
LABELV $395
line 893
;892:				
;893:				}
LABELV $379
line 894
;894:			} 
LABELV $363
line 896
;895:
;896:		}
LABELV $338
line 900
;897:		// End Arsenal Stuff
;898:
;899:		// Freeze Frozen
;900:		if (g_GameMode.integer == 5	)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 5
NEI4 $398
line 901
;901:		{
line 902
;902:			self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 2492
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 903
;903:			self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 904
;904:			self->client->pers.Frozen = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
CNSTI4 1
ASGNI4
line 905
;905:			self->client->pers.TrueTeam = self->client->sess.sessionTeam;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 2496
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ASGNI4
line 906
;906:			self->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 3
ASGNI4
line 907
;907:			SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 909
;908:			// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;909:			level.lastClient = attacker->client;
ADDRGP4 level+9244
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 910
;910:		}
LABELV $398
line 913
;911:
;912:		// reset zoom at death
;913:		trap_SendServerCommand(self->client->ps.clientNum, "-gzoom");
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $402
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 914
;914:		self->client->Zoomed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 0
ASGNI4
line 916
;915:
;916:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 919
;917:	// send updated scores to any clients that are following this one,
;918:	// or they would get stale scoreboards
;919:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $406
JUMPV
LABELV $403
line 922
;920:		gclient_t	*client;
;921:
;922:		client = &level.clients[i];
ADDRLP4 104
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 923
;923:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 104
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $408
line 924
;924:			continue;
ADDRGP4 $404
JUMPV
LABELV $408
line 926
;925:		}
;926:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 104
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
EQI4 $410
line 927
;927:			continue;
ADDRGP4 $404
JUMPV
LABELV $410
line 929
;928:		}
;929:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 104
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $412
line 930
;930:			Cmd_Score_f( g_entities + i );
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 931
;931:		}
LABELV $412
line 932
;932:	}
LABELV $404
line 919
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $406
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $403
line 936
;933:
;934:	
;935:
;936:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 938
;937:
;938:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 939
;939:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 940
;940:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 942
;941:
;942:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 943
;943:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 944
;944:	LookAtKiller (self, inflictor, attacker);
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
line 946
;945:
;946:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 948
;947:
;948:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 950
;949:
;950:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 3238002688
ASGNF4
line 954
;951:
;952:	// don't allow respawn until the death anim is done
;953:	// g_forcerespawn may force spawning at some later time
;954:	self->client->respawnTime = level.time + 1700;  // This is the real line
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 959
;955:	
;956:
;957:
;958:	// remove powerups
;959:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
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
line 961
;960:
;961:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $415
line 962
;962:	{
line 963
;963:			BroadCastSound("sound/misc/headshot.ogg");
ADDRGP4 $417
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 964
;964:	}
LABELV $415
line 969
;965:
;966:
;967:
;968:	// never gib in a nodrop
;969:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $424
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $424
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $424
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $421
LABELV $424
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $418
LABELV $421
line 971
;970:		// gib death
;971:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 972
;972:	} else {
ADDRGP4 $419
JUMPV
LABELV $418
line 976
;973:		// normal death
;974:		static int i;
;975:
;976:		switch ( i ) {
ADDRLP4 108
ADDRGP4 $425
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 108
INDIRI4
CNSTI4 1
EQI4 $429
ADDRLP4 108
INDIRI4
CNSTI4 2
EQI4 $430
ADDRGP4 $426
JUMPV
LABELV $428
line 978
;977:		case 0:
;978:			anim = BOTH_DEATH1;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 979
;979:			break;
ADDRGP4 $427
JUMPV
LABELV $429
line 981
;980:		case 1:
;981:			anim = BOTH_DEATH2;
ADDRLP4 36
CNSTI4 2
ASGNI4
line 982
;982:			break;
ADDRGP4 $427
JUMPV
LABELV $430
LABELV $426
line 985
;983:		case 2:
;984:		default:
;985:			anim = BOTH_DEATH3;
ADDRLP4 36
CNSTI4 4
ASGNI4
line 986
;986:			break;
LABELV $427
line 991
;987:		}
;988:
;989:		// for the no-blood option, we need to prevent the health
;990:		// from going to gib level
;991:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $431
line 992
;992:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 -39
ASGNI4
line 993
;993:		}
LABELV $431
line 995
;994:
;995:		self->client->ps.legsAnim = 
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 116
CNSTI4 128
ASGNI4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
ADDRLP4 116
INDIRI4
BANDI4
ADDRLP4 116
INDIRI4
BXORI4
ADDRLP4 36
INDIRI4
BORI4
ASGNI4
line 997
;996:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;997:		self->client->ps.torsoAnim = 
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 124
CNSTI4 128
ASGNI4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
BANDI4
ADDRLP4 124
INDIRI4
BXORI4
ADDRLP4 36
INDIRI4
BORI4
ASGNI4
line 1000
;998:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;999:
;1000:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $425
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
line 1003
;1001:
;1002:		// Shafe - Trep Headshot //////////////////////////////////////////
;1003:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $433
line 1004
;1004:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $434
JUMPV
LABELV $433
line 1006
;1005:		else
;1006:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 0
ASGNI4
LABELV $434
line 1010
;1007:		// Shafe - Trep - End Headshot /////////////////////////////
;1008:
;1009:		// the body can still be gibbed
;1010:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 body_die
ASGNP4
line 1013
;1011:
;1012:		// globally cycle through the different death animations
;1013:		i = ( i + 1 ) % 3;
ADDRLP4 128
ADDRGP4 $425
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 1022
;1014:
;1015:
;1016:
;1017:#ifdef MISSIONPACK
;1018:		if (self->s.eFlags & EF_KAMIKAZE) {
;1019:			Kamikaze_DeathTimer( self );
;1020:		}
;1021:#endif
;1022:	}
LABELV $419
line 1027
;1023:
;1024:	
;1025:
;1026:
;1027:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1029
;1028:
;1029:}
LABELV $230
endproc player_die 136 28
export CheckArmor
proc CheckArmor 20 4
line 1038
;1030:
;1031:
;1032:/*
;1033:================
;1034:CheckArmor
;1035:================
;1036:*/
;1037:int CheckArmor (gentity_t *ent, int damage, int dflags)
;1038:{
line 1043
;1039:	gclient_t	*client;
;1040:	int			save;
;1041:	int			count;
;1042:
;1043:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $436
line 1044
;1044:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $435
JUMPV
LABELV $436
line 1046
;1045:
;1046:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1048
;1047:
;1048:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $438
line 1049
;1049:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $435
JUMPV
LABELV $438
line 1051
;1050:
;1051:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $440
line 1052
;1052:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $435
JUMPV
LABELV $440
line 1055
;1053:
;1054:	// armor
;1055:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1056
;1056:	save = ceil( damage * ARMOR_PROTECTION );
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
line 1057
;1057:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $442
line 1058
;1058:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $442
line 1060
;1059:
;1060:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $444
line 1061
;1061:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $435
JUMPV
LABELV $444
line 1063
;1062:
;1063:	client->ps.stats[STAT_ARMOR] -= save;
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
line 1065
;1064:
;1065:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $435
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 1073
;1066:}
;1067:
;1068:/*
;1069:================
;1070:RaySphereIntersections
;1071:================
;1072:*/
;1073:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 1082
;1074:	float b, c, d, t;
;1075:
;1076:	//	| origin - (point + t * dir) | = radius
;1077:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;1078:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;1079:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;1080:
;1081:	// normalize dir so a = 1
;1082:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1083
;1083:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 1084
;1084:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 1089
;1085:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;1086:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;1087:		radius * radius;
;1088:
;1089:	d = b * b - 4 * c;
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
line 1090
;1090:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $447
line 1091
;1091:		t = (- b + sqrt(d)) / 2;
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
line 1092
;1092:		VectorMA(point, t, dir, intersections[0]);
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
line 1093
;1093:		t = (- b - sqrt(d)) / 2;
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
line 1094
;1094:		VectorMA(point, t, dir, intersections[1]);
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
line 1095
;1095:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $446
JUMPV
LABELV $447
line 1097
;1096:	}
;1097:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $449
line 1098
;1098:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1099
;1099:		VectorMA(point, t, dir, intersections[0]);
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
line 1100
;1100:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $446
JUMPV
LABELV $449
line 1102
;1101:	}
;1102:	return 0;
CNSTI4 0
RETI4
LABELV $446
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 100 24
line 1169
;1103:}
;1104:
;1105:#ifdef MISSIONPACK
;1106:/*
;1107:================
;1108:G_InvulnerabilityEffect
;1109:================
;1110:*/
;1111:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;1112:	gentity_t	*impact;
;1113:	vec3_t		intersections[2], vec;
;1114:	int			n;
;1115:
;1116:	if ( !targ->client ) {
;1117:		return qfalse;
;1118:	}
;1119:	VectorCopy(dir, vec);
;1120:	VectorInverse(vec);
;1121:	// sphere model radius = 42 units
;1122:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;1123:	if (n > 0) {
;1124:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;1125:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;1126:		vectoangles(vec, impact->s.angles);
;1127:		impact->s.angles[0] += 90;
;1128:		if (impact->s.angles[0] > 360)
;1129:			impact->s.angles[0] -= 360;
;1130:		if ( impactpoint ) {
;1131:			VectorCopy( intersections[0], impactpoint );
;1132:		}
;1133:		if ( bouncedir ) {
;1134:			VectorCopy( vec, bouncedir );
;1135:			VectorNormalize( bouncedir );
;1136:		}
;1137:		return qtrue;
;1138:	}
;1139:	else {
;1140:		return qfalse;
;1141:	}
;1142:}
;1143:#endif
;1144:/*
;1145:============
;1146:T_Damage
;1147:
;1148:targ		entity that is being damaged
;1149:inflictor	entity that is causing the damage
;1150:attacker	entity that caused the inflictor to damage targ
;1151:	example: targ=monster, inflictor=rocket, attacker=player
;1152:
;1153:dir			direction of the attack for knockback
;1154:point		point at which the damage is being inflicted, used for headshots
;1155:damage		amount of damage being inflicted
;1156:knockback	force to be applied against targ as a result of the damage
;1157:
;1158:inflictor, attacker, dir, and point can be NULL for environmental effects
;1159:
;1160:dflags		these flags are used to control how T_Damage works
;1161:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;1162:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;1163:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;1164:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1165:============
;1166:*/
;1167:
;1168:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1169:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1187
;1170:	gclient_t	*client;
;1171:	int			take;
;1172:	int			save;
;1173:	int			asave;
;1174:	int			knockback;
;1175:	int			max;
;1176:	// Shafe - Trep - Headshot
;1177:	float		z_ratio;
;1178:	float		z_rel;
;1179:	int			height;
;1180:	float		targ_maxs2;
;1181:	// Shafe - Trep - End Headshot
;1182:
;1183:#ifdef MISSIONPACK
;1184:	vec3_t		bouncedir, impactpoint;
;1185:#endif
;1186:
;1187:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $452
line 1188
;1188:		return;
ADDRGP4 $451
JUMPV
LABELV $452
line 1193
;1189:	}
;1190:
;1191:	// the intermission has allready been qualified for, so don't
;1192:	// allow any extra scoring
;1193:	if ( level.intermissionQueued ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
EQI4 $454
line 1194
;1194:		return;
ADDRGP4 $451
JUMPV
LABELV $454
line 1198
;1195:	}
;1196:
;1197:	// Grapple hook cannot be used to damage a buildable
;1198:	if (targ->s.eType ==ET_BUILDABLE && mod == MOD_GRAPPLE && g_GrappleMode.integer == 1)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $457
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $457
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $457
line 1199
;1199:	{
line 1200
;1200:		return;
ADDRGP4 $451
JUMPV
LABELV $457
line 1204
;1201:	}
;1202:
;1203:	// Instagib Trep Shafe
;1204:	if(g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $460
line 1205
;1205:	{
line 1206
;1206:		if (targ != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $463
line 1207
;1207:			{
line 1208
;1208:				dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1209
;1209:			}
LABELV $463
line 1210
;1210:	}
LABELV $460
line 1223
;1211:
;1212:
;1213:#ifdef MISSIONPACK
;1214:	if ( targ->client && mod != MOD_JUICED) {
;1215:		if ( targ->client->invulnerabilityTime > level.time) {
;1216:			if ( dir && point ) {
;1217:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1218:			}
;1219:			return;
;1220:		}
;1221:	}
;1222:#endif
;1223:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $465
line 1224
;1224:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+944328
ASGNP4
line 1225
;1225:	}
LABELV $465
line 1226
;1226:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $468
line 1227
;1227:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+944328
ASGNP4
line 1228
;1228:	}
LABELV $468
line 1231
;1229:
;1230:
;1231:	if(targ->client->ps.weapon == WP_RAILGUN)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
NEI4 $471
line 1232
;1232:	{
line 1234
;1233:
;1234:		trap_SendServerCommand(targ->client->ps.clientNum, "-gzoom");
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $402
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1235
;1235:		targ->client->Zoomed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 0
ASGNI4
line 1236
;1236:	}
LABELV $471
line 1240
;1237:	
;1238:
;1239:	// shootable doors / buttons don't actually have any health
;1240:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $473
line 1241
;1241:		if ( targ->use && targ->moverState == MOVER_POS1 || targ->moverState == ROTATOR_POS1) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $478
ADDRLP4 44
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $477
LABELV $478
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $451
LABELV $477
line 1242
;1242:			targ->use( targ, inflictor, attacker );
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
CNSTI4 732
ADDP4
INDIRP4
CALLV
pop
line 1243
;1243:		}
line 1244
;1244:		return;
ADDRGP4 $451
JUMPV
LABELV $473
line 1248
;1245:	}
;1246:
;1247:	// If we shot a breakable item subtract the damage from its health and try to break it
;1248: 	if ( targ->s.eType == ET_BREAKABLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $479
line 1249
;1249:         targ->health -= damage;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 1250
;1250: 		G_BreakGlass( targ, point, mod );
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
line 1251
;1251: 		return;
ADDRGP4 $451
JUMPV
LABELV $479
line 1260
;1252: 	}
;1253:#ifdef MISSIONPACK
;1254:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1255:		return;
;1256:	}
;1257:#endif
;1258:	// reduce damage by the attacker's handicap value
;1259:	// unless they are rocket jumping
;1260:	if ( attacker->client && attacker != targ ) {
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
EQU4 $481
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $481
line 1261
;1261:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
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
line 1267
;1262:#ifdef MISSIONPACK
;1263:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1264:			max /= 2;
;1265:		}
;1266:#endif
;1267:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1268
;1268:	}
LABELV $481
line 1270
;1269:
;1270:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1272
;1271:
;1272:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
line 1273
;1273:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 1274
;1274:			return;
ADDRGP4 $451
JUMPV
LABELV $485
line 1276
;1275:		}
;1276:	}
LABELV $483
line 1278
;1277:
;1278:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $487
line 1279
;1279:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1280
;1280:	} else {
ADDRGP4 $488
JUMPV
LABELV $487
line 1281
;1281:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1282
;1282:	}
LABELV $488
line 1284
;1283:
;1284:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1285
;1285:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $489
line 1286
;1286:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1287
;1287:	}
LABELV $489
line 1288
;1288:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $491
line 1289
;1289:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1290
;1290:	}
LABELV $491
line 1291
;1291:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $493
line 1292
;1292:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1293
;1293:	}
LABELV $493
line 1296
;1294:
;1295:	// figure momentum add, even if the damage won't be taken
;1296:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $495
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $495
line 1300
;1297:		vec3_t	kvel;
;1298:		float	mass;
;1299:
;1300:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1302
;1301:
;1302:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1303
;1303:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
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
line 1307
;1304:
;1305:		// set the timer so that the other client can't cancel
;1306:		// out the movement immediately
;1307:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $504
line 1310
;1308:			int		t;
;1309:
;1310:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1311
;1311:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $506
line 1312
;1312:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1313
;1313:			}
LABELV $506
line 1314
;1314:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $508
line 1315
;1315:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1316
;1316:			}
LABELV $508
line 1317
;1317:			targ->client->ps.pm_time = t;
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
line 1318
;1318:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1319
;1319:		}
LABELV $504
line 1320
;1320:	}
LABELV $495
line 1323
;1321:
;1322:	// check for completely getting out of the damage
;1323:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $510
line 1330
;1324:
;1325:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1326:		// if the attacker was on the same team
;1327:#ifdef MISSIONPACK
;1328:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1329:#else	
;1330:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $512
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
EQI4 $512
line 1332
;1331:#endif
;1332:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $514
line 1333
;1333:				return;
ADDRGP4 $451
JUMPV
LABELV $514
line 1335
;1334:			}
;1335:		}
LABELV $512
line 1349
;1336:
;1337:
;1338:	/*
;1339:	if (mod == MOD_GRAPPLE && g_GrappleMode.integer == 2)
;1340:	{
;1341:		//targ->client->ps.speed = 0;
;1342:		targ->immobilized == qtrue;
;1343:		return;
;1344:	}
;1345:	*/
;1346:
;1347:	
;1348:	// No Team Killing Of MC -  Make this a cvar
;1349:	if ((targ->s.eType ==ET_BUILDABLE) && (targ->s.team == attacker->client->sess.sessionTeam))
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
NEI4 $517
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
CNSTI4 2564
ADDP4
INDIRI4
NEI4 $517
line 1350
;1350:	{
line 1351
;1351:		if ((!strcmp(targ->classname, "mc")) && (g_PCTeamkills.integer == 0))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $521
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
NEI4 $519
ADDRGP4 g_PCTeamkills+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $519
line 1352
;1352:		{
line 1353
;1353:			return;
ADDRGP4 $451
JUMPV
LABELV $519
line 1355
;1354:		}
;1355:	}
LABELV $517
line 1358
;1356:
;1357:	
;1358:	if ((targ->s.eType ==ET_BUILDABLE) && (targ->health < 1000))
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
NEI4 $523
ADDRLP4 64
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $523
line 1359
;1359:	{
line 1360
;1360:		if (!strcmp(targ->classname, "mc"))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 68
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $525
line 1361
;1361:		{	
line 1362
;1362:				TeamCP("^9Power Core is Under Attack!",targ->s.team);
ADDRGP4 $527
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
line 1363
;1363:		}
LABELV $525
line 1364
;1364:	}
LABELV $523
line 1367
;1365:	
;1366:	// Debug
;1367:	if (trep_debug.integer) { G_Printf("Class : %s Taking Damage\n", targ->classname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $528
ADDRGP4 $531
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
LABELV $528
line 1382
;1368:	
;1369:
;1370:#ifdef MISSIONPACK
;1371:		if (mod == MOD_PROXIMITY_MINE) {
;1372:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1373:				return;
;1374:			}
;1375:			if (targ == attacker) {
;1376:				return;
;1377:			}
;1378:		}
;1379:#endif
;1380:
;1381:		// check for godmode
;1382:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $532
line 1383
;1383:			return;
ADDRGP4 $451
JUMPV
LABELV $532
line 1385
;1384:		}
;1385:	}
LABELV $510
line 1392
;1386:
;1387:		// Shafe - Gauss Jumping
;1388:		//if (g_instagib.integer == 1)  /// We can have rifle jumping without instagib can't we?
;1389:		//{
;1390:		
;1391:			// Is it self inflicted?  
;1392:			if ( attacker->client == targ->client )
ADDRLP4 48
CNSTI4 524
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CVPU4 4
NEU4 $534
line 1393
;1393:			{
line 1394
;1394:				if (g_GaussSelfDamage.value == 0) 
ADDRGP4 g_GaussSelfDamage+8
INDIRF4
CNSTF4 0
NEF4 $536
line 1395
;1395:				{
line 1397
;1396:					// It was self inflicted, but we aren't going to inflict damage
;1397:					return;
ADDRGP4 $451
JUMPV
LABELV $536
line 1399
;1398:				}
;1399:			}
LABELV $534
line 1406
;1400:
;1401:		//}
;1402:
;1403:
;1404:	// battlesuit protects from all radius damage (but takes knockback)
;1405:	// and protects 50% against all damage
;1406:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $539
line 1407
;1407:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1410
;1408:		
;1409:		// LFO Rifle can get through battlesuite - trep (maybe some other weapon?)
;1410:		if (mod == MOD_MACHINEGUN)
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $541
line 1411
;1411:		{
line 1412
;1412:			damage *= 0.75;
ADDRFP4 20
CNSTF4 1061158912
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1413
;1413:			return;
ADDRGP4 $451
JUMPV
LABELV $541
line 1416
;1414:		}
;1415:		
;1416:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $545
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $451
LABELV $545
line 1417
;1417:			return;
ADDRGP4 $451
JUMPV
line 1420
;1418:		}
;1419:		
;1420:		return;		
LABELV $539
line 1427
;1421:		//damage *= 0.5;
;1422:	}
;1423:
;1424:
;1425:
;1426:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1427:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 56
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $546
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRP4
CVPU4 4
EQU4 $546
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $546
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 3
EQI4 $546
ADDRLP4 68
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $546
ADDRLP4 68
INDIRI4
CNSTI4 13
EQI4 $546
line 1430
;1428:			&& targ->s.eType != ET_MISSILE
;1429:			&& targ->s.eType != ET_GENERAL
;1430:			&& targ->s.eType != ET_BUILDABLE ) {
line 1431
;1431:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $548
line 1432
;1432:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1433
;1433:		} else {
ADDRGP4 $549
JUMPV
LABELV $548
line 1434
;1434:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
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
line 1435
;1435:		}
LABELV $549
line 1436
;1436:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 1437
;1437:	}
LABELV $546
line 1441
;1438:
;1439:	// always give half damage if hurting self
;1440:	// calculated after knockback, so rocket jumping works
;1441:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $550
line 1442
;1442:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1443
;1443:	}
LABELV $550
line 1445
;1444:
;1445:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $552
line 1446
;1446:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1447
;1447:	}
LABELV $552
line 1448
;1448:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1449
;1449:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1452
;1450:
;1451:	// save some from armor
;1452:	asave = CheckArmor (targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 72
INDIRI4
ASGNI4
line 1453
;1453:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1455
;1454:
;1455:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $554
line 1456
;1456:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $557
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 756
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
line 1458
;1457:			targ->health, take, asave );
;1458:	}
LABELV $554
line 1463
;1459:
;1460:	// add to the damage inflicted on a player this frame
;1461:	// the total will be turned into screen blends and view angle kicks
;1462:	// at the end of the frame
;1463:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 1464
;1464:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $561
line 1465
;1465:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1466
;1466:		} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1467
;1467:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1468
;1468:		}
LABELV $562
line 1469
;1469:		client->damage_armor += asave;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1470
;1470:		client->damage_blood += take;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1471
;1471:		client->damage_knockback += knockback;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1472
;1472:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $563
line 1473
;1473:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1474
;1474:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 0
ASGNI4
line 1475
;1475:		} else {
ADDRGP4 $564
JUMPV
LABELV $563
line 1476
;1476:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1477
;1477:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 1
ASGNI4
line 1478
;1478:		}
LABELV $564
line 1479
;1479:	}
LABELV $559
line 1485
;1480:
;1481:	// See if it's the player hurting the emeny flag carrier
;1482:#ifdef MISSIONPACK
;1483:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1484:#else	
;1485:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $565
line 1487
;1486:#endif
;1487:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1488
;1488:	}
LABELV $565
line 1490
;1489:
;1490:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $568
line 1492
;1491:		// set the last client who damaged the target
;1492:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2672
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1493
;1493:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1494
;1494:	}
LABELV $568
line 1497
;1495:
;1496:	// Shafe - Trep - Headshots
;1497:	if (targ->client && attacker->client && targ->health > 0)
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 524
ASGNI4
ADDRLP4 84
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $570
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $570
ADDRLP4 76
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
LEI4 $570
line 1498
;1498:	{   
line 1500
;1499:		// let's say only railgun can do head shots
;1500:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 3
NEI4 $572
line 1501
;1501:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ASGNF4
line 1504
;1502:	
;1503:			// handling crouching
;1504:			if(targ->client->ps.pm_flags & PMF_DUCKED){
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
EQI4 $574
line 1505
;1505:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 88
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1061158912
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
MULF4
CVFI4 4
ASGNI4
line 1506
;1506:			}
ADDRGP4 $575
JUMPV
LABELV $574
line 1508
;1507:			else
;1508:				height = abs(targ->r.mins[2]) + targ_maxs2; 
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 88
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
CVFI4 4
ASGNI4
LABELV $575
line 1513
;1509:				
;1510:			// project the z component of point 
;1511:			// onto the z component of the model's origin
;1512:			// this results in the z component from the origin at 0
;1513:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 96
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ADDRLP4 96
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1514
;1514:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1516
;1515:		
;1516:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $576
line 1517
;1517:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1518
;1518:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1519
;1519:			}
LABELV $576
line 1520
;1520:		}
LABELV $572
line 1521
;1521:	}
LABELV $570
line 1526
;1522:	// Shafe - Trep - End Headshot Code
;1523:
;1524:
;1525:	// do the damage
;1526:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $578
line 1527
;1527:		targ->health = targ->health - take;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1528
;1528:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
line 1529
;1529:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 1530
;1530:			trap_SendServerCommand(client->ps.clientNum, "+greset");
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $582
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1531
;1531:		}
LABELV $580
line 1533
;1532:			
;1533:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $583
line 1534
;1534:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $585
line 1535
;1535:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $585
line 1537
;1536:
;1537:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $587
line 1538
;1538:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 -999
ASGNI4
LABELV $587
line 1540
;1539:
;1540:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1541
;1541:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
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
ADDRLP4 96
INDIRP4
CNSTI4 740
ADDP4
INDIRP4
CALLV
pop
line 1542
;1542:			return;
ADDRGP4 $451
JUMPV
LABELV $583
line 1543
;1543:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $589
line 1544
;1544:			targ->pain (targ, attacker, take);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
CALLV
pop
line 1545
;1545:		}
LABELV $589
line 1546
;1546:	}
LABELV $578
line 1548
;1547:
;1548:}
LABELV $451
endproc G_Damage 100 24
export CanDamage
proc CanDamage 112 28
line 1559
;1549:
;1550:
;1551:/*
;1552:============
;1553:CanDamage
;1554:
;1555:Returns qtrue if the inflictor can directly damage the target.  Used for
;1556:explosions and melee attacks.
;1557:============
;1558:*/
;1559:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1566
;1560:	vec3_t	dest;
;1561:	trace_t	tr;
;1562:	vec3_t	midpoint;
;1563:
;1564:	// use the midpoint of the bounds instead of the origin, because
;1565:	// bmodels may have their origin is 0,0,0
;1566:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
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
line 1567
;1567:	VectorScale (midpoint, 0.5, midpoint);
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
line 1569
;1568:
;1569:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1570
;1570:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1571
;1571:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $602
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $598
LABELV $602
line 1572
;1572:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $591
JUMPV
LABELV $598
line 1576
;1573:
;1574:	// this should probably check in the plane of projection, 
;1575:	// rather than in world coordinate, and also include Z
;1576:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1577
;1577:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1578
;1578:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1579
;1579:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1580
;1580:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $604
line 1581
;1581:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $591
JUMPV
LABELV $604
line 1583
;1582:
;1583:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1584
;1584:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1585
;1585:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1586
;1586:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1587
;1587:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $608
line 1588
;1588:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $591
JUMPV
LABELV $608
line 1590
;1589:
;1590:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1591
;1591:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1592
;1592:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1593
;1593:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1594
;1594:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $612
line 1595
;1595:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $591
JUMPV
LABELV $612
line 1597
;1596:
;1597:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1598
;1598:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1599
;1599:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1600
;1600:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1601
;1601:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $616
line 1602
;1602:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $591
JUMPV
LABELV $616
line 1605
;1603:
;1604:
;1605:	return qfalse;
CNSTI4 0
RETI4
LABELV $591
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1615
;1606:}
;1607:
;1608:
;1609:/*
;1610:============
;1611:G_RadiusDamage
;1612:============
;1613:*/
;1614:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1615:					 gentity_t *ignore, int mod) {
line 1624
;1616:	float		points, dist;
;1617:	gentity_t	*ent;
;1618:	int			entityList[MAX_GENTITIES];
;1619:	int			numListedEntities;
;1620:	vec3_t		mins, maxs;
;1621:	vec3_t		v;
;1622:	vec3_t		dir;
;1623:	int			i, e;
;1624:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1626
;1625:
;1626:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $620
line 1627
;1627:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1628
;1628:	}
LABELV $620
line 1630
;1629:
;1630:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $622
line 1631
;1631:		mins[i] = origin[i] - radius;
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
line 1632
;1632:		maxs[i] = origin[i] + radius;
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
line 1633
;1633:	}
LABELV $623
line 1630
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $622
line 1635
;1634:
;1635:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1637
;1636:
;1637:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $629
JUMPV
LABELV $626
line 1638
;1638:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 924
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
line 1640
;1639:
;1640:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $630
line 1641
;1641:			continue;
ADDRGP4 $627
JUMPV
LABELV $630
line 1642
;1642:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $632
line 1643
;1643:			continue;
ADDRGP4 $627
JUMPV
LABELV $632
line 1646
;1644:
;1645:		// find the distance from the edge of the bounding box
;1646:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $634
line 1647
;1647:			if ( origin[i] < ent->r.absmin[i] ) {
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
GEF4 $638
line 1648
;1648:				v[i] = ent->r.absmin[i] - origin[i];
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
line 1649
;1649:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $639
JUMPV
LABELV $638
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
LEF4 $640
line 1650
;1650:				v[i] = origin[i] - ent->r.absmax[i];
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
line 1651
;1651:			} else {
ADDRGP4 $641
JUMPV
LABELV $640
line 1652
;1652:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1653
;1653:			}
LABELV $641
LABELV $639
line 1654
;1654:		}
LABELV $635
line 1646
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $634
line 1656
;1655:
;1656:		dist = VectorLength( v );
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
line 1657
;1657:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $642
line 1658
;1658:			continue;
ADDRGP4 $627
JUMPV
LABELV $642
line 1661
;1659:		}
;1660:
;1661:		points = damage * ( 1.0 - dist / radius );
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
line 1663
;1662:
;1663:		if( CanDamage (ent, origin) ) {
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
EQI4 $644
line 1664
;1664:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $646
line 1665
;1665:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1666
;1666:			}
LABELV $646
line 1667
;1667:			VectorSubtract (ent->r.currentOrigin, origin, dir);
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
line 1670
;1668:			// push the center of mass higher than the origin so players
;1669:			// get knocked into the air more
;1670:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1673
;1671:
;1672:
;1673:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1695
;1674:			// Guass Rifle Jumping -- This is causing the problems
;1675:			/*
;1676:			if (g_instagib.integer == 1)
;1677:			{
;1678:				// Is it a rocket jump?
;1679:
;1680:				if (ent == attacker)
;1681:				{
;1682:					G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
;1683:				} 
;1684:				else
;1685:				{			
;1686:					G_Damage (ent, NULL, attacker, 0, origin, (int)points, DAMAGE_RADIUS, mod);
;1687:				}
;1688:			} 
;1689:			else 
;1690:			{
;1691:
;1692:				
;1693:			}
;1694:			*/
;1695:		}
LABELV $644
line 1696
;1696:	}
LABELV $627
line 1637
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $629
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $626
line 1698
;1697:
;1698:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $619
endproc G_RadiusDamage 4196 32
import CountTeamSurvivors
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
import fire_flamer
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
import G_InvulnerabilityEffect
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
LABELV $582
byte 1 43
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $557
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
LABELV $531
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
LABELV $527
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
LABELV $521
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $417
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $402
byte 1 45
byte 1 103
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $397
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $394
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 51
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $388
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $385
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 0
align 1
LABELV $376
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
LABELV $375
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
LABELV $371
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
LABELV $370
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
LABELV $333
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
LABELV $332
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $295
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
LABELV $294
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
LABELV $291
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
LABELV $290
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
LABELV $275
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
LABELV $274
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
LABELV $267
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $266
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
LABELV $256
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $247
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
LABELV $221
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
LABELV $220
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
LABELV $200
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
LABELV $199
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
LABELV $188
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
LABELV $187
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
LABELV $186
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
LABELV $185
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
LABELV $184
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
LABELV $183
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
LABELV $182
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
LABELV $181
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
LABELV $180
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
LABELV $179
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
LABELV $178
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
LABELV $177
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
LABELV $176
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
LABELV $175
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $174
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
LABELV $173
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
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
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
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $164
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
LABELV $163
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
