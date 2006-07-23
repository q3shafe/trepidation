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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $60
line 42
;42:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 768
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
CNSTI4 828
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 828
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
CNSTI4 828
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
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $96
line 211
;211:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 768
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
CNSTI4 828
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
CNSTI4 828
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
CNSTI4 768
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
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 235
;235:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 768
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
CNSTI4 828
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
CNSTI4 536
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 828
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
CNSTI4 828
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
CNSTI4 516
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
CNSTI4 828
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
CNSTI4 828
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 828
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
LABELV $115
line 284
;282:
;283:	// team deathmatch has slow weapon respawns
;284:	if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $117
line 285
;285:		return g_weaponTeamRespawn.integer;
ADDRGP4 g_weaponTeamRespawn+12
INDIRI4
RETI4
ADDRGP4 $98
JUMPV
LABELV $117
line 288
;286:	}
;287:
;288:	return g_weaponRespawn.integer;
ADDRGP4 g_weaponRespawn+12
INDIRI4
RETI4
LABELV $98
endproc Pickup_Weapon 12 12
export Pickup_Health
proc Pickup_Health 24 0
line 294
;289:}
;290:
;291:
;292://======================================================================
;293:
;294:int Pickup_Health (gentity_t *ent, gentity_t *other) {
line 306
;295:	int			max;
;296:	int			quantity;
;297:	int			respawnTime;
;298:
;299:	// small and mega healths will go over the max
;300:#ifdef MISSIONPACK
;301:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;302:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;303:	}
;304:	else
;305:#endif
;306:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $123
ADDRLP4 12
INDIRI4
CNSTI4 100
EQI4 $123
line 307
;307:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 308
;308:	} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 309
;309:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 310
;310:	}
LABELV $124
line 312
;311:
;312:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $125
line 313
;313:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ASGNI4
line 314
;314:	} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 315
;315:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 316
;316:	}
LABELV $126
line 318
;317:
;318:	other->health += quantity;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 740
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
line 320
;319:
;320:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $127
line 321
;321:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 322
;322:	}
LABELV $127
line 323
;323:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 326
;324:		
;325:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;326:	if (level.StopItemRespawn) 
ADDRGP4 level+9224
INDIRI4
CNSTI4 0
EQI4 $129
line 327
;327:	{ 
line 329
;328:			// If it's down to 2 players make it a really long time
;329:			respawnTime = RESPAWN_HEALTH * 60.0;  
ADDRLP4 8
CNSTI4 2100
ASGNI4
line 330
;330:			return	respawnTime;
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $122
JUMPV
LABELV $129
line 335
;331:	}
;332:	
;333:
;334:
;335:	if ( ent->item->quantity == 100 ) {		// mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $132
line 336
;336:		return RESPAWN_MEGAHEALTH;
CNSTI4 35
RETI4
ADDRGP4 $122
JUMPV
LABELV $132
line 339
;337:	}
;338:
;339:	return RESPAWN_HEALTH;
CNSTI4 35
RETI4
LABELV $122
endproc Pickup_Health 24 0
export Pickup_Armor
proc Pickup_Armor 16 0
line 344
;340:}
;341:
;342://======================================================================
;343:
;344:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 363
;345:	int		respawnTime;
;346:#ifdef MISSIONPACK
;347:	int		upperBound;
;348:	
;349:
;350:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;351:
;352:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;353:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;354:	}
;355:	else {
;356:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;357:	}
;358:
;359:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;360:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;361:	}
;362:#else
;363:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 364
;364:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 516
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
LEI4 $135
line 365
;365:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 516
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
line 366
;366:	}
LABELV $135
line 372
;367:
;368:#endif
;369:
;370:
;371:	// Arsenal - In arsenal things respawn really slowly when it's down to 2 people
;372:	if (level.StopItemRespawn) 
ADDRGP4 level+9224
INDIRI4
CNSTI4 0
EQI4 $137
line 373
;373:	{ 
line 375
;374:			// If it's down to 2 players make it a really long time
;375:			respawnTime = RESPAWN_ARMOR * 60.0;  
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 376
;376:			return	respawnTime;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $134
JUMPV
LABELV $137
line 379
;377:	}
;378:
;379:	return RESPAWN_ARMOR;
CNSTI4 25
RETI4
LABELV $134
endproc Pickup_Armor 16 0
export RespawnItem
proc RespawnItem 24 12
line 389
;380:}
;381:
;382://======================================================================
;383:
;384:/*
;385:===============
;386:RespawnItem
;387:===============
;388:*/
;389:void RespawnItem( gentity_t *ent ) {
line 391
;390:	// randomly select from teamed entities
;391:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 396
;392:		gentity_t	*master;
;393:		int	count;
;394:		int choice;
;395:
;396:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 397
;397:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $145
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 398
;398:		}
LABELV $143
line 399
;399:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
ASGNP4
line 401
;400:
;401:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
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
line 402
;402:			;
LABELV $147
line 401
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 784
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
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 404
;403:
;404:		choice = rand() % count;
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
line 406
;405:
;406:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $153
JUMPV
LABELV $150
line 407
;407:			;
LABELV $151
line 406
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $153
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $150
line 408
;408:	}
LABELV $141
line 410
;409:
;410:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 411
;411:	ent->s.eFlags &= ~EF_NODRAW;
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
line 412
;412:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 413
;413:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 415
;414:
;415:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $154
line 420
;416:		// play powerup spawn sound to all clients
;417:		gentity_t	*te;
;418:
;419:		// if the powerup respawn sound should Not be global
;420:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $156
line 421
;421:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 422
;422:		}
ADDRGP4 $157
JUMPV
LABELV $156
line 423
;423:		else {
line 424
;424:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
LABELV $157
line 426
;426:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $158
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
line 427
;427:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 424
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
line 428
;428:	}
LABELV $154
line 430
;429:
;430:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $159
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $159
line 435
;431:		// play powerup spawn sound to all clients
;432:		gentity_t	*te;
;433:
;434:		// if the powerup respawn sound should Not be global
;435:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $161
line 436
;436:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 437
;437:		}
ADDRGP4 $162
JUMPV
LABELV $161
line 438
;438:		else {
line 439
;439:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
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
LABELV $162
line 441
;441:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
ADDRGP4 $163
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
line 442
;442:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 424
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
line 443
;443:	}
LABELV $159
line 446
;444:
;445:	// play the normal respawn sound only to nearby clients
;446:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
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
line 448
;447:
;448:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 449
;449:}
LABELV $140
endproc RespawnItem 24 12
export Touch_Item
proc Touch_Item 48 12
line 457
;450:
;451:
;452:/*
;453:===============
;454:Touch_Item
;455:===============
;456:*/
;457:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 461
;458:	int			respawn;
;459:	qboolean	predict;
;460:
;461:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $165
line 462
;462:		return;
ADDRGP4 $164
JUMPV
LABELV $165
line 463
;463:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 1
GEI4 $167
line 464
;464:		return;		// dead people can't pickup
ADDRGP4 $164
JUMPV
LABELV $167
line 470
;465:
;466:	
;467:	// the same pickup rules are used for client side and server side
;468:	
;469:	// Shafe - Trep this is a cheap hack to allow pickups of dropped weapons
;470:	if ((ent->flags & FL_DROPPED_ITEM) && (ent->item->giType == IT_WEAPON)) // It's a dropped Item.. Let them have it -- Shafe - Trep
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $169
ADDRLP4 8
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $169
line 471
;471:	{
line 474
;472:		// Let not do anything for now - change later
;473:	
;474:	} else {
ADDRGP4 $170
JUMPV
LABELV $169
line 476
;475:
;476:		if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
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
NEI4 $171
line 477
;477:			return;
ADDRGP4 $164
JUMPV
LABELV $171
line 479
;478:		}
;479:	}
LABELV $170
line 481
;480:
;481:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $174
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 483
;482:
;483:	predict = other->client->pers.predictItemPickup;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 486
;484:
;485:	// call the item-specific pickup function
;486:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $164
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $164
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $185-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $185
address $178
address $179
address $180
address $181
address $182
address $184
address $164
address $183
code
LABELV $178
line 490
;487:	case IT_WEAPON:
;488:	
;489:		
;490:		respawn = Pickup_Weapon(ent, other);
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
line 492
;491://		predict = qfalse;
;492:		break;
ADDRGP4 $176
JUMPV
LABELV $179
line 494
;493:	case IT_AMMO:
;494:		respawn = Pickup_Ammo(ent, other);
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
line 496
;495://		predict = qfalse;
;496:		break;
ADDRGP4 $176
JUMPV
LABELV $180
line 498
;497:	case IT_ARMOR:
;498:		respawn = Pickup_Armor(ent, other);
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
line 499
;499:		break;
ADDRGP4 $176
JUMPV
LABELV $181
line 501
;500:	case IT_HEALTH:
;501:		respawn = Pickup_Health(ent, other);
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
line 502
;502:		break;
ADDRGP4 $176
JUMPV
LABELV $182
line 504
;503:	case IT_POWERUP:
;504:		respawn = Pickup_Powerup(ent, other);
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
line 505
;505:		predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 506
;506:		break;
ADDRGP4 $176
JUMPV
LABELV $183
line 513
;507:#ifdef MISSIONPACK
;508:	case IT_PERSISTANT_POWERUP:
;509:		respawn = Pickup_PersistantPowerup(ent, other);
;510:		break;
;511:#endif
;512:	case IT_TEAM:
;513:		respawn = Pickup_Team(ent, other);
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
line 514
;514:		break;
ADDRGP4 $176
JUMPV
LABELV $184
line 516
;515:	case IT_HOLDABLE:
;516:		respawn = Pickup_Holdable(ent, other);
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
line 517
;517:		break;
line 519
;518:	default:
;519:		return;
LABELV $176
line 522
;520:	}
;521:
;522:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $187
line 523
;523:		return;
ADDRGP4 $164
JUMPV
LABELV $187
line 527
;524:	}
;525:
;526:	// play the normal pickup sound
;527:	if (predict) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $189
line 528
;528:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 529
;529:	} else {
ADDRGP4 $190
JUMPV
LABELV $189
line 530
;530:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
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
line 531
;531:	}
LABELV $190
line 534
;532:
;533:	// powerup pickups are global broadcasts
;534:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $193
ADDRLP4 20
INDIRI4
CNSTI4 8
NEI4 $191
LABELV $193
line 536
;535:		// if we want the global sound to play
;536:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $194
line 539
;537:			gentity_t	*te;
;538:
;539:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 540
;540:			te->s.eventParm = ent->s.modelindex;
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
;541:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
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
line 542
;542:		} else {
ADDRGP4 $195
JUMPV
LABELV $194
line 545
;543:			gentity_t	*te;
;544:
;545:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
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
line 546
;546:			te->s.eventParm = ent->s.modelindex;
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
line 548
;547:			// only send this temp entity to a single client
;548:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
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
line 549
;549:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 550
;550:		}
LABELV $195
line 551
;551:	}
LABELV $191
line 554
;552:
;553:	// fire item targets
;554:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 557
;555:
;556:	// wait of -1 will not respawn
;557:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $196
line 558
;558:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 559
;559:		ent->s.eFlags |= EF_NODRAW;
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
line 560
;560:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 561
;561:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 562
;562:		return;
ADDRGP4 $164
JUMPV
LABELV $196
line 566
;563:	}
;564:
;565:	// non zero wait overrides respawn time
;566:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 0
EQF4 $198
line 567
;567:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 568
;568:	}
LABELV $198
line 571
;569:
;570:	// random can be used to vary the respawn time
;571:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 0
EQF4 $200
line 572
;572:		respawn += crandom() * ent->random;
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
CNSTI4 808
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 573
;573:		if ( respawn < 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $202
line 574
;574:			respawn = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 575
;575:		}
LABELV $202
line 576
;576:	}
LABELV $200
line 579
;577:
;578:	// dropped items will not respawn
;579:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $204
line 580
;580:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 581
;581:	}
LABELV $204
line 586
;582:
;583:	// picked up items still stay around, they just don't
;584:	// draw anything.  This allows respawnable items
;585:	// to be placed on movers.
;586:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
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
line 587
;587:	ent->s.eFlags |= EF_NODRAW;
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
line 588
;588:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 594
;589:
;590:	// ZOID
;591:	// A negative respawn times means to never respawn this item (but don't 
;592:	// delete it).  This is used by items that are respawned by third party 
;593:	// events such as ctf flags
;594:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $206
line 595
;595:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 596
;596:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTP4 0
ASGNP4
line 597
;597:	} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 598
;598:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 599
;599:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 600
;600:	}
LABELV $207
line 601
;601:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 602
;602:}
LABELV $164
endproc Touch_Item 48 12
export LaunchItem
proc LaunchItem 12 8
line 614
;603:
;604:
;605://======================================================================
;606:
;607:/*
;608:================
;609:LaunchItem
;610:
;611:Spawns an item and tosses it forward
;612:================
;613:*/
;614:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 617
;615:	gentity_t	*dropped;
;616:
;617:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 619
;618:
;619:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 620
;620:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
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
line 621
;621:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 623
;622:
;623:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 624
;624:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 625
;625:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 626
;626:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 627
;627:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 629
;628:
;629:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 631
;630:
;631:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 632
;632:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 633
;633:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 634
;634:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 636
;635:
;636:	dropped->s.eFlags |= EF_BOUNCE_HALF;
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
line 640
;637:#ifdef MISSIONPACK
;638:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;639:#else
;640:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $211
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $211
line 642
;641:#endif
;642:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 643
;643:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 644
;644:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 645
;645:	} else { // auto-remove after 30 seconds
ADDRGP4 $212
JUMPV
LABELV $211
line 646
;646:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 647
;647:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 648
;648:	}
LABELV $212
line 650
;649:
;650:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 4096
ASGNI4
line 652
;651:
;652:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 654
;653:
;654:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $209
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 40 16
line 664
;655:}
;656:
;657:/*
;658:================
;659:Drop_Item
;660:
;661:Spawns an item and tosses it forward
;662:================
;663:*/
;664:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 668
;665:	vec3_t	velocity;
;666:	vec3_t	angles;
;667:
;668:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 669
;669:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 670
;670:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 672
;671:
;672:	AngleVectors( angles, velocity, NULL, NULL );
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
line 673
;673:	VectorScale( velocity, 150, velocity );
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
line 674
;674:	velocity[2] += 200 + crandom() * 50;
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
line 676
;675://	PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: Drop Item Complete\n", velocity); // Shafe - Debug
;676:	return LaunchItem( item, ent->s.pos.trBase, velocity );
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
LABELV $216
endproc Drop_Item 40 16
export Use_Item
proc Use_Item 0 4
line 687
;677:}
;678:
;679:
;680:/*
;681:================
;682:Use_Item
;683:
;684:Respawn the item
;685:================
;686:*/
;687:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 688
;688:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 689
;689:}
LABELV $223
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 88 28
line 701
;690:
;691://======================================================================
;692:
;693:/*
;694:================
;695:FinishSpawningItem
;696:
;697:Traces down to find where an item should rest, instead of letting them
;698:free fall from their spawn points
;699:================
;700:*/
;701:void FinishSpawningItem( gentity_t *ent ) {
line 705
;702:	trace_t		tr;
;703:	vec3_t		dest;
;704:
;705:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 706
;706:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 708
;707:
;708:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 709
;709:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
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
CNSTI4 828
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
line 710
;710:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 712
;711:
;712:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 713
;713:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 715
;714:	// useing an item causes it to respawn
;715:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 717
;716:
;717:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $225
line 719
;718:		// suspended
;719:		G_SetOrigin( ent, ent->s.origin );
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
line 720
;720:	} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 722
;721:		// drop to floor
;722:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
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
line 723
;723:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
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
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
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
line 724
;724:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $229
line 725
;725:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $232
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 726
;726:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 727
;727:			return;
ADDRGP4 $224
JUMPV
LABELV $229
line 731
;728:		}
;729:
;730:		// allow to ride movers
;731:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 733
;732:
;733:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 734
;734:	}
LABELV $226
line 737
;735:
;736:	// team slaves and targeted items aren't present at start
;737:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $237
ADDRLP4 72
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
LABELV $237
line 738
;738:		ent->s.eFlags |= EF_NODRAW;
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
line 739
;739:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 740
;740:		return;
ADDRGP4 $224
JUMPV
LABELV $235
line 744
;741:	}
;742:
;743:	// powerups don't spawn in for a while
;744:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $238
line 747
;745:		float	respawn;
;746:
;747:		respawn = 45 + crandom() * 15;
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
line 748
;748:		ent->s.eFlags |= EF_NODRAW;
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
line 749
;749:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 750
;750:		ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
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
line 751
;751:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 752
;752:		return;
ADDRGP4 $224
JUMPV
LABELV $238
line 756
;753:	}
;754:
;755:
;756:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 757
;757:}
LABELV $224
endproc FinishSpawningItem 88 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 767
;758:
;759:
;760:qboolean	itemRegistered[MAX_ITEMS];
;761:
;762:/*
;763:==================
;764:G_CheckTeamItems
;765:==================
;766:*/
;767:void G_CheckTeamItems( void ) {
line 770
;768:
;769:	// Set up team stuff
;770:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 772
;771:
;772:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $242
line 776
;773:		gitem_t	*item;
;774:
;775:		// check for the two flags
;776:		item = BG_FindItem( "Red Flag" );
ADDRGP4 $245
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 777
;777:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $248
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
NEI4 $246
LABELV $248
line 778
;778:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
ADDRGP4 $249
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 779
;779:		}
LABELV $246
line 780
;780:		item = BG_FindItem( "Blue Flag" );
ADDRGP4 $250
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 781
;781:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $253
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
NEI4 $251
LABELV $253
line 782
;782:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
ADDRGP4 $254
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 783
;783:		}
LABELV $251
line 784
;784:	}
LABELV $242
line 844
;785:#ifdef MISSIONPACK
;786:	if( g_gametype.integer == GT_1FCTF ) {
;787:		gitem_t	*item;
;788:
;789:		// check for all three flags
;790:		item = BG_FindItem( "Red Flag" );
;791:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;792:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map" );
;793:		}
;794:		item = BG_FindItem( "Blue Flag" );
;795:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;796:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map" );
;797:		}
;798:		item = BG_FindItem( "Neutral Flag" );
;799:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;800:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map" );
;801:		}
;802:	}
;803:
;804:	if( g_gametype.integer == GT_OBELISK ) {
;805:		gentity_t	*ent;
;806:
;807:		// check for the two obelisks
;808:		ent = NULL;
;809:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;810:		if( !ent ) {
;811:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;812:		}
;813:
;814:		ent = NULL;
;815:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;816:		if( !ent ) {
;817:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;818:		}
;819:	}
;820:
;821:	if( g_gametype.integer == GT_HARVESTER ) {
;822:		gentity_t	*ent;
;823:
;824:		// check for all three obelisks
;825:		ent = NULL;
;826:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;827:		if( !ent ) {
;828:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map" );
;829:		}
;830:
;831:		ent = NULL;
;832:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;833:		if( !ent ) {
;834:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map" );
;835:		}
;836:
;837:		ent = NULL;
;838:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;839:		if( !ent ) {
;840:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map" );
;841:		}
;842:	}
;843:#endif
;844:}
LABELV $241
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 40 12
line 851
;845:
;846:/*
;847:==============
;848:ClearRegisteredItems
;849:==============
;850:*/
;851:void ClearRegisteredItems( void ) {
line 852
;852:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 855
;853:
;854:	// players always start with the base weapon
;855:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
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
line 856
;856:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
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
line 858
;857:	// Let's Always Register The Rocket Launcher  - Shafe - Trep 
;858:	RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
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
line 860
;859:	// Shafe - Trep Preregister Lighning and the Grapple For the offhand grapple
;860:	RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
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
line 861
;861:	RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
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
line 865
;862:	
;863:	// Shade - Trep - Register the Grenade Launcher for the PDG's... 
;864:	// If we get a model we wont need to pre-register this
;865:	RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
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
line 868
;866:	
;867:	// Shafe - Trep - Pre-register Railgun For Instagib
;868:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $256
line 869
;869:	{
line 870
;870:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
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
line 871
;871:	} // End Shafe
LABELV $256
line 874
;872:
;873:	// Shafe - Trep - Arsenal and LMS Gets All Weapons Pre-Registered
;874:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $263
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $259
LABELV $263
line 875
;875:	{
line 876
;876:		RegisterItem( BG_FindItemForWeapon( WP_SHOTGUN ) );
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
line 877
;877:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
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
line 878
;878:		RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
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
line 879
;879:		RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
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
line 880
;880:	}
LABELV $259
line 888
;881:
;882:#ifdef MISSIONPACK
;883:	if( g_gametype.integer == GT_HARVESTER ) {
;884:		RegisterItem( BG_FindItem( "Red Cube" ) );
;885:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;886:	}
;887:#endif
;888:}
LABELV $255
endproc ClearRegisteredItems 40 12
export RegisterItem
proc RegisterItem 0 4
line 897
;889:
;890:/*
;891:===============
;892:RegisterItem
;893:
;894:The item will be added to the precache list
;895:===============
;896:*/
;897:void RegisterItem( gitem_t *item ) {
line 898
;898:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $265
line 899
;899:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $267
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 900
;900:	}
LABELV $265
line 901
;901:	itemRegistered[ item - bg_itemlist ] = qtrue;
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
line 902
;902:}
LABELV $264
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 913
;903:
;904:
;905:/*
;906:===============
;907:SaveRegisteredItems
;908:
;909:Write the needed items to a config string
;910:so the client will know which ones to precache
;911:===============
;912:*/
;913:void SaveRegisteredItems( void ) {
line 918
;914:	char	string[MAX_ITEMS+1];
;915:	int		i;
;916:	int		count;
;917:
;918:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 919
;919:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $269
line 920
;920:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $273
line 921
;921:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 922
;922:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 923
;923:		} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 924
;924:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 925
;925:		}
LABELV $274
line 926
;926:	}
LABELV $270
line 919
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $272
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $269
line 927
;927:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 929
;928:
;929:	G_Printf( "%i items registered\n", count );
ADDRGP4 $275
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 930
;930:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 931
;931:}
LABELV $268
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 938
;932:
;933:/*
;934:============
;935:G_ItemDisabled
;936:============
;937:*/
;938:int G_ItemDisabled( gitem_t *item ) {
line 942
;939:
;940:	char name[128];
;941:
;942:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $277
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 943
;943:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $276
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 956
;944:}
;945:
;946:/*
;947:============
;948:G_SpawnItem
;949:
;950:Sets the clipping size and plants the object on the floor.
;951:
;952:Items can't be immediately dropped to floor, because they might
;953:be on an entity that hasn't spawned yet.
;954:============
;955:*/
;956:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 959
;957:	
;958:	//Shafe - Trep Instagib
;959:	if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $279
line 960
;960:	{
line 962
;961:	// InstaGib - prevent weapons and ammo from spawning
;962:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
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
EQI4 $284
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $282
LABELV $284
line 963
;963:		return;
ADDRGP4 $278
JUMPV
LABELV $282
line 964
;964:	}
LABELV $279
line 968
;965:	/////////////////////////////////////////////////////////
;966:
;967:	//Shafe - Trep Instagib
;968:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $289
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $285
LABELV $289
line 969
;969:	{
line 971
;970:	// Arsenal - prevent weapons and ammo from spawning
;971:	if ( item->giType == IT_WEAPON || item->giType == IT_AMMO)
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
EQI4 $292
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $290
LABELV $292
line 972
;972:		return;
ADDRGP4 $278
JUMPV
LABELV $290
line 973
;973:	}
LABELV $285
line 976
;974:	/////////////////////////////////////////////////////////
;975: 
;976:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $293
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 977
;977:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $295
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 979
;978:
;979:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 980
;980:	if ( G_ItemDisabled(item) )
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
EQI4 $296
line 981
;981:		return;
ADDRGP4 $278
JUMPV
LABELV $296
line 983
;982:
;983:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 986
;984:	// some movers spawn on the second frame, so delay item
;985:	// spawns until the third frame so they can ride trains
;986:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 987
;987:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 989
;988:
;989:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 1056964608
ASGNF4
line 991
;990:
;991:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $299
line 992
;992:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $158
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 993
;993:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $301
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 994
;994:	}
LABELV $299
line 1001
;995:
;996:#ifdef MISSIONPACK
;997:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;998:		ent->s.generic1 = ent->spawnflags;
;999:	}
;1000:#endif
;1001:}
LABELV $278
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 76 12
line 1010
;1002:
;1003:
;1004:/*
;1005:================
;1006:G_BounceItem
;1007:
;1008:================
;1009:*/
;1010:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1016
;1011:	vec3_t	velocity;
;1012:	float	dot;
;1013:	int		hitTime;
;1014:
;1015:	// reflect the velocity on the trace plane
;1016:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 1017
;1017:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 1018
;1018:	dot = DotProduct( velocity, trace->plane.normal );
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
line 1019
;1019:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 1022
;1020:
;1021:	// cut the velocity to keep from bouncing forever
;1022:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
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
CNSTI4 568
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
CNSTI4 568
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
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
line 1025
;1023:
;1024:	// check for stop
;1025:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $310
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $310
line 1026
;1026:		trace->endpos[2] += 1.0;	// make sure it is off ground
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
line 1027
;1027:		SnapVector( trace->endpos );
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
line 1028
;1028:		G_SetOrigin( ent, trace->endpos );
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
line 1029
;1029:		ent->s.groundEntityNum = trace->entityNum;
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
line 1030
;1030:		return;
ADDRGP4 $302
JUMPV
LABELV $310
line 1033
;1031:	}
;1032:
;1033:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 488
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
CNSTI4 492
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
CNSTI4 496
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
line 1034
;1034:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1035
;1035:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1036
;1036:}
LABELV $302
endproc G_BounceItem 76 12
export G_RunItem
proc G_RunItem 88 28
line 1045
;1037:
;1038:
;1039:/*
;1040:================
;1041:G_RunItem
;1042:
;1043:================
;1044:*/
;1045:void G_RunItem( gentity_t *ent ) {
line 1052
;1046:	vec3_t		origin;
;1047:	trace_t		tr;
;1048:	int			contents;
;1049:	int			mask;
;1050:
;1051:	// if groundentity has been set to -1, it may have been pushed off an edge
;1052:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $314
line 1053
;1053:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $316
line 1054
;1054:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1055
;1055:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1056
;1056:		}
LABELV $316
line 1057
;1057:	}
LABELV $314
line 1059
;1058:
;1059:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $319
line 1061
;1060:		// check think function
;1061:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1062
;1062:		return;
ADDRGP4 $313
JUMPV
LABELV $319
line 1066
;1063:	}
;1064:
;1065:	// get current position
;1066:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 1069
;1067:
;1068:	// trace a line from the previous position to the current position
;1069:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $322
line 1070
;1070:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1071
;1071:	} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 1072
;1072:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1073
;1073:	}
LABELV $323
line 1074
;1074:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1077
;1075:		ent->r.ownerNum, mask );
;1076:
;1077:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1079
;1078:
;1079:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $325
line 1080
;1080:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1081
;1081:	}
LABELV $325
line 1083
;1082:
;1083:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1086
;1084:
;1085:	// check think function
;1086:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1088
;1087:
;1088:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $329
line 1089
;1089:		return;
ADDRGP4 $313
JUMPV
LABELV $329
line 1093
;1090:	}
;1091:
;1092:	// if it is in a nodrop volume, remove it
;1093:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
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
line 1094
;1094:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $332
line 1095
;1095:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $334
line 1096
;1096:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1097
;1097:		} else {
ADDRGP4 $313
JUMPV
LABELV $334
line 1098
;1098:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1099
;1099:		}
line 1100
;1100:		return;
ADDRGP4 $313
JUMPV
LABELV $332
line 1103
;1101:	}
;1102:
;1103:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1104
;1104:}
LABELV $313
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
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJump
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
LABELV $301
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
LABELV $295
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $294
byte 1 48
byte 1 0
align 1
LABELV $293
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $277
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
LABELV $275
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
LABELV $267
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
LABELV $254
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
LABELV $250
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
LABELV $249
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
LABELV $245
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
LABELV $232
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
LABELV $174
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
LABELV $163
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
LABELV $158
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
LABELV $145
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
