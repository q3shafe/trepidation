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
CNSTI4 916
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
CNSTI4 916
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
CNSTI4 916
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
CNSTI4 916
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
proc Cmd_SpawnDisplacer_f 8 8
line 113
;110:
;111://BuildDisplacer
;112:void Cmd_SpawnDisplacer_f( gentity_t *ent )
;113:{
line 115
;114:	int	iserror; 
;115:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 117
;116:	
;117:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
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
line 118
;118:	{ // Don't do anything when you are dead -Vincent
line 119
;119:	return;
ADDRGP4 $103
JUMPV
LABELV $104
line 123
;120:	}
;121:
;122:	// You can only Build Displacers in GameMode 3
;123:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $106
line 124
;124:	{
line 126
;125:		// Make sure there's not more than 2
;126:		if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $109
line 127
;127:		{
line 128
;128:			if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $111
line 129
;129:			{
line 130
;130:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 131
;131:			} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 132
;132:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 133
;133:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 134
;134:			}
LABELV $112
line 135
;135:		}
LABELV $109
line 136
;136:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $114
line 137
;137:		{
line 138
;138:			if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $116
line 139
;139:			{
line 140
;140:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 141
;141:			} else {
ADDRGP4 $117
JUMPV
LABELV $116
line 142
;142:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 143
;143:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 144
;144:			}
LABELV $117
line 145
;145:		}
LABELV $114
line 146
;146:	}
LABELV $106
line 148
;147:	
;148:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $119
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $119
line 149
;149:	{
line 150
;150:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $122
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $122
line 151
;151:		{
line 153
;152:			// Make sure there's not more than 2
;153:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $125
line 154
;154:			{
line 155
;155:				if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $127
line 156
;156:				{
line 157
;157:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 158
;158:				} else {
ADDRGP4 $128
JUMPV
LABELV $127
line 159
;159:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 160
;160:					level.redMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 161
;161:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 162
;162:				}
LABELV $128
line 163
;163:			}
LABELV $125
line 164
;164:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $131
line 165
;165:			{
line 166
;166:				if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $133
line 167
;167:				{
line 168
;168:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 169
;169:				} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 170
;170:					level.blueMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 171
;171:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 172
;172:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 173
;173:				}
LABELV $134
line 174
;174:			}
LABELV $131
line 175
;175:		}
LABELV $122
line 178
;176:
;177:
;178:	}		
LABELV $119
line 181
;179:
;180:	// If it couldn't be built tell them why
;181:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $137
line 182
;182:	{
line 184
;183:		// FIXME: Play Error Sound
;184:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Immobilizers..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $139
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $141
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $139
line 185
;185:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizers Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $142
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $142
line 187
;186:		//G_AddEvent( ent, EV_ERROR, 0 );
;187:	}						
LABELV $137
line 189
;188:
;189:}
LABELV $103
endproc Cmd_SpawnDisplacer_f 8 8
export Cmd_SpawnTurret_f
proc Cmd_SpawnTurret_f 12 8
line 192
;190:
;191:void Cmd_SpawnTurret_f( gentity_t *ent , int type )
;192:{
line 195
;193:	int		iserror; 
;194:	int		cts;
;195:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 197
;196:	
;197:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $146
line 198
;198:	{ // Don't do anything when you are dead -Vincent
line 199
;199:	return;
ADDRGP4 $145
JUMPV
LABELV $146
line 203
;200:	}
;201:
;202:	// If Playing GM 3 Check the rules
;203:	if (g_GameMode.integer == 3) {
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $148
line 205
;204:		// What types of turrets are you allowed to build?
;205:		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];
ADDRLP4 4
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
ADDI4
ASGNI4
line 208
;206:		
;207:		// If the rules change This needs to be change in ui_ingame.c as well
;208:		if ((cts < 3) && (type == 1)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $155
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $155
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $155
line 209
;209:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 6
GEI4 $157
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $157
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $157
line 211
;210:
;211:		if (iserror == 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $159
line 212
;212:		{
line 214
;213:			// Be sure there arent too many
;214:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $161
line 215
;215:			{
line 216
;216:				if (level.blueTurrets > 5)  // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $163
line 217
;217:				{
line 218
;218:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 219
;219:				} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 220
;220:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 221
;221:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 222
;222:				}	
LABELV $164
line 223
;223:			}
LABELV $161
line 224
;224:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $166
line 225
;225:			{
line 226
;226:				if (level.redTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $168
line 227
;227:				{
line 228
;228:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 229
;229:				} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 230
;230:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 231
;231:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 232
;232:				}			
LABELV $169
line 233
;233:			}
LABELV $166
line 234
;234:		}
LABELV $159
line 235
;235:	}
LABELV $148
line 239
;236:
;237:	// If playing CTF Make sure that we dont have too many 
;238:	// Turrets on our team.
;239:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $171
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $171
line 240
;240:	{
line 242
;241:		
;242:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $174
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $174
line 243
;243:		{
line 244
;244:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $177
line 245
;245:			{
line 246
;246:				if (level.blueTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $179
line 247
;247:				{
line 248
;248:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 249
;249:				} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 250
;250:					level.blueMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 251
;251:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 252
;252:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 253
;253:				}			
LABELV $180
line 254
;254:			}
LABELV $177
line 255
;255:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $183
line 256
;256:			{
line 257
;257:				if (level.redTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $185
line 258
;258:				{
line 259
;259:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 260
;260:				} else {
ADDRGP4 $186
JUMPV
LABELV $185
line 261
;261:					level.redMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 262
;262:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 263
;263:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 264
;264:				}			
LABELV $186
line 265
;265:			}
LABELV $183
line 266
;266:		}
LABELV $174
line 267
;267:	}
LABELV $171
line 270
;268:	
;269:	// If it couldn't be built tell them why
;270:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $189
line 271
;271:	{
line 273
;272:		// FIXME Play Error Sound
;273:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Turret Type Not Available Yet.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $191
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $193
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $191
line 274
;274:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Turrets On Your Team.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $194
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $196
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $194
line 275
;275:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Turrets Not Allowed Here.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $197
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $197
line 277
;276:		//G_AddEvent( ent, EV_ERROR, 0 );
;277:	}
LABELV $189
line 279
;278:
;279:}
LABELV $145
endproc Cmd_SpawnTurret_f 12 8
export DeathmatchScoreboardMessage
proc DeathmatchScoreboardMessage 2484 68
line 294
;280:/*
;281:=================================================
;282:// End Buildables
;283:=================================================
;284:/*
;285:
;286:
;287:/*
;288:==================
;289:DeathmatchScoreboardMessage
;290:
;291:==================
;292:*/
;293:void DeathmatchScoreboardMessage( gentity_t *ent ) 
;294:{
line 304
;295:	char		entry[1024];
;296:	char		string[1400];
;297:	int			stringlength;
;298:	int			i, j;
;299:	gclient_t	*cl;
;300:	int			numSorted, scoreFlags, accuracy, perfect;
;301:	
;302:
;303:	// send the latest information on all clients
;304:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 305
;305:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 306
;306:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 308
;307:
;308:	numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+84
INDIRI4
ASGNI4
line 310
;309:	
;310:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 313
;311:		int		ping;
;312:
;313:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3456
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
line 315
;314:
;315:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $207
line 316
;316:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 317
;317:		} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 320
;318://unlagged - true ping
;319:			//ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
;320:			ping = cl->pers.realPing < 999 ? cl->pers.realPing : 999;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 999
GEI4 $210
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $210
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $211
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 322
;321://unlagged - true ping
;322:		}
LABELV $208
line 325
;323:
;324:
;325:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 326
;326:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
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
line 327
;327:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 328
;328:		else {
line 329
;329:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 330
;330:		}
LABELV $213
line 331
;331:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
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
NEI4 $215
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $215
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $215
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $216
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 334
;332:
;333:		// Changed cl->ps.persistant[PERS_SCORE] to .truescore
;334:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $217
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
CNSTI4 916
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
line 348
;335:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;336:			
;337:			cl->pers.TrueScore, ping, (level.time - cl->pers.enterTime)/60000,
;338:			
;339:
;340:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;341:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;342:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;343:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;344:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;345:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;346:			perfect,
;347:			cl->ps.persistant[PERS_CAPTURES]);
;348:		j = strlen(entry);
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
line 349
;349:		if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $222
line 350
;350:			break;
ADDRGP4 $204
JUMPV
LABELV $222
line 351
;351:		strcpy (string + stringlength, entry);
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
line 352
;352:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 353
;353:	}
LABELV $203
line 310
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $202
LABELV $204
line 355
;354:
;355:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $224
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 358
;356:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;357:		string ) );
;358:}
LABELV $200
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_TeleGren_f
proc Cmd_TeleGren_f 12 4
line 371
;359:
;360:
;361:/*
;362:
;363:=================
;364:
;365:Cmd_TeleGren_f
;366:Shafe - Trep - PDG
;367:=================
;368:*/
;369:
;370:void Cmd_TeleGren_f (gentity_t *ent) 
;371:{
line 372
;372:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $230
line 373
;373:	{ // Don't do anything when you are dead -Vincent
line 374
;374: 		if ( ent->istelepoint != 0 )
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 375
;375:		{ // Failsafe
line 376
;376:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 377
;377:		VectorClear( ent->teleloc );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 378
;378:		}
line 379
;379:	return;
ADDRGP4 $229
JUMPV
LABELV $230
line 382
;380:	}
;381:
;382:	if ( ent->istelepoint == 1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 1
NEI4 $234
line 383
;383:	{
line 385
;384:		// Shafe The old way was just to drop it now we return flags to base if you try to teleport with one
;385:		if (ent->client->ps.powerups[PW_REDFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $236
line 386
;386:		{
line 387
;387:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 388
;388:			ent->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 389
;389:		}
LABELV $236
line 390
;390:		if (ent->client->ps.powerups[PW_BLUEFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 391
;391:		{
line 392
;392:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 393
;393:			ent->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 394
;394:		}
LABELV $238
line 396
;395:
;396:		VectorCopy( ent->teleloc, ent->client->ps.origin );
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
CNSTI4 820
ADDP4
INDIRB
ASGNB 12
line 397
;397:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 398
;398:		VectorClear( ent->teleloc );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 399
;399:	} 
ADDRGP4 $235
JUMPV
LABELV $234
line 401
;400:	else 
;401:	{
line 402
;402:        G_Printf( S_COLOR_GREEN "PDG Lock Not Established\n" );
ADDRGP4 $240
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 403
;403:	}
LABELV $235
line 404
;404:}
LABELV $229
endproc Cmd_TeleGren_f 12 4
export Cmd_DropFlag_f
proc Cmd_DropFlag_f 0 4
line 416
;405:
;406:/*
;407:
;408:=================
;409:
;410:Cmd_DropFlag_f
;411:Shafe - Trep - PDG
;412:=================
;413:*/
;414:
;415:void Cmd_DropFlag_f (gentity_t *ent) 
;416:{
line 417
;417:Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 418
;418:}
LABELV $241
endproc Cmd_DropFlag_f 0 4
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 429
;419:
;420:
;421:/*
;422:==================
;423:Cmd_Score_f
;424:
;425:Request current scoreboard information
;426:==================
;427:*/
;428:void Cmd_Score_f( gentity_t *ent )
;429:{
line 430
;430:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 431
;431:}
LABELV $242
endproc Cmd_Score_f 0 4
export Cmd_Test_f
proc Cmd_Test_f 32 8
line 434
;432:
;433:void Cmd_Test_f (gentity_t *ent) 
;434:{
line 435
;435:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluegenerators %i\n\"", level.blueGen ));		
ADDRGP4 $244
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 436
;436:		trap_SendServerCommand( ent-g_entities, va("print \" level.redgenerators %i\n\"", level.redGen ));		
ADDRGP4 $246
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 437
;437:		trap_SendServerCommand( ent-g_entities, va("print \" level.blueturrets %i\n\"", level.blueTurrets ));		
ADDRGP4 $248
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 438
;438:		trap_SendServerCommand( ent-g_entities, va("print \" level.redturrets %i\n\"", level.redTurrets ));		
ADDRGP4 $250
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 439
;439:		trap_SendServerCommand( ent-g_entities, va("print \" level.redmc %i\n\"", level.redMC ));		
ADDRGP4 $252
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 440
;440:		trap_SendServerCommand( ent-g_entities, va("print \" level.blumc %i\n\"", level.blueMC ));		
ADDRGP4 $254
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 441
;441:		trap_SendServerCommand( ent-g_entities, va("print \" level.redscorelatched %i\n\"", level.redScoreLatched ));		
ADDRGP4 $256
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 442
;442:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluescorelatched %i\n\"", level.blueScoreLatched ));		
ADDRGP4 $258
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 444
;443:		//trap_SendServerCommand( ent-g_entities, va("print \" level.scoreTime %i\n\"", (level.time-level.scoreTime) ));		
;444:}
LABELV $243
endproc Cmd_Test_f 32 8
export CheatsOk
proc CheatsOk 4 8
line 453
;445:
;446:
;447:/*
;448:==================
;449:CheatsOk
;450:==================
;451:*/
;452:qboolean	CheatsOk( gentity_t *ent ) 
;453:{
line 454
;454:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $261
line 455
;455:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $264
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 456
;456:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $260
JUMPV
LABELV $261
line 459
;457:	}
;458:
;459:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $265
line 460
;460:      trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\"")); 
ADDRGP4 $267
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 461
;461:      return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $260
JUMPV
LABELV $265
line 463
;462:   }
;463:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $268
line 464
;464:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $267
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 465
;465:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $260
JUMPV
LABELV $268
line 467
;466:	}
;467:	return qtrue;
CNSTI4 1
RETI4
LABELV $260
endproc CheatsOk 4 8
bss
align 1
LABELV $271
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 476
;468:}
;469:
;470:
;471:/*
;472:==================
;473:ConcatArgs
;474:==================
;475:*/
;476:char	*ConcatArgs( int start ) {
line 482
;477:	int		i, c, tlen;
;478:	static char	line[MAX_STRING_CHARS];
;479:	int		len;
;480:	char	arg[MAX_STRING_CHARS];
;481:
;482:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 483
;483:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 484
;484:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $275
JUMPV
LABELV $272
line 485
;485:		trap_Argv( i, arg, sizeof( arg ) );
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
line 486
;486:		tlen = strlen( arg );
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
line 487
;487:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $276
line 488
;488:			break;
ADDRGP4 $274
JUMPV
LABELV $276
line 490
;489:		}
;490:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $271
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
line 491
;491:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 492
;492:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $278
line 493
;493:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $271
ADDP4
CNSTI1 32
ASGNI1
line 494
;494:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 495
;495:		}
LABELV $278
line 496
;496:	}
LABELV $273
line 484
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $275
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $272
LABELV $274
line 498
;497:
;498:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $271
ADDP4
CNSTI1 0
ASGNI1
line 500
;499:
;500:	return line;
ADDRGP4 $271
RETP4
LABELV $270
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 510
;501:}
;502:
;503:/*
;504:==================
;505:SanitizeString
;506:
;507:Remove case and control characters
;508:==================
;509:*/
;510:void SanitizeString( char *in, char *out ) {
ADDRGP4 $282
JUMPV
LABELV $281
line 511
;511:	while ( *in ) {
line 512
;512:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $284
line 513
;513:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 514
;514:			continue;
ADDRGP4 $282
JUMPV
LABELV $284
line 516
;515:		}
;516:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $286
line 517
;517:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 518
;518:			continue;
ADDRGP4 $282
JUMPV
LABELV $286
line 520
;519:		}
;520:		*out++ = tolower( *in++ );
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
line 521
;521:	}
LABELV $282
line 511
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $281
line 523
;522:
;523:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 524
;524:}
LABELV $280
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 534
;525:
;526:/*
;527:==================
;528:ClientNumberFromString
;529:
;530:Returns a player number for either a number or name string
;531:Returns -1 if invalid
;532:==================
;533:*/
;534:int ClientNumberFromString( gentity_t *to, char *s ) {
line 541
;535:	gclient_t	*cl;
;536:	int			idnum;
;537:	char		s2[MAX_STRING_CHARS];
;538:	char		n2[MAX_STRING_CHARS];
;539:
;540:	// numeric values are just slot numbers
;541:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $289
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $289
line 542
;542:		idnum = atoi( s );
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
line 543
;543:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $294
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $291
LABELV $294
line 544
;544:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $295
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 545
;545:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $288
JUMPV
LABELV $291
line 548
;546:		}
;547:
;548:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3456
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 549
;549:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $296
line 550
;550:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $298
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 551
;551:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $288
JUMPV
LABELV $296
line 553
;552:		}
;553:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $288
JUMPV
LABELV $289
line 557
;554:	}
;555:
;556:	// check for a name match
;557:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 558
;558:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $302
JUMPV
LABELV $299
line 559
;559:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $304
line 560
;560:			continue;
ADDRGP4 $300
JUMPV
LABELV $304
line 562
;561:		}
;562:		SanitizeString( cl->pers.netname, n2 );
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
line 563
;563:		if ( !strcmp( n2, s2 ) ) {
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
NEI4 $306
line 564
;564:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $288
JUMPV
LABELV $306
line 566
;565:		}
;566:	}
LABELV $300
line 558
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3456
ADDP4
ASGNP4
LABELV $302
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $299
line 568
;567:
;568:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $308
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 569
;569:	return -1;
CNSTI4 -1
RETI4
LABELV $288
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 580
;570:}
;571:
;572:/*
;573:==================
;574:Cmd_Give_f
;575:
;576:Give items to a client
;577:==================
;578:*/
;579:void Cmd_Give_f (gentity_t *ent)
;580:{
line 588
;581:	char		*name;
;582:	gitem_t		*it;
;583:	int			i;
;584:	qboolean	give_all;
;585:	gentity_t		*it_ent;
;586:	trace_t		trace;
;587:
;588:	if ( !CheatsOk( ent ) ) {
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
NEI4 $310
line 589
;589:		return;
ADDRGP4 $309
JUMPV
LABELV $310
line 592
;590:	}
;591:
;592:	name = ConcatArgs( 1 );
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
line 594
;593:
;594:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $312
line 595
;595:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $312
line 597
;596:	else
;597:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $313
line 599
;598:
;599:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $318
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $315
LABELV $318
line 600
;600:	{
line 601
;601:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 748
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
line 602
;602:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $319
line 603
;603:			return;
ADDRGP4 $309
JUMPV
LABELV $319
line 604
;604:	}
LABELV $315
line 606
;605:
;606:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $324
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $321
LABELV $324
line 607
;607:	{
line 608
;608:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 610
;609:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;610:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $325
line 611
;611:			return;
ADDRGP4 $309
JUMPV
LABELV $325
line 612
;612:	}
LABELV $321
line 614
;613:
;614:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $330
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $327
LABELV $330
line 615
;615:	{
line 616
;616:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $331
line 617
;617:			ent->client->ps.ammo[i] = 999;
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
line 618
;618:		}
LABELV $332
line 616
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $331
line 619
;619:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $335
line 620
;620:			return;
ADDRGP4 $309
JUMPV
LABELV $335
line 621
;621:	}
LABELV $327
line 623
;622:
;623:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $340
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $337
LABELV $340
line 624
;624:	{
line 625
;625:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 627
;626:
;627:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $341
line 628
;628:			return;
ADDRGP4 $309
JUMPV
LABELV $341
line 629
;629:	}
LABELV $337
line 631
;630:
;631:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $343
line 632
;632:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 633
;633:		return;
ADDRGP4 $309
JUMPV
LABELV $343
line 635
;634:	}
;635:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $346
line 636
;636:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 637
;637:		return;
ADDRGP4 $309
JUMPV
LABELV $346
line 639
;638:	}
;639:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $349
line 640
;640:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 641
;641:		return;
ADDRGP4 $309
JUMPV
LABELV $349
line 643
;642:	}
;643:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $352
line 644
;644:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
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
line 645
;645:		return;
ADDRGP4 $309
JUMPV
LABELV $352
line 647
;646:	}
;647:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $355
line 648
;648:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
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
line 649
;649:		return;
ADDRGP4 $309
JUMPV
LABELV $355
line 653
;650:	}
;651:
;652:	// spawn a specific item right on the player
;653:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $358
line 654
;654:		it = BG_FindItem (name);
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
line 655
;655:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $360
line 656
;656:			return;
ADDRGP4 $309
JUMPV
LABELV $360
line 659
;657:		}
;658:
;659:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 660
;660:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
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
line 661
;661:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 662
;662:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 663
;663:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 664
;664:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 665
;665:		Touch_Item (it_ent, ent, &trace);
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
line 666
;666:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $362
line 667
;667:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 668
;668:		}
LABELV $362
line 669
;669:	}
LABELV $358
line 670
;670:}
LABELV $309
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 683
;671:
;672:
;673:/*
;674:==================
;675:Cmd_God_f
;676:
;677:Sets client to godmode
;678:
;679:argv(0) god
;680:==================
;681:*/
;682:void Cmd_God_f (gentity_t *ent)
;683:{
line 686
;684:	char	*msg;
;685:
;686:	if ( !CheatsOk( ent ) ) {
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
NEI4 $365
line 687
;687:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 690
;688:	}
;689:
;690:	ent->flags ^= FL_GODMODE;
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
line 691
;691:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $367
line 692
;692:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $369
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $367
line 694
;693:	else
;694:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $370
ASGNP4
LABELV $368
line 696
;695:
;696:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $371
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 697
;697:}
LABELV $364
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 709
;698:
;699:
;700:/*
;701:==================
;702:Cmd_Notarget_f
;703:
;704:Sets client to notarget
;705:
;706:argv(0) notarget
;707:==================
;708:*/
;709:void Cmd_Notarget_f( gentity_t *ent ) {
line 712
;710:	char	*msg;
;711:
;712:	if ( !CheatsOk( ent ) ) {
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
NEI4 $373
line 713
;713:		return;
ADDRGP4 $372
JUMPV
LABELV $373
line 716
;714:	}
;715:
;716:	ent->flags ^= FL_NOTARGET;
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
line 717
;717:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $375
line 718
;718:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $377
ASGNP4
ADDRGP4 $376
JUMPV
LABELV $375
line 720
;719:	else
;720:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $378
ASGNP4
LABELV $376
line 722
;721:
;722:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $371
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 723
;723:}
LABELV $372
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 733
;724:
;725:
;726:/*
;727:==================
;728:Cmd_Noclip_f
;729:
;730:argv(0) noclip
;731:==================
;732:*/
;733:void Cmd_Noclip_f( gentity_t *ent ) {
line 736
;734:	char	*msg;
;735:
;736:	if ( !CheatsOk( ent ) ) {
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
NEI4 $380
line 737
;737:		return;
ADDRGP4 $379
JUMPV
LABELV $380
line 740
;738:	}
;739:
;740:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $382
line 741
;741:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $384
ASGNP4
line 742
;742:	} else {
ADDRGP4 $383
JUMPV
LABELV $382
line 743
;743:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $385
ASGNP4
line 744
;744:	}
LABELV $383
line 745
;745:	ent->client->noclip = !ent->client->noclip;
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
NEI4 $387
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $388
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 747
;746:
;747:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $371
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 748
;748:}
LABELV $379
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 761
;749:
;750:
;751:/*
;752:==================
;753:Cmd_LevelShot_f
;754:
;755:This is just to help generate the level pictures
;756:for the menus.  It goes to the intermission immediately
;757:and sends over a command to the client to resize the view,
;758:hide the scoreboard, and take a special screenshot
;759:==================
;760:*/
;761:void Cmd_LevelShot_f( gentity_t *ent ) {
line 762
;762:	if ( !CheatsOk( ent ) ) {
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
NEI4 $390
line 763
;763:		return;
ADDRGP4 $389
JUMPV
LABELV $390
line 767
;764:	}
;765:
;766:	// doesn't work in single player
;767:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $392
line 768
;768:		trap_SendServerCommand( ent-g_entities, 
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 770
;769:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;770:		return;
ADDRGP4 $389
JUMPV
LABELV $392
line 773
;771:	}
;772:
;773:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 774
;774:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $396
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 775
;775:}
LABELV $389
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 788
;776:
;777:
;778:/*
;779:==================
;780:Cmd_LevelShot_f
;781:
;782:This is just to help generate the level pictures
;783:for the menus.  It goes to the intermission immediately
;784:and sends over a command to the client to resize the view,
;785:hide the scoreboard, and take a special screenshot
;786:==================
;787:*/
;788:void Cmd_TeamTask_f( gentity_t *ent ) {
line 792
;789:	char userinfo[MAX_INFO_STRING];
;790:	char		arg[MAX_TOKEN_CHARS];
;791:	int task;
;792:	int client = ent->client - level.clients;
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
CNSTI4 3456
DIVI4
ASGNI4
line 794
;793:
;794:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $398
line 795
;795:		return;
ADDRGP4 $397
JUMPV
LABELV $398
line 797
;796:	}
;797:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 798
;798:	task = atoi( arg );
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
line 800
;799:
;800:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
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
line 801
;801:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $401
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
ADDRGP4 $400
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 802
;802:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 803
;803:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 804
;804:}
LABELV $397
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 813
;805:
;806:
;807:
;808:/*
;809:=================
;810:Cmd_Kill_f
;811:=================
;812:*/
;813:void Cmd_Kill_f( gentity_t *ent ) {
line 814
;814:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $403
line 815
;815:		return;
ADDRGP4 $402
JUMPV
LABELV $403
line 817
;816:	}
;817:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $405
line 818
;818:		return;
ADDRGP4 $402
JUMPV
LABELV $405
line 820
;819:	}
;820:	ent->flags &= ~FL_GODMODE;
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
line 821
;821:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 748
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
line 822
;822:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 823
;823:}
LABELV $402
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 833
;824:
;825:/*
;826:=================
;827:BroadCastTeamChange
;828:
;829:Let everyone know about a team change
;830:=================
;831:*/
;832:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;833:{
line 834
;834:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $408
line 835
;835:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $410
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
line 837
;836:			client->pers.netname) );
;837:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $409
JUMPV
LABELV $408
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $411
line 838
;838:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $413
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
line 840
;839:		client->pers.netname));
;840:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $412
JUMPV
LABELV $411
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
NEI4 $414
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $414
line 842
;841:		
;842:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $416
line 843
;843:		{
line 845
;844:		
;845:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $418
line 846
;846:			{
line 847
;847:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $421
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
line 848
;848:			}
LABELV $418
line 849
;849:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $415
line 850
;850:			{
line 851
;851:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $425
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
line 852
;852:			}
line 853
;853:		} 
ADDRGP4 $415
JUMPV
LABELV $416
line 856
;854:
;855:		else 
;856:		{
line 857
;857:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $426
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
line 858
;858:		}
line 860
;859:
;860:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $415
JUMPV
LABELV $414
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $427
line 861
;861:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $429
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
;862:		client->pers.netname));
;863:	}
LABELV $427
LABELV $415
LABELV $412
LABELV $409
line 864
;864:}
LABELV $407
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 871
;865:
;866:/*
;867:=================
;868:SetTeam
;869:=================
;870:*/
;871:void SetTeam( gentity_t *ent, char *s ) {
line 882
;872:	int					team, oldTeam;
;873:	gclient_t			*client;
;874:	int					clientNum;
;875:	spectatorState_t	specState;
;876:	int					specClient;
;877:	int					teamLeader;
;878:
;879:	//
;880:	// see what change is requested
;881:	//
;882:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 884
;883:
;884:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ASGNI4
line 885
;885:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 886
;886:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 887
;887:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $433
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $435
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $431
LABELV $435
line 888
;888:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 889
;889:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 890
;890:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $432
JUMPV
LABELV $431
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $436
line 891
;891:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 892
;892:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 893
;893:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 894
;894:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $437
JUMPV
LABELV $436
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $439
line 895
;895:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 896
;896:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 897
;897:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 898
;898:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $440
JUMPV
LABELV $439
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $446
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $445
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $442
LABELV $446
line 899
;899:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 900
;900:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 901
;901:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $443
JUMPV
LABELV $442
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $447
line 903
;902:		// if running a team game, assign player to one of the teams
;903:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 904
;904:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $454
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $450
LABELV $454
line 905
;905:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 906
;906:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $451
JUMPV
LABELV $450
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $457
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $459
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $458
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $455
LABELV $459
line 907
;907:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 908
;908:		} else {
ADDRGP4 $456
JUMPV
LABELV $455
line 910
;909:			// pick the team with the least number of players
;910:			team = PickTeam( clientNum );
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
line 911
;911:		}
LABELV $456
LABELV $451
line 913
;912:
;913:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $448
line 916
;914:			int		counts[TEAM_NUM_TEAMS];
;915:
;916:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
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
line 917
;917:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
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
line 920
;918:
;919:			// We allow a spread of two
;920:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $465
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $465
line 921
;921:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 923
;922:					"cp \"Red team has too many players.\n\"" );
;923:				return; // ignore the request
ADDRGP4 $430
JUMPV
LABELV $465
line 925
;924:			}
;925:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $448
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $448
line 926
;926:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $474
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 928
;927:					"cp \"Blue team has too many players.\n\"" );
;928:				return; // ignore the request
ADDRGP4 $430
JUMPV
line 932
;929:			}
;930:
;931:			// It's ok, the team we are switching to has less or same number of players
;932:		}
line 934
;933:
;934:	} else {
LABELV $447
line 936
;935:		// force them to spectators if there aren't any spots free
;936:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 937
;937:	}
LABELV $448
LABELV $443
LABELV $440
LABELV $437
LABELV $432
line 940
;938:
;939:	// override decision if limiting the players
;940:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $475
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $475
line 941
;941:		&& level.numNonSpectatorClients >= 2 ) {
line 942
;942:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 943
;943:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $476
JUMPV
LABELV $475
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $479
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $479
line 944
;944:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 945
;945:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 946
;946:	}
LABELV $479
LABELV $476
line 951
;947:
;948:	//
;949:	// decide if we will allow the change
;950:	//
;951:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 952
;952:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $484
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $484
line 953
;953:		return;
ADDRGP4 $430
JUMPV
LABELV $484
line 961
;954:	}
;955:
;956:	//
;957:	// execute the team change
;958:	//
;959:
;960:	// if the player was dead leave the body
;961:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $486
line 962
;962:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 963
;963:	}
LABELV $486
line 966
;964:
;965:	// he starts at 'base'
;966:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 967
;967:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $488
line 969
;968:		// Kill him (makes sure he loses flags, etc)
;969:		ent->flags &= ~FL_GODMODE;
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
line 970
;970:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 748
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
line 971
;971:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 973
;972:
;973:	}
LABELV $488
line 975
;974:	// they go to the end of the line for tournements
;975:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $490
line 976
;976:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 977
;977:	}
LABELV $490
line 979
;978:
;979:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 980
;980:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 981
;981:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 983
;982:
;983:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 984
;984:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $495
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $493
LABELV $495
line 985
;985:		teamLeader = TeamLeader( team );
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
line 987
;986:		// if there is no team leader or the team leader is a bot and this client is not a bot
;987:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $502
ADDRLP4 68
CNSTI4 916
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
NEI4 $496
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
EQI4 $496
LABELV $502
line 988
;988:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 989
;989:		}
LABELV $496
line 990
;990:	}
LABELV $493
line 992
;991:	// make sure there is a team leader on the team the player came from
;992:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $505
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $503
LABELV $505
line 993
;993:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 994
;994:	}
LABELV $503
line 996
;995:
;996:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 999
;997:
;998:	// get and distribute relevent paramters
;999:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1001
;1000:
;1001:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1002
;1002:}
LABELV $430
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 1012
;1003:
;1004:/*
;1005:=================
;1006:StopFollowing
;1007:
;1008:If the client being followed leaves the game, or you just want to drop
;1009:to free floating spectator mode
;1010:=================
;1011:*/
;1012:void StopFollowing( gentity_t *ent ) {
line 1013
;1013:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1014
;1014:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 3
ASGNI4
line 1015
;1015:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1016
;1016:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
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
line 1017
;1017:	ent->r.svFlags &= ~SVF_BOT;
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
line 1018
;1018:	ent->client->ps.clientNum = ent - g_entities;
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
CNSTI4 916
DIVI4
ASGNI4
line 1019
;1019:}
LABELV $506
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 1026
;1020:
;1021:/*
;1022:=================
;1023:Cmd_Team_f
;1024:=================
;1025:*/
;1026:void Cmd_Team_f( gentity_t *ent ) {
line 1030
;1027:	int			oldTeam;
;1028:	char		s[MAX_TOKEN_CHARS];
;1029:
;1030:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $508
line 1031
;1031:		oldTeam = ent->client->sess.sessionTeam;
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
line 1032
;1032:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $507
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $507
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $520
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $520
address $516
address $514
address $512
address $518
code
LABELV $512
line 1034
;1033:		case TEAM_BLUE:
;1034:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $513
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1035
;1035:			break;
ADDRGP4 $507
JUMPV
LABELV $514
line 1037
;1036:		case TEAM_RED:
;1037:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $515
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1038
;1038:			break;
ADDRGP4 $507
JUMPV
LABELV $516
line 1040
;1039:		case TEAM_FREE:
;1040:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $517
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1041
;1041:			break;
ADDRGP4 $507
JUMPV
LABELV $518
line 1043
;1042:		case TEAM_SPECTATOR:
;1043:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $519
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1044
;1044:			break;
line 1046
;1045:		}
;1046:		return;
ADDRGP4 $507
JUMPV
LABELV $508
line 1049
;1047:	}
;1048:
;1049:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
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
LEI4 $521
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $521
line 1050
;1050:	{
line 1052
;1051:
;1052:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $525
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1053
;1053:		return;
ADDRGP4 $507
JUMPV
LABELV $521
line 1057
;1054:	}
;1055:
;1056:
;1057:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $526
line 1058
;1058:	{
line 1059
;1059:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $533
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $529
LABELV $533
line 1060
;1060:		{
line 1062
;1061:		
;1062:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $534
line 1063
;1063:			{
line 1065
;1064:				
;1065:				if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $536
line 1066
;1066:				{
line 1067
;1067:					trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $538
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1068
;1068:					return;
ADDRGP4 $507
JUMPV
LABELV $536
line 1070
;1069:				}
;1070:				if (level.firstStrike == qtrue)
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $539
line 1071
;1071:				{
line 1072
;1072:					trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $542
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1073
;1073:					return;
ADDRGP4 $507
JUMPV
LABELV $539
line 1076
;1074:				}
;1075:
;1076:			}
LABELV $534
line 1077
;1077:		}
LABELV $529
line 1080
;1078:
;1079:
;1080:	}
LABELV $526
line 1087
;1081:
;1082:
;1083:	
;1084:
;1085:
;1086:	// if they are playing a tournement game, count as a loss
;1087:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $543
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $543
line 1088
;1088:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1089
;1089:		ent->client->sess.losses++;
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
line 1090
;1090:	}
LABELV $543
line 1092
;1091:
;1092:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1094
;1093:
;1094:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1096
;1095:
;1096:	ent->client->switchTeamTime = level.time + 5000;
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
line 1097
;1097:}
LABELV $507
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 1105
;1098:
;1099:
;1100:/*
;1101:=================
;1102:Cmd_Follow_f
;1103:=================
;1104:*/
;1105:void Cmd_Follow_f( gentity_t *ent ) {
line 1109
;1106:	int		i;
;1107:	char	arg[MAX_TOKEN_CHARS];
;1108:
;1109:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $548
line 1110
;1110:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $547
line 1111
;1111:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1112
;1112:		}
line 1113
;1113:		return;
ADDRGP4 $547
JUMPV
LABELV $548
line 1116
;1114:	}
;1115:
;1116:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1117
;1117:	i = ClientNumberFromString( ent, arg );
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
line 1118
;1118:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $552
line 1119
;1119:		return;
ADDRGP4 $547
JUMPV
LABELV $552
line 1123
;1120:	}
;1121:
;1122:	// can't follow self
;1123:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3456
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
NEU4 $554
line 1124
;1124:		return;
ADDRGP4 $547
JUMPV
LABELV $554
line 1128
;1125:	}
;1126:
;1127:	// can't follow another spectator
;1128:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3456
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
NEI4 $556
line 1129
;1129:		return;
ADDRGP4 $547
JUMPV
LABELV $556
line 1133
;1130:	}
;1131:
;1132:	// if they are playing a tournement game, count as a loss
;1133:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $558
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $558
line 1134
;1134:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1135
;1135:		ent->client->sess.losses++;
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
line 1136
;1136:	}
LABELV $558
line 1139
;1137:
;1138:	// first set them to spectator
;1139:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $561
line 1140
;1140:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1141
;1141:	}
LABELV $561
line 1143
;1142:
;1143:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1144
;1144:	ent->client->sess.spectatorClient = i;
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
line 1145
;1145:}
LABELV $547
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 1152
;1146:
;1147:/*
;1148:=================
;1149:Cmd_FollowCycle_f
;1150:=================
;1151:*/
;1152:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 1157
;1153:	int		clientnum;
;1154:	int		original;
;1155:
;1156:	// if they are playing a tournement game, count as a loss
;1157:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $564
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $564
line 1158
;1158:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1159
;1159:		ent->client->sess.losses++;
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
line 1160
;1160:	}
LABELV $564
line 1162
;1161:	// first set them to spectator
;1162:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $567
line 1163
;1163:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1164
;1164:	}
LABELV $567
line 1166
;1165:
;1166:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $569
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $569
line 1167
;1167:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $571
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1168
;1168:	}
LABELV $569
line 1170
;1169:
;1170:	clientnum = ent->client->sess.spectatorClient;
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
line 1171
;1171:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $572
line 1172
;1172:	do {
line 1173
;1173:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1174
;1174:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $575
line 1175
;1175:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1176
;1176:		}
LABELV $575
line 1177
;1177:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $578
line 1178
;1178:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1179
;1179:		}
LABELV $578
line 1182
;1180:
;1181:		// can only follow connected clients
;1182:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3456
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
EQI4 $581
line 1183
;1183:			continue;
ADDRGP4 $573
JUMPV
LABELV $581
line 1187
;1184:		}
;1185:
;1186:		// can't follow another spectator
;1187:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3456
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
NEI4 $583
line 1188
;1188:			continue;
ADDRGP4 $573
JUMPV
LABELV $583
line 1192
;1189:		}
;1190:
;1191:		// this is good, we can use it
;1192:		ent->client->sess.spectatorClient = clientnum;
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
line 1193
;1193:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1194
;1194:		return;
ADDRGP4 $563
JUMPV
LABELV $573
line 1195
;1195:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $572
line 1198
;1196:
;1197:	// leave it where it was
;1198:}
LABELV $563
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1209
;1199:
;1200:
;1201:/*
;1202:==================
;1203:G_Say
;1204:==================
;1205:*/
;1206:
;1207:
;1208:
;1209:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1210
;1210:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $586
line 1211
;1211:		return;
ADDRGP4 $585
JUMPV
LABELV $586
line 1213
;1212:	}
;1213:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $588
line 1214
;1214:		return;
ADDRGP4 $585
JUMPV
LABELV $588
line 1216
;1215:	}
;1216:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $590
line 1217
;1217:		return;
ADDRGP4 $585
JUMPV
LABELV $590
line 1219
;1218:	}
;1219:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $592
line 1220
;1220:		return;
ADDRGP4 $585
JUMPV
LABELV $592
line 1222
;1221:	}
;1222:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $594
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
NEI4 $594
line 1223
;1223:		return;
ADDRGP4 $585
JUMPV
LABELV $594
line 1226
;1224:	}
;1225:	// no chatting to players in tournements
;1226:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $596
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
NEI4 $596
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
EQI4 $596
line 1228
;1227:		&& other->client->sess.sessionTeam == TEAM_FREE
;1228:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1229
;1229:		return;
ADDRGP4 $585
JUMPV
LABELV $596
line 1232
;1230:	}
;1231:
;1232:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $599
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $603
ADDRLP4 16
ADDRGP4 $600
ASGNP4
ADDRGP4 $604
JUMPV
LABELV $603
ADDRLP4 16
ADDRGP4 $601
ASGNP4
LABELV $604
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1235
;1233:		mode == SAY_TEAM ? "tchat" : "chat",
;1234:		name, Q_COLOR_ESCAPE, color, message));
;1235:}
LABELV $585
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1239
;1236:
;1237:#define EC		"\x19"
;1238:
;1239:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1248
;1240:	int			j;
;1241:	gentity_t	*other;
;1242:	int			color;
;1243:	char		name[64];
;1244:	// don't let text be too long for malicious reasons
;1245:	char		text[MAX_SAY_TEXT];
;1246:	char		location[64];
;1247:
;1248:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $606
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $606
line 1249
;1249:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1250
;1250:	}
LABELV $606
line 1252
;1251:
;1252:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LTI4 $609
ADDRLP4 292
INDIRI4
CNSTI4 3
GTI4 $609
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $629
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $629
address $611
address $614
address $620
address $626
code
LABELV $609
LABELV $611
line 1255
;1253:	default:
;1254:	case SAY_ALL:
;1255:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $612
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
line 1256
;1256:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $613
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
line 1257
;1257:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1258
;1258:		break;
ADDRGP4 $610
JUMPV
LABELV $614
line 1260
;1259:	case SAY_TEAM:
;1260:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $615
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
line 1261
;1261:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
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
EQI4 $616
line 1262
;1262:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $618
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
ADDRGP4 $617
JUMPV
LABELV $616
line 1265
;1263:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1264:		else
;1265:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $619
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
LABELV $617
line 1267
;1266:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1267:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1268
;1268:		break;
ADDRGP4 $610
JUMPV
LABELV $620
line 1270
;1269:	case SAY_TELL:
;1270:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $621
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $621
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
NEI4 $621
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
EQI4 $621
line 1273
;1271:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1272:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1273:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
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
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $622
JUMPV
LABELV $621
line 1275
;1274:		else
;1275:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $625
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
LABELV $622
line 1276
;1276:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1277
;1277:		break;
ADDRGP4 $610
JUMPV
LABELV $626
line 1279
;1278:	case SAY_INVAL:
;1279:		G_LogPrintf( "Invalid During Intermission: %s: %s\n", ent->client->pers.netname, chatText );
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
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1280
;1280:		Com_sprintf (name, sizeof(name), "[Invalid During Intermission%c%c]: ", Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $628
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1281
;1281:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1282
;1282:		target = ent;
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1283
;1283:		break;
LABELV $610
line 1286
;1284:	}
;1285:
;1286:	Q_strncpyz( text, chatText, sizeof(text) );
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
line 1288
;1287:
;1288:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
line 1289
;1289:		G_SayTo( ent, target, mode, color, name, text );
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
line 1290
;1290:		return;
ADDRGP4 $605
JUMPV
LABELV $630
line 1294
;1291:	}
;1292:
;1293:	// echo the text to the console
;1294:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $632
line 1295
;1295:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $635
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1296
;1296:	}
LABELV $632
line 1299
;1297:
;1298:	// send it to all the apropriate clients
;1299:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $639
JUMPV
LABELV $636
line 1300
;1300:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1301
;1301:		G_SayTo( ent, other, mode, color, name, text );
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
line 1302
;1302:	}
LABELV $637
line 1299
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $639
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $636
line 1303
;1303:}
LABELV $605
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1311
;1304:
;1305:
;1306:/*
;1307:==================
;1308:Cmd_Say_f
;1309:==================
;1310:*/
;1311:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1314
;1312:	char		*p;
;1313:
;1314:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $642
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $642
line 1315
;1315:		return;
ADDRGP4 $641
JUMPV
LABELV $642
line 1318
;1316:	}
;1317:
;1318:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $644
line 1319
;1319:	{
line 1320
;1320:		p = ConcatArgs( 0 );
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
line 1321
;1321:	}
ADDRGP4 $645
JUMPV
LABELV $644
line 1323
;1322:	else
;1323:	{
line 1324
;1324:		p = ConcatArgs( 1 );
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
line 1325
;1325:	}
LABELV $645
line 1327
;1326:
;1327:	G_Say( ent, NULL, mode, p );
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
line 1328
;1328:}
LABELV $641
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1335
;1329:
;1330:/*
;1331:==================
;1332:Cmd_Tell_f
;1333:==================
;1334:*/
;1335:static void Cmd_Tell_f( gentity_t *ent ) {
line 1341
;1336:	int			targetNum;
;1337:	gentity_t	*target;
;1338:	char		*p;
;1339:	char		arg[MAX_TOKEN_CHARS];
;1340:
;1341:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $647
line 1342
;1342:		return;
ADDRGP4 $646
JUMPV
LABELV $647
line 1345
;1343:	}
;1344:
;1345:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1346
;1346:	targetNum = atoi( arg );
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
line 1347
;1347:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $652
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $649
LABELV $652
line 1348
;1348:		return;
ADDRGP4 $646
JUMPV
LABELV $649
line 1351
;1349:	}
;1350:
;1351:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1352
;1352:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $656
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $656
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $653
LABELV $656
line 1353
;1353:		return;
ADDRGP4 $646
JUMPV
LABELV $653
line 1356
;1354:	}
;1355:
;1356:	p = ConcatArgs( 2 );
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
line 1358
;1357:
;1358:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $657
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
line 1359
;1359:	G_Say( ent, target, SAY_TELL, p );
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
line 1362
;1360:	// don't tell to the player self if it was already directed to this player
;1361:	// also don't send the chat back to a bot
;1362:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $658
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $658
line 1363
;1363:		G_Say( ent, ent, SAY_TELL, p );
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
line 1364
;1364:	}
LABELV $658
line 1365
;1365:}
LABELV $646
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1368
;1366:
;1367:
;1368:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1372
;1369:	int color;
;1370:	char *cmd;
;1371:
;1372:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $661
line 1373
;1373:		return;
ADDRGP4 $660
JUMPV
LABELV $661
line 1375
;1374:	}
;1375:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $663
line 1376
;1376:		return;
ADDRGP4 $660
JUMPV
LABELV $663
line 1378
;1377:	}
;1378:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $665
line 1379
;1379:		return;
ADDRGP4 $660
JUMPV
LABELV $665
line 1381
;1380:	}
;1381:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $667
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
NEI4 $667
line 1382
;1382:		return;
ADDRGP4 $660
JUMPV
LABELV $667
line 1385
;1383:	}
;1384:	// no chatting to players in tournements
;1385:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $669
line 1386
;1386:		return;
ADDRGP4 $660
JUMPV
LABELV $669
line 1389
;1387:	}
;1388:
;1389:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $672
line 1390
;1390:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1391
;1391:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $674
ASGNP4
line 1392
;1392:	}
ADDRGP4 $673
JUMPV
LABELV $672
line 1393
;1393:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $675
line 1394
;1394:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1395
;1395:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $677
ASGNP4
line 1396
;1396:	}
ADDRGP4 $676
JUMPV
LABELV $675
line 1397
;1397:	else {
line 1398
;1398:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1399
;1399:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $678
ASGNP4
line 1400
;1400:	}
LABELV $676
LABELV $673
line 1402
;1401:
;1402:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $679
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1403
;1403:}
LABELV $660
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1405
;1404:
;1405:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1409
;1406:	int			j;
;1407:	gentity_t	*other;
;1408:
;1409:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $681
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $681
line 1410
;1410:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1411
;1411:	}
LABELV $681
line 1413
;1412:
;1413:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $684
line 1414
;1414:		G_VoiceTo( ent, target, mode, id, voiceonly );
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
line 1415
;1415:		return;
ADDRGP4 $680
JUMPV
LABELV $684
line 1419
;1416:	}
;1417:
;1418:	// echo the text to the console
;1419:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $686
line 1420
;1420:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $689
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
line 1421
;1421:	}
LABELV $686
line 1424
;1422:
;1423:	// send it to all the apropriate clients
;1424:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $693
JUMPV
LABELV $690
line 1425
;1425:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1426
;1426:		G_VoiceTo( ent, other, mode, id, voiceonly );
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
line 1427
;1427:	}
LABELV $691
line 1424
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $693
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $690
line 1428
;1428:}
LABELV $680
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1435
;1429:
;1430:/*
;1431:==================
;1432:Cmd_Voice_f
;1433:==================
;1434:*/
;1435:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1438
;1436:	char		*p;
;1437:
;1438:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $696
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $696
line 1439
;1439:		return;
ADDRGP4 $695
JUMPV
LABELV $696
line 1442
;1440:	}
;1441:
;1442:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $698
line 1443
;1443:	{
line 1444
;1444:		p = ConcatArgs( 0 );
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
line 1445
;1445:	}
ADDRGP4 $699
JUMPV
LABELV $698
line 1447
;1446:	else
;1447:	{
line 1448
;1448:		p = ConcatArgs( 1 );
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
line 1449
;1449:	}
LABELV $699
line 1451
;1450:
;1451:	G_Voice( ent, NULL, mode, p, voiceonly );
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
line 1452
;1452:}
LABELV $695
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1459
;1453:
;1454:/*
;1455:==================
;1456:Cmd_VoiceTell_f
;1457:==================
;1458:*/
;1459:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1465
;1460:	int			targetNum;
;1461:	gentity_t	*target;
;1462:	char		*id;
;1463:	char		arg[MAX_TOKEN_CHARS];
;1464:
;1465:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $701
line 1466
;1466:		return;
ADDRGP4 $700
JUMPV
LABELV $701
line 1469
;1467:	}
;1468:
;1469:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1470
;1470:	targetNum = atoi( arg );
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
line 1471
;1471:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $706
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $703
LABELV $706
line 1472
;1472:		return;
ADDRGP4 $700
JUMPV
LABELV $703
line 1475
;1473:	}
;1474:
;1475:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1476
;1476:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $710
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $710
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $707
LABELV $710
line 1477
;1477:		return;
ADDRGP4 $700
JUMPV
LABELV $707
line 1480
;1478:	}
;1479:
;1480:	id = ConcatArgs( 2 );
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
line 1482
;1481:
;1482:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $711
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
line 1483
;1483:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
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
line 1486
;1484:	// don't tell to the player self if it was already directed to this player
;1485:	// also don't send the chat back to a bot
;1486:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $712
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $712
line 1487
;1487:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
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
line 1488
;1488:	}
LABELV $712
line 1489
;1489:}
LABELV $700
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1497
;1490:
;1491:
;1492:/*
;1493:==================
;1494:Cmd_VoiceTaunt_f
;1495:==================
;1496:*/
;1497:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1501
;1498:	gentity_t *who;
;1499:	int i;
;1500:
;1501:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $715
line 1502
;1502:		return;
ADDRGP4 $714
JUMPV
LABELV $715
line 1506
;1503:	}
;1504:
;1505:	// insult someone who just killed you
;1506:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 784
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
EQU4 $717
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
EQU4 $717
ADDRLP4 20
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $717
line 1508
;1507:		// i am a dead corpse
;1508:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $719
line 1509
;1509:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $721
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1510
;1510:		}
LABELV $719
line 1511
;1511:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $722
line 1512
;1512:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $721
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1513
;1513:		}
LABELV $722
line 1514
;1514:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 1515
;1515:		return;
ADDRGP4 $714
JUMPV
LABELV $717
line 1518
;1516:	}
;1517:	// insult someone you just killed
;1518:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
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
LTI4 $724
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $724
line 1519
;1519:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 916
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
line 1520
;1520:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $726
line 1522
;1521:			// who is the person I just killed
;1522:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2660
ADDP4
INDIRI4
CNSTI4 2
NEI4 $728
line 1523
;1523:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $730
line 1524
;1524:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $732
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1525
;1525:				}
LABELV $730
line 1526
;1526:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $729
line 1527
;1527:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
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
ADDRGP4 $732
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1528
;1528:				}
line 1529
;1529:			} else {
ADDRGP4 $729
JUMPV
LABELV $728
line 1530
;1530:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $735
line 1531
;1531:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $737
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1532
;1532:				}
LABELV $735
line 1533
;1533:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $738
line 1534
;1534:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
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
ADDRGP4 $737
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1535
;1535:				}
LABELV $738
line 1536
;1536:			}
LABELV $729
line 1537
;1537:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 -1
ASGNI4
line 1538
;1538:			return;
ADDRGP4 $714
JUMPV
LABELV $726
line 1540
;1539:		}
;1540:	}
LABELV $724
line 1542
;1541:
;1542:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $740
line 1544
;1543:		// praise a team mate who just got a reward
;1544:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $743
line 1545
;1545:			who = g_entities + i;
ADDRLP4 0
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1546
;1546:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
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
EQU4 $747
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
EQU4 $747
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
NEI4 $747
line 1547
;1547:				if (who->client->rewardTime > level.time) {
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
LEI4 $749
line 1548
;1548:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $752
line 1549
;1549:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $754
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1550
;1550:					}
LABELV $752
line 1551
;1551:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $714
line 1552
;1552:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
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
ADDRGP4 $754
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1553
;1553:					}
line 1554
;1554:					return;
ADDRGP4 $714
JUMPV
LABELV $749
line 1556
;1555:				}
;1556:			}
LABELV $747
line 1557
;1557:		}
LABELV $744
line 1544
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $743
line 1558
;1558:	}
LABELV $740
line 1561
;1559:
;1560:	// just say something
;1561:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
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
ADDRGP4 $757
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1562
;1562:}
LABELV $714
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $758
address $759
address $760
address $761
address $762
address $763
address $764
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1576
;1563:
;1564:
;1565:
;1566:static char	*gc_orders[] = {
;1567:	"hold your position",
;1568:	"hold this position",
;1569:	"come here",
;1570:	"cover me",
;1571:	"guard location",
;1572:	"search and destroy",
;1573:	"report"
;1574:};
;1575:
;1576:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1581
;1577:	int		player;
;1578:	int		order;
;1579:	char	str[MAX_TOKEN_CHARS];
;1580:
;1581:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1582
;1582:	player = atoi( str );
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
line 1583
;1583:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1584
;1584:	order = atoi( str );
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
line 1586
;1585:
;1586:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $768
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $766
LABELV $768
line 1587
;1587:		return;
ADDRGP4 $765
JUMPV
LABELV $766
line 1589
;1588:	}
;1589:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $771
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $769
LABELV $771
line 1590
;1590:		return;
ADDRGP4 $765
JUMPV
LABELV $769
line 1592
;1591:	}
;1592:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 916
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
line 1593
;1593:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
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
line 1594
;1594:}
LABELV $765
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1601
;1595:
;1596:/*
;1597:==================
;1598:Cmd_Where_f
;1599:==================
;1600:*/
;1601:void Cmd_Where_f( gentity_t *ent ) {
line 1602
;1602:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $773
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1603
;1603:}
LABELV $772
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $774
address $775
address $776
address $777
address $778
address $779
address $780
address $781
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3136 24
line 1621
;1604:
;1605:static const char *gameNames[] = {
;1606:	"Free For All",
;1607:	"Tournament",
;1608:	"Single Player",
;1609:	"Team Deathmatch",
;1610:	"Capture the Flag",
;1611:	"One Flag CTF",
;1612:	"Overload",
;1613:	"Harvester"
;1614:};
;1615:
;1616:/*
;1617:==================
;1618:Cmd_CallVote_f
;1619:==================
;1620:*/
;1621:void Cmd_CallVote_f( gentity_t *ent ) {
line 1626
;1622:	int		i;
;1623:	char	arg1[MAX_STRING_TOKENS];
;1624:	char	arg2[MAX_STRING_TOKENS];
;1625:
;1626:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $783
line 1627
;1627:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $786
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1628
;1628:		return;
ADDRGP4 $782
JUMPV
LABELV $783
line 1631
;1629:	}
;1630:
;1631:	if ( level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
EQI4 $787
line 1632
;1632:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $790
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1633
;1633:		return;
ADDRGP4 $782
JUMPV
LABELV $787
line 1635
;1634:	}
;1635:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $791
line 1636
;1636:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $793
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1637
;1637:		return;
ADDRGP4 $782
JUMPV
LABELV $791
line 1639
;1638:	}
;1639:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $794
line 1640
;1640:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $796
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1641
;1641:		return;
ADDRGP4 $782
JUMPV
LABELV $794
line 1645
;1642:	}
;1643:
;1644:	// make sure it is a valid command to vote on
;1645:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1646
;1646:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1648
;1647:
;1648:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $799
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
EQU4 $797
LABELV $799
line 1649
;1649:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1650
;1650:		return;
ADDRGP4 $782
JUMPV
LABELV $797
line 1653
;1651:	}
;1652:
;1653:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $803
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $801
line 1654
;1654:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $802
JUMPV
LABELV $801
ADDRLP4 4
ARGP4
ADDRGP4 $806
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $804
line 1655
;1655:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $805
JUMPV
LABELV $804
ADDRLP4 4
ARGP4
ADDRGP4 $809
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $807
line 1656
;1656:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $808
JUMPV
LABELV $807
ADDRLP4 4
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $810
line 1657
;1657:	} else if ( !Q_stricmp( arg1, "balanceteams" ) ) {
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 4
ARGP4
ADDRGP4 $815
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $813
line 1658
;1658:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $814
JUMPV
LABELV $813
ADDRLP4 4
ARGP4
ADDRGP4 $818
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $816
line 1659
;1659:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $817
JUMPV
LABELV $816
ADDRLP4 4
ARGP4
ADDRGP4 $821
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $819
line 1660
;1660:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $820
JUMPV
LABELV $819
ADDRLP4 4
ARGP4
ADDRGP4 $824
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $822
line 1661
;1661:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $823
JUMPV
LABELV $822
ADDRLP4 4
ARGP4
ADDRGP4 $827
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $825
line 1662
;1662:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $826
JUMPV
LABELV $825
ADDRLP4 4
ARGP4
ADDRGP4 $830
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $828
line 1663
;1663:	} else {
ADDRGP4 $829
JUMPV
LABELV $828
line 1664
;1664:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1665
;1665:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $831
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1666
;1666:		return;
ADDRGP4 $782
JUMPV
LABELV $829
LABELV $826
LABELV $823
LABELV $820
LABELV $817
LABELV $814
LABELV $811
LABELV $808
LABELV $805
LABELV $802
line 1670
;1667:	}
;1668:
;1669:	// if there is still a vote to be executed
;1670:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2420
INDIRI4
CNSTI4 0
EQI4 $832
line 1671
;1671:		level.voteExecuteTime = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1672
;1672:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $836
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
line 1673
;1673:	}
LABELV $832
line 1676
;1674:
;1675:	// special case for g_gametype, check for bad values
;1676:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $838
line 1677
;1677:		i = atoi( arg2 );
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
line 1678
;1678:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $843
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $843
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $840
LABELV $843
line 1679
;1679:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $844
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1680
;1680:			return;
ADDRGP4 $782
JUMPV
LABELV $840
line 1683
;1681:		}
;1682:
;1683:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $847
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1684
;1684:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
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
line 1685
;1685:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $839
JUMPV
LABELV $838
ADDRLP4 4
ARGP4
ADDRGP4 $809
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $851
line 1690
;1686:		// special case for map changes, we want to reset the nextmap setting
;1687:		// this allows a player to change maps, but not upset the map rotation
;1688:		char	s[MAX_STRING_CHARS];
;1689:
;1690:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $806
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1691
;1691:		if (*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $853
line 1692
;1692:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $857
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
line 1693
;1693:		} else {
ADDRGP4 $854
JUMPV
LABELV $853
line 1694
;1694:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1695
;1695:		}
LABELV $854
line 1696
;1696:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $862
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1697
;1697:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $852
JUMPV
LABELV $851
ADDRLP4 4
ARGP4
ADDRGP4 $806
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $864
line 1700
;1698:		char	s[MAX_STRING_CHARS];
;1699:
;1700:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $806
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1701
;1701:		if (!*s) {
ADDRLP4 2112
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $866
line 1702
;1702:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $868
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1703
;1703:			return;
ADDRGP4 $782
JUMPV
LABELV $866
line 1705
;1704:		}
;1705:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $871
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1706
;1706:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $862
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1707
;1707:	} else {
ADDRGP4 $865
JUMPV
LABELV $864
line 1708
;1708:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $877
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1709
;1709:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $862
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1710
;1710:	}
LABELV $865
LABELV $852
LABELV $839
line 1712
;1711:
;1712:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $881
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
line 1715
;1713:
;1714:	// start the voting, the caller autoamtically votes yes
;1715:	level.voteTime = level.time;
ADDRGP4 level+2416
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1716
;1716:	level.voteYes = 1;
ADDRGP4 level+2424
CNSTI4 1
ASGNI4
line 1717
;1717:	level.voteNo = 0;
ADDRGP4 level+2428
CNSTI4 0
ASGNI4
line 1719
;1718:
;1719:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $889
JUMPV
LABELV $886
line 1720
;1720:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 3456
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
line 1721
;1721:	}
LABELV $887
line 1719
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $889
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $886
line 1722
;1722:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1724
;1723:
;1724:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $891
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
line 1725
;1725:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1392
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1726
;1726:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $891
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
line 1727
;1727:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $891
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
line 1728
;1728:}
LABELV $782
endproc Cmd_CallVote_f 3136 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1735
;1729:
;1730:/*
;1731:==================
;1732:Cmd_Vote_f
;1733:==================
;1734:*/
;1735:void Cmd_Vote_f( gentity_t *ent ) {
line 1738
;1736:	char		msg[64];
;1737:
;1738:	if ( !level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
NEI4 $897
line 1739
;1739:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $900
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1740
;1740:		return;
ADDRGP4 $896
JUMPV
LABELV $897
line 1742
;1741:	}
;1742:	if ( ent->client->ps.eFlags & EF_VOTED ) {
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
EQI4 $901
line 1743
;1743:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $903
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1744
;1744:		return;
ADDRGP4 $896
JUMPV
LABELV $901
line 1746
;1745:	}
;1746:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $904
line 1747
;1747:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $906
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1748
;1748:		return;
ADDRGP4 $896
JUMPV
LABELV $904
line 1751
;1749:	}
;1750:
;1751:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $907
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1753
;1752:
;1753:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1755
;1754:
;1755:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1757
;1756:
;1757:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $913
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $913
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $908
LABELV $913
line 1758
;1758:		level.voteYes++;
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
line 1759
;1759:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $891
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
line 1760
;1760:	} else {
ADDRGP4 $909
JUMPV
LABELV $908
line 1761
;1761:		level.voteNo++;
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
line 1762
;1762:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $891
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
line 1763
;1763:	}
LABELV $909
line 1767
;1764:
;1765:	// a majority will be determined in CheckVote, which will also account
;1766:	// for players entering or leaving
;1767:}
LABELV $896
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1774
;1768:
;1769:/*
;1770:==================
;1771:Cmd_CallTeamVote_f
;1772:==================
;1773:*/
;1774:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1779
;1775:	int		i, team, cs_offset;
;1776:	char	arg1[MAX_STRING_TOKENS];
;1777:	char	arg2[MAX_STRING_TOKENS];
;1778:
;1779:	team = ent->client->sess.sessionTeam;
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
line 1780
;1780:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $919
line 1781
;1781:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $920
JUMPV
LABELV $919
line 1782
;1782:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $918
line 1783
;1783:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1785
;1784:	else
;1785:		return;
LABELV $922
LABELV $920
line 1787
;1786:
;1787:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $923
line 1788
;1788:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $786
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1789
;1789:		return;
ADDRGP4 $918
JUMPV
LABELV $923
line 1792
;1790:	}
;1791:
;1792:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $926
line 1793
;1793:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $929
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1794
;1794:		return;
ADDRGP4 $918
JUMPV
LABELV $926
line 1796
;1795:	}
;1796:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $930
line 1797
;1797:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $932
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1798
;1798:		return;
ADDRGP4 $918
JUMPV
LABELV $930
line 1800
;1799:	}
;1800:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $933
line 1801
;1801:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $796
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1802
;1802:		return;
ADDRGP4 $918
JUMPV
LABELV $933
line 1806
;1803:	}
;1804:
;1805:	// make sure it is a valid command to vote on
;1806:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1807
;1807:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1808
;1808:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $938
JUMPV
LABELV $935
line 1809
;1809:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $939
line 1810
;1810:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $941
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $939
line 1811
;1811:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
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
line 1812
;1812:	}
LABELV $936
line 1808
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $938
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $935
line 1814
;1813:
;1814:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $944
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
EQU4 $942
LABELV $944
line 1815
;1815:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1816
;1816:		return;
ADDRGP4 $918
JUMPV
LABELV $942
line 1819
;1817:	}
;1818:
;1819:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $947
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $945
line 1822
;1820:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1821:
;1822:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $948
line 1823
;1823:			i = ent->client->ps.clientNum;
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
line 1824
;1824:		}
ADDRGP4 $949
JUMPV
LABELV $948
line 1825
;1825:		else {
line 1827
;1826:			// numeric values are just slot numbers
;1827:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $950
line 1828
;1828:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
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
EQI4 $957
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $957
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $954
LABELV $957
line 1829
;1829:					break;
ADDRGP4 $952
JUMPV
LABELV $954
line 1830
;1830:			}
LABELV $951
line 1827
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $950
LABELV $952
line 1831
;1831:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $960
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $958
LABELV $960
line 1832
;1832:				i = atoi( arg2 );
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
line 1833
;1833:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $964
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $961
LABELV $964
line 1834
;1834:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $295
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1835
;1835:					return;
ADDRGP4 $918
JUMPV
LABELV $961
line 1838
;1836:				}
;1837:
;1838:				if ( !g_entities[i].inuse ) {
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $959
line 1839
;1839:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $298
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1840
;1840:					return;
ADDRGP4 $918
JUMPV
line 1842
;1841:				}
;1842:			}
LABELV $958
line 1843
;1843:			else {
line 1844
;1844:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1845
;1845:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1846
;1846:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $971
JUMPV
LABELV $968
line 1847
;1847:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3456
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
NEI4 $973
line 1848
;1848:						continue;
ADDRGP4 $969
JUMPV
LABELV $973
line 1849
;1849:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3456
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
EQI4 $975
line 1850
;1850:						continue;
ADDRGP4 $969
JUMPV
LABELV $975
line 1851
;1851:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3456
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
line 1852
;1852:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1853
;1853:					if ( !Q_stricmp(netname, leader) ) {
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
NEI4 $977
line 1854
;1854:						break;
ADDRGP4 $970
JUMPV
LABELV $977
line 1856
;1855:					}
;1856:				}
LABELV $969
line 1846
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $971
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $968
LABELV $970
line 1857
;1857:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $979
line 1858
;1858:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $982
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1859
;1859:					return;
ADDRGP4 $918
JUMPV
LABELV $979
line 1861
;1860:				}
;1861:			}
LABELV $959
line 1862
;1862:		}
LABELV $949
line 1863
;1863:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $401
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1864
;1864:	} else {
ADDRGP4 $946
JUMPV
LABELV $945
line 1865
;1865:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1866
;1866:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $983
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1867
;1867:		return;
ADDRGP4 $918
JUMPV
LABELV $946
line 1870
;1868:	}
;1869:
;1870:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1872
;1871:
;1872:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $989
JUMPV
LABELV $986
line 1873
;1873:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3456
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
NEI4 $991
line 1874
;1874:			continue;
ADDRGP4 $987
JUMPV
LABELV $991
line 1875
;1875:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3456
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
NEI4 $993
line 1876
;1876:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $995
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
LABELV $993
line 1877
;1877:	}
LABELV $987
line 1872
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $989
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $986
line 1880
;1878:
;1879:	// start the voting, the caller autoamtically votes yes
;1880:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1881
;1881:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 1
ASGNI4
line 1882
;1882:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 1884
;1883:
;1884:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1003
JUMPV
LABELV $1000
line 1885
;1885:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3456
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
NEI4 $1005
line 1886
;1886:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3456
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
LABELV $1005
line 1887
;1887:	}
LABELV $1001
line 1884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1003
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1000
line 1888
;1888:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1890
;1889:
;1890:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $891
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
line 1891
;1891:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
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
line 1892
;1892:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $891
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
line 1893
;1893:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $891
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
line 1894
;1894:}
LABELV $918
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_ListPlayers_f
proc Cmd_ListPlayers_f 2108 16
line 1905
;1895:
;1896:
;1897:
;1898:/*
;1899:======================================
;1900:  ListPlayers
;1901:
;1902:  Please clean this up
;1903:======================================
;1904:*/
;1905:void Cmd_ListPlayers_f ( gentity_t *ent ) {
line 1918
;1906:
;1907:int		i;
;1908:int		j;
;1909:int		l;
;1910:int		h;
;1911:int		clientNum;
;1912:int		ping;
;1913:int		score;
;1914:char	userinfo[MAX_INFO_STRING];
;1915:char	*value;
;1916:char		n2[MAX_STRING_CHARS];
;1917:		
;1918:		trap_SendServerCommand( ent-g_entities, va("print \"CLIENT LIST\""));
ADDRGP4 $1012
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1919
;1919:		trap_SendServerCommand( ent-g_entities, va("print \"Client  -  Name                   - Ping   -  Score - GUID\""));
ADDRGP4 $1013
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1920
;1920:		trap_SendServerCommand( ent-g_entities, va("print \"---------------------------------------------------------------------------------------\""));
ADDRGP4 $1014
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1922
;1921:
;1922:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1018
JUMPV
LABELV $1015
line 1924
;1923:	
;1924:			if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3456
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
NEI4 $1020
line 1925
;1925:				continue;
ADDRGP4 $1016
JUMPV
LABELV $1020
line 1928
;1926:			}
;1927:				
;1928:			clientNum = level.clients[i].ps.clientNum;
ADDRLP4 12
CNSTI4 3456
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
line 1930
;1929:			
;1930:			ping = level.clients[i].ps.ping;
ADDRLP4 2068
CNSTI4 3456
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
line 1931
;1931:			score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 2072
CNSTI4 3456
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
line 1933
;1932:			
;1933:			trap_SendServerCommand( ent-g_entities, va("print \"%i  - %s\"", clientNum, level.clients[i].pers.netname ));
ADDRGP4 $1022
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3456
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1935
;1934:			
;1935:			SanitizeString( level.clients[i].pers.netname, n2 );
CNSTI4 3456
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
line 1936
;1936:			Q_CleanStr(n2);
ADDRLP4 1040
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1937
;1937:			l = strlen(n2);
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
line 1938
;1938:			h = 20 - l;
ADDRLP4 4
CNSTI4 20
ADDRLP4 2064
INDIRI4
SUBI4
ASGNI4
line 1939
;1939:				for ( j = 0 ; j < h ; j++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1026
JUMPV
LABELV $1023
line 1940
;1940:					G_Printf(" ");
ADDRGP4 $941
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1941
;1941:				}
LABELV $1024
line 1939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1026
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1023
line 1942
;1942:			trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 1943
;1943:			value = Info_ValueForKey (userinfo, "cl_guid");
ADDRLP4 16
ARGP4
ADDRGP4 $1027
ARGP4
ADDRLP4 2100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2076
ADDRLP4 2100
INDIRP4
ASGNP4
line 1944
;1944:			trap_SendServerCommand( ent-g_entities, va("print \"  -  %i  -  %i  -  %s\n\"", ping, score, value ));
ADDRGP4 $1028
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1946
;1945:		
;1946:		}
LABELV $1016
line 1922
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1018
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1015
line 1948
;1947:
;1948:}
LABELV $1011
endproc Cmd_ListPlayers_f 2108 16
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 1955
;1949:
;1950:/*
;1951:==================
;1952:Cmd_TeamVote_f
;1953:==================
;1954:*/
;1955:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1959
;1956:	int			team, cs_offset;
;1957:	char		msg[64];
;1958:
;1959:	team = ent->client->sess.sessionTeam;
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
line 1960
;1960:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1030
line 1961
;1961:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1031
JUMPV
LABELV $1030
line 1962
;1962:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $1029
line 1963
;1963:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1965
;1964:	else
;1965:		return;
LABELV $1033
LABELV $1031
line 1967
;1966:
;1967:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1034
line 1968
;1968:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $1037
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1969
;1969:		return;
ADDRGP4 $1029
JUMPV
LABELV $1034
line 1971
;1970:	}
;1971:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
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
EQI4 $1038
line 1972
;1972:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $1040
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1973
;1973:		return;
ADDRGP4 $1029
JUMPV
LABELV $1038
line 1975
;1974:	}
;1975:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1041
line 1976
;1976:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $906
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1977
;1977:		return;
ADDRGP4 $1029
JUMPV
LABELV $1041
line 1980
;1978:	}
;1979:
;1980:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 $1043
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1982
;1981:
;1982:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1984
;1983:
;1984:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1986
;1985:
;1986:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1049
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1049
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1044
LABELV $1049
line 1987
;1987:		level.teamVoteYes[cs_offset]++;
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
line 1988
;1988:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $891
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
line 1989
;1989:	} else {
ADDRGP4 $1045
JUMPV
LABELV $1044
line 1990
;1990:		level.teamVoteNo[cs_offset]++;
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
line 1991
;1991:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $891
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
line 1992
;1992:	}
LABELV $1045
line 1996
;1993:
;1994:	// a majority will be determined in TeamCheckVote, which will also account
;1995:	// for players entering or leaving
;1996:}
LABELV $1029
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2004
;1997:
;1998:
;1999:/*
;2000:=================
;2001:Cmd_SetViewpos_f
;2002:=================
;2003:*/
;2004:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 2009
;2005:	vec3_t		origin, angles;
;2006:	char		buffer[MAX_TOKEN_CHARS];
;2007:	int			i;
;2008:
;2009:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1055
line 2010
;2010:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $264
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2011
;2011:		return;
ADDRGP4 $1054
JUMPV
LABELV $1055
line 2013
;2012:	}
;2013:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1058
line 2014
;2014:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1060
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
CNSTI4 916
DIVI4
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2015
;2015:		return;
ADDRGP4 $1054
JUMPV
LABELV $1058
line 2018
;2016:	}
;2017:
;2018:	VectorClear( angles );
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
line 2019
;2019:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1063
line 2020
;2020:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
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
line 2021
;2021:		origin[i] = atof( buffer );
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
line 2022
;2022:	}
LABELV $1064
line 2019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1063
line 2024
;2023:
;2024:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2025
;2025:	angles[YAW] = atof( buffer );
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
line 2027
;2026:
;2027:	TeleportPlayer( ent, origin, angles );
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
line 2028
;2028:}
LABELV $1054
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 2037
;2029:
;2030:
;2031:
;2032:/*
;2033:=================
;2034:Cmd_Stats_f
;2035:=================
;2036:*/
;2037:void Cmd_Stats_f( gentity_t *ent ) {
line 2052
;2038:/*
;2039:	int max, n, i;
;2040:
;2041:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;2042:
;2043:	n = 0;
;2044:	for ( i = 0; i < max; i++ ) {
;2045:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;2046:			n++;
;2047:	}
;2048:
;2049:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;2050:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;2051:*/
;2052:}
LABELV $1068
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1192 16
line 2059
;2053:
;2054:/*
;2055:=================
;2056:ClientCommand
;2057:=================
;2058:*/
;2059:void ClientCommand( int clientNum ) {
line 2063
;2060:	gentity_t *ent;
;2061:	char	cmd[MAX_TOKEN_CHARS];
;2062:
;2063:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2064
;2064:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1070
line 2065
;2065:		return;		// not fully in game yet
ADDRGP4 $1069
JUMPV
LABELV $1070
line 2069
;2066:	}
;2067:
;2068:
;2069:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2071
;2070:
;2071:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1074
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1072
line 2072
;2072:		Cmd_Say_f (ent, SAY_ALL, qfalse);
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
line 2073
;2073:		return;
ADDRGP4 $1069
JUMPV
LABELV $1072
line 2075
;2074:	}
;2075:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1077
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1075
line 2076
;2076:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
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
line 2077
;2077:		return;
ADDRGP4 $1069
JUMPV
LABELV $1075
line 2079
;2078:	}
;2079:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1080
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1078
line 2080
;2080:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2081
;2081:		return;
ADDRGP4 $1069
JUMPV
LABELV $1078
line 2083
;2082:	}
;2083:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1083
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1081
line 2084
;2084:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
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
line 2085
;2085:		return;
ADDRGP4 $1069
JUMPV
LABELV $1081
line 2087
;2086:	}
;2087:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1086
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1084
line 2088
;2088:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
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
line 2089
;2089:		return;
ADDRGP4 $1069
JUMPV
LABELV $1084
line 2091
;2090:	}
;2091:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $677
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1087
line 2092
;2092:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2093
;2093:		return;
ADDRGP4 $1069
JUMPV
LABELV $1087
line 2095
;2094:	}
;2095:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1091
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1089
line 2096
;2096:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
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
line 2097
;2097:		return;
ADDRGP4 $1069
JUMPV
LABELV $1089
line 2099
;2098:	}
;2099:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1094
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1092
line 2100
;2100:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
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
line 2101
;2101:		return;
ADDRGP4 $1069
JUMPV
LABELV $1092
line 2103
;2102:	}
;2103:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1097
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1095
line 2104
;2104:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2105
;2105:		return;
ADDRGP4 $1069
JUMPV
LABELV $1095
line 2107
;2106:	}
;2107:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1100
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1098
line 2108
;2108:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2109
;2109:		return;
ADDRGP4 $1069
JUMPV
LABELV $1098
line 2111
;2110:	}
;2111:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1101
line 2112
;2112:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2113
;2113:		return;
ADDRGP4 $1069
JUMPV
LABELV $1101
line 2117
;2114:	}
;2115:
;2116:	// ignore all other commands when at intermission
;2117:	if (level.intermissiontime) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $1103
line 2118
;2118:		Cmd_Say_f (ent, SAY_INVAL, qtrue);
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
line 2119
;2119:		return;
ADDRGP4 $1069
JUMPV
LABELV $1103
line 2122
;2120:	}
;2121:
;2122:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1108
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1106
line 2123
;2123:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $1107
JUMPV
LABELV $1106
line 2124
;2124:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1111
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1109
line 2125
;2125:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1110
JUMPV
LABELV $1109
line 2126
;2126:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1114
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1112
line 2127
;2127:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1113
JUMPV
LABELV $1112
line 2128
;2128:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1117
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1115
line 2129
;2129:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2130
;2130:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1120
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1118
line 2131
;2131:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1119
JUMPV
LABELV $1118
line 2132
;2132:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $400
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1121
line 2133
;2133:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1122
JUMPV
LABELV $1121
line 2134
;2134:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1125
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1123
line 2135
;2135:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1124
JUMPV
LABELV $1123
line 2136
;2136:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1128
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1126
line 2137
;2137:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1127
JUMPV
LABELV $1126
line 2138
;2138:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1131
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1129
line 2139
;2139:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2140
;2140:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1134
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1132
line 2141
;2141:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2142
;2142:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1135
line 2143
;2143:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1136
JUMPV
LABELV $1135
line 2144
;2144:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1140
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1138
line 2145
;2145:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2146
;2146:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1143
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1141
line 2147
;2147:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1142
JUMPV
LABELV $1141
line 2148
;2148:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1146
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1144
line 2149
;2149:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2150
;2150:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1149
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1147
line 2151
;2151:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2152
;2152:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1150
line 2153
;2153:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2154
;2154:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1153
line 2155
;2155:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2156
;2156:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1156
line 2157
;2157:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2158
;2158:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1159
line 2159
;2159:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1160
JUMPV
LABELV $1159
line 2160
;2160:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1164
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1162
line 2161
;2161:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $1163
JUMPV
LABELV $1162
line 2162
;2162:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1167
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1165
line 2163
;2163:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2164
;2164:	else if (Q_stricmp (cmd, "spawnturret") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1170
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1168
line 2165
;2165:		Cmd_SpawnTurret_f( ent, 0 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1169
JUMPV
LABELV $1168
line 2166
;2166:	else if (Q_stricmp (cmd, "spawnturret2") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1173
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1171
line 2167
;2167:		Cmd_SpawnTurret_f( ent, 1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1172
JUMPV
LABELV $1171
line 2168
;2168:	else if (Q_stricmp (cmd, "spawnturret3") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1176
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1174
line 2169
;2169:		Cmd_SpawnTurret_f( ent, 2 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1175
JUMPV
LABELV $1174
line 2170
;2170:	else if (Q_stricmp (cmd, "spawngen") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1177
line 2171
;2171:		Cmd_SpawnGenerator_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnGenerator_f
CALLV
pop
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2172
;2172:	else if (Q_stricmp (cmd, "spawnmc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1182
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $1180
line 2173
;2173:		Cmd_SpawnMC_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnMC_f
CALLV
pop
ADDRGP4 $1181
JUMPV
LABELV $1180
line 2174
;2174:	else if (Q_stricmp (cmd, "spawntd") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1185
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $1183
line 2175
;2175:		Cmd_SpawnDisplacer_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnDisplacer_f
CALLV
pop
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2176
;2176:	else if (Q_stricmp (cmd, "listplayers") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1188
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1186
line 2177
;2177:		Cmd_ListPlayers_f( ent ); 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ListPlayers_f
CALLV
pop
ADDRGP4 $1187
JUMPV
LABELV $1186
line 2178
;2178:	else if (Q_stricmp (cmd, "test") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1191
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1189
line 2179
;2179:		Cmd_Test_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Test_f
CALLV
pop
ADDRGP4 $1190
JUMPV
LABELV $1189
line 2181
;2180:	else
;2181:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1192
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
LABELV $1130
LABELV $1127
LABELV $1124
LABELV $1122
LABELV $1119
LABELV $1116
LABELV $1113
LABELV $1110
LABELV $1107
line 2182
;2182:}
LABELV $1069
endproc ClientCommand 1192 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 2192
;2183:
;2184:/*
;2185:============================
;2186:G_SendCommandToClient
;2187:Send the given command to the specified (or all) clients
;2188:Shafe - Trep - This is for the Radar
;2189:============================
;2190:*/
;2191:void G_SendCommandToClient (gentity_t *to, char *cmd)
;2192:{
line 2193
;2193:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1194
line 2194
;2194:	{
line 2196
;2195:		// send to all clients 
;2196:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2197
;2197:	} else {
ADDRGP4 $1195
JUMPV
LABELV $1194
line 2199
;2198:    // send to specified client
;2199:    trap_SendServerCommand ( to-g_entities, cmd);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2200
;2200:	}
LABELV $1195
line 2201
;2201:}
LABELV $1193
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
LABELV $1192
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
LABELV $1191
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1188
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
LABELV $1185
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $1182
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $1179
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
LABELV $1176
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
LABELV $1173
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
LABELV $1170
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
LABELV $1167
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
LABELV $1164
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $1161
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1158
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
LABELV $1155
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1152
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
LABELV $1149
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
LABELV $1146
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1143
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
LABELV $1140
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1137
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1134
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
LABELV $1131
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
LABELV $1128
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1125
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
LABELV $1120
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1117
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1114
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
LABELV $1111
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1108
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1100
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1097
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1094
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
LABELV $1091
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1086
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
LABELV $1083
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1080
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1077
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
LABELV $1074
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1060
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
LABELV $1043
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
LABELV $1040
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
LABELV $1037
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
LABELV $1028
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
LABELV $1027
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
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
LABELV $1014
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
LABELV $1013
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
LABELV $1012
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
LABELV $995
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
LABELV $983
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
LABELV $982
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
LABELV $947
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $941
byte 1 32
byte 1 0
align 1
LABELV $932
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
LABELV $929
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
LABELV $907
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
LABELV $906
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
LABELV $903
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
LABELV $900
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
LABELV $891
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $881
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
LABELV $877
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $871
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
LABELV $868
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
LABELV $862
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $857
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
LABELV $850
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $847
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $844
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
LABELV $836
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $831
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
LABELV $830
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
LABELV $827
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
LABELV $824
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
LABELV $821
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
LABELV $818
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $815
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
LABELV $812
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
LABELV $809
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $806
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $803
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
LABELV $800
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
LABELV $796
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
LABELV $793
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
LABELV $790
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
LABELV $786
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
LABELV $781
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
LABELV $780
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
LABELV $779
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
LABELV $778
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
LABELV $777
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
LABELV $776
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
LABELV $775
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
LABELV $774
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
LABELV $773
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
LABELV $764
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $763
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
LABELV $762
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
LABELV $761
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
LABELV $760
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
LABELV $759
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
LABELV $758
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
LABELV $757
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $754
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $737
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
LABELV $732
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
LABELV $721
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
LABELV $711
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
LABELV $689
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
LABELV $679
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
LABELV $678
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $677
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $674
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $657
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
LABELV $635
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $628
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
LABELV $627
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
LABELV $625
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
LABELV $624
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
LABELV $619
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
LABELV $618
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
LABELV $615
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
LABELV $613
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
LABELV $612
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
LABELV $601
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $600
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $599
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
LABELV $571
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
LABELV $542
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
LABELV $538
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
LABELV $525
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
LABELV $519
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
LABELV $517
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
LABELV $515
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
LABELV $513
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
LABELV $474
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
LABELV $469
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
LABELV $458
byte 1 98
byte 1 0
align 1
LABELV $457
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $453
byte 1 114
byte 1 0
align 1
LABELV $452
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $445
byte 1 115
byte 1 0
align 1
LABELV $444
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
LABELV $441
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $438
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $434
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $433
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
LABELV $429
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
LABELV $426
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
LABELV $425
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
LABELV $421
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
LABELV $413
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
LABELV $410
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
LABELV $401
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $400
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
LABELV $396
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
LABELV $395
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
LABELV $385
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
LABELV $384
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
LABELV $378
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
LABELV $377
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
LABELV $371
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
LABELV $370
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
LABELV $369
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
LABELV $357
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $354
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $351
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
LABELV $348
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
LABELV $345
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
LABELV $339
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $329
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $323
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $317
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $314
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $308
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
LABELV $298
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
LABELV $295
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
LABELV $267
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
LABELV $264
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
LABELV $258
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
LABELV $256
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
LABELV $254
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
LABELV $252
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
LABELV $250
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
LABELV $248
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
LABELV $246
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
LABELV $244
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
LABELV $240
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
LABELV $224
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
LABELV $217
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
LABELV $199
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
LABELV $196
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
LABELV $193
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
LABELV $144
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
LABELV $141
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
