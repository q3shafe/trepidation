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
ADDRGP4 level+4508
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
ADDRGP4 level+4516
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
ADDRGP4 level+4516+4
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
ADDRGP4 level+4512
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
byte 4 524
byte 4 2
skip 4
address $76
byte 4 92
byte 4 4
skip 4
address $77
byte 4 540
byte 4 2
skip 4
address $78
byte 4 544
byte 4 2
skip 4
address $79
byte 4 528
byte 4 0
skip 4
address $80
byte 4 672
byte 4 1
skip 4
address $81
byte 4 648
byte 4 2
skip 4
address $82
byte 4 652
byte 4 2
skip 4
address $83
byte 4 636
byte 4 2
skip 4
address $84
byte 4 656
byte 4 2
skip 4
address $85
byte 4 804
byte 4 1
skip 4
address $86
byte 4 808
byte 4 1
skip 4
address $87
byte 4 768
byte 4 0
skip 4
address $88
byte 4 740
byte 4 0
skip 4
address $89
byte 4 0
byte 4 9
skip 4
address $90
byte 4 748
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
byte 4 660
byte 4 2
skip 4
address $94
byte 4 664
byte 4 2
skip 4
byte 4 0
skip 12
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 174
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
;99:
;100:	{NULL}
;101:};
;102:
;103:
;104:typedef struct {
;105:	char	*name;
;106:	void	(*spawn)(gentity_t *ent);
;107:} spawn_t;
;108:
;109:void SP_info_player_start (gentity_t *ent);
;110:void SP_info_player_deathmatch (gentity_t *ent);
;111:void SP_info_player_intermission (gentity_t *ent);
;112:void SP_info_firstplace(gentity_t *ent);
;113:void SP_info_secondplace(gentity_t *ent);
;114:void SP_info_thirdplace(gentity_t *ent);
;115:void SP_info_podium(gentity_t *ent);
;116:
;117:void SP_func_plat (gentity_t *ent);
;118:void SP_func_static (gentity_t *ent);
;119:void SP_func_rotating (gentity_t *ent);
;120:void SP_func_bobbing (gentity_t *ent);
;121:void SP_func_pendulum( gentity_t *ent );
;122:void SP_func_button (gentity_t *ent);
;123:void SP_func_door (gentity_t *ent);
;124:void SP_func_train (gentity_t *ent);
;125:void SP_func_timer (gentity_t *self);
;126:
;127:void SP_trigger_always (gentity_t *ent);
;128:void SP_trigger_multiple (gentity_t *ent);
;129:void SP_trigger_push (gentity_t *ent);
;130:void SP_trigger_teleport (gentity_t *ent);
;131:void SP_trigger_hurt (gentity_t *ent);
;132:
;133:void SP_target_remove_powerups( gentity_t *ent );
;134:void SP_target_give (gentity_t *ent);
;135:void SP_target_delay (gentity_t *ent);
;136:void SP_target_speaker (gentity_t *ent);
;137:void SP_target_print (gentity_t *ent);
;138:void SP_target_laser (gentity_t *self);
;139:void SP_target_character (gentity_t *ent);
;140:void SP_target_score( gentity_t *ent );
;141:void SP_target_teleporter( gentity_t *ent );
;142:void SP_target_relay (gentity_t *ent);
;143:void SP_target_kill (gentity_t *ent);
;144:void SP_target_position (gentity_t *ent);
;145:void SP_target_location (gentity_t *ent);
;146:void SP_target_push (gentity_t *ent);
;147:
;148:void SP_light (gentity_t *self);
;149:void SP_info_null (gentity_t *self);
;150:void SP_info_notnull (gentity_t *self);
;151:void SP_info_camp (gentity_t *self);
;152:void SP_path_corner (gentity_t *self);
;153:
;154:void SP_misc_teleporter_dest (gentity_t *self);
;155:void SP_misc_model(gentity_t *ent);
;156:void SP_misc_portal_camera(gentity_t *ent);
;157:void SP_misc_portal_surface(gentity_t *ent);
;158:
;159:void SP_shooter_rocket( gentity_t *ent );
;160:void SP_shooter_plasma( gentity_t *ent );
;161:void SP_shooter_grenade( gentity_t *ent );
;162:
;163:void SP_team_CTF_redplayer( gentity_t *ent );
;164:void SP_team_CTF_blueplayer( gentity_t *ent );
;165:
;166:void SP_team_CTF_redspawn( gentity_t *ent );
;167:void SP_team_CTF_bluespawn( gentity_t *ent );
;168:
;169:#ifdef MISSIONPACK
;170:void SP_team_blueobelisk( gentity_t *ent );
;171:void SP_team_redobelisk( gentity_t *ent );
;172:void SP_team_neutralobelisk( gentity_t *ent );
;173:#endif
;174:void SP_item_botroam( gentity_t *ent ) {};
LABELV $96
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $97
address SP_info_player_start
address $98
address SP_info_player_deathmatch
address $99
address SP_info_player_intermission
address $100
address SP_info_null
address $101
address SP_info_notnull
address $102
address SP_info_camp
address $103
address SP_func_plat
address $104
address SP_func_button
address $105
address SP_func_door
address $106
address SP_func_static
address $107
address SP_func_rotating
address $108
address SP_func_bobbing
address $109
address SP_func_pendulum
address $110
address SP_func_train
address $111
address SP_info_null
address $112
address SP_func_timer
address $113
address SP_trigger_always
address $114
address SP_trigger_multiple
address $115
address SP_trigger_push
address $116
address SP_trigger_teleport
address $117
address SP_trigger_hurt
address $118
address SP_target_give
address $119
address SP_target_remove_powerups
address $120
address SP_target_delay
address $121
address SP_target_speaker
address $122
address SP_target_print
address $123
address SP_target_laser
address $124
address SP_target_score
address $125
address SP_target_teleporter
address $126
address SP_target_relay
address $127
address SP_target_kill
address $128
address SP_target_position
address $129
address SP_target_location
address $130
address SP_target_push
address $89
address SP_light
address $131
address SP_path_corner
address $132
address SP_misc_teleporter_dest
address $133
address SP_misc_model
address $134
address SP_misc_portal_surface
address $135
address SP_misc_portal_camera
address $136
address SP_shooter_rocket
address $137
address SP_shooter_grenade
address $138
address SP_shooter_plasma
address $139
address SP_team_CTF_redplayer
address $140
address SP_team_CTF_blueplayer
address $141
address SP_team_CTF_redspawn
address $142
address SP_team_CTF_bluespawn
address $143
address SP_item_botroam
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 12 8
line 261
;175:
;176:spawn_t	spawns[] = {
;177:	// info entities don't do anything at all, but provide positional
;178:	// information for things controlled by other processes
;179:	{"info_player_start", SP_info_player_start},
;180:	{"info_player_deathmatch", SP_info_player_deathmatch},
;181:	{"info_player_intermission", SP_info_player_intermission},
;182:	{"info_null", SP_info_null},
;183:	{"info_notnull", SP_info_notnull},		// use target_position instead
;184:	{"info_camp", SP_info_camp},
;185:
;186:	{"func_plat", SP_func_plat},
;187:	{"func_button", SP_func_button},
;188:	{"func_door", SP_func_door},
;189:	{"func_static", SP_func_static},
;190:	{"func_rotating", SP_func_rotating},
;191:	{"func_bobbing", SP_func_bobbing},
;192:	{"func_pendulum", SP_func_pendulum},
;193:	{"func_train", SP_func_train},
;194:	{"func_group", SP_info_null},
;195:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;196://	{"func_breakable", SP_func_breakable},		// Shafe - Trep - Breakables
;197:
;198:	// Triggers are brush objects that cause an effect when contacted
;199:	// by a living player, usually involving firing targets.
;200:	// While almost everything could be done with
;201:	// a single trigger class and different targets, triggered effects
;202:	// could not be client side predicted (push and teleport).
;203:	{"trigger_always", SP_trigger_always},
;204:	{"trigger_multiple", SP_trigger_multiple},
;205:	{"trigger_push", SP_trigger_push},
;206:	{"trigger_teleport", SP_trigger_teleport},
;207:	{"trigger_hurt", SP_trigger_hurt},
;208:
;209:	// targets perform no action by themselves, but must be triggered
;210:	// by another entity
;211:	{"target_give", SP_target_give},
;212:	{"target_remove_powerups", SP_target_remove_powerups},
;213:	{"target_delay", SP_target_delay},
;214:	{"target_speaker", SP_target_speaker},
;215:	{"target_print", SP_target_print},
;216:	{"target_laser", SP_target_laser},
;217:	{"target_score", SP_target_score},
;218:	{"target_teleporter", SP_target_teleporter},
;219:	{"target_relay", SP_target_relay},
;220:	{"target_kill", SP_target_kill},
;221:	{"target_position", SP_target_position},
;222:	{"target_location", SP_target_location},
;223:	{"target_push", SP_target_push},
;224:
;225:	{"light", SP_light},
;226:	{"path_corner", SP_path_corner},
;227:
;228:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;229:	{"misc_model", SP_misc_model},
;230:	{"misc_portal_surface", SP_misc_portal_surface},
;231:	{"misc_portal_camera", SP_misc_portal_camera},
;232:
;233:	{"shooter_rocket", SP_shooter_rocket},
;234:	{"shooter_grenade", SP_shooter_grenade},
;235:	{"shooter_plasma", SP_shooter_plasma},
;236:
;237:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;238:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;239:
;240:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;241:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;242:
;243:#ifdef MISSIONPACK
;244:	{"team_redobelisk", SP_team_redobelisk},
;245:	{"team_blueobelisk", SP_team_blueobelisk},
;246:	{"team_neutralobelisk", SP_team_neutralobelisk},
;247:#endif
;248:	{"item_botroam", SP_item_botroam},
;249:
;250:	{0, 0}
;251:};
;252:
;253:/*
;254:===============
;255:G_CallSpawn
;256:
;257:Finds the spawn function for the entity and calls it,
;258:returning qfalse if not found
;259:===============
;260:*/
;261:qboolean G_CallSpawn( gentity_t *ent ) {
line 265
;262:	spawn_t	*s;
;263:	gitem_t	*item;
;264:
;265:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $145
line 266
;266:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $147
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 267
;267:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $145
line 271
;268:	}
;269:
;270:	// check item spawn functions
;271:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $151
JUMPV
LABELV $148
line 272
;272:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
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
NEI4 $153
line 273
;273:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 274
;274:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $144
JUMPV
LABELV $153
line 276
;275:		}
;276:	}
LABELV $149
line 271
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $151
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
line 279
;277:
;278:	// check normal spawn functions
;279:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $158
JUMPV
LABELV $155
line 280
;280:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
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
NEI4 $159
line 282
;281:			// found it
;282:			s->spawn(ent);
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
line 283
;283:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $144
JUMPV
LABELV $159
line 285
;284:		}
;285:	}
LABELV $156
line 279
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $158
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $155
line 286
;286:	G_Printf ("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $161
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 287
;287:	return qfalse;
CNSTI4 0
RETI4
LABELV $144
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 298
;288:}
;289:
;290:/*
;291:=============
;292:G_NewString
;293:
;294:Builds a copy of the string, translating \n to real linefeeds
;295:so message texts can be multi-line
;296:=============
;297:*/
;298:char *G_NewString( const char *string ) {
line 302
;299:	char	*newb, *new_p;
;300:	int		i,l;
;301:	
;302:	l = strlen(string) + 1;
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
line 304
;303:
;304:	newb = G_Alloc( l );
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
line 306
;305:
;306:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 309
;307:
;308:	// turn \n into a real linefeed
;309:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $163
line 310
;310:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $167
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $167
line 311
;311:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 312
;312:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $169
line 313
;313:				*new_p++ = '\n';
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
line 314
;314:			} else {
ADDRGP4 $168
JUMPV
LABELV $169
line 315
;315:				*new_p++ = '\\';
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
line 316
;316:			}
line 317
;317:		} else {
ADDRGP4 $168
JUMPV
LABELV $167
line 318
;318:			*new_p++ = string[i];
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
line 319
;319:		}
LABELV $168
line 320
;320:	}
LABELV $164
line 309
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $166
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $163
line 322
;321:	
;322:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $162
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 336
;323:}
;324:
;325:
;326:
;327:
;328:/*
;329:===============
;330:G_ParseField
;331:
;332:Takes a key/value pair and sets the binary values
;333:in a gentity
;334:===============
;335:*/
;336:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 342
;337:	field_t	*f;
;338:	byte	*b;
;339:	float	v;
;340:	vec3_t	vec;
;341:
;342:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $175
JUMPV
LABELV $172
line 343
;343:		if ( !Q_stricmp(f->name, key) ) {
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
NEI4 $176
line 345
;344:			// found it
;345:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 347
;346:
;347:			switch( f->type ) {
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
LTI4 $171
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $171
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $191
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $191
address $187
address $188
address $181
address $171
address $182
address $189
address $171
address $171
address $171
address $171
code
LABELV $181
line 349
;348:			case F_LSTRING:
;349:				*(char **)(b+f->ofs) = G_NewString (value);
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
line 350
;350:				break;
ADDRGP4 $171
JUMPV
LABELV $182
line 352
;351:			case F_VECTOR:
;352:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
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
line 353
;353:				((float *)(b+f->ofs))[0] = vec[0];
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
line 354
;354:				((float *)(b+f->ofs))[1] = vec[1];
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
line 355
;355:				((float *)(b+f->ofs))[2] = vec[2];
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
line 356
;356:				break;
ADDRGP4 $171
JUMPV
LABELV $187
line 358
;357:			case F_INT:
;358:				*(int *)(b+f->ofs) = atoi(value);
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
line 359
;359:				break;
ADDRGP4 $171
JUMPV
LABELV $188
line 361
;360:			case F_FLOAT:
;361:				*(float *)(b+f->ofs) = atof(value);
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
line 362
;362:				break;
ADDRGP4 $171
JUMPV
LABELV $189
line 364
;363:			case F_ANGLEHACK:
;364:				v = atof(value);
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
line 365
;365:				((float *)(b+f->ofs))[0] = 0;
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
line 366
;366:				((float *)(b+f->ofs))[1] = v;
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
line 367
;367:				((float *)(b+f->ofs))[2] = 0;
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
line 368
;368:				break;
line 371
;369:			default:
;370:			case F_IGNORE:
;371:				break;
line 373
;372:			}
;373:			return;
ADDRGP4 $171
JUMPV
LABELV $176
line 375
;374:		}
;375:	}
LABELV $173
line 342
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $175
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 376
;376:}
LABELV $171
endproc G_ParseField 60 20
data
align 4
LABELV $193
address $194
address $195
address $196
address $84
address $197
address $198
address $199
address $200
address $201
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 40 12
line 389
;377:
;378:
;379:
;380:
;381:/*
;382:===================
;383:G_SpawnGEntityFromSpawnVars
;384:
;385:Spawn an entity and fill in all of the level fields from
;386:level.spawnVars[], then call the class specfic spawn function
;387:===================
;388:*/
;389:void G_SpawnGEntityFromSpawnVars( void ) {
line 396
;390:	int			i;
;391:	gentity_t	*ent;
;392:	char		*s, *value, *gametypeName;
;393:	static char *gametypeNames[] = {"ffa", "tournament", "single", "team", "ctf", "oneflag", "obelisk", "harvester", "teamtournament"};
;394:
;395:	// get the next free entity
;396:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 398
;397:
;398:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 399
;399:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4516
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4516+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 400
;400:	}
LABELV $203
line 398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 0
INDIRI4
ADDRGP4 level+4512
INDIRI4
LTI4 $202
line 403
;401:
;402:	// check for "notsingle" flag
;403:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $210
line 404
;404:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $213
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 405
;405:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $215
line 406
;406:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 407
;407:			return;
ADDRGP4 $192
JUMPV
LABELV $215
line 409
;408:		}
;409:	}
LABELV $210
line 411
;410:	// check for "notteam" flag (GT_FFA, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;411:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $217
line 412
;412:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $220
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 413
;413:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $218
line 414
;414:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 415
;415:			return;
ADDRGP4 $192
JUMPV
line 417
;416:		}
;417:	} else {
LABELV $217
line 418
;418:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $223
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 419
;419:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $224
line 420
;420:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 421
;421:			return;
ADDRGP4 $192
JUMPV
LABELV $224
line 423
;422:		}
;423:	}
LABELV $218
line 432
;424:
;425:#ifdef MISSIONPACK
;426:	G_SpawnInt( "notta", "0", &i );
;427:	if ( i ) {
;428:		G_FreeEntity( ent );
;429:		return;
;430:	}
;431:#else
;432:	G_SpawnInt( "notq3a", "0", &i );
ADDRGP4 $226
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 433
;433:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $227
line 434
;434:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 435
;435:		return;
ADDRGP4 $192
JUMPV
LABELV $227
line 439
;436:	}
;437:#endif
;438:
;439:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $231
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
EQI4 $229
line 440
;440:		if( g_gametype.integer >= GT_FFA && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $232
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
GEI4 $232
line 441
;441:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $193
ADDP4
INDIRP4
ASGNP4
line 443
;442:
;443:			s = strstr( value, gametypeName );
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
line 444
;444:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 445
;445:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 446
;446:				return;
ADDRGP4 $192
JUMPV
LABELV $237
line 448
;447:			}
;448:		}
LABELV $232
line 449
;449:	}
LABELV $229
line 452
;450:
;451:	// move editor origin to pos
;452:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
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
line 453
;453:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 456
;454:
;455:	// if we didn't get a classname, don't bother spawning anything
;456:	if ( !G_CallSpawn( ent ) ) {
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
NEI4 $239
line 457
;457:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 458
;458:	}
LABELV $239
line 459
;459:}
LABELV $192
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 468
;460:
;461:
;462:
;463:/*
;464:====================
;465:G_AddSpawnVarToken
;466:====================
;467:*/
;468:char *G_AddSpawnVarToken( const char *string ) {
line 472
;469:	int		l;
;470:	char	*dest;
;471:
;472:	l = strlen( string );
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
line 473
;473:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+5028
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $242
line 474
;474:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_CHARS" );
ADDRGP4 $245
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 475
;475:	}
LABELV $242
line 477
;476:
;477:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+5028
INDIRI4
ADDRGP4 level+5032
ADDP4
ASGNP4
line 478
;478:	memcpy( dest, string, l+1 );
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
line 480
;479:
;480:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+5028
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
line 482
;481:
;482:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $241
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 495
;483:}
;484:
;485:/*
;486:====================
;487:G_ParseSpawnVars
;488:
;489:Parses a brace bounded set of key / value pairs out of the
;490:level's entity strings into level.spawnVars[]
;491:
;492:This does not actually spawn an entity.
;493:====================
;494:*/
;495:qboolean G_ParseSpawnVars( void ) {
line 499
;496:	char		keyname[MAX_TOKEN_CHARS];
;497:	char		com_token[MAX_TOKEN_CHARS];
;498:
;499:	level.numSpawnVars = 0;
ADDRGP4 level+4512
CNSTI4 0
ASGNI4
line 500
;500:	level.numSpawnVarChars = 0;
ADDRGP4 level+5028
CNSTI4 0
ASGNI4
line 503
;501:
;502:	// parse the opening brace
;503:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
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
NEI4 $252
line 505
;504:		// end of spawn string
;505:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $249
JUMPV
LABELV $252
line 507
;506:	}
;507:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $258
line 508
;508:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 509
;509:	}
ADDRGP4 $258
JUMPV
LABELV $257
line 512
;510:
;511:	// go through all the key / value pairs
;512:	while ( 1 ) {	
line 514
;513:		// parse key
;514:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
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
NEI4 $260
line 515
;515:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $262
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 516
;516:		}
LABELV $260
line 518
;517:
;518:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $263
line 519
;519:			break;
ADDRGP4 $259
JUMPV
LABELV $263
line 523
;520:		}
;521:		
;522:		// parse value	
;523:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
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
NEI4 $265
line 524
;524:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $262
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 525
;525:		}
LABELV $265
line 527
;526:
;527:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $267
line 528
;528:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $269
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 529
;529:		}
LABELV $267
line 530
;530:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+4512
INDIRI4
CNSTI4 64
NEI4 $270
line 531
;531:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $273
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 532
;532:		}
LABELV $270
line 533
;533:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4512
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 534
;534:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4512
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4516+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 535
;535:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+4512
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 536
;536:	}
LABELV $258
line 512
ADDRGP4 $257
JUMPV
LABELV $259
line 538
;537:
;538:	return qtrue;
CNSTI4 1
RETI4
LABELV $249
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 12
line 550
;539:}
;540:
;541:
;542:
;543:/*QUAKED worldspawn (0 0 0) ?
;544:
;545:Every map should have exactly one worldspawn.
;546:"music"		music wav file
;547:"gravity"	800 is default gravity
;548:"message"	Text to print during connection process
;549:*/
;550:void SP_worldspawn( void ) {
line 553
;551:	char	*s;
;552:
;553:	G_SpawnString( "classname", "", &s );
ADDRGP4 $75
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 554
;554:	if ( Q_stricmp( s, "worldspawn" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $282
line 555
;555:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $285
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 556
;556:	}
LABELV $282
line 559
;557:
;558:	// make some data visible to connecting client
;559:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $286
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 561
;560:
;561:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $287
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
line 563
;562:
;563:	G_SpawnString( "music", "", &s );
ADDRGP4 $289
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 564
;564:	trap_SetConfigstring( CS_MUSIC, s );
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 566
;565:
;566:	G_SpawnString( "message", "", &s );
ADDRGP4 $83
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 567
;567:	trap_SetConfigstring( CS_MESSAGE, s );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 569
;568:
;569:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 571
;570:
;571:	G_SpawnString( "gravity", "800", &s );
ADDRGP4 $291
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 572
;572:	trap_Cvar_Set( "g_gravity", s );
ADDRGP4 $293
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 574
;573:
;574:	G_SpawnString( "enableDust", "0", &s );
ADDRGP4 $294
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 575
;575:	trap_Cvar_Set( "g_enableDust", s );
ADDRGP4 $295
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 577
;576:
;577:	G_SpawnString( "enableBreath", "0", &s );
ADDRGP4 $296
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 578
;578:	trap_Cvar_Set( "g_enableBreath", s );
ADDRGP4 $297
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 580
;579:
;580:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+854392
CNSTI4 1022
ASGNI4
line 581
;581:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+854392+524
ADDRGP4 $284
ASGNP4
line 584
;582:
;583:	// see if we want a warmup time
;584:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $281
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 585
;585:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $301
line 586
;586:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $304
ARGP4
ADDRGP4 $214
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 587
;587:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 588
;588:		level.firstStrike = qfalse;
ADDRGP4 level+9228
CNSTI4 0
ASGNI4
line 589
;589:		level.OneSurvivor = qfalse;
ADDRGP4 level+9232
CNSTI4 0
ASGNI4
line 590
;590:		level.lastClient = -1;
ADDRGP4 level+9236
CNSTI4 -1
ASGNI4
line 592
;591:
;592:	} else if ( g_doWarmup.integer ) { // Turn it on
ADDRGP4 $302
JUMPV
LABELV $301
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $309
line 593
;593:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 594
;594:		level.firstStrike = qfalse;
ADDRGP4 level+9228
CNSTI4 0
ASGNI4
line 595
;595:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $287
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
line 597
;596:
;597:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $315
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 598
;598:	}
LABELV $309
LABELV $302
line 599
;599:	level.firstStrike = qfalse;
ADDRGP4 level+9228
CNSTI4 0
ASGNI4
line 601
;600:
;601:}
LABELV $280
endproc SP_worldspawn 16 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 611
;602:
;603:
;604:/*
;605:==============
;606:G_SpawnEntitiesFromString
;607:
;608:Parses textual entity definitions out of an entstring and spawns gentities.
;609:==============
;610:*/
;611:void G_SpawnEntitiesFromString( void ) {
line 613
;612:	// allow calls to G_Spawn*()
;613:	level.spawning = qtrue;
ADDRGP4 level+4508
CNSTI4 1
ASGNI4
line 614
;614:	level.numSpawnVars = 0;
ADDRGP4 level+4512
CNSTI4 0
ASGNI4
line 619
;615:
;616:	// the worldspawn is not an actual entity, but it still
;617:	// has a "spawn" function to perform any global setup
;618:	// needed by a level (setting configstrings or cvars, etc)
;619:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $320
line 620
;620:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $322
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 621
;621:	}
LABELV $320
line 622
;622:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $324
JUMPV
LABELV $323
line 625
;623:
;624:	// parse ents
;625:	while( G_ParseSpawnVars() ) {
line 626
;626:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 627
;627:	}	
LABELV $324
line 625
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $323
line 629
;628:
;629:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+4508
CNSTI4 0
ASGNI4
line 630
;630:}
LABELV $317
endproc G_SpawnEntitiesFromString 8 4
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
LABELV $315
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
LABELV $304
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
LABELV $297
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
LABELV $296
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
LABELV $295
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
LABELV $294
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
LABELV $293
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
LABELV $292
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $291
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $289
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $287
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $286
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
LABELV $285
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
LABELV $284
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
LABELV $281
byte 1 0
align 1
LABELV $273
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
LABELV $269
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
LABELV $262
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
LABELV $256
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
LABELV $245
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
LABELV $231
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
LABELV $226
byte 1 110
byte 1 111
byte 1 116
byte 1 113
byte 1 51
byte 1 97
byte 1 0
align 1
LABELV $223
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $220
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $214
byte 1 48
byte 1 0
align 1
LABELV $213
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
LABELV $201
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
LABELV $200
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
LABELV $199
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
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $196
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $195
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
LABELV $194
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $161
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
LABELV $147
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
LABELV $143
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $140
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
LABELV $139
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
LABELV $138
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
LABELV $137
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
LABELV $136
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
LABELV $135
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
LABELV $134
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
LABELV $133
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
LABELV $132
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
LABELV $131
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
LABELV $130
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
LABELV $129
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
LABELV $128
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
LABELV $127
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
LABELV $126
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
LABELV $125
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
LABELV $124
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
LABELV $123
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
LABELV $122
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
LABELV $121
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
LABELV $120
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
LABELV $119
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
LABELV $118
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
LABELV $117
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
LABELV $116
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
LABELV $115
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
LABELV $114
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
LABELV $113
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
LABELV $112
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
LABELV $111
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
LABELV $110
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
LABELV $109
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
LABELV $108
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
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
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
LABELV $103
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
LABELV $102
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
LABELV $101
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
LABELV $100
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
LABELV $97
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
