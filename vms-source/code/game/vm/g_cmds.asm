export Cmd_SpawnMC_f
code
proc Cmd_SpawnMC_f 4 8
file "../g_cmds.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#include "../../ui/menudef.h"			// for the voice chats
;6:
;7:extern void Team_ReturnFlagSound( gentity_t *ent, int team ); // Shafe
;8://extern void Team_ResetFlags( void ); // Shafe
;9:
;10:/*
;11:=================================================
;12:Buildables
;13:
;14:Do All The Gametype Checks Here Before Sending
;15:The command.
;16:=================================================
;17:*/
;18:void Cmd_SpawnMC_f( gentity_t *ent )
;19:{
line 21
;20:	int	iserror; 
;21:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 23
;22:	
;23:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $56
line 24
;24:	{ // Don't do anything when you are dead -Vincent
line 25
;25:	return;
ADDRGP4 $55
JUMPV
LABELV $56
line 29
;26:	}
;27:
;28:	// You can only Build MC's in GameMode 3
;29:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $58
line 30
;30:	{
line 32
;31:		// Make Sure We Dont Already Have One
;32:		if(ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $61
line 33
;33:		{
line 34
;34:			if (level.redMC == 0) { 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
NEI4 $63
line 35
;35:				BuildMC(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 36
;36:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 37
;37:			} else {
ADDRGP4 $64
JUMPV
LABELV $63
line 38
;38:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 39
;39:			}
LABELV $64
line 40
;40:		}
LABELV $61
line 41
;41:		if(ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $66
line 42
;42:		{
line 43
;43:			if (level.blueMC == 0) { 
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
NEI4 $68
line 44
;44:				BuildMC(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 45
;45:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 46
;46:			} else {
ADDRGP4 $69
JUMPV
LABELV $68
line 47
;47:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 48
;48:			}
LABELV $69
line 49
;49:		}	
LABELV $66
line 50
;50:	}
LABELV $58
line 53
;51:
;52:	// If it couldn't be built tell them why
;53:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $71
line 54
;54:	{
line 56
;55:		// FIXME: Play Error Sound
;56:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"There is Already A Power Core.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $73
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $73
line 57
;57:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Power Core Not Allowed.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $76
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $78
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $76
line 60
;58:		//G_AddEvent( ent, EV_ERROR, 0 );
;59:
;60:	}
LABELV $71
line 62
;61:	
;62:}
LABELV $55
endproc Cmd_SpawnMC_f 4 8
export Cmd_SpawnGenerator_f
proc Cmd_SpawnGenerator_f 4 8
line 65
;63:
;64:void Cmd_SpawnGenerator_f( gentity_t *ent )
;65:{
line 67
;66:	int	iserror; 
;67:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 69
;68:	
;69:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $80
line 70
;70:	{ // Don't do anything when you are dead -Vincent
line 71
;71:	return;
ADDRGP4 $79
JUMPV
LABELV $80
line 75
;72:	}
;73:
;74:	// You can only Build Generators in GameMode 3
;75:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $82
line 76
;76:	{
line 78
;77:		// Make sure there's not more than 2
;78:		if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $85
line 79
;79:		{
line 80
;80:			if (level.redGen > 1)
ADDRGP4 level+9256
INDIRI4
CNSTI4 1
LEI4 $87
line 81
;81:			{
line 82
;82:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 83
;83:			} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 84
;84:				BuildGenerator(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildGenerator
CALLV
pop
line 85
;85:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 86
;86:			}
LABELV $88
line 87
;87:		}
LABELV $85
line 88
;88:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $90
line 89
;89:		{
line 90
;90:			if (level.blueGen > 1)
ADDRGP4 level+9260
INDIRI4
CNSTI4 1
LEI4 $92
line 91
;91:			{
line 92
;92:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 93
;93:			} else {
ADDRGP4 $93
JUMPV
LABELV $92
line 94
;94:				BuildGenerator(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildGenerator
CALLV
pop
line 95
;95:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 96
;96:			}
LABELV $93
line 97
;97:		}
LABELV $90
line 98
;98:	}
LABELV $82
line 101
;99:	
;100:	// If it couldn't be built tell them why
;101:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $95
line 102
;102:	{
line 104
;103:		// FIXME: Play Error Sound
;104:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Shield Generators..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $97
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $99
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $97
line 105
;105:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Sheild Generators Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $100
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $102
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $100
line 107
;106:		//G_AddEvent( ent, EV_ERROR, 0 );
;107:	}						
LABELV $95
line 109
;108:
;109:}
LABELV $79
endproc Cmd_SpawnGenerator_f 4 8
export Cmd_SpawnDisplacer_f
proc Cmd_SpawnDisplacer_f 12 8
line 113
;110:
;111://BuildDisplacer
;112:void Cmd_SpawnDisplacer_f( gentity_t *ent )
;113:{
line 115
;114:	int	iserror, cts; 
;115:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 119
;116:
;117:
;118:
;119:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $104
line 120
;120:	{ // Don't do anything when you are dead -Vincent
line 121
;121:	return;
ADDRGP4 $103
JUMPV
LABELV $104
line 126
;122:	}
;123:  
;124:
;125:	// You can only Build Displacers in GameMode 3
;126:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $106
line 127
;127:	{
line 130
;128:		
;129:		// What types of turrets are you allowed to build?
;130:		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];
ADDRLP4 4
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
ADDI4
ASGNI4
line 133
;131:		
;132:		// If the rules change This needs to be change in ui_ingame.c as well
;133:		if (cts < 2) { 
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $113
line 134
;134:			iserror = 3; 
ADDRLP4 0
CNSTI4 3
ASGNI4
line 135
;135:			trap_SendServerCommand( ent-g_entities, "cp \"Immobilizer Not Available Yet.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $115
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 136
;136:			return;
ADDRGP4 $103
JUMPV
LABELV $113
line 140
;137:		}
;138:
;139:		// Make sure there's not more than 2
;140:		if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $116
line 141
;141:		{
line 142
;142:			if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $118
line 143
;143:			{
line 144
;144:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 145
;145:			} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 146
;146:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 147
;147:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 148
;148:			}
LABELV $119
line 149
;149:		}
LABELV $116
line 150
;150:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $121
line 151
;151:		{
line 152
;152:			if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $123
line 153
;153:			{
line 154
;154:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 155
;155:			} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 156
;156:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 157
;157:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 158
;158:			}
LABELV $124
line 159
;159:		}
LABELV $121
line 160
;160:	}
LABELV $106
line 162
;161:	
;162:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $126
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $126
line 163
;163:	{
line 164
;164:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $129
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $129
line 165
;165:		{
line 167
;166:			// Make sure there's not more than 2
;167:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $132
line 168
;168:			{
line 169
;169:				if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $134
line 170
;170:				{
line 171
;171:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 172
;172:				} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 173
;173:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 174
;174:					level.redMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 175
;175:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 176
;176:				}
LABELV $135
line 177
;177:			}
LABELV $132
line 178
;178:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $138
line 179
;179:			{
line 180
;180:				if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $140
line 181
;181:				{
line 182
;182:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 183
;183:				} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 184
;184:					level.blueMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 185
;185:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 186
;186:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 187
;187:				}
LABELV $141
line 188
;188:			}
LABELV $138
line 189
;189:		}
LABELV $129
line 192
;190:
;191:
;192:	}		
LABELV $126
line 195
;193:
;194:	// If it couldn't be built tell them why
;195:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $144
line 196
;196:	{
line 198
;197:		// FIXME: Play Error Sound
;198:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Immobilizers..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $146
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $148
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $146
line 199
;199:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizers Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $149
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $149
line 200
;200:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizer Not Available Yet.\"" );} // Redundant now?
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $152
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $115
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $152
line 202
;201:		//G_AddEvent( ent, EV_ERROR, 0 );
;202:	}						
LABELV $144
line 204
;203:
;204:}
LABELV $103
endproc Cmd_SpawnDisplacer_f 12 8
export Cmd_SpawnTurret_f
proc Cmd_SpawnTurret_f 12 8
line 207
;205:
;206:void Cmd_SpawnTurret_f( gentity_t *ent , int type )
;207:{
line 210
;208:	int		iserror; 
;209:	int		cts;
;210:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 212
;211:	
;212:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $155
line 213
;213:	{ // Don't do anything when you are dead -Vincent
line 214
;214:	return;
ADDRGP4 $154
JUMPV
LABELV $155
line 218
;215:	}
;216:
;217:	// If Playing GM 3 Check the rules
;218:	if (g_GameMode.integer == 3) {
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $157
line 220
;219:		// What types of turrets are you allowed to build?
;220:		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];
ADDRLP4 4
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
ADDI4
ASGNI4
line 223
;221:		
;222:		// If the rules change This needs to be change in ui_ingame.c as well
;223:		if ((cts < 3) && (type == 1)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $164
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $164
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $164
line 224
;224:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 6
GEI4 $166
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $166
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $166
line 226
;225:
;226:		if (iserror == 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $168
line 227
;227:		{
line 229
;228:			// Be sure there arent too many
;229:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $170
line 230
;230:			{
line 231
;231:				if (level.blueTurrets > 5)  // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $172
line 232
;232:				{
line 233
;233:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 234
;234:				} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 235
;235:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 236
;236:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 237
;237:				}	
LABELV $173
line 238
;238:			}
LABELV $170
line 239
;239:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $175
line 240
;240:			{
line 241
;241:				if (level.redTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $177
line 242
;242:				{
line 243
;243:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 244
;244:				} else {
ADDRGP4 $178
JUMPV
LABELV $177
line 245
;245:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 246
;246:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 247
;247:				}			
LABELV $178
line 248
;248:			}
LABELV $175
line 249
;249:		}
LABELV $168
line 250
;250:	}
LABELV $157
line 254
;251:
;252:	// If playing CTF Make sure that we dont have too many 
;253:	// Turrets on our team.
;254:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $180
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $180
line 255
;255:	{
line 257
;256:		
;257:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $183
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $183
line 258
;258:		{
line 259
;259:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $186
line 260
;260:			{
line 261
;261:				if (level.blueTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $188
line 262
;262:				{
line 263
;263:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 264
;264:				} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 265
;265:					level.blueMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 266
;266:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 267
;267:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 268
;268:				}			
LABELV $189
line 269
;269:			}
LABELV $186
line 270
;270:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $192
line 271
;271:			{
line 272
;272:				if (level.redTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $194
line 273
;273:				{
line 274
;274:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 275
;275:				} else {
ADDRGP4 $195
JUMPV
LABELV $194
line 276
;276:					level.redMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 277
;277:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 278
;278:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 279
;279:				}			
LABELV $195
line 280
;280:			}
LABELV $192
line 281
;281:		}
LABELV $183
line 282
;282:	}
LABELV $180
line 285
;283:	
;284:	// If it couldn't be built tell them why
;285:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $198
line 286
;286:	{
line 288
;287:		// FIXME Play Error Sound
;288:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Turret Type Not Available Yet.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $200
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $202
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $200
line 289
;289:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Turrets On Your Team.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $203
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $205
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $203
line 290
;290:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Turrets Not Allowed Here.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $206
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $208
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $206
line 292
;291:		//G_AddEvent( ent, EV_ERROR, 0 );
;292:	}
LABELV $198
line 294
;293:
;294:}
LABELV $154
endproc Cmd_SpawnTurret_f 12 8
export DeathmatchScoreboardMessage
proc DeathmatchScoreboardMessage 2484 68
line 309
;295:/*
;296:=================================================
;297:// End Buildables
;298:=================================================
;299:/*
;300:
;301:
;302:/*
;303:==================
;304:DeathmatchScoreboardMessage
;305:
;306:==================
;307:*/
;308:void DeathmatchScoreboardMessage( gentity_t *ent ) 
;309:{
line 319
;310:	char		entry[1024];
;311:	char		string[1400];
;312:	int			stringlength;
;313:	int			i, j;
;314:	gclient_t	*cl;
;315:	int			numSorted, scoreFlags, accuracy, perfect;
;316:	
;317:
;318:	// send the latest information on all clients
;319:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 320
;320:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 321
;321:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 323
;322:
;323:	numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+84
INDIRI4
ASGNI4
line 325
;324:	
;325:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 328
;326:		int		ping;
;327:
;328:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3464
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 330
;329:
;330:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $216
line 331
;331:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 332
;332:		} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 335
;333://unlagged - true ping
;334:			//ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
;335:			ping = cl->pers.realPing < 999 ? cl->pers.realPing : 999;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 999
GEI4 $219
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $220
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 337
;336://unlagged - true ping
;337:		}
LABELV $217
line 340
;338:
;339:
;340:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
line 341
;341:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
DIVI4
ASGNI4
line 342
;342:		}
ADDRGP4 $222
JUMPV
LABELV $221
line 343
;343:		else {
line 344
;344:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 345
;345:		}
LABELV $222
line 346
;346:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 2468
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $224
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $224
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $225
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 349
;347:
;348:		// Changed cl->ps.persistant[PERS_SCORE] to .truescore
;349:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $226
ARGP4
ADDRLP4 2472
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2472
INDIRI4
ADDRGP4 level+96
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 924
ADDRLP4 2472
INDIRI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 363
;350:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;351:			
;352:			cl->pers.TrueScore, ping, (level.time - cl->pers.enterTime)/60000,
;353:			
;354:
;355:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;356:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;357:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;358:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;359:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;360:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;361:			perfect,
;362:			cl->ps.persistant[PERS_CAPTURES]);
;363:		j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2480
INDIRI4
ASGNI4
line 364
;364:		if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $231
line 365
;365:			break;
ADDRGP4 $213
JUMPV
LABELV $231
line 366
;366:		strcpy (string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 367
;367:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 368
;368:	}
LABELV $212
line 325
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $211
LABELV $213
line 370
;369:
;370:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $233
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+52+4
INDIRI4
ARGI4
ADDRGP4 level+52+8
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 2456
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 373
;371:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;372:		string ) );
;373:}
LABELV $209
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_TeleGren_f
proc Cmd_TeleGren_f 12 4
line 386
;374:
;375:
;376:/*
;377:
;378:=================
;379:
;380:Cmd_TeleGren_f
;381:Shafe - Trep - PDG
;382:=================
;383:*/
;384:
;385:void Cmd_TeleGren_f (gentity_t *ent) 
;386:{
line 387
;387:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $239
line 388
;388:	{ // Don't do anything when you are dead -Vincent
line 389
;389: 		if ( ent->istelepoint != 0 )
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 390
;390:		{ // Failsafe
line 391
;391:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 392
;392:		VectorClear( ent->teleloc );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 393
;393:		}
line 394
;394:	return;
ADDRGP4 $238
JUMPV
LABELV $239
line 397
;395:	}
;396:
;397:	if ( ent->istelepoint == 1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 1
NEI4 $243
line 398
;398:	{
line 400
;399:		// Shafe The old way was just to drop it now we return flags to base if you try to teleport with one
;400:		if (ent->client->ps.powerups[PW_REDFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $245
line 401
;401:		{
line 402
;402:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 403
;403:			ent->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 404
;404:		}
LABELV $245
line 405
;405:		if (ent->client->ps.powerups[PW_BLUEFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $247
line 406
;406:		{
line 407
;407:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 408
;408:			ent->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 409
;409:		}
LABELV $247
line 411
;410:
;411:		VectorCopy( ent->teleloc, ent->client->ps.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 412
;412:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 413
;413:		VectorClear( ent->teleloc );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 414
;414:	} 
ADDRGP4 $244
JUMPV
LABELV $243
line 416
;415:	else 
;416:	{
line 417
;417:        G_Printf( S_COLOR_GREEN "PDG Lock Not Established\n" );
ADDRGP4 $249
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 418
;418:	}
LABELV $244
line 419
;419:}
LABELV $238
endproc Cmd_TeleGren_f 12 4
export Cmd_DropFlag_f
proc Cmd_DropFlag_f 0 4
line 431
;420:
;421:/*
;422:
;423:=================
;424:
;425:Cmd_DropFlag_f
;426:Shafe - Trep - PDG
;427:=================
;428:*/
;429:
;430:void Cmd_DropFlag_f (gentity_t *ent) 
;431:{
line 432
;432:Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 433
;433:}
LABELV $250
endproc Cmd_DropFlag_f 0 4
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 444
;434:
;435:
;436:/*
;437:==================
;438:Cmd_Score_f
;439:
;440:Request current scoreboard information
;441:==================
;442:*/
;443:void Cmd_Score_f( gentity_t *ent )
;444:{
line 445
;445:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 446
;446:}
LABELV $251
endproc Cmd_Score_f 0 4
export Cmd_Test_f
proc Cmd_Test_f 32 8
line 449
;447:
;448:void Cmd_Test_f (gentity_t *ent) 
;449:{
line 450
;450:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluegenerators %i\n\"", level.blueGen ));		
ADDRGP4 $253
ARGP4
ADDRGP4 level+9260
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 451
;451:		trap_SendServerCommand( ent-g_entities, va("print \" level.redgenerators %i\n\"", level.redGen ));		
ADDRGP4 $255
ARGP4
ADDRGP4 level+9256
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 452
;452:		trap_SendServerCommand( ent-g_entities, va("print \" level.blueturrets %i\n\"", level.blueTurrets ));		
ADDRGP4 $257
ARGP4
ADDRGP4 level+9268
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 453
;453:		trap_SendServerCommand( ent-g_entities, va("print \" level.redturrets %i\n\"", level.redTurrets ));		
ADDRGP4 $259
ARGP4
ADDRGP4 level+9264
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 454
;454:		trap_SendServerCommand( ent-g_entities, va("print \" level.redmc %i\n\"", level.redMC ));		
ADDRGP4 $261
ARGP4
ADDRGP4 level+9280
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 455
;455:		trap_SendServerCommand( ent-g_entities, va("print \" level.blumc %i\n\"", level.blueMC ));		
ADDRGP4 $263
ARGP4
ADDRGP4 level+9284
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 456
;456:		trap_SendServerCommand( ent-g_entities, va("print \" level.redscorelatched %i\n\"", level.redScoreLatched ));		
ADDRGP4 $265
ARGP4
ADDRGP4 level+9288
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 457
;457:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluescorelatched %i\n\"", level.blueScoreLatched ));		
ADDRGP4 $267
ARGP4
ADDRGP4 level+9292
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 459
;458:		//trap_SendServerCommand( ent-g_entities, va("print \" level.scoreTime %i\n\"", (level.time-level.scoreTime) ));		
;459:}
LABELV $252
endproc Cmd_Test_f 32 8
export CheatsOk
proc CheatsOk 4 8
line 468
;460:
;461:
;462:/*
;463:==================
;464:CheatsOk
;465:==================
;466:*/
;467:qboolean	CheatsOk( gentity_t *ent ) 
;468:{
line 469
;469:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $270
line 470
;470:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $273
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 471
;471:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $269
JUMPV
LABELV $270
line 474
;472:	}
;473:
;474:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $274
line 475
;475:      trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\"")); 
ADDRGP4 $276
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 476
;476:      return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $269
JUMPV
LABELV $274
line 478
;477:   }
;478:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $277
line 479
;479:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $276
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 480
;480:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $269
JUMPV
LABELV $277
line 482
;481:	}
;482:	return qtrue;
CNSTI4 1
RETI4
LABELV $269
endproc CheatsOk 4 8
bss
align 1
LABELV $280
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 491
;483:}
;484:
;485:
;486:/*
;487:==================
;488:ConcatArgs
;489:==================
;490:*/
;491:char	*ConcatArgs( int start ) {
line 497
;492:	int		i, c, tlen;
;493:	static char	line[MAX_STRING_CHARS];
;494:	int		len;
;495:	char	arg[MAX_STRING_CHARS];
;496:
;497:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 498
;498:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 499
;499:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 500
;500:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 501
;501:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 502
;502:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $285
line 503
;503:			break;
ADDRGP4 $283
JUMPV
LABELV $285
line 505
;504:		}
;505:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $280
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 506
;506:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 507
;507:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $287
line 508
;508:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $280
ADDP4
CNSTI1 32
ASGNI1
line 509
;509:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 510
;510:		}
LABELV $287
line 511
;511:	}
LABELV $282
line 499
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $281
LABELV $283
line 513
;512:
;513:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $280
ADDP4
CNSTI1 0
ASGNI1
line 515
;514:
;515:	return line;
ADDRGP4 $280
RETP4
LABELV $279
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 525
;516:}
;517:
;518:/*
;519:==================
;520:SanitizeString
;521:
;522:Remove case and control characters
;523:==================
;524:*/
;525:void SanitizeString( char *in, char *out ) {
ADDRGP4 $291
JUMPV
LABELV $290
line 526
;526:	while ( *in ) {
line 527
;527:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $293
line 528
;528:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 529
;529:			continue;
ADDRGP4 $291
JUMPV
LABELV $293
line 531
;530:		}
;531:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $295
line 532
;532:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 533
;533:			continue;
ADDRGP4 $291
JUMPV
LABELV $295
line 535
;534:		}
;535:		*out++ = tolower( *in++ );
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 536
;536:	}
LABELV $291
line 526
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $290
line 538
;537:
;538:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 539
;539:}
LABELV $289
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 549
;540:
;541:/*
;542:==================
;543:ClientNumberFromString
;544:
;545:Returns a player number for either a number or name string
;546:Returns -1 if invalid
;547:==================
;548:*/
;549:int ClientNumberFromString( gentity_t *to, char *s ) {
line 556
;550:	gclient_t	*cl;
;551:	int			idnum;
;552:	char		s2[MAX_STRING_CHARS];
;553:	char		n2[MAX_STRING_CHARS];
;554:
;555:	// numeric values are just slot numbers
;556:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $298
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $298
line 557
;557:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 558
;558:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $303
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $300
LABELV $303
line 559
;559:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $304
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 560
;560:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $297
JUMPV
LABELV $300
line 563
;561:		}
;562:
;563:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3464
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 564
;564:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $305
line 565
;565:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $307
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 566
;566:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $297
JUMPV
LABELV $305
line 568
;567:		}
;568:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $297
JUMPV
LABELV $298
line 572
;569:	}
;570:
;571:	// check for a name match
;572:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 573
;573:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $311
JUMPV
LABELV $308
line 574
;574:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $313
line 575
;575:			continue;
ADDRGP4 $309
JUMPV
LABELV $313
line 577
;576:		}
;577:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 578
;578:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $315
line 579
;579:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $297
JUMPV
LABELV $315
line 581
;580:		}
;581:	}
LABELV $309
line 573
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3464
ADDP4
ASGNP4
LABELV $311
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $308
line 583
;582:
;583:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $317
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 584
;584:	return -1;
CNSTI4 -1
RETI4
LABELV $297
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 595
;585:}
;586:
;587:/*
;588:==================
;589:Cmd_Give_f
;590:
;591:Give items to a client
;592:==================
;593:*/
;594:void Cmd_Give_f (gentity_t *ent)
;595:{
line 603
;596:	char		*name;
;597:	gitem_t		*it;
;598:	int			i;
;599:	qboolean	give_all;
;600:	gentity_t		*it_ent;
;601:	trace_t		trace;
;602:
;603:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $319
line 604
;604:		return;
ADDRGP4 $318
JUMPV
LABELV $319
line 607
;605:	}
;606:
;607:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 609
;608:
;609:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $321
line 610
;610:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $321
line 612
;611:	else
;612:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $322
line 614
;613:
;614:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $327
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $324
LABELV $327
line 615
;615:	{
line 616
;616:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 617
;617:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $328
line 618
;618:			return;
ADDRGP4 $318
JUMPV
LABELV $328
line 619
;619:	}
LABELV $324
line 621
;620:
;621:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $333
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $332
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $330
LABELV $333
line 622
;622:	{
line 623
;623:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 625
;624:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;625:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $334
line 626
;626:			return;
ADDRGP4 $318
JUMPV
LABELV $334
line 627
;627:	}
LABELV $330
line 629
;628:
;629:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $336
LABELV $339
line 630
;630:	{
line 631
;631:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $340
line 632
;632:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
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
CNSTI4 999
ASGNI4
line 633
;633:		}
LABELV $341
line 631
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $340
line 634
;634:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $344
line 635
;635:			return;
ADDRGP4 $318
JUMPV
LABELV $344
line 636
;636:	}
LABELV $336
line 638
;637:
;638:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $349
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $346
LABELV $349
line 639
;639:	{
line 640
;640:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 642
;641:
;642:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $350
line 643
;643:			return;
ADDRGP4 $318
JUMPV
LABELV $350
line 644
;644:	}
LABELV $346
line 646
;645:
;646:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $352
line 647
;647:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 288
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
line 648
;648:		return;
ADDRGP4 $318
JUMPV
LABELV $352
line 650
;649:	}
;650:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $355
line 651
;651:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 284
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
line 652
;652:		return;
ADDRGP4 $318
JUMPV
LABELV $355
line 654
;653:	}
;654:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $358
line 655
;655:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 656
;656:		return;
ADDRGP4 $318
JUMPV
LABELV $358
line 658
;657:	}
;658:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $361
line 659
;659:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 660
;660:		return;
ADDRGP4 $318
JUMPV
LABELV $361
line 662
;661:	}
;662:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $364
line 663
;663:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 296
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
line 664
;664:		return;
ADDRGP4 $318
JUMPV
LABELV $364
line 668
;665:	}
;666:
;667:	// spawn a specific item right on the player
;668:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $367
line 669
;669:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 670
;670:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $369
line 671
;671:			return;
ADDRGP4 $318
JUMPV
LABELV $369
line 674
;672:		}
;673:
;674:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 675
;675:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 676
;676:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 677
;677:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 678
;678:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 679
;679:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 680
;680:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 681
;681:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $371
line 682
;682:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 683
;683:		}
LABELV $371
line 684
;684:	}
LABELV $367
line 685
;685:}
LABELV $318
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 698
;686:
;687:
;688:/*
;689:==================
;690:Cmd_God_f
;691:
;692:Sets client to godmode
;693:
;694:argv(0) god
;695:==================
;696:*/
;697:void Cmd_God_f (gentity_t *ent)
;698:{
line 701
;699:	char	*msg;
;700:
;701:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $374
line 702
;702:		return;
ADDRGP4 $373
JUMPV
LABELV $374
line 705
;703:	}
;704:
;705:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 706
;706:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $376
line 707
;707:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $378
ASGNP4
ADDRGP4 $377
JUMPV
LABELV $376
line 709
;708:	else
;709:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $379
ASGNP4
LABELV $377
line 711
;710:
;711:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $380
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 712
;712:}
LABELV $373
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 724
;713:
;714:
;715:/*
;716:==================
;717:Cmd_Notarget_f
;718:
;719:Sets client to notarget
;720:
;721:argv(0) notarget
;722:==================
;723:*/
;724:void Cmd_Notarget_f( gentity_t *ent ) {
line 727
;725:	char	*msg;
;726:
;727:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $382
line 728
;728:		return;
ADDRGP4 $381
JUMPV
LABELV $382
line 731
;729:	}
;730:
;731:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 732
;732:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $384
line 733
;733:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $386
ASGNP4
ADDRGP4 $385
JUMPV
LABELV $384
line 735
;734:	else
;735:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $387
ASGNP4
LABELV $385
line 737
;736:
;737:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $380
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 738
;738:}
LABELV $381
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 748
;739:
;740:
;741:/*
;742:==================
;743:Cmd_Noclip_f
;744:
;745:argv(0) noclip
;746:==================
;747:*/
;748:void Cmd_Noclip_f( gentity_t *ent ) {
line 751
;749:	char	*msg;
;750:
;751:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $389
line 752
;752:		return;
ADDRGP4 $388
JUMPV
LABELV $389
line 755
;753:	}
;754:
;755:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 756
;756:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $393
ASGNP4
line 757
;757:	} else {
ADDRGP4 $392
JUMPV
LABELV $391
line 758
;758:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $394
ASGNP4
line 759
;759:	}
LABELV $392
line 760
;760:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $396
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $396
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $397
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 762
;761:
;762:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $380
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 763
;763:}
LABELV $388
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 776
;764:
;765:
;766:/*
;767:==================
;768:Cmd_LevelShot_f
;769:
;770:This is just to help generate the level pictures
;771:for the menus.  It goes to the intermission immediately
;772:and sends over a command to the client to resize the view,
;773:hide the scoreboard, and take a special screenshot
;774:==================
;775:*/
;776:void Cmd_LevelShot_f( gentity_t *ent ) {
line 777
;777:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $399
line 778
;778:		return;
ADDRGP4 $398
JUMPV
LABELV $399
line 782
;779:	}
;780:
;781:	// doesn't work in single player
;782:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $401
line 783
;783:		trap_SendServerCommand( ent-g_entities, 
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 785
;784:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;785:		return;
ADDRGP4 $398
JUMPV
LABELV $401
line 788
;786:	}
;787:
;788:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 789
;789:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $405
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 790
;790:}
LABELV $398
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 803
;791:
;792:
;793:/*
;794:==================
;795:Cmd_LevelShot_f
;796:
;797:This is just to help generate the level pictures
;798:for the menus.  It goes to the intermission immediately
;799:and sends over a command to the client to resize the view,
;800:hide the scoreboard, and take a special screenshot
;801:==================
;802:*/
;803:void Cmd_TeamTask_f( gentity_t *ent ) {
line 807
;804:	char userinfo[MAX_INFO_STRING];
;805:	char		arg[MAX_TOKEN_CHARS];
;806:	int task;
;807:	int client = ent->client - level.clients;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3464
DIVI4
ASGNI4
line 809
;808:
;809:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $407
line 810
;810:		return;
ADDRGP4 $406
JUMPV
LABELV $407
line 812
;811:	}
;812:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 813
;813:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 815
;814:
;815:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 816
;816:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $410
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 817
;817:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 818
;818:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 819
;819:}
LABELV $406
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 828
;820:
;821:
;822:
;823:/*
;824:=================
;825:Cmd_Kill_f
;826:=================
;827:*/
;828:void Cmd_Kill_f( gentity_t *ent ) {
line 829
;829:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $412
line 830
;830:		return;
ADDRGP4 $411
JUMPV
LABELV $412
line 832
;831:	}
;832:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $414
line 833
;833:		return;
ADDRGP4 $411
JUMPV
LABELV $414
line 835
;834:	}
;835:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 836
;836:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 837
;837:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 838
;838:}
LABELV $411
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 848
;839:
;840:/*
;841:=================
;842:BroadCastTeamChange
;843:
;844:Let everyone know about a team change
;845:=================
;846:*/
;847:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;848:{
line 849
;849:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $417
line 850
;850:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $419
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 852
;851:			client->pers.netname) );
;852:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $418
JUMPV
LABELV $417
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $420
line 853
;853:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $422
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 855
;854:		client->pers.netname));
;855:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $421
JUMPV
LABELV $420
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $423
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $423
line 857
;856:		
;857:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $425
line 858
;858:		{
line 860
;859:		
;860:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $427
line 861
;861:			{
line 862
;862:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $430
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 863
;863:			}
LABELV $427
line 864
;864:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $424
line 865
;865:			{
line 866
;866:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $434
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 867
;867:			}
line 868
;868:		} 
ADDRGP4 $424
JUMPV
LABELV $425
line 871
;869:
;870:		else 
;871:		{
line 872
;872:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 873
;873:		}
line 875
;874:
;875:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $424
JUMPV
LABELV $423
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $436
line 876
;876:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $438
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 878
;877:		client->pers.netname));
;878:	}
LABELV $436
LABELV $424
LABELV $421
LABELV $418
line 879
;879:}
LABELV $416
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 886
;880:
;881:/*
;882:=================
;883:SetTeam
;884:=================
;885:*/
;886:void SetTeam( gentity_t *ent, char *s ) {
line 897
;887:	int					team, oldTeam;
;888:	gclient_t			*client;
;889:	int					clientNum;
;890:	spectatorState_t	specState;
;891:	int					specClient;
;892:	int					teamLeader;
;893:
;894:	//
;895:	// see what change is requested
;896:	//
;897:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 899
;898:
;899:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3464
DIVI4
ASGNI4
line 900
;900:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 901
;901:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 902
;902:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $444
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $440
LABELV $444
line 903
;903:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 904
;904:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 905
;905:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $441
JUMPV
LABELV $440
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $445
line 906
;906:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 907
;907:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 908
;908:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 909
;909:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $446
JUMPV
LABELV $445
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $448
line 910
;910:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 911
;911:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 912
;912:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 913
;913:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $449
JUMPV
LABELV $448
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $455
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $451
LABELV $455
line 914
;914:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 915
;915:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 916
;916:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $452
JUMPV
LABELV $451
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $456
line 918
;917:		// if running a team game, assign player to one of the teams
;918:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 919
;919:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $463
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $462
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $459
LABELV $463
line 920
;920:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 921
;921:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $460
JUMPV
LABELV $459
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $466
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $468
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $464
LABELV $468
line 922
;922:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 923
;923:		} else {
ADDRGP4 $465
JUMPV
LABELV $464
line 925
;924:			// pick the team with the least number of players
;925:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 926
;926:		}
LABELV $465
LABELV $460
line 928
;927:
;928:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $457
line 931
;929:			int		counts[TEAM_NUM_TEAMS];
;930:
;931:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 84
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+8
ADDRLP4 84
INDIRI4
ASGNI4
line 932
;932:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+4
ADDRLP4 88
INDIRI4
ASGNI4
line 935
;933:
;934:			// We allow a spread of two
;935:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $474
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $474
line 936
;936:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $478
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 938
;937:					"cp \"Red team has too many players.\n\"" );
;938:				return; // ignore the request
ADDRGP4 $439
JUMPV
LABELV $474
line 940
;939:			}
;940:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $457
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $457
line 941
;941:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $483
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 943
;942:					"cp \"Blue team has too many players.\n\"" );
;943:				return; // ignore the request
ADDRGP4 $439
JUMPV
line 947
;944:			}
;945:
;946:			// It's ok, the team we are switching to has less or same number of players
;947:		}
line 949
;948:
;949:	} else {
LABELV $456
line 951
;950:		// force them to spectators if there aren't any spots free
;951:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 952
;952:	}
LABELV $457
LABELV $452
LABELV $449
LABELV $446
LABELV $441
line 955
;953:
;954:	// override decision if limiting the players
;955:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $484
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $484
line 956
;956:		&& level.numNonSpectatorClients >= 2 ) {
line 957
;957:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 958
;958:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $485
JUMPV
LABELV $484
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $488
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $488
line 959
;959:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 960
;960:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 961
;961:	}
LABELV $488
LABELV $485
line 966
;962:
;963:	//
;964:	// decide if we will allow the change
;965:	//
;966:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 967
;967:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $493
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $493
line 968
;968:		return;
ADDRGP4 $439
JUMPV
LABELV $493
line 976
;969:	}
;970:
;971:	//
;972:	// execute the team change
;973:	//
;974:
;975:	// if the player was dead leave the body
;976:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $495
line 977
;977:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 978
;978:	}
LABELV $495
line 981
;979:
;980:	// he starts at 'base'
;981:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 982
;982:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $497
line 984
;983:		// Kill him (makes sure he loses flags, etc)
;984:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 985
;985:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 986
;986:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 988
;987:
;988:	}
LABELV $497
line 990
;989:	// they go to the end of the line for tournements
;990:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $499
line 991
;991:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 992
;992:	}
LABELV $499
line 994
;993:
;994:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 995
;995:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 996
;996:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 998
;997:
;998:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 999
;999:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $504
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $502
LABELV $504
line 1000
;1000:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 1002
;1001:		// if there is no team leader or the team leader is a bot and this client is not a bot
;1002:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $511
ADDRLP4 68
CNSTI4 924
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
NEI4 $505
ADDRLP4 68
INDIRI4
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $505
LABELV $511
line 1003
;1003:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1004
;1004:		}
LABELV $505
line 1005
;1005:	}
LABELV $502
line 1007
;1006:	// make sure there is a team leader on the team the player came from
;1007:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $514
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $512
LABELV $514
line 1008
;1008:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 1009
;1009:	}
LABELV $512
line 1011
;1010:
;1011:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1014
;1012:
;1013:	// get and distribute relevent paramters
;1014:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1016
;1015:
;1016:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1017
;1017:}
LABELV $439
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 1027
;1018:
;1019:/*
;1020:=================
;1021:StopFollowing
;1022:
;1023:If the client being followed leaves the game, or you just want to drop
;1024:to free floating spectator mode
;1025:=================
;1026:*/
;1027:void StopFollowing( gentity_t *ent ) {
line 1028
;1028:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1029
;1029:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 3
ASGNI4
line 1030
;1030:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1031
;1031:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 1032
;1032:	ent->r.svFlags &= ~SVF_BOT;
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
CNSTI4 -9
BANDI4
ASGNI4
line 1033
;1033:	ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ASGNI4
line 1034
;1034:}
LABELV $515
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 1041
;1035:
;1036:/*
;1037:=================
;1038:Cmd_Team_f
;1039:=================
;1040:*/
;1041:void Cmd_Team_f( gentity_t *ent ) {
line 1045
;1042:	int			oldTeam;
;1043:	char		s[MAX_TOKEN_CHARS];
;1044:
;1045:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $517
line 1046
;1046:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1047
;1047:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $516
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $516
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $529
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $529
address $525
address $523
address $521
address $527
code
LABELV $521
line 1049
;1048:		case TEAM_BLUE:
;1049:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $522
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1050
;1050:			break;
ADDRGP4 $516
JUMPV
LABELV $523
line 1052
;1051:		case TEAM_RED:
;1052:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $524
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1053
;1053:			break;
ADDRGP4 $516
JUMPV
LABELV $525
line 1055
;1054:		case TEAM_FREE:
;1055:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1056
;1056:			break;
ADDRGP4 $516
JUMPV
LABELV $527
line 1058
;1057:		case TEAM_SPECTATOR:
;1058:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1059
;1059:			break;
line 1061
;1060:		}
;1061:		return;
ADDRGP4 $516
JUMPV
LABELV $517
line 1064
;1062:	}
;1063:
;1064:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $530
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $530
line 1065
;1065:	{
line 1067
;1066:
;1067:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $534
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1068
;1068:		return;
ADDRGP4 $516
JUMPV
LABELV $530
line 1072
;1069:	}
;1070:
;1071:
;1072:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $535
line 1073
;1073:	{
line 1074
;1074:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $542
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $538
LABELV $542
line 1075
;1075:		{
line 1077
;1076:		
;1077:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $543
line 1078
;1078:			{
line 1080
;1079:				
;1080:				if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $545
line 1081
;1081:				{
line 1082
;1082:					trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $547
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1083
;1083:					return;
ADDRGP4 $516
JUMPV
LABELV $545
line 1085
;1084:				}
;1085:				if (level.firstStrike == qtrue)
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $548
line 1086
;1086:				{
line 1087
;1087:					trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $551
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1088
;1088:					return;
ADDRGP4 $516
JUMPV
LABELV $548
line 1091
;1089:				}
;1090:
;1091:			}
LABELV $543
line 1092
;1092:		}
LABELV $538
line 1095
;1093:
;1094:
;1095:	}
LABELV $535
line 1102
;1096:
;1097:
;1098:	
;1099:
;1100:
;1101:	// if they are playing a tournement game, count as a loss
;1102:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $552
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $552
line 1103
;1103:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1104
;1104:		ent->client->sess.losses++;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1105
;1105:	}
LABELV $552
line 1107
;1106:
;1107:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1109
;1108:
;1109:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1111
;1110:
;1111:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1112
;1112:}
LABELV $516
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 1120
;1113:
;1114:
;1115:/*
;1116:=================
;1117:Cmd_Follow_f
;1118:=================
;1119:*/
;1120:void Cmd_Follow_f( gentity_t *ent ) {
line 1124
;1121:	int		i;
;1122:	char	arg[MAX_TOKEN_CHARS];
;1123:
;1124:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $557
line 1125
;1125:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $556
line 1126
;1126:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1127
;1127:		}
line 1128
;1128:		return;
ADDRGP4 $556
JUMPV
LABELV $557
line 1131
;1129:	}
;1130:
;1131:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1132
;1132:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1133
;1133:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $561
line 1134
;1134:		return;
ADDRGP4 $556
JUMPV
LABELV $561
line 1138
;1135:	}
;1136:
;1137:	// can't follow self
;1138:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
NEU4 $563
line 1139
;1139:		return;
ADDRGP4 $556
JUMPV
LABELV $563
line 1143
;1140:	}
;1141:
;1142:	// can't follow another spectator
;1143:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $565
line 1144
;1144:		return;
ADDRGP4 $556
JUMPV
LABELV $565
line 1148
;1145:	}
;1146:
;1147:	// if they are playing a tournement game, count as a loss
;1148:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $567
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $567
line 1149
;1149:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1150
;1150:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1151
;1151:	}
LABELV $567
line 1154
;1152:
;1153:	// first set them to spectator
;1154:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $570
line 1155
;1155:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1156
;1156:	}
LABELV $570
line 1158
;1157:
;1158:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1159
;1159:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1160
;1160:}
LABELV $556
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 1167
;1161:
;1162:/*
;1163:=================
;1164:Cmd_FollowCycle_f
;1165:=================
;1166:*/
;1167:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 1172
;1168:	int		clientnum;
;1169:	int		original;
;1170:
;1171:	// if they are playing a tournement game, count as a loss
;1172:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $573
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $573
line 1173
;1173:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1174
;1174:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1175
;1175:	}
LABELV $573
line 1177
;1176:	// first set them to spectator
;1177:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $576
line 1178
;1178:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1179
;1179:	}
LABELV $576
line 1181
;1180:
;1181:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $578
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $578
line 1182
;1182:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $580
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1183
;1183:	}
LABELV $578
line 1185
;1184:
;1185:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ASGNI4
line 1186
;1186:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $581
line 1187
;1187:	do {
line 1188
;1188:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1189
;1189:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $584
line 1190
;1190:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1191
;1191:		}
LABELV $584
line 1192
;1192:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $587
line 1193
;1193:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1194
;1194:		}
LABELV $587
line 1197
;1195:
;1196:		// can only follow connected clients
;1197:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
EQI4 $590
line 1198
;1198:			continue;
ADDRGP4 $582
JUMPV
LABELV $590
line 1202
;1199:		}
;1200:
;1201:		// can't follow another spectator
;1202:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $592
line 1203
;1203:			continue;
ADDRGP4 $582
JUMPV
LABELV $592
line 1207
;1204:		}
;1205:
;1206:		// this is good, we can use it
;1207:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1208
;1208:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1209
;1209:		return;
ADDRGP4 $572
JUMPV
LABELV $582
line 1210
;1210:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $581
line 1213
;1211:
;1212:	// leave it where it was
;1213:}
LABELV $572
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1224
;1214:
;1215:
;1216:/*
;1217:==================
;1218:G_Say
;1219:==================
;1220:*/
;1221:
;1222:
;1223:
;1224:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1225
;1225:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $595
line 1226
;1226:		return;
ADDRGP4 $594
JUMPV
LABELV $595
line 1228
;1227:	}
;1228:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $597
line 1229
;1229:		return;
ADDRGP4 $594
JUMPV
LABELV $597
line 1231
;1230:	}
;1231:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $599
line 1232
;1232:		return;
ADDRGP4 $594
JUMPV
LABELV $599
line 1234
;1233:	}
;1234:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $601
line 1235
;1235:		return;
ADDRGP4 $594
JUMPV
LABELV $601
line 1237
;1236:	}
;1237:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $603
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $603
line 1238
;1238:		return;
ADDRGP4 $594
JUMPV
LABELV $603
line 1241
;1239:	}
;1240:	// no chatting to players in tournements
;1241:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $605
ADDRLP4 4
CNSTI4 524
ASGNI4
ADDRLP4 8
CNSTI4 2552
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $605
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $605
line 1243
;1242:		&& other->client->sess.sessionTeam == TEAM_FREE
;1243:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1244
;1244:		return;
ADDRGP4 $594
JUMPV
LABELV $605
line 1247
;1245:	}
;1246:
;1247:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $608
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $612
ADDRLP4 16
ADDRGP4 $609
ASGNP4
ADDRGP4 $613
JUMPV
LABELV $612
ADDRLP4 16
ADDRGP4 $610
ASGNP4
LABELV $613
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1250
;1248:		mode == SAY_TEAM ? "tchat" : "chat",
;1249:		name, Q_COLOR_ESCAPE, color, message));
;1250:}
LABELV $594
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1254
;1251:
;1252:#define EC		"\x19"
;1253:
;1254:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1263
;1255:	int			j;
;1256:	gentity_t	*other;
;1257:	int			color;
;1258:	char		name[64];
;1259:	// don't let text be too long for malicious reasons
;1260:	char		text[MAX_SAY_TEXT];
;1261:	char		location[64];
;1262:
;1263:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $615
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $615
line 1264
;1264:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1265
;1265:	}
LABELV $615
line 1267
;1266:
;1267:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LTI4 $618
ADDRLP4 292
INDIRI4
CNSTI4 3
GTI4 $618
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $638
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $638
address $620
address $623
address $629
address $635
code
LABELV $618
LABELV $620
line 1270
;1268:	default:
;1269:	case SAY_ALL:
;1270:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $621
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1271
;1271:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $622
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1272
;1272:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1273
;1273:		break;
ADDRGP4 $619
JUMPV
LABELV $623
line 1275
;1274:	case SAY_TEAM:
;1275:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $624
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1276
;1276:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $625
line 1277
;1277:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $627
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $626
JUMPV
LABELV $625
line 1280
;1278:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1279:		else
;1280:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $628
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $626
line 1282
;1281:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1282:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1283
;1283:		break;
ADDRGP4 $619
JUMPV
LABELV $629
line 1285
;1284:	case SAY_TELL:
;1285:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $630
ADDRLP4 304
CNSTI4 524
ASGNI4
ADDRLP4 308
CNSTI4 2552
ASGNI4
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
ADDRLP4 312
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
NEI4 $630
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 316
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $630
line 1288
;1286:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1287:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1288:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $633
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $631
JUMPV
LABELV $630
line 1290
;1289:		else
;1290:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $634
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $631
line 1291
;1291:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1292
;1292:		break;
ADDRGP4 $619
JUMPV
LABELV $635
line 1294
;1293:	case SAY_INVAL:
;1294:		G_LogPrintf( "Invalid During Intermission: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $636
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1295
;1295:		Com_sprintf (name, sizeof(name), "[Invalid During Intermission%c%c]: ", Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $637
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1296
;1296:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1297
;1297:		target = ent;
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1298
;1298:		break;
LABELV $619
line 1301
;1299:	}
;1300:
;1301:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1303
;1302:
;1303:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $639
line 1304
;1304:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1305
;1305:		return;
ADDRGP4 $614
JUMPV
LABELV $639
line 1309
;1306:	}
;1307:
;1308:	// echo the text to the console
;1309:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $641
line 1310
;1310:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $644
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1311
;1311:	}
LABELV $641
line 1314
;1312:
;1313:	// send it to all the apropriate clients
;1314:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $645
line 1315
;1315:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1316
;1316:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1317
;1317:	}
LABELV $646
line 1314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $648
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $645
line 1318
;1318:}
LABELV $614
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1326
;1319:
;1320:
;1321:/*
;1322:==================
;1323:Cmd_Say_f
;1324:==================
;1325:*/
;1326:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1329
;1327:	char		*p;
;1328:
;1329:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $651
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $651
line 1330
;1330:		return;
ADDRGP4 $650
JUMPV
LABELV $651
line 1333
;1331:	}
;1332:
;1333:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $653
line 1334
;1334:	{
line 1335
;1335:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1336
;1336:	}
ADDRGP4 $654
JUMPV
LABELV $653
line 1338
;1337:	else
;1338:	{
line 1339
;1339:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1340
;1340:	}
LABELV $654
line 1342
;1341:
;1342:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1343
;1343:}
LABELV $650
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1350
;1344:
;1345:/*
;1346:==================
;1347:Cmd_Tell_f
;1348:==================
;1349:*/
;1350:static void Cmd_Tell_f( gentity_t *ent ) {
line 1356
;1351:	int			targetNum;
;1352:	gentity_t	*target;
;1353:	char		*p;
;1354:	char		arg[MAX_TOKEN_CHARS];
;1355:
;1356:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $656
line 1357
;1357:		return;
ADDRGP4 $655
JUMPV
LABELV $656
line 1360
;1358:	}
;1359:
;1360:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1361
;1361:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1362
;1362:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $661
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $658
LABELV $661
line 1363
;1363:		return;
ADDRGP4 $655
JUMPV
LABELV $658
line 1366
;1364:	}
;1365:
;1366:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1367
;1367:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $665
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $665
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $662
LABELV $665
line 1368
;1368:		return;
ADDRGP4 $655
JUMPV
LABELV $662
line 1371
;1369:	}
;1370:
;1371:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1373
;1372:
;1373:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $666
ARGP4
ADDRLP4 1060
CNSTI4 524
ASGNI4
ADDRLP4 1064
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1374
;1374:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1377
;1375:	// don't tell to the player self if it was already directed to this player
;1376:	// also don't send the chat back to a bot
;1377:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $667
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $667
line 1378
;1378:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1379
;1379:	}
LABELV $667
line 1380
;1380:}
LABELV $655
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1383
;1381:
;1382:
;1383:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1387
;1384:	int color;
;1385:	char *cmd;
;1386:
;1387:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $670
line 1388
;1388:		return;
ADDRGP4 $669
JUMPV
LABELV $670
line 1390
;1389:	}
;1390:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $672
line 1391
;1391:		return;
ADDRGP4 $669
JUMPV
LABELV $672
line 1393
;1392:	}
;1393:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $674
line 1394
;1394:		return;
ADDRGP4 $669
JUMPV
LABELV $674
line 1396
;1395:	}
;1396:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $676
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $676
line 1397
;1397:		return;
ADDRGP4 $669
JUMPV
LABELV $676
line 1400
;1398:	}
;1399:	// no chatting to players in tournements
;1400:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $678
line 1401
;1401:		return;
ADDRGP4 $669
JUMPV
LABELV $678
line 1404
;1402:	}
;1403:
;1404:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $681
line 1405
;1405:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1406
;1406:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $683
ASGNP4
line 1407
;1407:	}
ADDRGP4 $682
JUMPV
LABELV $681
line 1408
;1408:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $684
line 1409
;1409:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1410
;1410:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $686
ASGNP4
line 1411
;1411:	}
ADDRGP4 $685
JUMPV
LABELV $684
line 1412
;1412:	else {
line 1413
;1413:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1414
;1414:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $687
ASGNP4
line 1415
;1415:	}
LABELV $685
LABELV $682
line 1417
;1416:
;1417:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $688
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1418
;1418:}
LABELV $669
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1420
;1419:
;1420:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1424
;1421:	int			j;
;1422:	gentity_t	*other;
;1423:
;1424:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $690
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $690
line 1425
;1425:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1426
;1426:	}
LABELV $690
line 1428
;1427:
;1428:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $693
line 1429
;1429:		G_VoiceTo( ent, target, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1430
;1430:		return;
ADDRGP4 $689
JUMPV
LABELV $693
line 1434
;1431:	}
;1432:
;1433:	// echo the text to the console
;1434:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $695
line 1435
;1435:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $698
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1436
;1436:	}
LABELV $695
line 1439
;1437:
;1438:	// send it to all the apropriate clients
;1439:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $702
JUMPV
LABELV $699
line 1440
;1440:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1441
;1441:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1442
;1442:	}
LABELV $700
line 1439
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $702
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $699
line 1443
;1443:}
LABELV $689
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1450
;1444:
;1445:/*
;1446:==================
;1447:Cmd_Voice_f
;1448:==================
;1449:*/
;1450:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1453
;1451:	char		*p;
;1452:
;1453:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $705
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $705
line 1454
;1454:		return;
ADDRGP4 $704
JUMPV
LABELV $705
line 1457
;1455:	}
;1456:
;1457:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $707
line 1458
;1458:	{
line 1459
;1459:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1460
;1460:	}
ADDRGP4 $708
JUMPV
LABELV $707
line 1462
;1461:	else
;1462:	{
line 1463
;1463:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1464
;1464:	}
LABELV $708
line 1466
;1465:
;1466:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1467
;1467:}
LABELV $704
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1474
;1468:
;1469:/*
;1470:==================
;1471:Cmd_VoiceTell_f
;1472:==================
;1473:*/
;1474:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1480
;1475:	int			targetNum;
;1476:	gentity_t	*target;
;1477:	char		*id;
;1478:	char		arg[MAX_TOKEN_CHARS];
;1479:
;1480:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $710
line 1481
;1481:		return;
ADDRGP4 $709
JUMPV
LABELV $710
line 1484
;1482:	}
;1483:
;1484:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1485
;1485:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1486
;1486:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $715
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $712
LABELV $715
line 1487
;1487:		return;
ADDRGP4 $709
JUMPV
LABELV $712
line 1490
;1488:	}
;1489:
;1490:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1491
;1491:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $719
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $719
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $716
LABELV $719
line 1492
;1492:		return;
ADDRGP4 $709
JUMPV
LABELV $716
line 1495
;1493:	}
;1494:
;1495:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1497
;1496:
;1497:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $720
ARGP4
ADDRLP4 1060
CNSTI4 524
ASGNI4
ADDRLP4 1064
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1498
;1498:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1501
;1499:	// don't tell to the player self if it was already directed to this player
;1500:	// also don't send the chat back to a bot
;1501:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $721
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $721
line 1502
;1502:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1503
;1503:	}
LABELV $721
line 1504
;1504:}
LABELV $709
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1512
;1505:
;1506:
;1507:/*
;1508:==================
;1509:Cmd_VoiceTaunt_f
;1510:==================
;1511:*/
;1512:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1516
;1513:	gentity_t *who;
;1514:	int i;
;1515:
;1516:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $724
line 1517
;1517:		return;
ADDRGP4 $723
JUMPV
LABELV $724
line 1521
;1518:	}
;1519:
;1520:	// insult someone who just killed you
;1521:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $726
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $726
ADDRLP4 20
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $726
line 1523
;1522:		// i am a dead corpse
;1523:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $728
line 1524
;1524:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $730
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1525
;1525:		}
LABELV $728
line 1526
;1526:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $731
line 1527
;1527:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $730
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1528
;1528:		}
LABELV $731
line 1529
;1529:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 1530
;1530:		return;
ADDRGP4 $723
JUMPV
LABELV $726
line 1533
;1531:	}
;1532:	// insult someone you just killed
;1533:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $733
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $733
line 1534
;1534:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1535
;1535:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $735
line 1537
;1536:			// who is the person I just killed
;1537:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2660
ADDP4
INDIRI4
CNSTI4 2
NEI4 $737
line 1538
;1538:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $739
line 1539
;1539:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $741
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1540
;1540:				}
LABELV $739
line 1541
;1541:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $738
line 1542
;1542:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $741
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1543
;1543:				}
line 1544
;1544:			} else {
ADDRGP4 $738
JUMPV
LABELV $737
line 1545
;1545:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $744
line 1546
;1546:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $746
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1547
;1547:				}
LABELV $744
line 1548
;1548:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $747
line 1549
;1549:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $746
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1550
;1550:				}
LABELV $747
line 1551
;1551:			}
LABELV $738
line 1552
;1552:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 -1
ASGNI4
line 1553
;1553:			return;
ADDRGP4 $723
JUMPV
LABELV $735
line 1555
;1554:		}
;1555:	}
LABELV $733
line 1557
;1556:
;1557:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $749
line 1559
;1558:		// praise a team mate who just got a reward
;1559:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $752
line 1560
;1560:			who = g_entities + i;
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1561
;1561:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 36
CNSTI4 524
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $756
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $756
ADDRLP4 48
CNSTI4 2552
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $756
line 1562
;1562:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $758
line 1563
;1563:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $761
line 1564
;1564:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $763
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1565
;1565:					}
LABELV $761
line 1566
;1566:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $723
line 1567
;1567:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $763
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1568
;1568:					}
line 1569
;1569:					return;
ADDRGP4 $723
JUMPV
LABELV $758
line 1571
;1570:				}
;1571:			}
LABELV $756
line 1572
;1572:		}
LABELV $753
line 1559
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $752
line 1573
;1573:	}
LABELV $749
line 1576
;1574:
;1575:	// just say something
;1576:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $766
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1577
;1577:}
LABELV $723
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $767
address $768
address $769
address $770
address $771
address $772
address $773
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1591
;1578:
;1579:
;1580:
;1581:static char	*gc_orders[] = {
;1582:	"hold your position",
;1583:	"hold this position",
;1584:	"come here",
;1585:	"cover me",
;1586:	"guard location",
;1587:	"search and destroy",
;1588:	"report"
;1589:};
;1590:
;1591:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1596
;1592:	int		player;
;1593:	int		order;
;1594:	char	str[MAX_TOKEN_CHARS];
;1595:
;1596:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1597
;1597:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1598
;1598:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1599
;1599:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1601
;1600:
;1601:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $777
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $775
LABELV $777
line 1602
;1602:		return;
ADDRGP4 $774
JUMPV
LABELV $775
line 1604
;1603:	}
;1604:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $780
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $778
LABELV $780
line 1605
;1605:		return;
ADDRGP4 $774
JUMPV
LABELV $778
line 1607
;1606:	}
;1607:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 924
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1048
CNSTI4 2
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1048
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1608
;1608:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 2
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1056
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1609
;1609:}
LABELV $774
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1616
;1610:
;1611:/*
;1612:==================
;1613:Cmd_Where_f
;1614:==================
;1615:*/
;1616:void Cmd_Where_f( gentity_t *ent ) {
line 1617
;1617:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $782
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1618
;1618:}
LABELV $781
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $783
address $784
address $785
address $786
address $787
address $788
address $789
address $790
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3136 24
line 1636
;1619:
;1620:static const char *gameNames[] = {
;1621:	"Free For All",
;1622:	"Tournament",
;1623:	"Single Player",
;1624:	"Team Deathmatch",
;1625:	"Capture the Flag",
;1626:	"One Flag CTF",
;1627:	"Overload",
;1628:	"Harvester"
;1629:};
;1630:
;1631:/*
;1632:==================
;1633:Cmd_CallVote_f
;1634:==================
;1635:*/
;1636:void Cmd_CallVote_f( gentity_t *ent ) {
line 1641
;1637:	int		i;
;1638:	char	arg1[MAX_STRING_TOKENS];
;1639:	char	arg2[MAX_STRING_TOKENS];
;1640:
;1641:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $792
line 1642
;1642:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $795
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1643
;1643:		return;
ADDRGP4 $791
JUMPV
LABELV $792
line 1646
;1644:	}
;1645:
;1646:	if ( level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
EQI4 $796
line 1647
;1647:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $799
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1648
;1648:		return;
ADDRGP4 $791
JUMPV
LABELV $796
line 1650
;1649:	}
;1650:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $800
line 1651
;1651:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $802
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1652
;1652:		return;
ADDRGP4 $791
JUMPV
LABELV $800
line 1654
;1653:	}
;1654:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $803
line 1655
;1655:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $805
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1656
;1656:		return;
ADDRGP4 $791
JUMPV
LABELV $803
line 1660
;1657:	}
;1658:
;1659:	// make sure it is a valid command to vote on
;1660:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1661
;1661:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1663
;1662:
;1663:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $808
ADDRLP4 1028
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2056
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $806
LABELV $808
line 1664
;1664:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1665
;1665:		return;
ADDRGP4 $791
JUMPV
LABELV $806
line 1668
;1666:	}
;1667:
;1668:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $810
line 1669
;1669:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 4
ARGP4
ADDRGP4 $815
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $813
line 1670
;1670:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $814
JUMPV
LABELV $813
ADDRLP4 4
ARGP4
ADDRGP4 $818
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $816
line 1671
;1671:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $817
JUMPV
LABELV $816
ADDRLP4 4
ARGP4
ADDRGP4 $821
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $819
line 1672
;1672:	} else if ( !Q_stricmp( arg1, "balanceteams" ) ) {
ADDRGP4 $820
JUMPV
LABELV $819
ADDRLP4 4
ARGP4
ADDRGP4 $824
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $822
line 1673
;1673:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $823
JUMPV
LABELV $822
ADDRLP4 4
ARGP4
ADDRGP4 $827
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $825
line 1674
;1674:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $826
JUMPV
LABELV $825
ADDRLP4 4
ARGP4
ADDRGP4 $830
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $828
line 1675
;1675:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $829
JUMPV
LABELV $828
ADDRLP4 4
ARGP4
ADDRGP4 $833
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $831
line 1676
;1676:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $832
JUMPV
LABELV $831
ADDRLP4 4
ARGP4
ADDRGP4 $836
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $834
line 1677
;1677:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $835
JUMPV
LABELV $834
ADDRLP4 4
ARGP4
ADDRGP4 $839
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $837
line 1678
;1678:	} else {
ADDRGP4 $838
JUMPV
LABELV $837
line 1679
;1679:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1680
;1680:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1681
;1681:		return;
ADDRGP4 $791
JUMPV
LABELV $838
LABELV $835
LABELV $832
LABELV $829
LABELV $826
LABELV $823
LABELV $820
LABELV $817
LABELV $814
LABELV $811
line 1685
;1682:	}
;1683:
;1684:	// if there is still a vote to be executed
;1685:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2420
INDIRI4
CNSTI4 0
EQI4 $841
line 1686
;1686:		level.voteExecuteTime = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1687
;1687:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $845
ARGP4
ADDRGP4 level+368
ARGP4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1688
;1688:	}
LABELV $841
line 1691
;1689:
;1690:	// special case for g_gametype, check for bad values
;1691:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $821
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $847
line 1692
;1692:		i = atoi( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2104
INDIRI4
ASGNI4
line 1693
;1693:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $852
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $852
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $849
LABELV $852
line 1694
;1694:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $853
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1695
;1695:			return;
ADDRGP4 $791
JUMPV
LABELV $849
line 1698
;1696:		}
;1697:
;1698:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $856
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1699
;1699:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $859
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1700
;1700:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $848
JUMPV
LABELV $847
ADDRLP4 4
ARGP4
ADDRGP4 $818
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $860
line 1705
;1701:		// special case for map changes, we want to reset the nextmap setting
;1702:		// this allows a player to change maps, but not upset the map rotation
;1703:		char	s[MAX_STRING_CHARS];
;1704:
;1705:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $815
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1706
;1706:		if (*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $862
line 1707
;1707:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $866
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2108
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1708
;1708:		} else {
ADDRGP4 $863
JUMPV
LABELV $862
line 1709
;1709:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $859
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1710
;1710:		}
LABELV $863
line 1711
;1711:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $871
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1712
;1712:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $861
JUMPV
LABELV $860
ADDRLP4 4
ARGP4
ADDRGP4 $815
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $873
line 1715
;1713:		char	s[MAX_STRING_CHARS];
;1714:
;1715:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $815
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1716
;1716:		if (!*s) {
ADDRLP4 2112
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $875
line 1717
;1717:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $877
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1718
;1718:			return;
ADDRGP4 $791
JUMPV
LABELV $875
line 1720
;1719:		}
;1720:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $880
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1721
;1721:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $871
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1722
;1722:	} else {
ADDRGP4 $874
JUMPV
LABELV $873
line 1723
;1723:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $886
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1724
;1724:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $871
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1725
;1725:	}
LABELV $874
LABELV $861
LABELV $848
line 1727
;1726:
;1727:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $890
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 2112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1730
;1728:
;1729:	// start the voting, the caller autoamtically votes yes
;1730:	level.voteTime = level.time;
ADDRGP4 level+2416
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1731
;1731:	level.voteYes = 1;
ADDRGP4 level+2424
CNSTI4 1
ASGNI4
line 1732
;1732:	level.voteNo = 0;
ADDRGP4 level+2428
CNSTI4 0
ASGNI4
line 1734
;1733:
;1734:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $898
JUMPV
LABELV $895
line 1735
;1735:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2116
INDIRP4
ADDRLP4 2116
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1736
;1736:	}
LABELV $896
line 1734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $898
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $895
line 1737
;1737:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2116
INDIRP4
ADDRLP4 2116
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1739
;1738:
;1739:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $900
ARGP4
ADDRGP4 level+2416
INDIRI4
ARGI4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1740
;1740:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1392
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1741
;1741:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $900
ARGP4
ADDRGP4 level+2424
INDIRI4
ARGI4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1742
;1742:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $900
ARGP4
ADDRGP4 level+2428
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1743
;1743:}
LABELV $791
endproc Cmd_CallVote_f 3136 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1750
;1744:
;1745:/*
;1746:==================
;1747:Cmd_Vote_f
;1748:==================
;1749:*/
;1750:void Cmd_Vote_f( gentity_t *ent ) {
line 1753
;1751:	char		msg[64];
;1752:
;1753:	if ( !level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
NEI4 $906
line 1754
;1754:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $909
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1755
;1755:		return;
ADDRGP4 $905
JUMPV
LABELV $906
line 1757
;1756:	}
;1757:	if ( ent->client->ps.eFlags & EF_VOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $910
line 1758
;1758:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $912
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1759
;1759:		return;
ADDRGP4 $905
JUMPV
LABELV $910
line 1761
;1760:	}
;1761:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $913
line 1762
;1762:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $915
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1763
;1763:		return;
ADDRGP4 $905
JUMPV
LABELV $913
line 1766
;1764:	}
;1765:
;1766:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $916
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1768
;1767:
;1768:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1770
;1769:
;1770:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1772
;1771:
;1772:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $922
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $922
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $917
LABELV $922
line 1773
;1773:		level.voteYes++;
ADDRLP4 68
ADDRGP4 level+2424
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1774
;1774:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $900
ARGP4
ADDRGP4 level+2424
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1775
;1775:	} else {
ADDRGP4 $918
JUMPV
LABELV $917
line 1776
;1776:		level.voteNo++;
ADDRLP4 68
ADDRGP4 level+2428
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1777
;1777:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $900
ARGP4
ADDRGP4 level+2428
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1778
;1778:	}
LABELV $918
line 1782
;1779:
;1780:	// a majority will be determined in CheckVote, which will also account
;1781:	// for players entering or leaving
;1782:}
LABELV $905
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1789
;1783:
;1784:/*
;1785:==================
;1786:Cmd_CallTeamVote_f
;1787:==================
;1788:*/
;1789:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1794
;1790:	int		i, team, cs_offset;
;1791:	char	arg1[MAX_STRING_TOKENS];
;1792:	char	arg2[MAX_STRING_TOKENS];
;1793:
;1794:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1795
;1795:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $928
line 1796
;1796:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $929
JUMPV
LABELV $928
line 1797
;1797:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $927
line 1798
;1798:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1800
;1799:	else
;1800:		return;
LABELV $931
LABELV $929
line 1802
;1801:
;1802:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $932
line 1803
;1803:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $795
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1804
;1804:		return;
ADDRGP4 $927
JUMPV
LABELV $932
line 1807
;1805:	}
;1806:
;1807:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $935
line 1808
;1808:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $938
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1809
;1809:		return;
ADDRGP4 $927
JUMPV
LABELV $935
line 1811
;1810:	}
;1811:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $939
line 1812
;1812:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $941
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1813
;1813:		return;
ADDRGP4 $927
JUMPV
LABELV $939
line 1815
;1814:	}
;1815:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $942
line 1816
;1816:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $805
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1817
;1817:		return;
ADDRGP4 $927
JUMPV
LABELV $942
line 1821
;1818:	}
;1819:
;1820:	// make sure it is a valid command to vote on
;1821:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1822
;1822:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1823
;1823:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $947
JUMPV
LABELV $944
line 1824
;1824:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $948
line 1825
;1825:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $950
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $948
line 1826
;1826:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1827
;1827:	}
LABELV $945
line 1823
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $947
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $944
line 1829
;1828:
;1829:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $953
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $951
LABELV $953
line 1830
;1830:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1831
;1831:		return;
ADDRGP4 $927
JUMPV
LABELV $951
line 1834
;1832:	}
;1833:
;1834:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $956
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $954
line 1837
;1835:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1836:
;1837:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $957
line 1838
;1838:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1839
;1839:		}
ADDRGP4 $958
JUMPV
LABELV $957
line 1840
;1840:		else {
line 1842
;1841:			// numeric values are just slot numbers
;1842:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $959
line 1843
;1843:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2148
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
EQI4 $966
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $966
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $963
LABELV $966
line 1844
;1844:					break;
ADDRGP4 $961
JUMPV
LABELV $963
line 1845
;1845:			}
LABELV $960
line 1842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $959
LABELV $961
line 1846
;1846:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $969
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $967
LABELV $969
line 1847
;1847:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2152
INDIRI4
ASGNI4
line 1848
;1848:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $973
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $970
LABELV $973
line 1849
;1849:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $304
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1850
;1850:					return;
ADDRGP4 $927
JUMPV
LABELV $970
line 1853
;1851:				}
;1852:
;1853:				if ( !g_entities[i].inuse ) {
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $968
line 1854
;1854:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $307
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1855
;1855:					return;
ADDRGP4 $927
JUMPV
line 1857
;1856:				}
;1857:			}
LABELV $967
line 1858
;1858:			else {
line 1859
;1859:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1860
;1860:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1861
;1861:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $980
JUMPV
LABELV $977
line 1862
;1862:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
CNSTI4 0
NEI4 $982
line 1863
;1863:						continue;
ADDRGP4 $978
JUMPV
LABELV $982
line 1864
;1864:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $984
line 1865
;1865:						continue;
ADDRGP4 $978
JUMPV
LABELV $984
line 1866
;1866:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1867
;1867:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1868
;1868:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2076
ARGP4
ADDRLP4 2112
ARGP4
ADDRLP4 2152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $986
line 1869
;1869:						break;
ADDRGP4 $979
JUMPV
LABELV $986
line 1871
;1870:					}
;1871:				}
LABELV $978
line 1861
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $980
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $977
LABELV $979
line 1872
;1872:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $988
line 1873
;1873:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $991
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1874
;1874:					return;
ADDRGP4 $927
JUMPV
LABELV $988
line 1876
;1875:				}
;1876:			}
LABELV $968
line 1877
;1877:		}
LABELV $958
line 1878
;1878:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $410
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1879
;1879:	} else {
ADDRGP4 $955
JUMPV
LABELV $954
line 1880
;1880:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1881
;1881:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $992
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1882
;1882:		return;
ADDRGP4 $927
JUMPV
LABELV $955
line 1885
;1883:	}
;1884:
;1885:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $859
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1887
;1886:
;1887:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $998
JUMPV
LABELV $995
line 1888
;1888:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
CNSTI4 0
NEI4 $1000
line 1889
;1889:			continue;
ADDRGP4 $996
JUMPV
LABELV $1000
line 1890
;1890:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1002
line 1891
;1891:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $1004
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1002
line 1892
;1892:	}
LABELV $996
line 1887
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $998
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $995
line 1895
;1893:
;1894:	// start the voting, the caller autoamtically votes yes
;1895:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1896
;1896:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 1
ASGNI4
line 1897
;1897:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 1899
;1898:
;1899:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1012
JUMPV
LABELV $1009
line 1900
;1900:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1014
line 1901
;1901:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
LABELV $1014
line 1902
;1902:	}
LABELV $1010
line 1899
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1012
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1009
line 1903
;1903:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2076
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1905
;1904:
;1905:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $900
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1906
;1906:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1907
;1907:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $900
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1908
;1908:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $900
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1909
;1909:}
LABELV $927
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_ListPlayers_f
proc Cmd_ListPlayers_f 2108 16
line 1920
;1910:
;1911:
;1912:
;1913:/*
;1914:======================================
;1915:  ListPlayers
;1916:
;1917:  Please clean this up
;1918:======================================
;1919:*/
;1920:void Cmd_ListPlayers_f ( gentity_t *ent ) {
line 1933
;1921:
;1922:int		i;
;1923:int		j;
;1924:int		l;
;1925:int		h;
;1926:int		clientNum;
;1927:int		ping;
;1928:int		score;
;1929:char	userinfo[MAX_INFO_STRING];
;1930:char	*value;
;1931:char		n2[MAX_STRING_CHARS];
;1932:		
;1933:		trap_SendServerCommand( ent-g_entities, va("print \"CLIENT LIST\""));
ADDRGP4 $1021
ARGP4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1934
;1934:		trap_SendServerCommand( ent-g_entities, va("print \"Client  -  Name                   - Ping   -  Score - GUID\""));
ADDRGP4 $1022
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1935
;1935:		trap_SendServerCommand( ent-g_entities, va("print \"---------------------------------------------------------------------------------------\""));
ADDRGP4 $1023
ARGP4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1937
;1936:
;1937:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1027
JUMPV
LABELV $1024
line 1939
;1938:	
;1939:			if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1029
line 1940
;1940:				continue;
ADDRGP4 $1025
JUMPV
LABELV $1029
line 1943
;1941:			}
;1942:				
;1943:			clientNum = level.clients[i].ps.clientNum;
ADDRLP4 12
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1945
;1944:			
;1945:			ping = level.clients[i].ps.ping;
ADDRLP4 2068
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1946
;1946:			score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 2072
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1948
;1947:			
;1948:			trap_SendServerCommand( ent-g_entities, va("print \"%i  - %s\"", clientNum, level.clients[i].pers.netname ));
ADDRGP4 $1031
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1950
;1949:			
;1950:			SanitizeString( level.clients[i].pers.netname, n2 );
CNSTI4 3464
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 1951
;1951:			Q_CleanStr(n2);
ADDRLP4 1040
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1952
;1952:			l = strlen(n2);
ADDRLP4 1040
ARGP4
ADDRLP4 2096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
ADDRLP4 2096
INDIRI4
ASGNI4
line 1953
;1953:			h = 20 - l;
ADDRLP4 4
CNSTI4 20
ADDRLP4 2064
INDIRI4
SUBI4
ASGNI4
line 1954
;1954:				for ( j = 0 ; j < h ; j++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1035
JUMPV
LABELV $1032
line 1955
;1955:					G_Printf(" ");
ADDRGP4 $950
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1956
;1956:				}
LABELV $1033
line 1954
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1035
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1032
line 1957
;1957:			trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1958
;1958:			value = Info_ValueForKey (userinfo, "cl_guid");
ADDRLP4 16
ARGP4
ADDRGP4 $1036
ARGP4
ADDRLP4 2100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2076
ADDRLP4 2100
INDIRP4
ASGNP4
line 1959
;1959:			trap_SendServerCommand( ent-g_entities, va("print \"  -  %i  -  %i  -  %s\n\"", ping, score, value ));
ADDRGP4 $1037
ARGP4
ADDRLP4 2068
INDIRI4
ARGI4
ADDRLP4 2072
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1961
;1960:		
;1961:		}
LABELV $1025
line 1937
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1027
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1024
line 1963
;1962:
;1963:}
LABELV $1020
endproc Cmd_ListPlayers_f 2108 16
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 1970
;1964:
;1965:/*
;1966:==================
;1967:Cmd_TeamVote_f
;1968:==================
;1969:*/
;1970:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1974
;1971:	int			team, cs_offset;
;1972:	char		msg[64];
;1973:
;1974:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1975
;1975:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1039
line 1976
;1976:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1040
JUMPV
LABELV $1039
line 1977
;1977:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $1038
line 1978
;1978:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1980
;1979:	else
;1980:		return;
LABELV $1042
LABELV $1040
line 1982
;1981:
;1982:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1043
line 1983
;1983:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $1046
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1984
;1984:		return;
ADDRGP4 $1038
JUMPV
LABELV $1043
line 1986
;1985:	}
;1986:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $1047
line 1987
;1987:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $1049
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1988
;1988:		return;
ADDRGP4 $1038
JUMPV
LABELV $1047
line 1990
;1989:	}
;1990:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1050
line 1991
;1991:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $915
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1992
;1992:		return;
ADDRGP4 $1038
JUMPV
LABELV $1050
line 1995
;1993:	}
;1994:
;1995:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 $1052
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1997
;1996:
;1997:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1999
;1998:
;1999:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2001
;2000:
;2001:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1058
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1058
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1053
LABELV $1058
line 2002
;2002:		level.teamVoteYes[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
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
line 2003
;2003:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $900
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2004
;2004:	} else {
ADDRGP4 $1054
JUMPV
LABELV $1053
line 2005
;2005:		level.teamVoteNo[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
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
line 2006
;2006:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $900
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2007
;2007:	}
LABELV $1054
line 2011
;2008:
;2009:	// a majority will be determined in TeamCheckVote, which will also account
;2010:	// for players entering or leaving
;2011:}
LABELV $1038
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2019
;2012:
;2013:
;2014:/*
;2015:=================
;2016:Cmd_SetViewpos_f
;2017:=================
;2018:*/
;2019:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 2024
;2020:	vec3_t		origin, angles;
;2021:	char		buffer[MAX_TOKEN_CHARS];
;2022:	int			i;
;2023:
;2024:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1064
line 2025
;2025:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $273
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2026
;2026:		return;
ADDRGP4 $1063
JUMPV
LABELV $1064
line 2028
;2027:	}
;2028:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1067
line 2029
;2029:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1069
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2030
;2030:		return;
ADDRGP4 $1063
JUMPV
LABELV $1067
line 2033
;2031:	}
;2032:
;2033:	VectorClear( angles );
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 2034
;2034:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1072
line 2035
;2035:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2036
;2036:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2037
;2037:	}
LABELV $1073
line 2034
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1072
line 2039
;2038:
;2039:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2040
;2040:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2042
;2041:
;2042:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 2043
;2043:}
LABELV $1063
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 2052
;2044:
;2045:
;2046:
;2047:/*
;2048:=================
;2049:Cmd_Stats_f
;2050:=================
;2051:*/
;2052:void Cmd_Stats_f( gentity_t *ent ) {
line 2067
;2053:/*
;2054:	int max, n, i;
;2055:
;2056:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;2057:
;2058:	n = 0;
;2059:	for ( i = 0; i < max; i++ ) {
;2060:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;2061:			n++;
;2062:	}
;2063:
;2064:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;2065:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;2066:*/
;2067:}
LABELV $1077
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1192 16
line 2074
;2068:
;2069:/*
;2070:=================
;2071:ClientCommand
;2072:=================
;2073:*/
;2074:void ClientCommand( int clientNum ) {
line 2078
;2075:	gentity_t *ent;
;2076:	char	cmd[MAX_TOKEN_CHARS];
;2077:
;2078:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2079
;2079:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1079
line 2080
;2080:		return;		// not fully in game yet
ADDRGP4 $1078
JUMPV
LABELV $1079
line 2084
;2081:	}
;2082:
;2083:
;2084:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2086
;2085:
;2086:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1083
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1081
line 2087
;2087:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2088
;2088:		return;
ADDRGP4 $1078
JUMPV
LABELV $1081
line 2090
;2089:	}
;2090:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1086
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1084
line 2091
;2091:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2092
;2092:		return;
ADDRGP4 $1078
JUMPV
LABELV $1084
line 2094
;2093:	}
;2094:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1089
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1087
line 2095
;2095:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2096
;2096:		return;
ADDRGP4 $1078
JUMPV
LABELV $1087
line 2098
;2097:	}
;2098:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1092
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1090
line 2099
;2099:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2100
;2100:		return;
ADDRGP4 $1078
JUMPV
LABELV $1090
line 2102
;2101:	}
;2102:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1095
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1093
line 2103
;2103:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2104
;2104:		return;
ADDRGP4 $1078
JUMPV
LABELV $1093
line 2106
;2105:	}
;2106:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $686
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1096
line 2107
;2107:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2108
;2108:		return;
ADDRGP4 $1078
JUMPV
LABELV $1096
line 2110
;2109:	}
;2110:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1100
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1098
line 2111
;2111:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2112
;2112:		return;
ADDRGP4 $1078
JUMPV
LABELV $1098
line 2114
;2113:	}
;2114:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1103
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1101
line 2115
;2115:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2116
;2116:		return;
ADDRGP4 $1078
JUMPV
LABELV $1101
line 2118
;2117:	}
;2118:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1106
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1104
line 2119
;2119:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2120
;2120:		return;
ADDRGP4 $1078
JUMPV
LABELV $1104
line 2122
;2121:	}
;2122:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1109
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1107
line 2123
;2123:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2124
;2124:		return;
ADDRGP4 $1078
JUMPV
LABELV $1107
line 2126
;2125:	}
;2126:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1110
line 2127
;2127:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2128
;2128:		return;
ADDRGP4 $1078
JUMPV
LABELV $1110
line 2132
;2129:	}
;2130:
;2131:	// ignore all other commands when at intermission
;2132:	if (level.intermissiontime) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $1112
line 2133
;2133:		Cmd_Say_f (ent, SAY_INVAL, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2134
;2134:		return;
ADDRGP4 $1078
JUMPV
LABELV $1112
line 2137
;2135:	}
;2136:
;2137:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1117
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1115
line 2138
;2138:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2139
;2139:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1120
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1118
line 2140
;2140:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1119
JUMPV
LABELV $1118
line 2141
;2141:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1123
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1121
line 2142
;2142:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1122
JUMPV
LABELV $1121
line 2143
;2143:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1126
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1124
line 2144
;2144:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1125
JUMPV
LABELV $1124
line 2145
;2145:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1129
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1127
line 2146
;2146:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1128
JUMPV
LABELV $1127
line 2147
;2147:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1130
line 2148
;2148:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1131
JUMPV
LABELV $1130
line 2149
;2149:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1134
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1132
line 2150
;2150:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2151
;2151:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1135
line 2152
;2152:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1136
JUMPV
LABELV $1135
line 2153
;2153:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1140
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1138
line 2154
;2154:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2155
;2155:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1143
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1141
line 2156
;2156:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1142
JUMPV
LABELV $1141
line 2157
;2157:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1146
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1144
line 2158
;2158:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2159
;2159:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1149
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1147
line 2160
;2160:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2161
;2161:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1150
line 2162
;2162:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2163
;2163:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1153
line 2164
;2164:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2165
;2165:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1156
line 2166
;2166:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2167
;2167:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1159
line 2168
;2168:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1160
JUMPV
LABELV $1159
line 2169
;2169:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1164
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1162
line 2170
;2170:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1163
JUMPV
LABELV $1162
line 2171
;2171:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1167
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1165
line 2172
;2172:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2173
;2173:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1170
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1168
line 2174
;2174:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1169
JUMPV
LABELV $1168
line 2175
;2175:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1173
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1171
line 2176
;2176:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $1172
JUMPV
LABELV $1171
line 2177
;2177:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1176
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1174
line 2178
;2178:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $1175
JUMPV
LABELV $1174
line 2179
;2179:	else if (Q_stricmp (cmd, "spawnturret") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1177
line 2180
;2180:		Cmd_SpawnTurret_f( ent, 0 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2181
;2181:	else if (Q_stricmp (cmd, "spawnturret2") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1182
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1180
line 2182
;2182:		Cmd_SpawnTurret_f( ent, 1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1181
JUMPV
LABELV $1180
line 2183
;2183:	else if (Q_stricmp (cmd, "spawnturret3") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1185
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1183
line 2184
;2184:		Cmd_SpawnTurret_f( ent, 2 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2185
;2185:	else if (Q_stricmp (cmd, "spawngen") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1188
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1186
line 2186
;2186:		Cmd_SpawnGenerator_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnGenerator_f
CALLV
pop
ADDRGP4 $1187
JUMPV
LABELV $1186
line 2187
;2187:	else if (Q_stricmp (cmd, "spawnmc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1191
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $1189
line 2188
;2188:		Cmd_SpawnMC_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnMC_f
CALLV
pop
ADDRGP4 $1190
JUMPV
LABELV $1189
line 2189
;2189:	else if (Q_stricmp (cmd, "spawntd") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1194
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $1192
line 2190
;2190:		Cmd_SpawnDisplacer_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnDisplacer_f
CALLV
pop
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2191
;2191:	else if (Q_stricmp (cmd, "listplayers") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1195
line 2192
;2192:		Cmd_ListPlayers_f( ent ); 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ListPlayers_f
CALLV
pop
ADDRGP4 $1196
JUMPV
LABELV $1195
line 2193
;2193:	else if (Q_stricmp (cmd, "test") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1200
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1198
line 2194
;2194:		Cmd_Test_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Test_f
CALLV
pop
ADDRGP4 $1199
JUMPV
LABELV $1198
line 2196
;2195:	else
;2196:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1201
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1199
LABELV $1196
LABELV $1193
LABELV $1190
LABELV $1187
LABELV $1184
LABELV $1181
LABELV $1178
LABELV $1175
LABELV $1172
LABELV $1169
LABELV $1166
LABELV $1163
LABELV $1160
LABELV $1157
LABELV $1154
LABELV $1151
LABELV $1148
LABELV $1145
LABELV $1142
LABELV $1139
LABELV $1136
LABELV $1133
LABELV $1131
LABELV $1128
LABELV $1125
LABELV $1122
LABELV $1119
LABELV $1116
line 2197
;2197:}
LABELV $1078
endproc ClientCommand 1192 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 2207
;2198:
;2199:/*
;2200:============================
;2201:G_SendCommandToClient
;2202:Send the given command to the specified (or all) clients
;2203:Shafe - Trep - This is for the Radar
;2204:============================
;2205:*/
;2206:void G_SendCommandToClient (gentity_t *to, char *cmd)
;2207:{
line 2208
;2208:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1203
line 2209
;2209:	{
line 2211
;2210:		// send to all clients 
;2211:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2212
;2212:	} else {
ADDRGP4 $1204
JUMPV
LABELV $1203
line 2214
;2213:    // send to specified client
;2214:    trap_SendServerCommand ( to-g_entities, cmd);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2215
;2215:	}
LABELV $1204
line 2216
;2216:}
LABELV $1202
endproc G_SendCommandToClient 0 8
import Team_ReturnFlagSound
import CheckPlayerPostions
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
LABELV $1201
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1200
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1197
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1194
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $1191
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $1188
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1185
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $1182
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $1179
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1176
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1173
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $1170
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1167
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $1164
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1161
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1158
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1155
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1152
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1149
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1146
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1143
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $1140
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $1137
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1134
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1129
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1126
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1123
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1120
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1117
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1109
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1106
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1103
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1100
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1095
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1092
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1089
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1086
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1083
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1069
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1052
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1049
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1046
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1037
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1036
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $1031
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1023
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 34
byte 1 0
align 1
LABELV $1022
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 32
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 45
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 34
byte 1 0
align 1
LABELV $1021
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 84
byte 1 32
byte 1 76
byte 1 73
byte 1 83
byte 1 84
byte 1 34
byte 1 0
align 1
LABELV $1004
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
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $992
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $991
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
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $956
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $950
byte 1 32
byte 1 0
align 1
LABELV $941
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $938
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $916
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $915
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $912
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $909
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $900
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $890
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
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $886
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $880
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $877
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $871
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $866
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $859
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $856
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $853
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $845
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $840
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 62
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 44
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $839
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $836
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $833
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $830
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $827
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $824
byte 1 98
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $821
byte 1 103
byte 1 95
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
LABELV $818
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $815
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $812
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $809
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $805
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $802
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $799
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $795
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $790
byte 1 72
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
LABELV $789
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $788
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $787
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $786
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
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
LABELV $785
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $784
byte 1 84
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
LABELV $783
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $782
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $773
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $772
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $771
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
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
LABELV $770
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $769
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $768
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
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
LABELV $767
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
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
LABELV $766
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $763
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $746
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $741
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $730
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $720
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $698
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $688
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $687
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $686
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $683
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $666
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $644
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $637
byte 1 91
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 68
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
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
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 93
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $636
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 68
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $634
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $633
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $628
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $627
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $624
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $622
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $621
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $610
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $609
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $608
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $580
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $551
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 85
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $547
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 65
byte 1 114
byte 1 101
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
byte 1 32
byte 1 85
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $534
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $528
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $526
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $524
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $522
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $483
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $478
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $467
byte 1 98
byte 1 0
align 1
LABELV $466
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $462
byte 1 114
byte 1 0
align 1
LABELV $461
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $454
byte 1 115
byte 1 0
align 1
LABELV $453
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $450
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $447
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $443
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $442
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $438
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $435
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $434
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
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
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $430
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
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
byte 1 73
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
LABELV $422
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $419
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $410
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $409
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $405
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $404
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $394
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $393
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $387
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $386
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $380
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $379
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $378
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $366
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $363
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $360
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $357
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $354
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $348
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $338
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $332
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $326
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $323
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $317
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $307
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $304
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
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
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
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
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $267
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $265
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $263
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 98
byte 1 108
byte 1 117
byte 1 109
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $261
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 114
byte 1 101
byte 1 100
byte 1 109
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $259
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $257
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $255
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 114
byte 1 101
byte 1 100
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $253
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $249
byte 1 94
byte 1 50
byte 1 80
byte 1 68
byte 1 71
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 69
byte 1 115
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $233
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $226
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 79
byte 1 110
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $202
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 89
byte 1 101
byte 1 116
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 73
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 73
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 73
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 89
byte 1 101
byte 1 116
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 83
byte 1 104
byte 1 101
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 83
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 32
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $78
byte 1 99
byte 1 112
byte 1 32
byte 1 34
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
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $75
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 65
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 65
byte 1 32
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
byte 1 46
byte 1 34
byte 1 0
