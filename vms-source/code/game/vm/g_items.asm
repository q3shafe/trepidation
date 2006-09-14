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
CNSTI4 836
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
CNSTI4 836
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
CNSTI4 836
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
CNSTI4 836
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
CNSTI4 3392
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
CNSTI4 2492
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
proc Pickup_Holdable 4 0
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
CNSTI4 836
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
;179:	if( ent->item->giTag == HI_KAMIKAZE ) {
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $90
line 180
;180:		other->client->ps.eFlags |= EF_KAMIKAZE;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 181
;181:	}
LABELV $90
line 191
;182:	
;183:	// Shafe - Trep -- Test
;184:	/*
;185:	if( ent->item->giTag == HI_MEDKIT ) {
;186:		other->client->pers.holdable = 1;
;187:			
;188:	}
;189:	*/
;190:	
;191:	return RESPAWN_HOLDABLE;
CNSTI4 60
RETI4
LABELV $89
endproc Pickup_Holdable 4 0
export Add_Ammo
proc Add_Ammo 4 0
line 198
;192:}
;193:
;194:
;195://======================================================================
;196:
;197:void Add_Ammo (gentity_t *ent, int weapon, int count)
;198:{
line 199
;199:	ent->client->ps.ammo[weapon] += count;
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
line 200
;200:	if ( ent->client->ps.ammo[weapon] > 200 ) {
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
LEI4 $93
line 202
;201:		//ent->client->ps.ammo[weapon] = 200; // Shafe - Trep - Ammo is no longer maxxed at 200
;202:	}
LABELV $93
line 204
;203:	
;204:}
LABELV $92
endproc Add_Ammo 4 0
export Pickup_Ammo
proc Pickup_Ammo 4 12
line 207
;205:
;206:int Pickup_Ammo (gentity_t *ent, gentity_t *other)
;207:{
line 210
;208:	int		quantity;
;209:
;210:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $96
line 211
;211:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 212
;212:	} else {
ADDRGP4 $97
JUMPV
LABELV $96
line 214
;213:	
;214:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 215
;215:	}
LABELV $97
line 218
;216:	
;217:	
;218:	Add_Ammo (other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 220
;219:
;220:	return RESPAWN_AMMO;
CNSTI4 40
RETI4
LABELV $95
endproc Pickup_Ammo 4 12
export Pickup_Weapon
proc Pickup_Weapon 12 12
line 226
;221:}
;222:
;223://======================================================================
;224:
;225:
;226:int Pickup_Weapon (gentity_t *ent, gentity_t *other) {
line 231
;227:	int		quantity;
;228:
;229:	
;230:	
;231:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
GEI4 $99
line 232
;232:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 233
;233:	} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 234
;234:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 235
;235:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 236
;236:		} else {
ADDRGP4 $102
JUMPV
LABELV $101
line 238
;237:
;238:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 239
;239:		}
LABELV $102
line 243
;240:
;241:		
;242:		// dropped items and teamplay weapons always have full ammo
;243:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $103
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $103
line 246
;244:			// respawning rules
;245:			// drop the quantity if the already have over the minimum
;246:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
ADDRFP4 0
INDIRP4
CNSTI4 836
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
GEI4 $106
line 247
;247:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 248
;248:			} else {
ADDRGP4 $107
JUMPV
LABELV $106
line 249
;249:				quantity = 1;		// only add a single shot  
ADDRLP4 0
CNSTI4 1
ASGNI4
line 251
;250:				
;251:			}
LABELV $107
line 252
;252:		}
LABELV $103
line 253
;253:	}
LABELV $100
line 257
;254:
;255:	
;256:	// add the weapon
;257:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
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
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 259
;258:
;259:	if ( (other->client->ps.ammo[ ent->item->giTag ] + quantity)  <= Max_Ammo[ ent->item->giTag ] ) 
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 836
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
GTI4 $108
line 260
;260:	{
line 262
;261:		// It's not gonna put them over give them the full amount
;262:		Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 263
;263:	}
ADDRGP4 $109
JUMPV
LABELV $108
line 265
;264:	else 
;265:	{
line 267
;266:		// Otherwise just give them the max
;267:		quantity = Max_Ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 268
;268:		other->client->ps.ammo[ ent->item->giTag ] = quantity;
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 270
;269:		//Add_Ammo( other, ent->item->giTag, quantity ); // Oops :) Shafe
;270:	}
LABELV $109
line 273
;271:	
;272:	// If it's arsenal and lms then make sure they are still at infinite
;273:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $114
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $110
LABELV $114
line 274
;274:	{
line 275
;275:		other->client->ps.ammo[ ent->item->giTag ] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 276
;276:	}
LABELV $110
line 280
;277:
;278:	//}
;279:
;280:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $115
line 281
;281:		other->client->ps.ammo[ent->item->giTag] = -1; // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 291
;282:
;283:	// team deathmatch has slow weapon respawns
;284:	// I always hated this shit.
;285:	/*
;286:	if ( g_gametype.integer == GT_TEAM ) {
;287:		return g_weaponTeamRespawn.integer;
;288:	}
;289:	*/
;290:
;291:	return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
LABELV $98
endproc Pickup_Weapon 12 12
export Pickup_Health
proc Pickup_Health 24 0
line 297
;292:}
;293:
;294:
;295://======================================================================
;296:
;297:int Pickup_Health (gentity_t *ent, gentity_t *other) {
line 309
;298:	int			max;
;299:	int			quantity;
;300:	int			respawnTime;
;301:
;302:	// small and mega healths will go over the max
;303:#ifdef MISSIONPACK
;304:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;305:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;306:	}
;307:	else
;308:#endif
;309:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 310
;310:		max = other->client->ps.stats[STAT_MAX_HEALTH];
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
line 311
;311:	} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 312
;312:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
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
line 313
;313:	}
LABELV $120
line 315
;314:
;315:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $121
line 316
;316:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 317
;317:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 318
;318:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 319
;319:	}
LABELV $122
line 321
;320:
;321:	other->health += quantity;
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
line 323
;322:
;323:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $123
line 324
;324:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 325
;325:	}
LABELV $123
line 326
;326:	other->client->ps.stats[STAT_HEALTH] = other->health;
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
line 329
;327:		
;328:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;329:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $125
line 330
;330:	{ 
line 332
;331:			// If it's down to 2 players make it a really long time
;332:			respawnTime = RESPAWN_HEALTH * 60.0;  
ADDRLP4 8
CNSTI4 2100
ASGNI4
line 333
;333:			return	respawnTime;
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $118
JUMPV
LABELV $125
line 338
;334:	}
;335:	
;336:
;337:
;338:	if ( ent->item->quantity == 100 ) {		// mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $128
line 339
;339:		return RESPAWN_MEGAHEALTH;
CNSTI4 35
RETI4
ADDRGP4 $118
JUMPV
LABELV $128
line 342
;340:	}
;341:
;342:	return RESPAWN_HEALTH;
CNSTI4 35
RETI4
LABELV $118
endproc Pickup_Health 24 0
export Pickup_Armor
proc Pickup_Armor 16 0
line 347
;343:}
;344:
;345://======================================================================
;346:
;347:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 366
;348:	int		respawnTime;
;349:#ifdef MISSIONPACK
;350:	int		upperBound;
;351:	
;352:
;353:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;354:
;355:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;356:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;357:	}
;358:	else {
;359:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;360:	}
;361:
;362:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;363:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;364:	}
;365:#else
;366:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
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
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 367
;367:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
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
line 368
;368:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
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
line 369
;369:	}
LABELV $131
line 375
;370:
;371:#endif
;372:
;373:
;374:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;375:	if (level.StopItemRespawn) 
ADDRGP4 level+9232
INDIRI4
CNSTI4 0
EQI4 $133
line 376
;376:	{ 
line 378
;377:			// If it's down to 2 players make it a really long time
;378:			respawnTime = RESPAWN_ARMOR * 60.0;  
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 379
;379:			return	respawnTime;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $130
JUMPV
LABELV $133
line 382
;380:	}
;381:
;382:	return RESPAWN_ARMOR;
CNSTI4 25
RETI4
LABELV $130
endproc Pickup_Armor 16 0
export RespawnItem
proc RespawnItem 24 12
line 392
;383:}
;384:
;385://======================================================================
;386:
;387:/*
;388:===============
;389:RespawnItem
;390:===============
;391:*/
;392:void RespawnItem( gentity_t *ent ) {
line 394
;393:	// randomly select from teamed entities
;394:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
line 399
;395:		gentity_t	*master;
;396:		int	count;
;397:		int choice;
;398:
;399:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $139
line 400
;400:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $141
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 401
;401:		}
LABELV $139
line 402
;402:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
ASGNP4
line 404
;403:
;404:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
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
line 405
;405:			;
LABELV $143
line 404
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
LABELV $145
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
line 407
;406:
;407:		choice = rand() % count;
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
line 409
;408:
;409:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
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
line 410
;410:			;
LABELV $147
line 409
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
LABELV $149
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $146
line 411
;411:	}
LABELV $137
line 413
;412:
;413:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 414
;414:	ent->s.eFlags &= ~EF_NODRAW;
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
line 415
;415:	ent->r.svFlags &= ~SVF_NOCLIENT;
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
line 416
;416:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 418
;417:
;418:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $150
line 423
;419:		// play powerup spawn sound to all clients
;420:		gentity_t	*te;
;421:
;422:		// if the powerup respawn sound should Not be global
;423:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $152
line 424
;424:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
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
line 425
;425:		}
ADDRGP4 $153
JUMPV
LABELV $152
line 426
;426:		else {
line 427
;427:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
line 428
;428:		}
LABELV $153
line 429
;429:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
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
line 430
;430:		te->r.svFlags |= SVF_BROADCAST;
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
line 431
;431:	}
LABELV $150
line 433
;432:
;433:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 438
;434:		// play powerup spawn sound to all clients
;435:		gentity_t	*te;
;436:
;437:		// if the powerup respawn sound should Not be global
;438:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $157
line 439
;439:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
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
line 440
;440:		}
ADDRGP4 $158
JUMPV
LABELV $157
line 441
;441:		else {
line 442
;442:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
line 443
;443:		}
LABELV $158
line 444
;444:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
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
line 445
;445:		te->r.svFlags |= SVF_BROADCAST;
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
line 446
;446:	}
LABELV $155
line 449
;447:
;448:	// play the normal respawn sound only to nearby clients
;449:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
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
line 451
;450:
;451:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 452
;452:}
LABELV $136
endproc RespawnItem 24 12
export Touch_Item
proc Touch_Item 48 12
line 460
;453:
;454:
;455:/*
;456:===============
;457:Touch_Item
;458:===============
;459:*/
;460:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 464
;461:	int			respawn;
;462:	qboolean	predict;
;463:
;464:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 465
;465:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 466
;466:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 1
GEI4 $163
line 467
;467:		return;		// dead people can't pickup
ADDRGP4 $160
JUMPV
LABELV $163
line 473
;468:
;469:	
;470:	// the same pickup rules are used for client side and server side
;471:	
;472:	// Shafe - Trep this is a cheap hack to allow pickups of dropped weapons
;473:	if ((ent->flags & FL_DROPPED_ITEM) && (ent->item->giType == IT_WEAPON)) // It's a dropped Item.. Let them have it -- Shafe - Trep
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
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $165
line 474
;474:	{
line 477
;475:		// Let not do anything for now - change later
;476:	
;477:	} else {
ADDRGP4 $166
JUMPV
LABELV $165
line 479
;478:
;479:		if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
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
line 480
;480:			return;
ADDRGP4 $160
JUMPV
LABELV $167
line 482
;481:		}
;482:	}
LABELV $166
line 484
;483:
;484:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $170
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 486
;485:
;486:	predict = other->client->pers.predictItemPickup;
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
line 489
;487:
;488:	// call the item-specific pickup function
;489:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 493
;490:	case IT_WEAPON:
;491:	
;492:		
;493:		respawn = Pickup_Weapon(ent, other);
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
line 495
;494://		predict = qfalse;
;495:		break;
ADDRGP4 $172
JUMPV
LABELV $175
line 497
;496:	case IT_AMMO:
;497:		respawn = Pickup_Ammo(ent, other);
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
line 499
;498://		predict = qfalse;
;499:		break;
ADDRGP4 $172
JUMPV
LABELV $176
line 501
;500:	case IT_ARMOR:
;501:		respawn = Pickup_Armor(ent, other);
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
line 502
;502:		break;
ADDRGP4 $172
JUMPV
LABELV $177
line 504
;503:	case IT_HEALTH:
;504:		respawn = Pickup_Health(ent, other);
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
line 505
;505:		break;
ADDRGP4 $172
JUMPV
LABELV $178
line 507
;506:	case IT_POWERUP:
;507:		respawn = Pickup_Powerup(ent, other);
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
line 508
;508:		predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 509
;509:		break;
ADDRGP4 $172
JUMPV
LABELV $179
line 516
;510:#ifdef MISSIONPACK
;511:	case IT_PERSISTANT_POWERUP:
;512:		respawn = Pickup_PersistantPowerup(ent, other);
;513:		break;
;514:#endif
;515:	case IT_TEAM:
;516:		respawn = Pickup_Team(ent, other);
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
line 517
;517:		break;
ADDRGP4 $172
JUMPV
LABELV $180
line 519
;518:	case IT_HOLDABLE:
;519:		respawn = Pickup_Holdable(ent, other);
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
line 520
;520:		break;
line 522
;521:	default:
;522:		return;
LABELV $172
line 525
;523:	}
;524:
;525:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $183
line 526
;526:		return;
ADDRGP4 $160
JUMPV
LABELV $183
line 530
;527:	}
;528:
;529:	// play the normal pickup sound
;530:	if (predict) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $185
line 531
;531:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 532
;532:	} else {
ADDRGP4 $186
JUMPV
LABELV $185
line 533
;533:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 534
;534:	}
LABELV $186
line 537
;535:
;536:	// powerup pickups are global broadcasts
;537:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 836
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
line 539
;538:		// if we want the global sound to play
;539:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $190
line 542
;540:			gentity_t	*te;
;541:
;542:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 543
;543:			te->s.eventParm = ent->s.modelindex;
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
line 544
;544:			te->r.svFlags |= SVF_BROADCAST;
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
line 545
;545:		} else {
ADDRGP4 $191
JUMPV
LABELV $190
line 548
;546:			gentity_t	*te;
;547:
;548:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 549
;549:			te->s.eventParm = ent->s.modelindex;
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
line 551
;550:			// only send this temp entity to a single client
;551:			te->r.svFlags |= SVF_SINGLECLIENT;
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
line 552
;552:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 553
;553:		}
LABELV $191
line 554
;554:	}
LABELV $187
line 557
;555:
;556:	// fire item targets
;557:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 560
;558:
;559:	// wait of -1 will not respawn
;560:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $192
line 561
;561:		ent->r.svFlags |= SVF_NOCLIENT;
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
line 562
;562:		ent->s.eFlags |= EF_NODRAW;
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
line 563
;563:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 564
;564:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 1
ASGNI4
line 565
;565:		return;
ADDRGP4 $160
JUMPV
LABELV $192
line 569
;566:	}
;567:
;568:	// non zero wait overrides respawn time
;569:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CNSTF4 0
EQF4 $194
line 570
;570:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 571
;571:	}
LABELV $194
line 574
;572:
;573:	// random can be used to vary the respawn time
;574:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRF4
CNSTF4 0
EQF4 $196
line 575
;575:		respawn += crandom() * ent->random;
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
line 576
;576:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $198
line 577
;577:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 578
;578:		}
LABELV $198
line 579
;579:	}
LABELV $196
line 582
;580:
;581:	// dropped items will not respawn
;582:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $200
line 583
;583:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 584
;584:	}
LABELV $200
line 589
;585:
;586:	// picked up items still stay around, they just don't
;587:	// draw anything.  This allows respawnable items
;588:	// to be placed on movers.
;589:	ent->r.svFlags |= SVF_NOCLIENT;
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
line 590
;590:	ent->s.eFlags |= EF_NODRAW;
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
line 591
;591:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 597
;592:
;593:	// ZOID
;594:	// A negative respawn times means to never respawn this item (but don't 
;595:	// delete it).  This is used by items that are respawned by third party 
;596:	// events such as ctf flags
;597:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $202
line 598
;598:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 599
;599:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTP4 0
ASGNP4
line 600
;600:	} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 601
;601:		ent->nextthink = level.time + respawn * 1000;
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
line 602
;602:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 603
;603:	}
LABELV $203
line 604
;604:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 605
;605:}
LABELV $160
endproc Touch_Item 48 12
export LaunchItem
proc LaunchItem 12 8
line 617
;606:
;607:
;608://======================================================================
;609:
;610:/*
;611:================
;612:LaunchItem
;613:
;614:Spawns an item and tosses it forward
;615:================
;616:*/
;617:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 620
;618:	gentity_t	*dropped;
;619:
;620:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 622
;621:
;622:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 623
;623:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
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
line 624
;624:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 626
;625:
;626:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 627
;627:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 628
;628:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
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
line 629
;629:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
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
line 630
;630:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 632
;631:
;632:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 634
;633:
;634:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 635
;635:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 636
;636:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 637
;637:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 639
;638:
;639:	dropped->s.eFlags |= EF_BOUNCE_HALF;
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
line 643
;640:#ifdef MISSIONPACK
;641:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;642:#else
;643:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
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
line 645
;644:#endif
;645:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 646
;646:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 647
;647:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 648
;648:	} else { // auto-remove after 30 seconds
ADDRGP4 $208
JUMPV
LABELV $207
line 649
;649:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 650
;650:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 651
;651:	}
LABELV $208
line 653
;652:
;653:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 4096
ASGNI4
line 655
;654:
;655:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 657
;656:
;657:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $205
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 40 16
line 667
;658:}
;659:
;660:/*
;661:================
;662:Drop_Item
;663:
;664:Spawns an item and tosses it forward
;665:================
;666:*/
;667:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 671
;668:	vec3_t	velocity;
;669:	vec3_t	angles;
;670:
;671:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 672
;672:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 673
;673:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 675
;674:
;675:	AngleVectors( angles, velocity, NULL, NULL );
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
line 676
;676:	VectorScale( velocity, 150, velocity );
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
line 677
;677:	velocity[2] += 200 + crandom() * 50;
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
line 679
;678://	PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: Drop Item Complete\n", velocity); // Shafe - Debug
;679:	return LaunchItem( item, ent->s.pos.trBase, velocity );
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
line 690
;680:}
;681:
;682:
;683:/*
;684:================
;685:Use_Item
;686:
;687:Respawn the item
;688:================
;689:*/
;690:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 691
;691:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 692
;692:}
LABELV $219
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 88 28
line 704
;693:
;694://======================================================================
;695:
;696:/*
;697:================
;698:FinishSpawningItem
;699:
;700:Traces down to find where an item should rest, instead of letting them
;701:free fall from their spawn points
;702:================
;703:*/
;704:void FinishSpawningItem( gentity_t *ent ) {
line 708
;705:	trace_t		tr;
;706:	vec3_t		dest;
;707:
;708:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
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
line 709
;709:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
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
line 711
;710:
;711:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 712
;712:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
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
CNSTI4 836
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
line 713
;713:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 715
;714:
;715:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 716
;716:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 718
;717:	// useing an item causes it to respawn
;718:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 720
;719:
;720:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $221
line 722
;721:		// suspended
;722:		G_SetOrigin( ent, ent->s.origin );
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
line 723
;723:	} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 725
;724:		// drop to floor
;725:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
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
line 726
;726:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
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
line 727
;727:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $225
line 728
;728:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
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
line 729
;729:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 730
;730:			return;
ADDRGP4 $220
JUMPV
LABELV $225
line 734
;731:		}
;732:
;733:		// allow to ride movers
;734:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 736
;735:
;736:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 737
;737:	}
LABELV $222
line 740
;738:
;739:	// team slaves and targeted items aren't present at start
;740:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
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
line 741
;741:		ent->s.eFlags |= EF_NODRAW;
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
line 742
;742:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:		return;
ADDRGP4 $220
JUMPV
LABELV $231
line 747
;744:	}
;745:
;746:	// powerups don't spawn in for a while
;747:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $234
line 750
;748:		float	respawn;
;749:
;750:		respawn = 45 + crandom() * 15;
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
line 751
;751:		ent->s.eFlags |= EF_NODRAW;
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
line 752
;752:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 753
;753:		ent->nextthink = level.time + respawn * 1000;
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
line 754
;754:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 755
;755:		return;
ADDRGP4 $220
JUMPV
LABELV $234
line 759
;756:	}
;757:
;758:
;759:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 760
;760:}
LABELV $220
endproc FinishSpawningItem 88 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 770
;761:
;762:
;763:qboolean	itemRegistered[MAX_ITEMS];
;764:
;765:/*
;766:==================
;767:G_CheckTeamItems
;768:==================
;769:*/
;770:void G_CheckTeamItems( void ) {
line 773
;771:
;772:	// Set up team stuff
;773:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 775
;774:
;775:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $238
line 779
;776:		gitem_t	*item;
;777:
;778:		// check for the two flags
;779:		item = BG_FindItem( "Red Flag" );
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
line 780
;780:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
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
line 781
;781:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
ADDRGP4 $245
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 782
;782:		}
LABELV $242
line 783
;783:		item = BG_FindItem( "Blue Flag" );
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
line 784
;784:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
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
line 785
;785:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
ADDRGP4 $250
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 786
;786:		}
LABELV $247
line 787
;787:	}
LABELV $238
line 847
;788:#ifdef MISSIONPACK
;789:	if( g_gametype.integer == GT_1FCTF ) {
;790:		gitem_t	*item;
;791:
;792:		// check for all three flags
;793:		item = BG_FindItem( "Red Flag" );
;794:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;795:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
;796:		}
;797:		item = BG_FindItem( "Blue Flag" );
;798:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;799:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
;800:		}
;801:		item = BG_FindItem( "Neutral Flag" );
;802:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;803:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map" );
;804:		}
;805:	}
;806:
;807:	if( g_gametype.integer == GT_OBELISK ) {
;808:		gentity_t	*ent;
;809:
;810:		// check for the two obelisks
;811:		ent = NULL;
;812:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;813:		if( !ent ) {
;814:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;815:		}
;816:
;817:		ent = NULL;
;818:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;819:		if( !ent ) {
;820:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;821:		}
;822:	}
;823:
;824:	if( g_gametype.integer == GT_HARVESTER ) {
;825:		gentity_t	*ent;
;826:
;827:		// check for all three obelisks
;828:		ent = NULL;
;829:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;830:		if( !ent ) {
;831:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;832:		}
;833:
;834:		ent = NULL;
;835:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;836:		if( !ent ) {
;837:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;838:		}
;839:
;840:		ent = NULL;
;841:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;842:		if( !ent ) {
;843:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map" );
;844:		}
;845:	}
;846:#endif
;847:}
LABELV $237
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 40 12
line 854
;848:
;849:/*
;850:==============
;851:ClearRegisteredItems
;852:==============
;853:*/
;854:void ClearRegisteredItems( void ) {
line 855
;855:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 858
;856:
;857:	// players always start with the base weapon
;858:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
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
line 859
;859:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
CNSTI4 1
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
line 861
;860:	// Let's Always Register The Rocket Launcher  - Shafe - Trep 
;861:	RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
CNSTI4 5
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
line 863
;862:	// Shafe - Trep Preregister Lighning and the Grapple For the offhand grapple
;863:	RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
CNSTI4 6
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
line 864
;864:	RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
CNSTI4 10
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
line 868
;865:	
;866:	// Shade - Trep - Register the Grenade Launcher for the PDG's... 
;867:	// If we get a model we wont need to pre-register this
;868:	RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
CNSTI4 4
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
line 871
;869:	
;870:	// Shafe - Trep - Pre-register Railgun For Instagib
;871:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $252
line 872
;872:	{
line 873
;873:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 7
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
line 874
;874:	} // End Shafe
LABELV $252
line 877
;875:
;876:	// Shafe - Trep - Arsenal and LMS Gets All Weapons Pre-Registered
;877:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $259
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $255
LABELV $259
line 878
;878:	{
line 879
;879:		if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $260
line 880
;880:		{
line 881
;881:			RegisterItem( BG_FindItemForWeapon( WP_SHOTGUN ) );
CNSTI4 3
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
line 882
;882:			RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
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
line 883
;883:			RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 8
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
line 884
;884:			RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
CNSTI4 9
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
line 885
;885:		}
LABELV $260
line 886
;886:	}
LABELV $255
line 894
;887:
;888:#ifdef MISSIONPACK
;889:	if( g_gametype.integer == GT_HARVESTER ) {
;890:		RegisterItem( BG_FindItem( "Red Cube" ) );
;891:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;892:	}
;893:#endif
;894:}
LABELV $251
endproc ClearRegisteredItems 40 12
export RegisterItem
proc RegisterItem 0 4
line 903
;895:
;896:/*
;897:===============
;898:RegisterItem
;899:
;900:The item will be added to the precache list
;901:===============
;902:*/
;903:void RegisterItem( gitem_t *item ) {
line 904
;904:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 905
;905:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $266
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 906
;906:	}
LABELV $264
line 907
;907:	itemRegistered[ item - bg_itemlist ] = qtrue;
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
line 908
;908:}
LABELV $263
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 919
;909:
;910:
;911:/*
;912:===============
;913:SaveRegisteredItems
;914:
;915:Write the needed items to a config string
;916:so the client will know which ones to precache
;917:===============
;918:*/
;919:void SaveRegisteredItems( void ) {
line 924
;920:	char	string[MAX_ITEMS+1];
;921:	int		i;
;922:	int		count;
;923:
;924:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 925
;925:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $268
line 926
;926:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $272
line 927
;927:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 928
;928:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 929
;929:		} else {
ADDRGP4 $273
JUMPV
LABELV $272
line 930
;930:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 931
;931:		}
LABELV $273
line 932
;932:	}
LABELV $269
line 925
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $271
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $268
line 933
;933:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 935
;934:
;935:	G_Printf( "%i items registered\n", count );
ADDRGP4 $274
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 936
;936:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 937
;937:}
LABELV $267
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 944
;938:
;939:/*
;940:============
;941:G_ItemDisabled
;942:============
;943:*/
;944:int G_ItemDisabled( gitem_t *item ) {
line 948
;945:
;946:	char name[128];
;947:
;948:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $276
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 949
;949:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $275
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 962
;950:}
;951:
;952:/*
;953:============
;954:G_SpawnItem
;955:
;956:Sets the clipping size and plants the object on the floor.
;957:
;958:Items can't be immediately dropped to floor, because they might
;959:be on an entity that hasn't spawned yet.
;960:============
;961:*/
;962:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 965
;963:	
;964:	//Shafe - Trep Instagib
;965:	if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $278
line 966
;966:	{
line 968
;967:	// InstaGib - prevent weapons and ammo from spawning
;968:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
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
EQI4 $283
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $281
LABELV $283
line 969
;969:		return;
ADDRGP4 $277
JUMPV
LABELV $281
line 970
;970:	}
LABELV $278
line 974
;971:	/////////////////////////////////////////////////////////
;972:
;973:	//Shafe - Trep Instagib
;974:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $288
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $284
LABELV $288
line 975
;975:	{
line 977
;976:	// Arsenal - prevent weapons and ammo from spawning
;977:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
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
EQI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $289
LABELV $291
line 978
;978:		return;
ADDRGP4 $277
JUMPV
LABELV $289
line 979
;979:	}
LABELV $284
line 982
;980:	/////////////////////////////////////////////////////////
;981: 
;982:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $292
ARGP4
ADDRGP4 $293
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 983
;983:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $294
ARGP4
ADDRGP4 $293
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 985
;984:
;985:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 986
;986:	if ( G_ItemDisabled(item) )
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
EQI4 $295
line 987
;987:		return;
ADDRGP4 $277
JUMPV
LABELV $295
line 989
;988:
;989:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 992
;990:	// some movers spawn on the second frame, so delay item
;991:	// spawns until the third frame so they can ride trains
;992:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 993
;993:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 995
;994:
;995:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTF4 1056964608
ASGNF4
line 997
;996:
;997:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $298
line 998
;998:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $154
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 999
;999:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $300
ARGP4
ADDRGP4 $293
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1000
;1000:	}
LABELV $298
line 1007
;1001:
;1002:#ifdef MISSIONPACK
;1003:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;1004:		ent->s.generic1 = ent->spawnflags;
;1005:	}
;1006:#endif
;1007:}
LABELV $277
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 76 12
line 1016
;1008:
;1009:
;1010:/*
;1011:================
;1012:G_BounceItem
;1013:
;1014:================
;1015:*/
;1016:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1022
;1017:	vec3_t	velocity;
;1018:	float	dot;
;1019:	int		hitTime;
;1020:
;1021:	// reflect the velocity on the trace plane
;1022:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 1023
;1023:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 1024
;1024:	dot = DotProduct( velocity, trace->plane.normal );
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
line 1025
;1025:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 1028
;1026:
;1027:	// cut the velocity to keep from bouncing forever
;1028:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
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
line 1031
;1029:
;1030:	// check for stop
;1031:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $309
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $309
line 1032
;1032:		trace->endpos[2] += 1.0;	// make sure it is off ground
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
line 1033
;1033:		SnapVector( trace->endpos );
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
line 1034
;1034:		G_SetOrigin( ent, trace->endpos );
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
line 1035
;1035:		ent->s.groundEntityNum = trace->entityNum;
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
line 1036
;1036:		return;
ADDRGP4 $301
JUMPV
LABELV $309
line 1039
;1037:	}
;1038:
;1039:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 1040
;1040:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 1041
;1041:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1042
;1042:}
LABELV $301
endproc G_BounceItem 76 12
export G_RunItem
proc G_RunItem 88 28
line 1051
;1043:
;1044:
;1045:/*
;1046:================
;1047:G_RunItem
;1048:
;1049:================
;1050:*/
;1051:void G_RunItem( gentity_t *ent ) {
line 1058
;1052:	vec3_t		origin;
;1053:	trace_t		tr;
;1054:	int			contents;
;1055:	int			mask;
;1056:
;1057:	// if groundentity has been set to -1, it may have been pushed off an edge
;1058:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $313
line 1059
;1059:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $315
line 1060
;1060:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1061
;1061:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1062
;1062:		}
LABELV $315
line 1063
;1063:	}
LABELV $313
line 1065
;1064:
;1065:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $318
line 1067
;1066:		// check think function
;1067:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1068
;1068:		return;
ADDRGP4 $312
JUMPV
LABELV $318
line 1072
;1069:	}
;1070:
;1071:	// get current position
;1072:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 1075
;1073:
;1074:	// trace a line from the previous position to the current position
;1075:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $321
line 1076
;1076:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ASGNI4
line 1077
;1077:	} else {
ADDRGP4 $322
JUMPV
LABELV $321
line 1078
;1078:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1079
;1079:	}
LABELV $322
line 1080
;1080:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
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
line 1083
;1081:		ent->r.ownerNum, mask );
;1082:
;1083:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1085
;1084:
;1085:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $324
line 1086
;1086:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1087
;1087:	}
LABELV $324
line 1089
;1088:
;1089:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1092
;1090:
;1091:	// check think function
;1092:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1094
;1093:
;1094:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $328
line 1095
;1095:		return;
ADDRGP4 $312
JUMPV
LABELV $328
line 1099
;1096:	}
;1097:
;1098:	// if it is in a nodrop volume, remove it
;1099:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
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
line 1100
;1100:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $331
line 1101
;1101:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $333
line 1102
;1102:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1103
;1103:		} else {
ADDRGP4 $312
JUMPV
LABELV $333
line 1104
;1104:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1105
;1105:		}
line 1106
;1106:		return;
ADDRGP4 $312
JUMPV
LABELV $331
line 1109
;1107:	}
;1108:
;1109:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1110
;1110:}
LABELV $312
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
LABELV $300
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
LABELV $294
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $293
byte 1 48
byte 1 0
align 1
LABELV $292
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $276
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
LABELV $274
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
LABELV $266
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
byte 1 119
byte 1 97
byte 1 118
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
byte 1 119
byte 1 97
byte 1 118
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
