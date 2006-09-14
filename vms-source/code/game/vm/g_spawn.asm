export G_SpawnString
code
proc G_SpawnString 8 8
file "../g_spawn.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 9
;7:	int		i;
;8:
;9:	if ( !level.spawning ) {
ADDRGP4 level+4516
INDIRI4
CNSTI4 0
NEI4 $56
line 10
;10:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 12
;11://		G_Error( "G_SpawnString() called while not spawning" );
;12:	}
LABELV $56
line 14
;13:
;14:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $62
JUMPV
LABELV $59
line 15
;15:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4524
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $64
line 16
;16:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4524+4
ADDP4
INDIRP4
ASGNP4
line 17
;17:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $55
JUMPV
LABELV $64
line 19
;18:		}
;19:	}
LABELV $60
line 14
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $62
ADDRLP4 0
INDIRI4
ADDRGP4 level+4520
INDIRI4
LTI4 $59
line 21
;20:
;21:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 22
;22:	return qfalse;
CNSTI4 0
RETI4
LABELV $55
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 25
;23:}
;24:
;25:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 29
;26:	char		*s;
;27:	qboolean	present;
;28:
;29:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 30
;30:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 31
;31:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $69
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 34
;32:}
;33:
;34:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 38
;35:	char		*s;
;36:	qboolean	present;
;37:
;38:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 39
;39:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 40
;40:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $70
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 43
;41:}
;42:
;43:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 47
;44:	char		*s;
;45:	qboolean	present;
;46:
;47:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 48
;48:	sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 49
;49:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $71
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $75
byte 4 532
byte 4 2
skip 4
address $76
byte 4 92
byte 4 4
skip 4
address $77
byte 4 548
byte 4 2
skip 4
address $78
byte 4 552
byte 4 2
skip 4
address $79
byte 4 536
byte 4 0
skip 4
address $80
byte 4 680
byte 4 1
skip 4
address $81
byte 4 656
byte 4 2
skip 4
address $82
byte 4 660
byte 4 2
skip 4
address $83
byte 4 644
byte 4 2
skip 4
address $84
byte 4 664
byte 4 2
skip 4
address $85
byte 4 812
byte 4 1
skip 4
address $86
byte 4 816
byte 4 1
skip 4
address $87
byte 4 776
byte 4 0
skip 4
address $88
byte 4 748
byte 4 0
skip 4
address $89
byte 4 0
byte 4 9
skip 4
address $90
byte 4 756
byte 4 0
skip 4
address $91
byte 4 116
byte 4 4
skip 4
address $92
byte 4 116
byte 4 5
skip 4
address $93
byte 4 668
byte 4 2
skip 4
address $94
byte 4 672
byte 4 2
skip 4
address $95
byte 4 840
byte 4 1
skip 4
byte 4 0
skip 12
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 178
;50:}
;51:
;52:
;53:
;54://
;55:// fields are needed for spawning from the entity string
;56://
;57:typedef enum {
;58:	F_INT, 
;59:	F_FLOAT,
;60:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;61:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;62:	F_VECTOR,
;63:	F_ANGLEHACK,
;64:	F_ENTITY,			// index on disk, pointer in memory
;65:	F_ITEM,				// index on disk, pointer in memory
;66:	F_CLIENT,			// index on disk, pointer in memory
;67:	F_IGNORE
;68:} fieldtype_t;
;69:
;70:typedef struct
;71:{
;72:	char	*name;
;73:	int		ofs;
;74:	fieldtype_t	type;
;75:	int		flags;
;76:} field_t;
;77:
;78:field_t fields[] = {
;79:	{"classname", FOFS(classname), F_LSTRING},
;80:	{"origin", FOFS(s.origin), F_VECTOR},
;81:	{"model", FOFS(model), F_LSTRING},
;82:	{"model2", FOFS(model2), F_LSTRING},
;83:	{"spawnflags", FOFS(spawnflags), F_INT},
;84:	{"speed", FOFS(speed), F_FLOAT},
;85:	{"target", FOFS(target), F_LSTRING},
;86:	{"targetname", FOFS(targetname), F_LSTRING},
;87:	{"message", FOFS(message), F_LSTRING},
;88:	{"team", FOFS(team), F_LSTRING},
;89:	{"wait", FOFS(wait), F_FLOAT},
;90:	{"random", FOFS(random), F_FLOAT},
;91:	{"count", FOFS(count), F_INT},
;92:	{"health", FOFS(health), F_INT},
;93:	{"light", 0, F_IGNORE},
;94:	{"dmg", FOFS(damage), F_INT},
;95:	{"angles", FOFS(s.angles), F_VECTOR},
;96:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;97:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;98:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;99:	{"distance", FOFS(distance), F_FLOAT},	
;100:
;101:	{NULL}
;102:};
;103:
;104:
;105:typedef struct {
;106:	char	*name;
;107:	void	(*spawn)(gentity_t *ent);
;108:} spawn_t;
;109:
;110:void SP_info_player_start (gentity_t *ent);
;111:void SP_info_player_deathmatch (gentity_t *ent);
;112:void SP_info_player_intermission (gentity_t *ent);
;113:void SP_info_firstplace(gentity_t *ent);
;114:void SP_info_secondplace(gentity_t *ent);
;115:void SP_info_thirdplace(gentity_t *ent);
;116:void SP_info_podium(gentity_t *ent);
;117:
;118:void SP_func_plat (gentity_t *ent);
;119:void SP_func_static (gentity_t *ent);
;120:void SP_func_rotating (gentity_t *ent);
;121:void SP_func_bobbing (gentity_t *ent);
;122:void SP_func_pendulum( gentity_t *ent );
;123:void SP_func_button (gentity_t *ent);
;124:void SP_func_door (gentity_t *ent);
;125:void SP_func_train (gentity_t *ent);
;126:void SP_func_timer (gentity_t *self);
;127:void SP_func_breakable (gentity_t *ent);
;128:
;129:void SP_trigger_always (gentity_t *ent);
;130:void SP_trigger_multiple (gentity_t *ent);
;131:void SP_trigger_push (gentity_t *ent);
;132:void SP_trigger_teleport (gentity_t *ent);
;133:void SP_trigger_hurt (gentity_t *ent);
;134:
;135:void SP_target_remove_powerups( gentity_t *ent );
;136:void SP_target_give (gentity_t *ent);
;137:void SP_target_delay (gentity_t *ent);
;138:void SP_target_speaker (gentity_t *ent);
;139:void SP_target_print (gentity_t *ent);
;140:void SP_target_laser (gentity_t *self);
;141:void SP_target_character (gentity_t *ent);
;142:void SP_target_score( gentity_t *ent );
;143:void SP_target_teleporter( gentity_t *ent );
;144:void SP_target_relay (gentity_t *ent);
;145:void SP_target_kill (gentity_t *ent);
;146:void SP_target_position (gentity_t *ent);
;147:void SP_target_location (gentity_t *ent);
;148:void SP_target_push (gentity_t *ent);
;149:
;150:void SP_light (gentity_t *self);
;151:void SP_info_null (gentity_t *self);
;152:void SP_info_notnull (gentity_t *self);
;153:void SP_info_camp (gentity_t *self);
;154:void SP_path_corner (gentity_t *self);
;155:
;156:void SP_misc_teleporter_dest (gentity_t *self);
;157:void SP_misc_model(gentity_t *ent);
;158:void SP_misc_portal_camera(gentity_t *ent);
;159:void SP_misc_portal_surface(gentity_t *ent);
;160:
;161:void SP_shooter_rocket( gentity_t *ent );
;162:void SP_shooter_plasma( gentity_t *ent );
;163:void SP_shooter_grenade( gentity_t *ent );
;164:
;165:void SP_team_CTF_redplayer( gentity_t *ent );
;166:void SP_team_CTF_blueplayer( gentity_t *ent );
;167:
;168:void SP_team_CTF_redspawn( gentity_t *ent );
;169:void SP_team_CTF_bluespawn( gentity_t *ent );
;170:
;171:void SP_func_door_rotating( gentity_t *ent );	
;172:
;173:#ifdef MISSIONPACK
;174:void SP_team_blueobelisk( gentity_t *ent );
;175:void SP_team_redobelisk( gentity_t *ent );
;176:void SP_team_neutralobelisk( gentity_t *ent );
;177:#endif
;178:void SP_item_botroam( gentity_t *ent ) {};
LABELV $97
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $98
address SP_info_player_start
address $99
address SP_info_player_deathmatch
address $100
address SP_info_player_intermission
address $101
address SP_info_null
address $102
address SP_info_notnull
address $103
address SP_info_camp
address $104
address SP_func_plat
address $105
address SP_func_button
address $106
address SP_func_door
address $107
address SP_func_static
address $108
address SP_func_rotating
address $109
address SP_func_bobbing
address $110
address SP_func_pendulum
address $111
address SP_func_train
address $112
address SP_info_null
address $113
address SP_func_timer
address $114
address SP_func_breakable
address $115
address SP_trigger_always
address $116
address SP_trigger_multiple
address $117
address SP_trigger_push
address $118
address SP_trigger_teleport
address $119
address SP_trigger_hurt
address $120
address SP_target_give
address $121
address SP_target_remove_powerups
address $122
address SP_target_delay
address $123
address SP_target_speaker
address $124
address SP_target_print
address $125
address SP_target_laser
address $126
address SP_target_score
address $127
address SP_target_teleporter
address $128
address SP_target_relay
address $129
address SP_target_kill
address $130
address SP_target_position
address $131
address SP_target_location
address $132
address SP_target_push
address $89
address SP_light
address $133
address SP_path_corner
address $134
address SP_misc_teleporter_dest
address $135
address SP_misc_model
address $136
address SP_misc_portal_surface
address $137
address SP_misc_portal_camera
address $138
address SP_shooter_rocket
address $139
address SP_shooter_grenade
address $140
address SP_shooter_plasma
address $141
address SP_team_CTF_redplayer
address $142
address SP_team_CTF_blueplayer
address $143
address SP_team_CTF_redspawn
address $144
address SP_team_CTF_bluespawn
address $145
address SP_func_door_rotating
address $146
address SP_item_botroam
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 12 8
line 266
;179:
;180:spawn_t	spawns[] = {
;181:	// info entities don't do anything at all, but provide positional
;182:	// information for things controlled by other processes
;183:	{"info_player_start", SP_info_player_start},
;184:	{"info_player_deathmatch", SP_info_player_deathmatch},
;185:	{"info_player_intermission", SP_info_player_intermission},
;186:	{"info_null", SP_info_null},
;187:	{"info_notnull", SP_info_notnull},		// use target_position instead
;188:	{"info_camp", SP_info_camp},
;189:
;190:	{"func_plat", SP_func_plat},
;191:	{"func_button", SP_func_button},
;192:	{"func_door", SP_func_door},
;193:	{"func_static", SP_func_static},
;194:	{"func_rotating", SP_func_rotating},
;195:	{"func_bobbing", SP_func_bobbing},
;196:	{"func_pendulum", SP_func_pendulum},
;197:	{"func_train", SP_func_train},
;198:	{"func_group", SP_info_null},
;199:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;200:	{"func_breakable", SP_func_breakable},		// Shafe - Trep - Breakables
;201:
;202:	// Triggers are brush objects that cause an effect when contacted
;203:	// by a living player, usually involving firing targets.
;204:	// While almost everything could be done with
;205:	// a single trigger class and different targets, triggered effects
;206:	// could not be client side predicted (push and teleport).
;207:	{"trigger_always", SP_trigger_always},
;208:	{"trigger_multiple", SP_trigger_multiple},
;209:	{"trigger_push", SP_trigger_push},
;210:	{"trigger_teleport", SP_trigger_teleport},
;211:	{"trigger_hurt", SP_trigger_hurt},
;212:
;213:	// targets perform no action by themselves, but must be triggered
;214:	// by another entity
;215:	{"target_give", SP_target_give},
;216:	{"target_remove_powerups", SP_target_remove_powerups},
;217:	{"target_delay", SP_target_delay},
;218:	{"target_speaker", SP_target_speaker},
;219:	{"target_print", SP_target_print},
;220:	{"target_laser", SP_target_laser},
;221:	{"target_score", SP_target_score},
;222:	{"target_teleporter", SP_target_teleporter},
;223:	{"target_relay", SP_target_relay},
;224:	{"target_kill", SP_target_kill},
;225:	{"target_position", SP_target_position},
;226:	{"target_location", SP_target_location},
;227:	{"target_push", SP_target_push},
;228:
;229:	{"light", SP_light},
;230:	{"path_corner", SP_path_corner},
;231:
;232:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;233:	{"misc_model", SP_misc_model},
;234:	{"misc_portal_surface", SP_misc_portal_surface},
;235:	{"misc_portal_camera", SP_misc_portal_camera},
;236:
;237:	{"shooter_rocket", SP_shooter_rocket},
;238:	{"shooter_grenade", SP_shooter_grenade},
;239:	{"shooter_plasma", SP_shooter_plasma},
;240:
;241:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;242:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;243:
;244:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;245:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;246:	{"func_door_rotating", SP_func_door_rotating}, // Actually Calls it when found in map
;247:
;248:#ifdef MISSIONPACK
;249:	{"team_redobelisk", SP_team_redobelisk},
;250:	{"team_blueobelisk", SP_team_blueobelisk},
;251:	{"team_neutralobelisk", SP_team_neutralobelisk},
;252:#endif
;253:	{"item_botroam", SP_item_botroam},
;254:
;255:	{0, 0}
;256:};
;257:
;258:/*
;259:===============
;260:G_CallSpawn
;261:
;262:Finds the spawn function for the entity and calls it,
;263:returning qfalse if not found
;264:===============
;265:*/
;266:qboolean G_CallSpawn( gentity_t *ent ) {
line 270
;267:	spawn_t	*s;
;268:	gitem_t	*item;
;269:
;270:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
line 271
;271:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $150
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 272
;272:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 276
;273:	}
;274:
;275:	// check item spawn functions
;276:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $154
JUMPV
LABELV $151
line 277
;277:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $156
line 278
;278:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 279
;279:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $156
line 281
;280:		}
;281:	}
LABELV $152
line 276
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $154
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 284
;282:
;283:	// check normal spawn functions
;284:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $161
JUMPV
LABELV $158
line 285
;285:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $162
line 287
;286:			// found it
;287:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 288
;288:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $162
line 290
;289:		}
;290:	}
LABELV $159
line 284
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $161
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 291
;291:	G_Printf ("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $164
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
line 292
;292:	return qfalse;
CNSTI4 0
RETI4
LABELV $147
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 303
;293:}
;294:
;295:/*
;296:=============
;297:G_NewString
;298:
;299:Builds a copy of the string, translating \n to real linefeeds
;300:so message texts can be multi-line
;301:=============
;302:*/
;303:char *G_NewString( const char *string ) {
line 307
;304:	char	*newb, *new_p;
;305:	int		i,l;
;306:	
;307:	l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 309
;308:
;309:	newb = G_Alloc( l );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 311
;310:
;311:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 314
;312:
;313:	// turn \n into a real linefeed
;314:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 315
;315:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $170
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $170
line 316
;316:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 317
;317:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $172
line 318
;318:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 319
;319:			} else {
ADDRGP4 $171
JUMPV
LABELV $172
line 320
;320:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 321
;321:			}
line 322
;322:		} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 323
;323:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 324
;324:		}
LABELV $171
line 325
;325:	}
LABELV $167
line 314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $166
line 327
;326:	
;327:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $165
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 341
;328:}
;329:
;330:
;331:
;332:
;333:/*
;334:===============
;335:G_ParseField
;336:
;337:Takes a key/value pair and sets the binary values
;338:in a gentity
;339:===============
;340:*/
;341:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 347
;342:	field_t	*f;
;343:	byte	*b;
;344:	float	v;
;345:	vec3_t	vec;
;346:
;347:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $175
line 348
;348:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $179
line 350
;349:			// found it
;350:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 352
;351:
;352:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $174
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $174
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $194
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $194
address $190
address $191
address $184
address $174
address $185
address $192
address $174
address $174
address $174
address $174
code
LABELV $184
line 354
;353:			case F_LSTRING:
;354:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 355
;355:				break;
ADDRGP4 $174
JUMPV
LABELV $185
line 357
;356:			case F_VECTOR:
;357:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 358
;358:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 359
;359:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 360
;360:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 361
;361:				break;
ADDRGP4 $174
JUMPV
LABELV $190
line 363
;362:			case F_INT:
;363:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 364
;364:				break;
ADDRGP4 $174
JUMPV
LABELV $191
line 366
;365:			case F_FLOAT:
;366:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 367
;367:				break;
ADDRGP4 $174
JUMPV
LABELV $192
line 369
;368:			case F_ANGLEHACK:
;369:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 370
;370:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 371
;371:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 372
;372:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 373
;373:				break;
line 376
;374:			default:
;375:			case F_IGNORE:
;376:				break;
line 378
;377:			}
;378:			return;
ADDRGP4 $174
JUMPV
LABELV $179
line 380
;379:		}
;380:	}
LABELV $176
line 347
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $178
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 381
;381:}
LABELV $174
endproc G_ParseField 60 20
data
align 4
LABELV $196
address $197
address $198
address $199
address $84
address $200
address $201
address $202
address $203
address $204
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 40 12
line 394
;382:
;383:
;384:
;385:
;386:/*
;387:===================
;388:G_SpawnGEntityFromSpawnVars
;389:
;390:Spawn an entity and fill in all of the level fields from
;391:level.spawnVars[], then call the class specfic spawn function
;392:===================
;393:*/
;394:void G_SpawnGEntityFromSpawnVars( void ) {
line 401
;395:	int			i;
;396:	gentity_t	*ent;
;397:	char		*s, *value, *gametypeName;
;398:	static char *gametypeNames[] = {"ffa", "tournament", "single", "team", "ctf", "oneflag", "obelisk", "harvester", "teamtournament"};
;399:
;400:	// get the next free entity
;401:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 403
;402:
;403:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 404
;404:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4524
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4524+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 405
;405:	}
LABELV $206
line 403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRGP4 level+4520
INDIRI4
LTI4 $205
line 408
;406:
;407:	// check for "notsingle" flag
;408:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $213
line 409
;409:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $216
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 410
;410:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $218
line 411
;411:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 412
;412:			return;
ADDRGP4 $195
JUMPV
LABELV $218
line 414
;413:		}
;414:	}
LABELV $213
line 416
;415:	// check for "notteam" flag (GT_FFA, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;416:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $220
line 417
;417:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $223
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 418
;418:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $221
line 419
;419:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 420
;420:			return;
ADDRGP4 $195
JUMPV
line 422
;421:		}
;422:	} else {
LABELV $220
line 423
;423:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $226
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 424
;424:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $227
line 425
;425:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 426
;426:			return;
ADDRGP4 $195
JUMPV
LABELV $227
line 428
;427:		}
;428:	}
LABELV $221
line 437
;429:
;430:#ifdef MISSIONPACK
;431:	G_SpawnInt( "notta", "0", &i );
;432:	if ( i ) {
;433:		G_FreeEntity( ent );
;434:		return;
;435:	}
;436:#else
;437:	G_SpawnInt( "notq3a", "0", &i );
ADDRGP4 $229
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 438
;438:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $230
line 439
;439:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 440
;440:		return;
ADDRGP4 $195
JUMPV
LABELV $230
line 444
;441:	}
;442:#endif
;443:
;444:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $234
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $232
line 445
;445:		if( g_gametype.integer >= GT_FFA && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $235
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
GEI4 $235
line 446
;446:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $196
ADDP4
INDIRP4
ASGNP4
line 448
;447:
;448:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 449
;449:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $240
line 450
;450:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 451
;451:				return;
ADDRGP4 $195
JUMPV
LABELV $240
line 453
;452:			}
;453:		}
LABELV $235
line 454
;454:	}
LABELV $232
line 457
;455:
;456:	// move editor origin to pos
;457:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 458
;458:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 461
;459:
;460:	// if we didn't get a classname, don't bother spawning anything
;461:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $242
line 462
;462:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 463
;463:	}
LABELV $242
line 464
;464:}
LABELV $195
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 473
;465:
;466:
;467:
;468:/*
;469:====================
;470:G_AddSpawnVarToken
;471:====================
;472:*/
;473:char *G_AddSpawnVarToken( const char *string ) {
line 477
;474:	int		l;
;475:	char	*dest;
;476:
;477:	l = strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 478
;478:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+5036
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $245
line 479
;479:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_CHARS" );
ADDRGP4 $248
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 480
;480:	}
LABELV $245
line 482
;481:
;482:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+5036
INDIRI4
ADDRGP4 level+5040
ADDP4
ASGNP4
line 483
;483:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 485
;484:
;485:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+5036
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 487
;486:
;487:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $244
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 500
;488:}
;489:
;490:/*
;491:====================
;492:G_ParseSpawnVars
;493:
;494:Parses a brace bounded set of key / value pairs out of the
;495:level's entity strings into level.spawnVars[]
;496:
;497:This does not actually spawn an entity.
;498:====================
;499:*/
;500:qboolean G_ParseSpawnVars( void ) {
line 504
;501:	char		keyname[MAX_TOKEN_CHARS];
;502:	char		com_token[MAX_TOKEN_CHARS];
;503:
;504:	level.numSpawnVars = 0;
ADDRGP4 level+4520
CNSTI4 0
ASGNI4
line 505
;505:	level.numSpawnVarChars = 0;
ADDRGP4 level+5036
CNSTI4 0
ASGNI4
line 508
;506:
;507:	// parse the opening brace
;508:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $255
line 510
;509:		// end of spawn string
;510:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $252
JUMPV
LABELV $255
line 512
;511:	}
;512:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $261
line 513
;513:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $259
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 514
;514:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 517
;515:
;516:	// go through all the key / value pairs
;517:	while ( 1 ) {	
line 519
;518:		// parse key
;519:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $263
line 520
;520:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $265
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 521
;521:		}
LABELV $263
line 523
;522:
;523:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $266
line 524
;524:			break;
ADDRGP4 $262
JUMPV
LABELV $266
line 528
;525:		}
;526:		
;527:		// parse value	
;528:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $268
line 529
;529:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $265
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 530
;530:		}
LABELV $268
line 532
;531:
;532:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $270
line 533
;533:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $272
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 534
;534:		}
LABELV $270
line 535
;535:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+4520
INDIRI4
CNSTI4 64
NEI4 $273
line 536
;536:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $276
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 537
;537:		}
LABELV $273
line 538
;538:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4520
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4524
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 539
;539:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4520
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4524+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 540
;540:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+4520
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 541
;541:	}
LABELV $261
line 517
ADDRGP4 $260
JUMPV
LABELV $262
line 543
;542:
;543:	return qtrue;
CNSTI4 1
RETI4
LABELV $252
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 12
line 555
;544:}
;545:
;546:
;547:
;548:/*QUAKED worldspawn (0 0 0) ?
;549:
;550:Every map should have exactly one worldspawn.
;551:"music"		music wav file
;552:"gravity"	800 is default gravity
;553:"message"	Text to print during connection process
;554:*/
;555:void SP_worldspawn( void ) {
line 558
;556:	char	*s;
;557:
;558:	G_SpawnString( "classname", "", &s );
ADDRGP4 $75
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 559
;559:	if ( Q_stricmp( s, "worldspawn" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $285
line 560
;560:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $288
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 561
;561:	}
LABELV $285
line 564
;562:
;563:	// make some data visible to connecting client
;564:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $289
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 566
;565:
;566:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $290
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 568
;567:
;568:	G_SpawnString( "music", "", &s );
ADDRGP4 $292
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 569
;569:	trap_SetConfigstring( CS_MUSIC, s );
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 571
;570:
;571:	G_SpawnString( "message", "", &s );
ADDRGP4 $83
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 572
;572:	trap_SetConfigstring( CS_MESSAGE, s );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 574
;573:
;574:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 576
;575:
;576:	G_SpawnString( "gravity", "800", &s );
ADDRGP4 $294
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 577
;577:	trap_Cvar_Set( "g_gravity", s );
ADDRGP4 $296
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 579
;578:
;579:	G_SpawnString( "enableDust", "0", &s );
ADDRGP4 $297
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 580
;580:	trap_Cvar_Set( "g_enableDust", s );
ADDRGP4 $298
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 582
;581:
;582:	G_SpawnString( "enableBreath", "0", &s );
ADDRGP4 $299
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 583
;583:	trap_Cvar_Set( "g_enableBreath", s );
ADDRGP4 $300
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 585
;584:
;585:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+891184
CNSTI4 1022
ASGNI4
line 586
;586:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+891184+532
ADDRGP4 $287
ASGNP4
line 589
;587:
;588:	// see if we want a warmup time
;589:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $284
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 590
;590:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $304
line 591
;591:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $307
ARGP4
ADDRGP4 $217
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 592
;592:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 593
;593:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 596
;594:		//level.lastClient = -1;
;595:
;596:	} else if ( g_doWarmup.integer ) { // Turn it on
ADDRGP4 $305
JUMPV
LABELV $304
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $310
line 597
;597:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 598
;598:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 599
;599:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $290
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 601
;600:
;601:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $316
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 602
;602:	}
LABELV $310
LABELV $305
line 605
;603:	//level.firstStrike = qfalse;
;604:
;605:}
LABELV $283
endproc SP_worldspawn 16 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 615
;606:
;607:
;608:/*
;609:==============
;610:G_SpawnEntitiesFromString
;611:
;612:Parses textual entity definitions out of an entstring and spawns gentities.
;613:==============
;614:*/
;615:void G_SpawnEntitiesFromString( void ) {
line 617
;616:	// allow calls to G_Spawn*()
;617:	level.spawning = qtrue;
ADDRGP4 level+4516
CNSTI4 1
ASGNI4
line 618
;618:	level.numSpawnVars = 0;
ADDRGP4 level+4520
CNSTI4 0
ASGNI4
line 623
;619:
;620:	// the worldspawn is not an actual entity, but it still
;621:	// has a "spawn" function to perform any global setup
;622:	// needed by a level (setting configstrings or cvars, etc)
;623:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $320
line 624
;624:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $322
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 625
;625:	}
LABELV $320
line 626
;626:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $324
JUMPV
LABELV $323
line 629
;627:
;628:	// parse ents
;629:	while( G_ParseSpawnVars() ) {
line 630
;630:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 631
;631:	}	
LABELV $324
line 629
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $323
line 633
;632:
;633:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+4516
CNSTI4 0
ASGNI4
line 634
;634:}
LABELV $317
endproc G_SpawnEntitiesFromString 8 4
import SP_func_door_rotating
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_breakable
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
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
LABELV $322
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $316
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $300
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $299
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $298
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $297
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $296
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $295
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $294
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $292
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $290
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $289
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $288
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $287
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $284
byte 1 0
align 1
LABELV $276
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $272
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $265
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $259
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $248
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $234
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $229
byte 1 110
byte 1 111
byte 1 116
byte 1 113
byte 1 51
byte 1 97
byte 1 0
align 1
LABELV $226
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $223
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $217
byte 1 48
byte 1 0
align 1
LABELV $216
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $203
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $202
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $201
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $199
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $198
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $197
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $164
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $150
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $146
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $145
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $144
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $143
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $142
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $141
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $137
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $133
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $131
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $127
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $124
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $122
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $121
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $115
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $112
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $111
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $110
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $109
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $108
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $107
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $106
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $105
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $104
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $102
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $99
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $98
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $94
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $90
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $89
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $86
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $85
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $84
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $82
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $79
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $76
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $72
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
