export Pickup_Powerup
code
proc Pickup_Powerup 132 28
file "../g_items.c"
line 29
;1:// Copyright (C) 1999-2000 Id Software, Inc.
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
CNSTI4 876
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
CNSTI4 876
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
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $60
line 42
;42:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 776
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
CNSTI4 876
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
CNSTI4 876
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
CNSTI4 3456
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
CNSTI4 2552
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
CNSTI4 876
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
line 193
;178:
;179:	/*
;180:	if( ent->item->giTag == HI_KAMIKAZE ) {
;181:		other->client->ps.eFlags |= EF_KAMIKAZE;
;182:	}
;183:	*/
;184:	
;185:	// Shafe - Trep -- Test
;186:	/*
;187:	if( ent->item->giTag == HI_MEDKIT ) {
;188:		other->client->pers.holdable = 1;
;189:			
;190:	}
;191:	*/
;192:	
;193:	return RESPAWN_HOLDABLE;
CNSTI4 60
RETI4
LABELV $89
endproc Pickup_Holdable 0 0
export Add_Ammo
proc Add_Ammo 4 0
line 200
;194:}
;195:
;196:
;197://======================================================================
;198:
;199:void Add_Ammo (gentity_t *ent, int weapon, int count)
;200:{
line 201
;201:	ent->client->ps.ammo[weapon] += count;
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
line 202
;202:	if ( ent->client->ps.ammo[weapon] > 200 ) {
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
line 204
;203:		//ent->client->ps.ammo[weapon] = 200; // Shafe - Trep - Ammo is no longer maxxed at 200
;204:	}
LABELV $91
line 206
;205:	
;206:}
LABELV $90
endproc Add_Ammo 4 0
export Pickup_Ammo
proc Pickup_Ammo 4 12
line 209
;207:
;208:int Pickup_Ammo (gentity_t *ent, gentity_t *other)
;209:{
line 212
;210:	int		quantity;
;211:
;212:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
line 213
;213:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 214
;214:	} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 216
;215:	
;216:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 217
;217:	}
LABELV $95
line 220
;218:	
;219:	
;220:	Add_Ammo (other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 222
;221:
;222:	return RESPAWN_AMMO;
CNSTI4 40
RETI4
LABELV $93
endproc Pickup_Ammo 4 12
export Pickup_Weapon
proc Pickup_Weapon 12 12
line 228
;223:}
;224:
;225://======================================================================
;226:
;227:
;228:int Pickup_Weapon (gentity_t *ent, gentity_t *other) {
line 233
;229:	int		quantity;
;230:
;231:	
;232:	
;233:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
GEI4 $97
line 234
;234:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 235
;235:	} else {
ADDRGP4 $98
JUMPV
LABELV $97
line 236
;236:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $99
line 237
;237:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 238
;238:		} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 240
;239:
;240:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 241
;241:		}
LABELV $100
line 245
;242:
;243:		
;244:		// dropped items and teamplay weapons always have full ammo
;245:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
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
line 248
;246:			// respawning rules
;247:			// drop the quantity if the already have over the minimum
;248:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 249
;249:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 250
;250:			} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 251
;251:				quantity = 1;		// only add a single shot  
ADDRLP4 0
CNSTI4 1
ASGNI4
line 253
;252:				
;253:			}
LABELV $105
line 254
;254:		}
LABELV $101
line 255
;255:	}
LABELV $98
line 259
;256:
;257:	
;258:	// add the weapon
;259:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
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
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 261
;260:
;261:	if ( (other->client->ps.ammo[ ent->item->giTag ] + quantity)  <= Max_Ammo[ ent->item->giTag ] ) 
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 262
;262:	{
line 264
;263:		// It's not gonna put them over give them the full amount
;264:		Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 265
;265:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 267
;266:	else 
;267:	{
line 269
;268:		// Otherwise just give them the max
;269:		quantity = Max_Ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 270
;270:		other->client->ps.ammo[ ent->item->giTag ] = quantity;
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 272
;271:		//Add_Ammo( other, ent->item->giTag, quantity ); // Oops :) Shafe
;272:	}
LABELV $107
line 275
;273:	
;274:	// If it's arsenal and lms then make sure they are still at infinite
;275:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $112
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $108
LABELV $112
line 276
;276:	{
line 277
;277:		other->client->ps.ammo[ ent->item->giTag ] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 876
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
line 278
;278:	}
LABELV $108
line 282
;279:
;280:	//}
;281:
;282:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $113
line 283
;283:		other->client->ps.ammo[ent->item->giTag] = -1; // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 876
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
LABELV $113
line 293
;284:
;285:	// team deathmatch has slow weapon respawns
;286:	// I always hated this shit.
;287:	/*
;288:	if ( g_gametype.integer == GT_TEAM ) {
;289:		return g_weaponTeamRespawn.integer;
;290:	}
;291:	*/
;292:
;293:	return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
LABELV $96
endproc Pickup_Weapon 12 12
export Pickup_Health
proc Pickup_Health 24 0
line 299
;294:}
;295:
;296:
;297://======================================================================
;298:
;299:int Pickup_Health (gentity_t *ent, gentity_t *other) {
line 311
;300:	int			max;
;301:	int			quantity;
;302:	int			respawnTime;
;303:
;304:	// small and mega healths will go over the max
;305:#ifdef MISSIONPACK
;306:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;307:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;308:	}
;309:	else
;310:#endif
;311:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $117
ADDRLP4 12
INDIRI4
CNSTI4 100
EQI4 $117
line 312
;312:		max = other->client->ps.stats[STAT_MAX_HEALTH];
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
line 313
;313:	} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 314
;314:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
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
line 315
;315:	}
LABELV $118
line 317
;316:
;317:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $119
line 318
;318:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 319
;319:	} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 320
;320:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 321
;321:	}
LABELV $120
line 323
;322:
;323:	other->health += quantity;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 748
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
line 325
;324:
;325:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $121
line 326
;326:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 327
;327:	}
LABELV $121
line 328
;328:	other->client->ps.stats[STAT_HEALTH] = other->health;
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
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 331
;329:		
;330:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;331:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $123
line 332
;332:	{ 
line 334
;333:			// If it's down to 2 players make it a really long time
;334:			respawnTime = RESPAWN_HEALTH * 60.0;  
ADDRLP4 8
CNSTI4 2100
ASGNI4
line 335
;335:			return	respawnTime;
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $123
line 340
;336:	}
;337:	
;338:
;339:
;340:	if ( ent->item->quantity == 100 ) {		// mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $126
line 341
;341:		return RESPAWN_MEGAHEALTH;
CNSTI4 35
RETI4
ADDRGP4 $116
JUMPV
LABELV $126
line 344
;342:	}
;343:
;344:	return RESPAWN_HEALTH;
CNSTI4 35
RETI4
LABELV $116
endproc Pickup_Health 24 0
export Pickup_Armor
proc Pickup_Armor 16 0
line 349
;345:}
;346:
;347://======================================================================
;348:
;349:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 368
;350:	int		respawnTime;
;351:#ifdef MISSIONPACK
;352:	int		upperBound;
;353:	
;354:
;355:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;356:
;357:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;358:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;359:	}
;360:	else {
;361:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;362:	}
;363:
;364:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;365:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;366:	}
;367:#else
;368:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
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
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 369
;369:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
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
LEI4 $129
line 370
;370:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
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
line 371
;371:	}
LABELV $129
line 377
;372:
;373:#endif
;374:
;375:
;376:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;377:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $131
line 378
;378:	{ 
line 380
;379:			// If it's down to 2 players make it a really long time
;380:			respawnTime = RESPAWN_ARMOR * 60.0;  
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 381
;381:			return	respawnTime;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $128
JUMPV
LABELV $131
line 384
;382:	}
;383:
;384:	return RESPAWN_ARMOR;
CNSTI4 25
RETI4
LABELV $128
endproc Pickup_Armor 16 0
export RespawnItem
proc RespawnItem 24 12
line 394
;385:}
;386:
;387://======================================================================
;388:
;389:/*
;390:===============
;391:RespawnItem
;392:===============
;393:*/
;394:void RespawnItem( gentity_t *ent ) {
line 396
;395:	// randomly select from teamed entities
;396:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $135
line 401
;397:		gentity_t	*master;
;398:		int	count;
;399:		int choice;
;400:
;401:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $137
line 402
;402:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $139
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 403
;403:		}
LABELV $137
line 404
;404:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
ASGNP4
line 406
;405:
;406:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $140
line 407
;407:			;
LABELV $141
line 406
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 409
;408:
;409:		choice = rand() % count;
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
line 411
;410:
;411:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $144
line 412
;412:			;
LABELV $145
line 411
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $144
line 413
;413:	}
LABELV $135
line 415
;414:
;415:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 416
;416:	ent->s.eFlags &= ~EF_NODRAW;
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
line 417
;417:	ent->r.svFlags &= ~SVF_NOCLIENT;
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
line 418
;418:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 420
;419:
;420:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $148
line 425
;421:		// play powerup spawn sound to all clients
;422:		gentity_t	*te;
;423:
;424:		// if the powerup respawn sound should Not be global
;425:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $150
line 426
;426:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
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
line 427
;427:		}
ADDRGP4 $151
JUMPV
LABELV $150
line 428
;428:		else {
line 429
;429:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
line 430
;430:		}
LABELV $151
line 431
;431:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $152
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
line 432
;432:		te->r.svFlags |= SVF_BROADCAST;
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
line 433
;433:	}
LABELV $148
line 435
;434:
;435:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $153
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $153
line 440
;436:		// play powerup spawn sound to all clients
;437:		gentity_t	*te;
;438:
;439:		// if the powerup respawn sound should Not be global
;440:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $155
line 441
;441:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
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
line 442
;442:		}
ADDRGP4 $156
JUMPV
LABELV $155
line 443
;443:		else {
line 444
;444:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
line 445
;445:		}
LABELV $156
line 446
;446:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
ADDRGP4 $157
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
line 447
;447:		te->r.svFlags |= SVF_BROADCAST;
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
line 448
;448:	}
LABELV $153
line 451
;449:
;450:	// play the normal respawn sound only to nearby clients
;451:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
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
line 453
;452:
;453:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 454
;454:}
LABELV $134
endproc RespawnItem 24 12
export Touch_Item
proc Touch_Item 48 12
line 462
;455:
;456:
;457:/*
;458:===============
;459:Touch_Item
;460:===============
;461:*/
;462:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 466
;463:	int			respawn;
;464:	qboolean	predict;
;465:
;466:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 467
;467:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 468
;468:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 1
GEI4 $161
line 469
;469:		return;		// dead people can't pickup
ADDRGP4 $158
JUMPV
LABELV $161
line 475
;470:
;471:	
;472:	// the same pickup rules are used for client side and server side
;473:	
;474:	// Shafe - Trep this is a cheap hack to allow pickups of dropped weapons
;475:	if ((ent->flags & FL_DROPPED_ITEM) && (ent->item->giType == IT_WEAPON)) // It's a dropped Item.. Let them have it -- Shafe - Trep
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
EQI4 $163
ADDRLP4 8
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $163
line 476
;476:	{
line 479
;477:		// Let not do anything for now - change later
;478:	
;479:	} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 481
;480:
;481:		if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
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
NEI4 $165
line 482
;482:			return;
ADDRGP4 $158
JUMPV
LABELV $165
line 484
;483:		}
;484:	}
LABELV $164
line 486
;485:
;486:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $168
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 488
;487:
;488:	predict = other->client->pers.predictItemPickup;
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
line 491
;489:
;490:	// call the item-specific pickup function
;491:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $158
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $158
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $179-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $179
address $172
address $173
address $174
address $175
address $176
address $178
address $158
address $177
code
LABELV $172
line 495
;492:	case IT_WEAPON:
;493:	
;494:		
;495:		respawn = Pickup_Weapon(ent, other);
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
line 497
;496://		predict = qfalse;
;497:		break;
ADDRGP4 $170
JUMPV
LABELV $173
line 499
;498:	case IT_AMMO:
;499:		respawn = Pickup_Ammo(ent, other);
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
line 501
;500://		predict = qfalse;
;501:		break;
ADDRGP4 $170
JUMPV
LABELV $174
line 503
;502:	case IT_ARMOR:
;503:		respawn = Pickup_Armor(ent, other);
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
line 504
;504:		break;
ADDRGP4 $170
JUMPV
LABELV $175
line 506
;505:	case IT_HEALTH:
;506:		respawn = Pickup_Health(ent, other);
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
line 507
;507:		break;
ADDRGP4 $170
JUMPV
LABELV $176
line 509
;508:	case IT_POWERUP:
;509:		respawn = Pickup_Powerup(ent, other);
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
line 510
;510:		predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 511
;511:		break;
ADDRGP4 $170
JUMPV
LABELV $177
line 518
;512:#ifdef MISSIONPACK
;513:	case IT_PERSISTANT_POWERUP:
;514:		respawn = Pickup_PersistantPowerup(ent, other);
;515:		break;
;516:#endif
;517:	case IT_TEAM:
;518:		respawn = Pickup_Team(ent, other);
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
line 519
;519:		break;
ADDRGP4 $170
JUMPV
LABELV $178
line 521
;520:	case IT_HOLDABLE:
;521:		respawn = Pickup_Holdable(ent, other);
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
line 522
;522:		break;
line 524
;523:	default:
;524:		return;
LABELV $170
line 527
;525:	}
;526:
;527:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $181
line 528
;528:		return;
ADDRGP4 $158
JUMPV
LABELV $181
line 532
;529:	}
;530:
;531:	// play the normal pickup sound
;532:	if (predict) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $183
line 533
;533:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 534
;534:	} else {
ADDRGP4 $184
JUMPV
LABELV $183
line 535
;535:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 536
;536:	}
LABELV $184
line 539
;537:
;538:	// powerup pickups are global broadcasts
;539:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $187
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $185
LABELV $187
line 541
;540:		// if we want the global sound to play
;541:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $188
line 544
;542:			gentity_t	*te;
;543:
;544:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 545
;545:			te->s.eventParm = ent->s.modelindex;
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
line 546
;546:			te->r.svFlags |= SVF_BROADCAST;
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
line 547
;547:		} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 550
;548:			gentity_t	*te;
;549:
;550:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 551
;551:			te->s.eventParm = ent->s.modelindex;
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
line 553
;552:			// only send this temp entity to a single client
;553:			te->r.svFlags |= SVF_SINGLECLIENT;
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
line 554
;554:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 555
;555:		}
LABELV $189
line 556
;556:	}
LABELV $185
line 559
;557:
;558:	// fire item targets
;559:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 562
;560:
;561:	// wait of -1 will not respawn
;562:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $190
line 563
;563:		ent->r.svFlags |= SVF_NOCLIENT;
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
line 564
;564:		ent->s.eFlags |= EF_NODRAW;
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
line 565
;565:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 566
;566:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 1
ASGNI4
line 567
;567:		return;
ADDRGP4 $158
JUMPV
LABELV $190
line 571
;568:	}
;569:
;570:	// non zero wait overrides respawn time
;571:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CNSTF4 0
EQF4 $192
line 572
;572:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 573
;573:	}
LABELV $192
line 576
;574:
;575:	// random can be used to vary the respawn time
;576:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRF4
CNSTF4 0
EQF4 $194
line 577
;577:		respawn += crandom() * ent->random;
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
CNSTI4 816
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 578
;578:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $196
line 579
;579:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 580
;580:		}
LABELV $196
line 581
;581:	}
LABELV $194
line 584
;582:
;583:	// dropped items will not respawn
;584:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $198
line 585
;585:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 586
;586:	}
LABELV $198
line 591
;587:
;588:	// picked up items still stay around, they just don't
;589:	// draw anything.  This allows respawnable items
;590:	// to be placed on movers.
;591:	ent->r.svFlags |= SVF_NOCLIENT;
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
line 592
;592:	ent->s.eFlags |= EF_NODRAW;
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
line 593
;593:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 599
;594:
;595:	// ZOID
;596:	// A negative respawn times means to never respawn this item (but don't 
;597:	// delete it).  This is used by items that are respawned by third party 
;598:	// events such as ctf flags
;599:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $200
line 600
;600:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 601
;601:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTP4 0
ASGNP4
line 602
;602:	} else {
ADDRGP4 $201
JUMPV
LABELV $200
line 603
;603:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 604
;604:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 605
;605:	}
LABELV $201
line 606
;606:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 607
;607:}
LABELV $158
endproc Touch_Item 48 12
export LaunchItem
proc LaunchItem 12 8
line 619
;608:
;609:
;610://======================================================================
;611:
;612:/*
;613:================
;614:LaunchItem
;615:
;616:Spawns an item and tosses it forward
;617:================
;618:*/
;619:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 622
;620:	gentity_t	*dropped;
;621:
;622:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 624
;623:
;624:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 625
;625:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
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
line 626
;626:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 628
;627:
;628:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 629
;629:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 630
;630:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
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
line 631
;631:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
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
line 632
;632:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 634
;633:
;634:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 636
;635:
;636:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 637
;637:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 638
;638:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 639
;639:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 641
;640:
;641:	dropped->s.eFlags |= EF_BOUNCE_HALF;
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
line 645
;642:#ifdef MISSIONPACK
;643:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;644:#else
;645:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $205
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $205
line 647
;646:#endif
;647:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 648
;648:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 649
;649:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 650
;650:	} else { // auto-remove after 30 seconds
ADDRGP4 $206
JUMPV
LABELV $205
line 651
;651:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 652
;652:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 653
;653:	}
LABELV $206
line 655
;654:
;655:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 4096
ASGNI4
line 657
;656:
;657:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 659
;658:
;659:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $203
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 40 16
line 669
;660:}
;661:
;662:/*
;663:================
;664:Drop_Item
;665:
;666:Spawns an item and tosses it forward
;667:================
;668:*/
;669:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 673
;670:	vec3_t	velocity;
;671:	vec3_t	angles;
;672:
;673:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 674
;674:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 675
;675:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 677
;676:
;677:	AngleVectors( angles, velocity, NULL, NULL );
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
line 678
;678:	VectorScale( velocity, 150, velocity );
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
line 679
;679:	velocity[2] += 200 + crandom() * 50;
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
line 681
;680://	PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: Drop Item Complete\n", velocity); // Shafe - Debug
;681:	return LaunchItem( item, ent->s.pos.trBase, velocity );
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
LABELV $210
endproc Drop_Item 40 16
export Use_Item
proc Use_Item 0 4
line 692
;682:}
;683:
;684:
;685:/*
;686:================
;687:Use_Item
;688:
;689:Respawn the item
;690:================
;691:*/
;692:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 693
;693:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 694
;694:}
LABELV $217
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 88 28
line 706
;695:
;696://======================================================================
;697:
;698:/*
;699:================
;700:FinishSpawningItem
;701:
;702:Traces down to find where an item should rest, instead of letting them
;703:free fall from their spawn points
;704:================
;705:*/
;706:void FinishSpawningItem( gentity_t *ent ) {
line 710
;707:	trace_t		tr;
;708:	vec3_t		dest;
;709:
;710:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
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
line 711
;711:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
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
line 713
;712:
;713:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 714
;714:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
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
CNSTI4 876
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
line 715
;715:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 717
;716:
;717:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 718
;718:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 720
;719:	// useing an item causes it to respawn
;720:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 722
;721:
;722:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $219
line 724
;723:		// suspended
;724:		G_SetOrigin( ent, ent->s.origin );
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
line 725
;725:	} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 727
;726:		// drop to floor
;727:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
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
line 728
;728:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
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
line 729
;729:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $223
line 730
;730:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $226
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
line 731
;731:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 732
;732:			return;
ADDRGP4 $218
JUMPV
LABELV $223
line 736
;733:		}
;734:
;735:		// allow to ride movers
;736:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 738
;737:
;738:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 739
;739:	}
LABELV $220
line 742
;740:
;741:	// team slaves and targeted items aren't present at start
;742:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
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
NEI4 $231
ADDRLP4 72
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
LABELV $231
line 743
;743:		ent->s.eFlags |= EF_NODRAW;
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
line 744
;744:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 745
;745:		return;
ADDRGP4 $218
JUMPV
LABELV $229
line 749
;746:	}
;747:
;748:	// powerups don't spawn in for a while
;749:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $232
line 752
;750:		float	respawn;
;751:
;752:		respawn = 45 + crandom() * 15;
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
line 753
;753:		ent->s.eFlags |= EF_NODRAW;
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
line 754
;754:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 755
;755:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 696
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
line 756
;756:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 757
;757:		return;
ADDRGP4 $218
JUMPV
LABELV $232
line 761
;758:	}
;759:
;760:
;761:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 762
;762:}
LABELV $218
endproc FinishSpawningItem 88 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 772
;763:
;764:
;765:qboolean	itemRegistered[MAX_ITEMS];
;766:
;767:/*
;768:==================
;769:G_CheckTeamItems
;770:==================
;771:*/
;772:void G_CheckTeamItems( void ) {
line 775
;773:
;774:	// Set up team stuff
;775:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 777
;776:
;777:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $236
line 781
;778:		gitem_t	*item;
;779:
;780:		// check for the two flags
;781:		item = BG_FindItem( "Red Flag" );
ADDRGP4 $239
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 782
;782:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $242
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
NEI4 $240
LABELV $242
line 783
;783:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
ADDRGP4 $243
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 784
;784:		}
LABELV $240
line 785
;785:		item = BG_FindItem( "Blue Flag" );
ADDRGP4 $244
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 786
;786:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $247
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
NEI4 $245
LABELV $247
line 787
;787:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
ADDRGP4 $248
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 788
;788:		}
LABELV $245
line 789
;789:	}
LABELV $236
line 849
;790:#ifdef MISSIONPACK
;791:	if( g_gametype.integer == GT_1FCTF ) {
;792:		gitem_t	*item;
;793:
;794:		// check for all three flags
;795:		item = BG_FindItem( "Red Flag" );
;796:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;797:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
;798:		}
;799:		item = BG_FindItem( "Blue Flag" );
;800:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;801:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
;802:		}
;803:		item = BG_FindItem( "Neutral Flag" );
;804:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;805:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map" );
;806:		}
;807:	}
;808:
;809:	if( g_gametype.integer == GT_OBELISK ) {
;810:		gentity_t	*ent;
;811:
;812:		// check for the two obelisks
;813:		ent = NULL;
;814:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;815:		if( !ent ) {
;816:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;817:		}
;818:
;819:		ent = NULL;
;820:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;821:		if( !ent ) {
;822:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;823:		}
;824:	}
;825:
;826:	if( g_gametype.integer == GT_HARVESTER ) {
;827:		gentity_t	*ent;
;828:
;829:		// check for all three obelisks
;830:		ent = NULL;
;831:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;832:		if( !ent ) {
;833:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;834:		}
;835:
;836:		ent = NULL;
;837:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;838:		if( !ent ) {
;839:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;840:		}
;841:
;842:		ent = NULL;
;843:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;844:		if( !ent ) {
;845:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map" );
;846:		}
;847:	}
;848:#endif
;849:}
LABELV $235
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 44 12
line 856
;850:
;851:/*
;852:==============
;853:ClearRegisteredItems
;854:==============
;855:*/
;856:void ClearRegisteredItems( void ) {
line 857
;857:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 860
;858:
;859:	// players always start with the base weapon
;860:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
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
line 862
;861:	// We're using some effects from the plasma gun.. so yeah..
;862:	RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 8
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
line 863
;863:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
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
line 866
;864:
;865:	// Let's Always Register The Rocket Launcher  - Shafe - Trep 
;866:	RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
CNSTI4 5
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
line 868
;867:	// Shafe - Trep Preregister Lighning and the Grapple For the offhand grapple
;868:	RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
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
line 869
;869:	RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
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
line 873
;870:	
;871:	// Shade - Trep - Register the Grenade Launcher for the PDG's... 
;872:	// If we get a model we wont need to pre-register this
;873:	RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
CNSTI4 4
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
line 876
;874:	
;875:	// Shafe - Trep - Pre-register Railgun For Instagib
;876:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $250
line 877
;877:	{
line 878
;878:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 7
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
line 879
;879:	} // End Shafe
LABELV $250
line 882
;880:
;881:	// Shafe - Trep - Arsenal and LMS Gets All Weapons Pre-Registered
;882:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $257
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $253
LABELV $257
line 883
;883:	{
line 884
;884:		if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $258
line 885
;885:		{
line 886
;886:			RegisterItem( BG_FindItemForWeapon( WP_SHOTGUN ) );
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
line 887
;887:			RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 7
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
line 888
;888:			RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 8
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
line 889
;889:			RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
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
line 890
;890:		}
LABELV $258
line 891
;891:	}
LABELV $253
line 899
;892:
;893:#ifdef MISSIONPACK
;894:	if( g_gametype.integer == GT_HARVESTER ) {
;895:		RegisterItem( BG_FindItem( "Red Cube" ) );
;896:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;897:	}
;898:#endif
;899:}
LABELV $249
endproc ClearRegisteredItems 44 12
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
NEU4 $262
line 910
;910:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $264
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 911
;911:	}
LABELV $262
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
LABELV $261
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
ADDRGP4 $269
JUMPV
LABELV $266
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
EQI4 $270
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
ADDRGP4 $271
JUMPV
LABELV $270
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
LABELV $271
line 937
;937:	}
LABELV $267
line 930
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $269
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $266
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
ADDRGP4 $272
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
LABELV $265
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
ADDRGP4 $274
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
LABELV $273
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 967
;955:}
;956:
;957:/*
;958:============
;959:G_SpawnItem
;960:
;961:Sets the clipping size and plants the object on the floor.
;962:
;963:Items can't be immediately dropped to floor, because they might
;964:be on an entity that hasn't spawned yet.
;965:============
;966:*/
;967:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 970
;968:	
;969:	//Shafe - Trep Instagib
;970:	if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $276
line 971
;971:	{
line 973
;972:	// InstaGib - prevent weapons and ammo from spawning
;973:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $281
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $279
LABELV $281
line 974
;974:		return;
ADDRGP4 $275
JUMPV
LABELV $279
line 975
;975:	}
LABELV $276
line 979
;976:	/////////////////////////////////////////////////////////
;977:
;978:	//Shafe - Trep Instagib
;979:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $286
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $282
LABELV $286
line 980
;980:	{
line 982
;981:	// Arsenal - prevent weapons and ammo from spawning
;982:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $289
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $287
LABELV $289
line 983
;983:		return;
ADDRGP4 $275
JUMPV
LABELV $287
line 984
;984:	}
LABELV $282
line 987
;985:	/////////////////////////////////////////////////////////
;986: 
;987:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $290
ARGP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 988
;988:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $292
ARGP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 990
;989:
;990:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 991
;991:	if ( G_ItemDisabled(item) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $293
line 992
;992:		return;
ADDRGP4 $275
JUMPV
LABELV $293
line 994
;993:
;994:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 997
;995:	// some movers spawn on the second frame, so delay item
;996:	// spawns until the third frame so they can ride trains
;997:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 998
;998:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 1000
;999:
;1000:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTF4 1056964608
ASGNF4
line 1002
;1001:
;1002:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $296
line 1003
;1003:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $152
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1004
;1004:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $298
ARGP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1005
;1005:	}
LABELV $296
line 1012
;1006:
;1007:#ifdef MISSIONPACK
;1008:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;1009:		ent->s.generic1 = ent->spawnflags;
;1010:	}
;1011:#endif
;1012:}
LABELV $275
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 76 12
line 1021
;1013:
;1014:
;1015:/*
;1016:================
;1017:G_BounceItem
;1018:
;1019:================
;1020:*/
;1021:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1027
;1022:	vec3_t	velocity;
;1023:	float	dot;
;1024:	int		hitTime;
;1025:
;1026:	// reflect the velocity on the trace plane
;1027:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 1028
;1028:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 1029
;1029:	dot = DotProduct( velocity, trace->plane.normal );
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
line 1030
;1030:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 1033
;1031:
;1032:	// cut the velocity to keep from bouncing forever
;1033:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
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
line 1036
;1034:
;1035:	// check for stop
;1036:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $307
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $307
line 1037
;1037:		trace->endpos[2] += 1.0;	// make sure it is off ground
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
line 1038
;1038:		SnapVector( trace->endpos );
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
line 1039
;1039:		G_SetOrigin( ent, trace->endpos );
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
line 1040
;1040:		ent->s.groundEntityNum = trace->entityNum;
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
line 1041
;1041:		return;
ADDRGP4 $299
JUMPV
LABELV $307
line 1044
;1042:	}
;1043:
;1044:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 1045
;1045:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 1046
;1046:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1047
;1047:}
LABELV $299
endproc G_BounceItem 76 12
export G_RunItem
proc G_RunItem 88 28
line 1056
;1048:
;1049:
;1050:/*
;1051:================
;1052:G_RunItem
;1053:
;1054:================
;1055:*/
;1056:void G_RunItem( gentity_t *ent ) {
line 1063
;1057:	vec3_t		origin;
;1058:	trace_t		tr;
;1059:	int			contents;
;1060:	int			mask;
;1061:
;1062:	// if groundentity has been set to -1, it may have been pushed off an edge
;1063:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $311
line 1064
;1064:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $313
line 1065
;1065:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1066
;1066:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1067
;1067:		}
LABELV $313
line 1068
;1068:	}
LABELV $311
line 1070
;1069:
;1070:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 1072
;1071:		// check think function
;1072:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1073
;1073:		return;
ADDRGP4 $310
JUMPV
LABELV $316
line 1077
;1074:	}
;1075:
;1076:	// get current position
;1077:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 1080
;1078:
;1079:	// trace a line from the previous position to the current position
;1080:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
line 1081
;1081:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ASGNI4
line 1082
;1082:	} else {
ADDRGP4 $320
JUMPV
LABELV $319
line 1083
;1083:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1084
;1084:	}
LABELV $320
line 1085
;1085:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
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
line 1088
;1086:		ent->r.ownerNum, mask );
;1087:
;1088:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1090
;1089:
;1090:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $322
line 1091
;1091:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1092
;1092:	}
LABELV $322
line 1094
;1093:
;1094:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1097
;1095:
;1096:	// check think function
;1097:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1099
;1098:
;1099:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $326
line 1100
;1100:		return;
ADDRGP4 $310
JUMPV
LABELV $326
line 1104
;1101:	}
;1102:
;1103:	// if it is in a nodrop volume, remove it
;1104:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
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
line 1105
;1105:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $329
line 1106
;1106:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $331
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $331
line 1107
;1107:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1108
;1108:		} else {
ADDRGP4 $310
JUMPV
LABELV $331
line 1109
;1109:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1110
;1110:		}
line 1111
;1111:		return;
ADDRGP4 $310
JUMPV
LABELV $329
line 1114
;1112:	}
;1113:
;1114:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1115
;1115:}
LABELV $310
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
LABELV $298
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
LABELV $292
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $291
byte 1 48
byte 1 0
align 1
LABELV $290
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $274
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
LABELV $272
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
LABELV $264
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
LABELV $248
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
LABELV $244
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
LABELV $243
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
LABELV $239
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
LABELV $226
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
LABELV $168
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
LABELV $157
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
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $152
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
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $139
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
