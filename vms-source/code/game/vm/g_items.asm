export Pickup_Powerup
code
proc Pickup_Powerup 132 28
file "../g_items.c"
line 29
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:
;7:  Items are any object that a player can touch to gain some effect.
;8:
;9:  Pickup will return the number of seconds until they should respawn.
;10:
;11:  all items should pop when dropped in lava or slime
;12:
;13:  Respawnable items don't actually go away when picked up, they are
;14:  just made invisible and untouchable.  This allows them to ride
;15:  movers and respawn apropriately.
;16:*/
;17:
;18:
;19:#define	RESPAWN_ARMOR		25
;20:#define	RESPAWN_HEALTH		35
;21:#define	RESPAWN_AMMO		40
;22:#define	RESPAWN_HOLDABLE	60
;23:#define	RESPAWN_MEGAHEALTH	35//120
;24:#define	RESPAWN_POWERUP		120
;25:
;26:
;27://======================================================================
;28:
;29:int Pickup_Powerup( gentity_t *ent, gentity_t *other ) {
line 34
;30:	int			quantity;
;31:	int			i;
;32:	gclient_t	*client;
;33:
;34:	if ( !other->client->ps.powerups[ent->item->giTag] ) {
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $56
line 37
;35:		// round timing to seconds to make multiple powerup timers
;36:		// count in sync
;37:		other->client->ps.powerups[ent->item->giTag] = 
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 39
;38:			level.time - ( level.time % 1000 );
;39:	}
LABELV $56
line 41
;40:
;41:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $60
line 42
;42:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 43
;43:	} else {
ADDRGP4 $61
JUMPV
LABELV $60
line 44
;44:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 45
;45:	}
LABELV $61
line 47
;46:
;47:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 50
;48:
;49:	// give any nearby players a "denied" anti-reward
;50:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $65
JUMPV
LABELV $62
line 56
;51:		vec3_t		delta;
;52:		float		len;
;53:		vec3_t		forward;
;54:		trace_t		tr;
;55:
;56:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 57
;57:		if ( client == other->client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
NEU4 $67
line 58
;58:			continue;
ADDRGP4 $63
JUMPV
LABELV $67
line 60
;59:		}
;60:		if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $69
line 61
;61:			continue;
ADDRGP4 $63
JUMPV
LABELV $69
line 63
;62:		}
;63:		if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $71
line 64
;64:			continue;
ADDRGP4 $63
JUMPV
LABELV $71
line 69
;65:		}
;66:
;67:    // if same team in team game, no sound
;68:    // cannot use OnSameTeam as it expects to g_entities, not clients
;69:  	if ( g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $73
ADDRLP4 100
CNSTI4 2564
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
NEI4 $73
line 70
;70:      continue;
ADDRGP4 $63
JUMPV
LABELV $73
line 74
;71:    }
;72:
;73:		// if too far away, no sound
;74:		VectorSubtract( ent->s.pos.trBase, client->ps.origin, delta );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 24
ASGNI4
ADDRLP4 16
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 104
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 75
;75:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 116
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 116
INDIRF4
ASGNF4
line 76
;76:		if ( len > 192 ) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $78
line 77
;77:			continue;
ADDRGP4 $63
JUMPV
LABELV $78
line 81
;78:		}
;79:
;80:		// if not facing, no sound
;81:		AngleVectors( client->ps.viewangles, forward, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 82
;82:		if ( DotProduct( delta, forward ) < 0.4 ) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $80
line 83
;83:			continue;
ADDRGP4 $63
JUMPV
LABELV $80
line 87
;84:		}
;85:
;86:		// if not line of sight, no sound
;87:		trap_Trace( &tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID );
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 88
;88:		if ( tr.fraction != 1.0 ) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $86
line 89
;89:			continue;
ADDRGP4 $63
JUMPV
LABELV $86
line 93
;90:		}
;91:
;92:		// anti-reward
;93:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 94
;94:	}
LABELV $63
line 50
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $65
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $62
line 95
;95:	return RESPAWN_POWERUP;
CNSTI4 120
RETI4
LABELV $55
endproc Pickup_Powerup 132 28
export Pickup_Holdable
proc Pickup_Holdable 0 0
line 175
;96:}
;97:
;98://======================================================================
;99:
;100:#ifdef MISSIONPACK
;101:int Pickup_PersistantPowerup( gentity_t *ent, gentity_t *other ) {
;102:	int		clientNum;
;103:	char	userinfo[MAX_INFO_STRING];
;104:	float	handicap;
;105:	int		max;
;106:
;107:	other->client->ps.stats[STAT_PERSISTANT_POWERUP] = ent->item - bg_itemlist;
;108:	other->client->persistantPowerup = ent;
;109:
;110:	switch( ent->item->giTag ) {
;111:	case PW_GUARD:
;112:		clientNum = other->client->ps.clientNum;
;113:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;114:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;115:		if( handicap<=0.0f || handicap>100.0f) {
;116:			handicap = 100.0f;
;117:		}
;118:		max = (int)(2 *  handicap);
;119:
;120:		other->health = max;
;121:		other->client->ps.stats[STAT_HEALTH] = max;
;122:		other->client->ps.stats[STAT_MAX_HEALTH] = max;
;123:		other->client->ps.stats[STAT_ARMOR] = max;
;124:		other->client->pers.maxHealth = max;
;125:
;126:		break;
;127:
;128:	case PW_SCOUT:
;129:		clientNum = other->client->ps.clientNum;
;130:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;131:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;132:		if( handicap<=0.0f || handicap>100.0f) {
;133:			handicap = 100.0f;
;134:		}
;135:		other->client->pers.maxHealth = handicap;
;136:		other->client->ps.stats[STAT_ARMOR] = 0;
;137:		break;
;138:
;139:	case PW_DOUBLER:
;140:		clientNum = other->client->ps.clientNum;
;141:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;142:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;143:		if( handicap<=0.0f || handicap>100.0f) {
;144:			handicap = 100.0f;
;145:		}
;146:		other->client->pers.maxHealth = handicap;
;147:		break;
;148:	case PW_AMMOREGEN:
;149:		clientNum = other->client->ps.clientNum;
;150:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;151:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;152:		if( handicap<=0.0f || handicap>100.0f) {
;153:			handicap = 100.0f;
;154:		}
;155:		other->client->pers.maxHealth = handicap;
;156:		memset(other->client->ammoTimes, 0, sizeof(other->client->ammoTimes));
;157:		break;
;158:	default:
;159:		clientNum = other->client->ps.clientNum;
;160:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;161:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;162:		if( handicap<=0.0f || handicap>100.0f) {
;163:			handicap = 100.0f;
;164:		}
;165:		other->client->pers.maxHealth = handicap;
;166:		break;
;167:	}
;168:
;169:	return -1;
;170:}
;171:
;172://======================================================================
;173:#endif
;174:
;175:int Pickup_Holdable( gentity_t *ent, gentity_t *other ) {
line 177
;176:
;177:	other->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->item - bg_itemlist;
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 179
;178:	
;179:	return RESPAWN_HOLDABLE;
CNSTI4 60
RETI4
LABELV $89
endproc Pickup_Holdable 0 0
export Add_Ammo
proc Add_Ammo 4 0
line 186
;180:}
;181:
;182:
;183://======================================================================
;184:
;185:void Add_Ammo (gentity_t *ent, int weapon, int count)
;186:{
line 187
;187:	ent->client->ps.ammo[weapon] += count;
ADDRLP4 0
ADDRFP4 4
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
line 188
;188:	if ( ent->client->ps.ammo[weapon] > 200 ) {
ADDRFP4 4
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
CNSTI4 200
LEI4 $91
line 190
;189:		//ent->client->ps.ammo[weapon] = 200; // Shafe - Trep - Ammo is no longer maxxed at 200
;190:	}
LABELV $91
line 192
;191:	
;192:}
LABELV $90
endproc Add_Ammo 4 0
export Pickup_Ammo
proc Pickup_Ammo 4 12
line 195
;193:
;194:int Pickup_Ammo (gentity_t *ent, gentity_t *other)
;195:{
line 198
;196:	int		quantity;
;197:
;198:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
line 199
;199:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 200
;200:	} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 202
;201:	
;202:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 203
;203:	}
LABELV $95
line 206
;204:	
;205:	
;206:	Add_Ammo (other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 208
;207:
;208:	return RESPAWN_AMMO;
CNSTI4 40
RETI4
LABELV $93
endproc Pickup_Ammo 4 12
export Pickup_Weapon
proc Pickup_Weapon 12 12
line 214
;209:}
;210:
;211://======================================================================
;212:
;213:
;214:int Pickup_Weapon (gentity_t *ent, gentity_t *other) {
line 219
;215:	int		quantity;
;216:
;217:	
;218:	
;219:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
GEI4 $97
line 220
;220:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 221
;221:	} else {
ADDRGP4 $98
JUMPV
LABELV $97
line 222
;222:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $99
line 223
;223:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 224
;224:		} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 226
;225:
;226:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 227
;227:		}
LABELV $100
line 231
;228:
;229:		
;230:		// dropped items and teamplay weapons always have full ammo
;231:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $101
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $101
line 234
;232:			// respawning rules
;233:			// drop the quantity if the already have over the minimum
;234:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $104
line 236
;235:				
;236:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 238
;237:				
;238:			} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 239
;239:				quantity = quantity*0.5;		// only add a single shot  
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 241
;240:				
;241:			}
LABELV $105
line 242
;242:		}
LABELV $101
line 243
;243:	}
LABELV $98
line 247
;244:
;245:	
;246:	// add the weapon
;247:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 249
;248:
;249:	if ( (other->client->ps.ammo[ ent->item->giTag ] + quantity)  <= Max_Ammo[ ent->item->giTag ] ) 
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
ADDRGP4 Max_Ammo
ADDP4
INDIRI4
GTI4 $106
line 250
;250:	{
line 252
;251:		// It's not gonna put them over give them the full amount
;252:		Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 253
;253:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 255
;254:	else 
;255:	{
line 257
;256:		// Otherwise just give them the max
;257:		quantity = Max_Ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 Max_Ammo
ADDP4
INDIRI4
ASGNI4
line 258
;258:		other->client->ps.ammo[ ent->item->giTag ] = quantity;
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 260
;259:		//Add_Ammo( other, ent->item->giTag, quantity ); // Oops :) Shafe
;260:	}
LABELV $107
line 263
;261:	
;262:	// If it's arsenal and lms then make sure they are still at infinite - and One4All
;263:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2) || (g_GameMode.integer == 4))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $114
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $114
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 4
NEI4 $108
LABELV $114
line 264
;264:	{
line 265
;265:		other->client->ps.ammo[ ent->item->giTag ] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 9999
ASGNI4
line 266
;266:	}
LABELV $108
line 270
;267:
;268:	//}
;269:
;270:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $115
line 271
;271:		other->client->ps.ammo[ent->item->giTag] = -1; // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
LABELV $115
line 281
;272:
;273:	// team deathmatch has slow weapon respawns
;274:	// I always hated this shit.
;275:	/*
;276:	if ( g_gametype.integer == GT_TEAM ) {
;277:		return g_weaponTeamRespawn.integer;
;278:	}
;279:	*/
;280:
;281:	return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
LABELV $96
endproc Pickup_Weapon 12 12
export Pickup_Health
proc Pickup_Health 24 0
line 287
;282:}
;283:
;284:
;285://======================================================================
;286:
;287:int Pickup_Health (gentity_t *ent, gentity_t *other) {
line 299
;288:	int			max;
;289:	int			quantity;
;290:	int			respawnTime;
;291:
;292:	// small and mega healths will go over the max
;293:#ifdef MISSIONPACK
;294:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;295:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;296:	}
;297:	else
;298:#endif
;299:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $119
ADDRLP4 12
INDIRI4
CNSTI4 100
EQI4 $119
line 300
;300:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 301
;301:	} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 302
;302:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
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
line 303
;303:	}
LABELV $120
line 305
;304:
;305:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $121
line 306
;306:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 307
;307:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 308
;308:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 309
;309:	}
LABELV $122
line 311
;310:
;311:	other->health += quantity;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 313
;312:
;313:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $123
line 314
;314:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 315
;315:	}
LABELV $123
line 316
;316:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 319
;317:		
;318:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;319:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $125
line 320
;320:	{ 
line 322
;321:			// If it's down to 2 players make it a really long time
;322:			respawnTime = RESPAWN_HEALTH * 60.0;  
ADDRLP4 8
CNSTI4 2100
ASGNI4
line 323
;323:			return	respawnTime;
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $118
JUMPV
LABELV $125
line 328
;324:	}
;325:	
;326:
;327:
;328:	if ( ent->item->quantity == 100 ) {		// mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $128
line 329
;329:		return RESPAWN_MEGAHEALTH;
CNSTI4 35
RETI4
ADDRGP4 $118
JUMPV
LABELV $128
line 332
;330:	}
;331:
;332:	return RESPAWN_HEALTH;
CNSTI4 35
RETI4
LABELV $118
endproc Pickup_Health 24 0
export Pickup_Armor
proc Pickup_Armor 16 0
line 337
;333:}
;334:
;335://======================================================================
;336:
;337:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 356
;338:	int		respawnTime;
;339:#ifdef MISSIONPACK
;340:	int		upperBound;
;341:	
;342:
;343:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;344:
;345:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;346:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;347:	}
;348:	else {
;349:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;350:	}
;351:
;352:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;353:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;354:	}
;355:#else
;356:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 357
;357:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $131
line 358
;358:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 359
;359:	}
LABELV $131
line 365
;360:
;361:#endif
;362:
;363:
;364:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;365:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $133
line 366
;366:	{ 
line 368
;367:			// If it's down to 2 players make it a really long time
;368:			respawnTime = RESPAWN_ARMOR * 60.0;  
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 369
;369:			return	respawnTime;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $130
JUMPV
LABELV $133
line 372
;370:	}
;371:
;372:	return RESPAWN_ARMOR;
CNSTI4 25
RETI4
LABELV $130
endproc Pickup_Armor 16 0
export RespawnItem
proc RespawnItem 24 12
line 382
;373:}
;374:
;375://======================================================================
;376:
;377:/*
;378:===============
;379:RespawnItem
;380:===============
;381:*/
;382:void RespawnItem( gentity_t *ent ) {
line 384
;383:	// randomly select from teamed entities
;384:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
line 389
;385:		gentity_t	*master;
;386:		int	count;
;387:		int choice;
;388:
;389:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $139
line 390
;390:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $141
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 391
;391:		}
LABELV $139
line 392
;392:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
ASGNP4
line 394
;393:
;394:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $142
line 395
;395:			;
LABELV $143
line 394
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
line 397
;396:
;397:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 399
;398:
;399:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $149
JUMPV
LABELV $146
line 400
;400:			;
LABELV $147
line 399
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $149
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $146
line 401
;401:	}
LABELV $137
line 403
;402:
;403:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 404
;404:	ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 405
;405:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 406
;406:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 408
;407:
;408:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $150
line 413
;409:		// play powerup spawn sound to all clients
;410:		gentity_t	*te;
;411:
;412:		// if the powerup respawn sound should Not be global
;413:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $152
line 414
;414:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 415
;415:		}
ADDRGP4 $153
JUMPV
LABELV $152
line 416
;416:		else {
line 417
;417:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 418
;418:		}
LABELV $153
line 419
;419:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.ogg" );
ADDRGP4 $154
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 420
;420:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 421
;421:	}
LABELV $150
line 423
;422:
;423:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $155
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $155
line 428
;424:		// play powerup spawn sound to all clients
;425:		gentity_t	*te;
;426:
;427:		// if the powerup respawn sound should Not be global
;428:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $157
line 429
;429:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 430
;430:		}
ADDRGP4 $158
JUMPV
LABELV $157
line 431
;431:		else {
line 432
;432:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 433
;433:		}
LABELV $158
line 434
;434:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.ogg" );
ADDRGP4 $159
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 435
;435:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 436
;436:	}
LABELV $155
line 439
;437:
;438:	// play the normal respawn sound only to nearby clients
;439:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 41
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 441
;440:
;441:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 442
;442:}
LABELV $136
endproc RespawnItem 24 12
export Touch_Item
proc Touch_Item 48 12
line 450
;443:
;444:
;445:/*
;446:===============
;447:Touch_Item
;448:===============
;449:*/
;450:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 454
;451:	int			respawn;
;452:	qboolean	predict;
;453:
;454:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 455
;455:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 456
;456:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 1
GEI4 $163
line 457
;457:		return;		// dead people can't pickup
ADDRGP4 $160
JUMPV
LABELV $163
line 463
;458:
;459:	
;460:	// the same pickup rules are used for client side and server side
;461:	
;462:	// Shafe - Trep this is a cheap hack to allow pickups of dropped weapons
;463:	if ((ent->flags & FL_DROPPED_ITEM) && (ent->item->giType == IT_WEAPON)) // It's a dropped Item.. Let them have it -- Shafe - Trep
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $165
ADDRLP4 8
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $165
line 464
;464:	{
line 467
;465:		// Let not do anything for now - change later
;466:	
;467:	} else {
ADDRGP4 $166
JUMPV
LABELV $165
line 469
;468:
;469:		if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $167
line 470
;470:			return;
ADDRGP4 $160
JUMPV
LABELV $167
line 472
;471:		}
;472:	}
LABELV $166
line 474
;473:
;474:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $170
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 476
;475:
;476:	predict = other->client->pers.predictItemPickup;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 479
;477:
;478:	// call the item-specific pickup function
;479:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $160
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $160
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $181-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $181
address $174
address $175
address $176
address $177
address $178
address $180
address $160
address $179
code
LABELV $174
line 483
;480:	case IT_WEAPON:
;481:	
;482:		
;483:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 485
;484://		predict = qfalse;
;485:		break;
ADDRGP4 $172
JUMPV
LABELV $175
line 487
;486:	case IT_AMMO:
;487:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 489
;488://		predict = qfalse;
;489:		break;
ADDRGP4 $172
JUMPV
LABELV $176
line 491
;490:	case IT_ARMOR:
;491:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 492
;492:		break;
ADDRGP4 $172
JUMPV
LABELV $177
line 494
;493:	case IT_HEALTH:
;494:		respawn = Pickup_Health(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Pickup_Health
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 495
;495:		break;
ADDRGP4 $172
JUMPV
LABELV $178
line 497
;496:	case IT_POWERUP:
;497:		respawn = Pickup_Powerup(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Pickup_Powerup
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 498
;498:		predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 499
;499:		break;
ADDRGP4 $172
JUMPV
LABELV $179
line 506
;500:#ifdef MISSIONPACK
;501:	case IT_PERSISTANT_POWERUP:
;502:		respawn = Pickup_PersistantPowerup(ent, other);
;503:		break;
;504:#endif
;505:	case IT_TEAM:
;506:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 507
;507:		break;
ADDRGP4 $172
JUMPV
LABELV $180
line 509
;508:	case IT_HOLDABLE:
;509:		respawn = Pickup_Holdable(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Pickup_Holdable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 510
;510:		break;
line 512
;511:	default:
;512:		return;
LABELV $172
line 515
;513:	}
;514:
;515:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $183
line 516
;516:		return;
ADDRGP4 $160
JUMPV
LABELV $183
line 520
;517:	}
;518:
;519:	// play the normal pickup sound
;520:	if (predict) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $185
line 521
;521:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddPredictableEvent
CALLV
pop
line 522
;522:	} else {
ADDRGP4 $186
JUMPV
LABELV $185
line 523
;523:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 524
;524:	}
LABELV $186
line 527
;525:
;526:	// powerup pickups are global broadcasts
;527:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $189
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $187
LABELV $189
line 529
;528:		// if we want the global sound to play
;529:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $190
line 532
;530:			gentity_t	*te;
;531:
;532:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 533
;533:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 534
;534:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 24
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
line 535
;535:		} else {
ADDRGP4 $191
JUMPV
LABELV $190
line 538
;536:			gentity_t	*te;
;537:
;538:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 539
;539:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 541
;540:			// only send this temp entity to a single client
;541:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 542
;542:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 543
;543:		}
LABELV $191
line 544
;544:	}
LABELV $187
line 547
;545:
;546:	// fire item targets
;547:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 550
;548:
;549:	// wait of -1 will not respawn
;550:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $192
line 551
;551:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 552
;552:		ent->s.eFlags |= EF_NODRAW;
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
CNSTI4 128
BORI4
ASGNI4
line 553
;553:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 554
;554:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 1
ASGNI4
line 555
;555:		return;
ADDRGP4 $160
JUMPV
LABELV $192
line 559
;556:	}
;557:
;558:	// non zero wait overrides respawn time
;559:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
EQF4 $194
line 560
;560:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 561
;561:	}
LABELV $194
line 564
;562:
;563:	// random can be used to vary the respawn time
;564:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 0
EQF4 $196
line 565
;565:		respawn += crandom() * ent->random;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 566
;566:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $198
line 567
;567:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 568
;568:		}
LABELV $198
line 569
;569:	}
LABELV $196
line 572
;570:
;571:	// dropped items will not respawn
;572:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $200
line 573
;573:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 574
;574:	}
LABELV $200
line 579
;575:
;576:	// picked up items still stay around, they just don't
;577:	// draw anything.  This allows respawnable items
;578:	// to be placed on movers.
;579:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 580
;580:	ent->s.eFlags |= EF_NODRAW;
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
CNSTI4 128
BORI4
ASGNI4
line 581
;581:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 587
;582:
;583:	// ZOID
;584:	// A negative respawn times means to never respawn this item (but don't 
;585:	// delete it).  This is used by items that are respawned by third party 
;586:	// events such as ctf flags
;587:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $202
line 588
;588:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 589
;589:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 590
;590:	} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 591
;591:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 592
;592:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 593
;593:	}
LABELV $203
line 594
;594:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 595
;595:}
LABELV $160
endproc Touch_Item 48 12
export LaunchItem
proc LaunchItem 12 8
line 607
;596:
;597:
;598://======================================================================
;599:
;600:/*
;601:================
;602:LaunchItem
;603:
;604:Spawns an item and tosses it forward
;605:================
;606:*/
;607:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 610
;608:	gentity_t	*dropped;
;609:
;610:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 612
;611:
;612:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 613
;613:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 614
;614:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 616
;615:
;616:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 617
;617:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 618
;618:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3245342720
ASGNF4
line 619
;619:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1097859072
ASGNF4
line 620
;620:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 622
;621:
;622:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 624
;623:
;624:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 625
;625:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 626
;626:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 627
;627:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 629
;628:
;629:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 633
;630:#ifdef MISSIONPACK
;631:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;632:#else
;633:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $207
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $207
line 635
;634:#endif
;635:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 636
;636:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 637
;637:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 638
;638:	} else { // auto-remove after 30 seconds
ADDRGP4 $208
JUMPV
LABELV $207
line 639
;639:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 640
;640:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 641
;641:	}
LABELV $208
line 643
;642:
;643:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 4096
ASGNI4
line 645
;644:
;645:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 647
;646:
;647:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $205
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 40 16
line 657
;648:}
;649:
;650:/*
;651:================
;652:Drop_Item
;653:
;654:Spawns an item and tosses it forward
;655:================
;656:*/
;657:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 661
;658:	vec3_t	velocity;
;659:	vec3_t	angles;
;660:
;661:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 662
;662:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 663
;663:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 665
;664:
;665:	AngleVectors( angles, velocity, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 666
;666:	VectorScale( velocity, 150, velocity );
ADDRLP4 28
CNSTF4 1125515264
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1125515264
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 667
;667:	velocity[2] += 200 + crandom() * 50;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 669
;668://	PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: Drop Item Complete\n", velocity); // Shafe - Debug
;669:	return LaunchItem( item, ent->s.pos.trBase, velocity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
LABELV $212
endproc Drop_Item 40 16
export Use_Item
proc Use_Item 0 4
line 680
;670:}
;671:
;672:
;673:/*
;674:================
;675:Use_Item
;676:
;677:Respawn the item
;678:================
;679:*/
;680:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 681
;681:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 682
;682:}
LABELV $219
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 88 28
line 694
;683:
;684://======================================================================
;685:
;686:/*
;687:================
;688:FinishSpawningItem
;689:
;690:Traces down to find where an item should rest, instead of letting them
;691:free fall from their spawn points
;692:================
;693:*/
;694:void FinishSpawningItem( gentity_t *ent ) {
line 698
;695:	trace_t		tr;
;696:	vec3_t		dest;
;697:
;698:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3245342720
ASGNF4
line 699
;699:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1097859072
ASGNF4
line 701
;700:
;701:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 702
;702:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 703
;703:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 705
;704:
;705:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 706
;706:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 708
;707:	// useing an item causes it to respawn
;708:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 710
;709:
;710:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $221
line 712
;711:		// suspended
;712:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 713
;713:	} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 715
;714:		// drop to floor
;715:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 716
;716:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 717
;717:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $225
line 718
;718:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $228
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 719
;719:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 720
;720:			return;
ADDRGP4 $220
JUMPV
LABELV $225
line 724
;721:		}
;722:
;723:		// allow to ride movers
;724:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 726
;725:
;726:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 727
;727:	}
LABELV $222
line 730
;728:
;729:	// team slaves and targeted items aren't present at start
;730:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $233
ADDRLP4 72
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
LABELV $233
line 731
;731:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 732
;732:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 733
;733:		return;
ADDRGP4 $220
JUMPV
LABELV $231
line 737
;734:	}
;735:
;736:	// powerups don't spawn in for a while
;737:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $234
line 740
;738:		float	respawn;
;739:
;740:		respawn = 45 + crandom() * 15;
ADDRLP4 80
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 76
CNSTF4 1097859072
CNSTF4 1073741824
ADDRLP4 80
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 741
;741:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 742
;742:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 76
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 744
;744:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 745
;745:		return;
ADDRGP4 $220
JUMPV
LABELV $234
line 749
;746:	}
;747:
;748:
;749:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 750
;750:}
LABELV $220
endproc FinishSpawningItem 88 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 760
;751:
;752:
;753:qboolean	itemRegistered[MAX_ITEMS];
;754:
;755:/*
;756:==================
;757:G_CheckTeamItems
;758:==================
;759:*/
;760:void G_CheckTeamItems( void ) {
line 763
;761:
;762:	// Set up team stuff
;763:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 765
;764:
;765:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $238
line 769
;766:		gitem_t	*item;
;767:
;768:		// check for the two flags
;769:		item = BG_FindItem( "Red Flag" );
ADDRGP4 $241
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 770
;770:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $244
ADDRLP4 8
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $242
LABELV $244
line 771
;771:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
ADDRGP4 $245
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 772
;772:		}
LABELV $242
line 773
;773:		item = BG_FindItem( "Blue Flag" );
ADDRGP4 $246
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 774
;774:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $249
ADDRLP4 16
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $247
LABELV $249
line 775
;775:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
ADDRGP4 $250
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 776
;776:		}
LABELV $247
line 777
;777:	}
LABELV $238
line 837
;778:#ifdef MISSIONPACK
;779:	if( g_gametype.integer == GT_1FCTF ) {
;780:		gitem_t	*item;
;781:
;782:		// check for all three flags
;783:		item = BG_FindItem( "Red Flag" );
;784:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;785:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
;786:		}
;787:		item = BG_FindItem( "Blue Flag" );
;788:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;789:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
;790:		}
;791:		item = BG_FindItem( "Neutral Flag" );
;792:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;793:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map" );
;794:		}
;795:	}
;796:
;797:	if( g_gametype.integer == GT_OBELISK ) {
;798:		gentity_t	*ent;
;799:
;800:		// check for the two obelisks
;801:		ent = NULL;
;802:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;803:		if( !ent ) {
;804:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;805:		}
;806:
;807:		ent = NULL;
;808:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;809:		if( !ent ) {
;810:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;811:		}
;812:	}
;813:
;814:	if( g_gametype.integer == GT_HARVESTER ) {
;815:		gentity_t	*ent;
;816:
;817:		// check for all three obelisks
;818:		ent = NULL;
;819:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;820:		if( !ent ) {
;821:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;822:		}
;823:
;824:		ent = NULL;
;825:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;826:		if( !ent ) {
;827:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;828:		}
;829:
;830:		ent = NULL;
;831:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;832:		if( !ent ) {
;833:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map" );
;834:		}
;835:	}
;836:#endif
;837:}
LABELV $237
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 60 12
line 844
;838:
;839:/*
;840:==============
;841:ClearRegisteredItems
;842:==============
;843:*/
;844:void ClearRegisteredItems( void ) {
line 845
;845:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 848
;846:
;847:	// players always start with the base weapon
;848:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 850
;849:	// We're using some effects from the plasma gun.. so yeah..
;850:	RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 851
;851:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 854
;852:
;853:	// Let's Always Register The Rocket Launcher  - Shafe - Trep 
;854:	RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
CNSTI4 8
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 856
;855:	// Shafe - Trep Preregister Lighning and the Grapple For the offhand grapple
;856:	RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
CNSTI4 6
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 857
;857:	RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
CNSTI4 10
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 861
;858:	
;859:	// Shade - Trep - Register the Grenade Launcher for the PDG's... 
;860:	// If we get a model we wont need to pre-register this
;861:	RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
CNSTI4 5
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 864
;862:	
;863:	// Shafe - Trep - Pre-register Railgun For Instagib
;864:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $252
line 865
;865:	{
line 866
;866:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 3
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 867
;867:	} // End Shafe
LABELV $252
line 869
;868:
;869:	if (g_allowDevastator.integer == 0 ) // pre-register sing cannon ammo if devastators disallowed
ADDRGP4 g_allowDevastator+12
INDIRI4
CNSTI4 0
NEI4 $255
line 870
;870:	{
line 871
;871:		RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
CNSTI4 8
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 872
;872:	}
LABELV $255
line 875
;873:
;874:	// Shafe - Trep - Arsenal and LMS Gets All Weapons Pre-Registered
;875:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2)  || (g_GameMode.integer == 999))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $264
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $264
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $258
LABELV $264
line 876
;876:	{
line 877
;877:		if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $265
line 878
;878:		{
line 879
;879:			RegisterItem( BG_FindItemForWeapon( WP_SHOTGUN ) );
CNSTI4 4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 880
;880:			RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 3
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 881
;881:			RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 7
ARGI4
ADDRLP4 36
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 882
;882:			RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
CNSTI4 9
ARGI4
ADDRLP4 40
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 885
;883:
;884:			// Github issue 43 - fix shafe
;885:			RegisterItem( BG_FindItemForPowerup( PW_QUAD ) );
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 886
;886:			RegisterItem( BG_FindItemForPowerup( PW_FLIGHT ) );
CNSTI4 6
ARGI4
ADDRLP4 48
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 887
;887:			RegisterItem( BG_FindItemForPowerup( PW_BATTLESUIT ) );
CNSTI4 2
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 888
;888:			RegisterItem( BG_FindItemForPowerup( PW_REGEN ) );
CNSTI4 5
ARGI4
ADDRLP4 56
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 890
;889:
;890:		}
LABELV $265
line 891
;891:	}
LABELV $258
line 899
;892:
;893:#ifdef MISSIONPACK
;894:	if( g_gametype.integer == GT_HARVESTER ) {
;895:		RegisterItem( BG_FindItem( "Red Cube" ) );
;896:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;897:	}
;898:#endif
;899:}
LABELV $251
endproc ClearRegisteredItems 60 12
export RegisterItem
proc RegisterItem 0 4
line 908
;900:
;901:/*
;902:===============
;903:RegisterItem
;904:
;905:The item will be added to the precache list
;906:===============
;907:*/
;908:void RegisterItem( gitem_t *item ) {
line 909
;909:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $269
line 910
;910:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $271
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 911
;911:	}
LABELV $269
line 912
;912:	itemRegistered[ item - bg_itemlist ] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 913
;913:}
LABELV $268
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 924
;914:
;915:
;916:/*
;917:===============
;918:SaveRegisteredItems
;919:
;920:Write the needed items to a config string
;921:so the client will know which ones to precache
;922:===============
;923:*/
;924:void SaveRegisteredItems( void ) {
line 929
;925:	char	string[MAX_ITEMS+1];
;926:	int		i;
;927:	int		count;
;928:
;929:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 930
;930:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 931
;931:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $277
line 932
;932:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 933
;933:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 934
;934:		} else {
ADDRGP4 $278
JUMPV
LABELV $277
line 935
;935:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 936
;936:		}
LABELV $278
line 937
;937:	}
LABELV $274
line 930
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $276
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $273
line 938
;938:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 940
;939:
;940:	G_Printf( "%i items registered\n", count );
ADDRGP4 $279
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 941
;941:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 942
;942:}
LABELV $272
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 949
;943:
;944:/*
;945:============
;946:G_ItemDisabled
;947:============
;948:*/
;949:int G_ItemDisabled( gitem_t *item ) {
line 953
;950:
;951:	char name[128];
;952:
;953:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $281
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 954
;954:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $280
endproc G_ItemDisabled 132 16
export G_CheckReplaceItem
proc G_CheckReplaceItem 24 4
line 959
;955:}
;956:
;957:
;958:gitem_t *G_CheckReplaceItem( gentity_t *ent, gitem_t *item )
;959:{
line 960
;960:	gitem_t *newitem = item;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 962
;961:
;962:	if(!g_allowDevastator.integer)	
ADDRGP4 g_allowDevastator+12
INDIRI4
CNSTI4 0
NEI4 $283
line 963
;963:	{	//replace tetryon and scav rifles with I-Mods
line 964
;964:		switch ( item->giTag )
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 9
EQI4 $289
ADDRGP4 $287
JUMPV
line 965
;965:		{
LABELV $289
line 967
;966:		case WP_BFG:
;967:			switch( item->giType )
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $293
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $295
ADDRGP4 $287
JUMPV
line 968
;968:			{
LABELV $293
line 970
;969:			case IT_WEAPON:
;970:				newitem = BG_FindItemForWeapon( WP_ROCKET_LAUNCHER );
CNSTI4 8
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 971
;971:				ent->classname = "weapon_rocketlauncher";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $294
ASGNP4
line 972
;972:				break;
ADDRGP4 $287
JUMPV
LABELV $295
line 974
;973:			case IT_AMMO:
;974:				newitem = BG_FindItemForAmmo( WP_ROCKET_LAUNCHER);
CNSTI4 8
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindItemForAmmo
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 975
;975:				ent->classname = "ammo_rockets";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $296
ASGNP4
line 976
;976:				break;
line 978
;977:			default:
;978:				break;
line 980
;979:			}
;980:			break;
line 982
;981:		default:
;982:			break;
LABELV $287
line 984
;983:		}
;984:	}
LABELV $283
line 985
;985:	return newitem;
ADDRLP4 0
INDIRP4
RETP4
LABELV $282
endproc G_CheckReplaceItem 24 4
export G_SpawnItem
proc G_SpawnItem 8 12
line 998
;986:}
;987:
;988:/*
;989:============
;990:G_SpawnItem
;991:
;992:Sets the clipping size and plants the object on the floor.
;993:
;994:Items can't be immediately dropped to floor, because they might
;995:be on an entity that hasn't spawned yet.
;996:============
;997:*/
;998:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 1001
;999:	
;1000:
;1001:	item = G_CheckReplaceItem( ent, item ); // New	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_CheckReplaceItem
CALLP4
ASGNP4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1004
;1002:
;1003:	//Shafe - Trep Instagib
;1004:	if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $298
line 1005
;1005:	{
line 1007
;1006:		// InstaGib - prevent weapons and ammo from spawning
;1007:		if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $303
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $301
LABELV $303
line 1008
;1008:			return;
ADDRGP4 $297
JUMPV
LABELV $301
line 1009
;1009:		}
LABELV $298
line 1013
;1010:	/////////////////////////////////////////////////////////
;1011:
;1012:	//Shafe - Trep Instagib, One4All
;1013:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2) || (g_GameMode.integer == 4)  )
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $310
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $310
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 4
NEI4 $304
LABELV $310
line 1014
;1014:		{
line 1016
;1015:		// Arsenal - prevent weapons and ammo from spawning
;1016:		if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $313
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $311
LABELV $313
line 1017
;1017:			return;
ADDRGP4 $297
JUMPV
LABELV $311
line 1018
;1018:		}
LABELV $304
line 1025
;1019:	
;1020:	/////////////////////////////////////////////////////////
;1021:
;1022:	/////////////////////////////////////////////////////////
;1023:
;1024:		//Shafe - Trep Instagib, One4All
;1025:		if ((g_GameMode.integer == 999))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $314
line 1026
;1026:		{
line 1028
;1027:		// Arsenal - prevent weapons and ammo from spawning
;1028:		if ( item->giType == IT_WEAPON  || item->giType == IT_AMMO)
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $319
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $317
LABELV $319
line 1029
;1029:			return;
ADDRGP4 $297
JUMPV
LABELV $317
line 1030
;1030:		}
LABELV $314
line 1037
;1031:	
;1032:	/////////////////////////////////////////////////////////
;1033:
;1034:
;1035:	
;1036:
;1037:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $320
ARGP4
ADDRGP4 $321
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1038
;1038:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $322
ARGP4
ADDRGP4 $321
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1040
;1039:
;1040:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 1041
;1041:	if ( G_ItemDisabled(item) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $323
line 1042
;1042:		return;
ADDRGP4 $297
JUMPV
LABELV $323
line 1044
;1043:
;1044:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1047
;1045:	// some movers spawn on the second frame, so delay item
;1046:	// spawns until the third frame so they can ride trains
;1047:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1048
;1048:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 1050
;1049:
;1050:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTF4 1056964608
ASGNF4
line 1052
;1051:
;1052:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $326
line 1053
;1053:		G_SoundIndex( "sound/items/poweruprespawn.ogg" );
ADDRGP4 $154
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1054
;1054:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $328
ARGP4
ADDRGP4 $321
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1055
;1055:	}
LABELV $326
line 1062
;1056:
;1057:#ifdef MISSIONPACK
;1058:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;1059:		ent->s.generic1 = ent->spawnflags;
;1060:	}
;1061:#endif
;1062:}
LABELV $297
endproc G_SpawnItem 8 12
export G_BounceItem
proc G_BounceItem 76 12
line 1071
;1063:
;1064:
;1065:/*
;1066:================
;1067:G_BounceItem
;1068:
;1069:================
;1070:*/
;1071:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1077
;1072:	vec3_t	velocity;
;1073:	float	dot;
;1074:	int		hitTime;
;1075:
;1076:	// reflect the velocity on the trace plane
;1077:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1078
;1078:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1079
;1079:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1080
;1080:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1083
;1081:
;1082:	// cut the velocity to keep from bouncing forever
;1083:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
MULF4
ASGNF4
line 1086
;1084:
;1085:	// check for stop
;1086:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $337
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $337
line 1087
;1087:		trace->endpos[2] += 1.0;	// make sure it is off ground
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1088
;1088:		SnapVector( trace->endpos );
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRF4
ASGNF4
line 1089
;1089:		G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1090
;1090:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 1091
;1091:		return;
ADDRGP4 $329
JUMPV
LABELV $337
line 1094
;1092:	}
;1093:
;1094:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1095
;1095:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1096
;1096:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1097
;1097:}
LABELV $329
endproc G_BounceItem 76 12
export G_RunItem
proc G_RunItem 88 28
line 1106
;1098:
;1099:
;1100:/*
;1101:================
;1102:G_RunItem
;1103:
;1104:================
;1105:*/
;1106:void G_RunItem( gentity_t *ent ) {
line 1113
;1107:	vec3_t		origin;
;1108:	trace_t		tr;
;1109:	int			contents;
;1110:	int			mask;
;1111:
;1112:	// if groundentity has been set to -1, it may have been pushed off an edge
;1113:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $341
line 1114
;1114:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $343
line 1115
;1115:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1116
;1116:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1117
;1117:		}
LABELV $343
line 1118
;1118:	}
LABELV $341
line 1120
;1119:
;1120:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $346
line 1122
;1121:		// check think function
;1122:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1123
;1123:		return;
ADDRGP4 $340
JUMPV
LABELV $346
line 1127
;1124:	}
;1125:
;1126:	// get current position
;1127:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1130
;1128:
;1129:	// trace a line from the previous position to the current position
;1130:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $349
line 1131
;1131:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ASGNI4
line 1132
;1132:	} else {
ADDRGP4 $350
JUMPV
LABELV $349
line 1133
;1133:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1134
;1134:	}
LABELV $350
line 1135
;1135:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1138
;1136:		ent->r.ownerNum, mask );
;1137:
;1138:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1140
;1139:
;1140:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $352
line 1141
;1141:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1142
;1142:	}
LABELV $352
line 1144
;1143:
;1144:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1147
;1145:
;1146:	// check think function
;1147:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1149
;1148:
;1149:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $356
line 1150
;1150:		return;
ADDRGP4 $340
JUMPV
LABELV $356
line 1154
;1151:	}
;1152:
;1153:	// if it is in a nodrop volume, remove it
;1154:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
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
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 1155
;1155:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $359
line 1156
;1156:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $361
line 1157
;1157:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1158
;1158:		} else {
ADDRGP4 $340
JUMPV
LABELV $361
line 1159
;1159:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1160
;1160:		}
line 1161
;1161:		return;
ADDRGP4 $340
JUMPV
LABELV $359
line 1164
;1162:	}
;1163:
;1164:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1165
;1165:}
LABELV $340
endproc G_RunItem 88 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
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
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
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
LABELV $328
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $321
byte 1 48
byte 1 0
align 1
LABELV $320
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $296
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $294
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $281
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $279
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $250
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $246
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $245
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $241
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $228
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $154
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $141
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
