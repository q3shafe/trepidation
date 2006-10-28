export Cmd_SpawnMC_f
code
proc Cmd_SpawnMC_f 4 8
file "../g_cmds.c"
line 18
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
;18:void Cmd_SpawnMC_f( gentity_t *ent ){
line 21
;19:	
;20:	int	iserror; 
;21:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 24
;22:
;23:	// You can only Build MC's in GameMode 3
;24:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $56
line 25
;25:	{
line 27
;26:		// Make Sure We Dont Already Have One
;27:		if(ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $59
line 28
;28:		{
line 29
;29:			if (level.redMC == 0) { 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
NEI4 $61
line 30
;30:				BuildMC(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 31
;31:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 32
;32:			} else {
ADDRGP4 $62
JUMPV
LABELV $61
line 33
;33:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 34
;34:			}
LABELV $62
line 35
;35:		}
LABELV $59
line 36
;36:		if(ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $64
line 37
;37:		{
line 38
;38:			if (level.blueMC == 0) { 
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
NEI4 $66
line 39
;39:				BuildMC(ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 40
;40:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 41
;41:			} else {
ADDRGP4 $67
JUMPV
LABELV $66
line 42
;42:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 43
;43:			}
LABELV $67
line 44
;44:		}	
LABELV $64
line 45
;45:	}
LABELV $56
line 48
;46:
;47:	// If it couldn't be built tell them why
;48:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $69
line 49
;49:	{
line 51
;50:		// FIXME: Play Error Sound
;51:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"There is Already A Power Core.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $71
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $71
line 52
;52:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Power Core Not Allowed.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $74
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $76
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $74
line 55
;53:		//G_AddEvent( ent, EV_ERROR, 0 );
;54:
;55:	}
LABELV $69
line 57
;56:	
;57:}
LABELV $55
endproc Cmd_SpawnMC_f 4 8
export Cmd_SpawnGenerator_f
proc Cmd_SpawnGenerator_f 4 8
line 59
;58:
;59:void Cmd_SpawnGenerator_f( gentity_t *ent ){
line 62
;60:
;61:	int	iserror; 
;62:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 65
;63:
;64:	// You can only Build Generators in GameMode 3
;65:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $78
line 66
;66:	{
line 68
;67:		// Make sure there's not more than 2
;68:		if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $81
line 69
;69:		{
line 70
;70:			if (level.redGen > 1)
ADDRGP4 level+9256
INDIRI4
CNSTI4 1
LEI4 $83
line 71
;71:			{
line 72
;72:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 73
;73:			} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 74
;74:				BuildGenerator(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildGenerator
CALLV
pop
line 75
;75:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 76
;76:			}
LABELV $84
line 77
;77:		}
LABELV $81
line 78
;78:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $86
line 79
;79:		{
line 80
;80:			if (level.blueGen > 1)
ADDRGP4 level+9260
INDIRI4
CNSTI4 1
LEI4 $88
line 81
;81:			{
line 82
;82:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 83
;83:			} else {
ADDRGP4 $89
JUMPV
LABELV $88
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
LABELV $89
line 87
;87:		}
LABELV $86
line 88
;88:	}
LABELV $78
line 91
;89:	
;90:	// If it couldn't be built tell them why
;91:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $91
line 92
;92:	{
line 94
;93:		// FIXME: Play Error Sound
;94:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Shield Generators..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $93
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $95
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $93
line 95
;95:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Sheild Generators Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $96
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $96
line 97
;96:		//G_AddEvent( ent, EV_ERROR, 0 );
;97:	}						
LABELV $91
line 99
;98:
;99:}
LABELV $77
endproc Cmd_SpawnGenerator_f 4 8
export Cmd_SpawnDisplacer_f
proc Cmd_SpawnDisplacer_f 8 8
line 105
;100:
;101:
;102:
;103:
;104://BuildDisplacer
;105:void Cmd_SpawnDisplacer_f( gentity_t *ent ){
line 108
;106:
;107:	int	iserror; 
;108:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 111
;109:
;110:	// You can only Build Displacers in GameMode 3
;111:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $100
line 112
;112:	{
line 114
;113:		// Make sure there's not more than 2
;114:		if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $103
line 115
;115:		{
line 116
;116:			if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $105
line 117
;117:			{
line 118
;118:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 119
;119:			} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 120
;120:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 121
;121:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 122
;122:			}
LABELV $106
line 123
;123:		}
LABELV $103
line 124
;124:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $108
line 125
;125:		{
line 126
;126:			if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $110
line 127
;127:			{
line 128
;128:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 129
;129:			} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 130
;130:				BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 131
;131:				iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 132
;132:			}
LABELV $111
line 133
;133:		}
LABELV $108
line 134
;134:	}
LABELV $100
line 136
;135:	
;136:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $113
line 137
;137:	{
line 138
;138:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $116
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $116
line 139
;139:		{
line 141
;140:			// Make sure there's not more than 2
;141:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $119
line 142
;142:			{
line 143
;143:				if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $121
line 144
;144:				{
line 145
;145:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 146
;146:				} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 147
;147:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 148
;148:					level.redMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 149
;149:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 150
;150:				}
LABELV $122
line 151
;151:			}
LABELV $119
line 152
;152:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $125
line 153
;153:			{
line 154
;154:				if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $127
line 155
;155:				{
line 156
;156:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 157
;157:				} else {
ADDRGP4 $128
JUMPV
LABELV $127
line 158
;158:					level.blueMC = 1; // Do this so it doesnt instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 159
;159:					BuildDisplacer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BuildDisplacer
CALLV
pop
line 160
;160:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 161
;161:				}
LABELV $128
line 162
;162:			}
LABELV $125
line 163
;163:		}
LABELV $116
line 166
;164:
;165:
;166:	}
LABELV $113
line 170
;167:		
;168:
;169:	// If it couldn't be built tell them why
;170:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $131
line 171
;171:	{
line 173
;172:		// FIXME: Play Error Sound
;173:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Immobilizers..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $133
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $133
line 174
;174:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizers Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $136
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $136
line 176
;175:		//G_AddEvent( ent, EV_ERROR, 0 );
;176:	}						
LABELV $131
line 178
;177:
;178:}
LABELV $99
endproc Cmd_SpawnDisplacer_f 8 8
export Cmd_SpawnTurret_f
proc Cmd_SpawnTurret_f 12 8
line 181
;179:
;180:
;181:void Cmd_SpawnTurret_f( gentity_t *ent , int type ){
line 185
;182:
;183:	int		iserror; 
;184:	int		cts;
;185:	iserror = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 189
;186:	
;187:
;188:	// If Playing GM 3 Check the rules
;189:	if (g_GameMode.integer == 3) {
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $140
line 191
;190:		// What types of turrets are you allowed to build?
;191:		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];
ADDRLP4 4
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
ADDI4
ASGNI4
line 194
;192:		
;193:		// If the rules change This needs to be change in ui_ingame.c as well
;194:		if ((cts < 3) && (type == 1)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $147
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $147
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $147
line 195
;195:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 6
GEI4 $149
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $149
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $149
line 197
;196:
;197:		if (iserror == 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $151
line 198
;198:		{
line 200
;199:			// Be sure there arent too many
;200:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $153
line 201
;201:			{
line 202
;202:				if (level.blueTurrets > 5)
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $155
line 203
;203:				{
line 204
;204:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 205
;205:				} else {
ADDRGP4 $156
JUMPV
LABELV $155
line 206
;206:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 207
;207:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 208
;208:				}	
LABELV $156
line 209
;209:			}
LABELV $153
line 210
;210:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $158
line 211
;211:			{
line 212
;212:				if (level.redTurrets > 5)
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $160
line 213
;213:				{
line 214
;214:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 215
;215:				} else {
ADDRGP4 $161
JUMPV
LABELV $160
line 216
;216:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 217
;217:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 218
;218:				}			
LABELV $161
line 219
;219:			}
LABELV $158
line 220
;220:		}
LABELV $151
line 221
;221:	}
LABELV $140
line 225
;222:
;223:	// If playing CTF Make sure that we dont have too many 
;224:	// Turrets on our team.
;225:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $163
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $163
line 226
;226:	{
line 228
;227:		
;228:		if ((iserror == 1) && (g_Turrets.integer == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $166
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $166
line 229
;229:		{
line 230
;230:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $169
line 231
;231:			{
line 232
;232:				if (level.blueTurrets > 5)
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $171
line 233
;233:				{
line 234
;234:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 235
;235:				} else {
ADDRGP4 $172
JUMPV
LABELV $171
line 236
;236:					level.blueMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9284
CNSTI4 1
ASGNI4
line 237
;237:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 238
;238:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 239
;239:				}			
LABELV $172
line 240
;240:			}
LABELV $169
line 241
;241:			if(ent->client->sess.sessionTeam == TEAM_RED) 
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
line 242
;242:			{
line 243
;243:				if (level.redTurrets > 5)
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $177
line 244
;244:				{
line 245
;245:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 246
;246:				} else {
ADDRGP4 $178
JUMPV
LABELV $177
line 247
;247:					level.redMC = 1; // Do this so that the turrets dont instantly blow up
ADDRGP4 level+9280
CNSTI4 1
ASGNI4
line 248
;248:					BuildTurret(ent, type);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BuildTurret
CALLV
pop
line 249
;249:					iserror = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 250
;250:				}			
LABELV $178
line 251
;251:			}
LABELV $175
line 252
;252:		}
LABELV $166
line 253
;253:	}
LABELV $163
line 256
;254:	
;255:	// If it couldn't be built tell them why
;256:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $181
line 257
;257:	{
line 259
;258:		// FIXME Play Error Sound
;259:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Turret Type Not Available Yet.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $183
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $185
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $183
line 260
;260:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Turrets On Your Team.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $186
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $188
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $186
line 261
;261:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Turrets Not Allowed Here.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $189
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $191
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $189
line 263
;262:		//G_AddEvent( ent, EV_ERROR, 0 );
;263:	}
LABELV $181
line 265
;264:
;265:}
LABELV $139
endproc Cmd_SpawnTurret_f 12 8
export DeathmatchScoreboardMessage
proc DeathmatchScoreboardMessage 2484 68
line 279
;266:/*
;267:=================================================
;268:// End Buildables
;269:=================================================
;270:/*
;271:
;272:
;273:/*
;274:==================
;275:DeathmatchScoreboardMessage
;276:
;277:==================
;278:*/
;279:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 289
;280:	char		entry[1024];
;281:	char		string[1400];
;282:	int			stringlength;
;283:	int			i, j;
;284:	gclient_t	*cl;
;285:	int			numSorted, scoreFlags, accuracy, perfect;
;286:	
;287:
;288:	// send the latest information on all clients
;289:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 290
;290:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 291
;291:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 293
;292:
;293:	numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+84
INDIRI4
ASGNI4
line 295
;294:	
;295:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $194
line 298
;296:		int		ping;
;297:
;298:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3452
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
line 300
;299:
;300:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $199
line 301
;301:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 302
;302:		} else {
ADDRGP4 $200
JUMPV
LABELV $199
line 305
;303://unlagged - true ping
;304:			//ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
;305:			ping = cl->pers.realPing < 999 ? cl->pers.realPing : 999;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 999
GEI4 $202
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $202
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $203
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 307
;306://unlagged - true ping
;307:		}
LABELV $200
line 310
;308:
;309:
;310:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $204
line 311
;311:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
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
line 312
;312:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 313
;313:		else {
line 314
;314:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 315
;315:		}
LABELV $205
line 316
;316:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
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
NEI4 $207
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $207
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $208
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 319
;317:
;318:		// Changed cl->ps.persistant[PERS_SCORE] to .truescore
;319:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $209
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
CNSTI4 876
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
line 333
;320:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;321:			
;322:			cl->pers.TrueScore, ping, (level.time - cl->pers.enterTime)/60000,
;323:			
;324:
;325:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;326:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;327:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;328:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;329:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;330:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;331:			perfect,
;332:			cl->ps.persistant[PERS_CAPTURES]);
;333:		j = strlen(entry);
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
line 334
;334:		if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $214
line 335
;335:			break;
ADDRGP4 $196
JUMPV
LABELV $214
line 336
;336:		strcpy (string + stringlength, entry);
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
line 337
;337:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 338
;338:	}
LABELV $195
line 295
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $197
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $194
LABELV $196
line 340
;339:
;340:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $216
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 343
;341:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;342:		string ) );
;343:}
LABELV $192
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_TeleGren_f
proc Cmd_TeleGren_f 12 4
line 355
;344:
;345:
;346:/*
;347:
;348:=================
;349:
;350:Cmd_TeleGren_f
;351:Shafe - Trep - PDG
;352:=================
;353:*/
;354:
;355:void Cmd_TeleGren_f (gentity_t *ent) {
line 357
;356:
;357:    if ( ent->istelepoint == 1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 1
NEI4 $222
line 358
;358:	{
line 361
;359:		// Shafe The old way was just to drop it now we return flags to base if you try to teleport with one
;360:			
;361:		if (ent->client->ps.powerups[PW_REDFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $224
line 362
;362:		{
line 363
;363:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 364
;364:			ent->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 365
;365:		}
LABELV $224
line 367
;366:
;367:		if (ent->client->ps.powerups[PW_BLUEFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $226
line 368
;368:		{
line 369
;369:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 370
;370:			ent->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 371
;371:		}
LABELV $226
line 374
;372:
;373:
;374:		VectorCopy( ent->teleloc, ent->client->ps.origin );
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
line 375
;375:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 376
;376:		VectorClear( ent->teleloc );
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
line 378
;377:
;378:	} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 379
;379:        G_Printf( S_COLOR_GREEN "PDG Lock Not Established\n" );
ADDRGP4 $228
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 381
;380:
;381:	}
LABELV $223
line 383
;382:
;383:}
LABELV $221
endproc Cmd_TeleGren_f 12 4
export Cmd_DropFlag_f
proc Cmd_DropFlag_f 0 4
line 394
;384:
;385:/*
;386:
;387:=================
;388:
;389:Cmd_DropFlag_f
;390:Shafe - Trep - PDG
;391:=================
;392:*/
;393:
;394:void Cmd_DropFlag_f (gentity_t *ent) {
line 396
;395:
;396:	Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 398
;397:
;398:}
LABELV $229
endproc Cmd_DropFlag_f 0 4
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 408
;399:
;400:
;401:/*
;402:==================
;403:Cmd_Score_f
;404:
;405:Request current scoreboard information
;406:==================
;407:*/
;408:void Cmd_Score_f( gentity_t *ent ) {
line 409
;409:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 410
;410:}
LABELV $230
endproc Cmd_Score_f 0 4
export Cmd_Test_f
proc Cmd_Test_f 32 8
line 416
;411:
;412:
;413:
;414:
;415:
;416:void Cmd_Test_f (gentity_t *ent) {
line 420
;417:	
;418:	
;419:		
;420:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluegenerators %i\n\"", level.blueGen ));		
ADDRGP4 $232
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 421
;421:		trap_SendServerCommand( ent-g_entities, va("print \" level.redgenerators %i\n\"", level.redGen ));		
ADDRGP4 $234
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 422
;422:		trap_SendServerCommand( ent-g_entities, va("print \" level.blueturrets %i\n\"", level.blueTurrets ));		
ADDRGP4 $236
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 423
;423:		trap_SendServerCommand( ent-g_entities, va("print \" level.redturrets %i\n\"", level.redTurrets ));		
ADDRGP4 $238
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 424
;424:		trap_SendServerCommand( ent-g_entities, va("print \" level.redmc %i\n\"", level.redMC ));		
ADDRGP4 $240
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 425
;425:		trap_SendServerCommand( ent-g_entities, va("print \" level.blumc %i\n\"", level.blueMC ));		
ADDRGP4 $242
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 426
;426:		trap_SendServerCommand( ent-g_entities, va("print \" level.redscorelatched %i\n\"", level.redScoreLatched ));		
ADDRGP4 $244
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 427
;427:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluescorelatched %i\n\"", level.blueScoreLatched ));		
ADDRGP4 $246
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 431
;428:		//trap_SendServerCommand( ent-g_entities, va("print \" level.scoreTime %i\n\"", (level.time-level.scoreTime) ));		
;429:	
;430:
;431:}
LABELV $231
endproc Cmd_Test_f 32 8
export CheatsOk
proc CheatsOk 4 8
line 439
;432:
;433:
;434:/*
;435:==================
;436:CheatsOk
;437:==================
;438:*/
;439:qboolean	CheatsOk( gentity_t *ent ) {
line 440
;440:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $249
line 441
;441:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $252
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 442
;442:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $248
JUMPV
LABELV $249
line 445
;443:	}
;444:
;445:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $253
line 446
;446:      trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\"")); 
ADDRGP4 $255
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 447
;447:      return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $248
JUMPV
LABELV $253
line 449
;448:   }
;449:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $256
line 450
;450:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $255
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 451
;451:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $248
JUMPV
LABELV $256
line 453
;452:	}
;453:	return qtrue;
CNSTI4 1
RETI4
LABELV $248
endproc CheatsOk 4 8
bss
align 1
LABELV $259
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 462
;454:}
;455:
;456:
;457:/*
;458:==================
;459:ConcatArgs
;460:==================
;461:*/
;462:char	*ConcatArgs( int start ) {
line 468
;463:	int		i, c, tlen;
;464:	static char	line[MAX_STRING_CHARS];
;465:	int		len;
;466:	char	arg[MAX_STRING_CHARS];
;467:
;468:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 469
;469:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 470
;470:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $260
line 471
;471:		trap_Argv( i, arg, sizeof( arg ) );
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
line 472
;472:		tlen = strlen( arg );
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
line 473
;473:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $264
line 474
;474:			break;
ADDRGP4 $262
JUMPV
LABELV $264
line 476
;475:		}
;476:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $259
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
line 477
;477:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 478
;478:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $266
line 479
;479:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $259
ADDP4
CNSTI1 32
ASGNI1
line 480
;480:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 481
;481:		}
LABELV $266
line 482
;482:	}
LABELV $261
line 470
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $263
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $260
LABELV $262
line 484
;483:
;484:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $259
ADDP4
CNSTI1 0
ASGNI1
line 486
;485:
;486:	return line;
ADDRGP4 $259
RETP4
LABELV $258
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 496
;487:}
;488:
;489:/*
;490:==================
;491:SanitizeString
;492:
;493:Remove case and control characters
;494:==================
;495:*/
;496:void SanitizeString( char *in, char *out ) {
ADDRGP4 $270
JUMPV
LABELV $269
line 497
;497:	while ( *in ) {
line 498
;498:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $272
line 499
;499:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 500
;500:			continue;
ADDRGP4 $270
JUMPV
LABELV $272
line 502
;501:		}
;502:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $274
line 503
;503:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 504
;504:			continue;
ADDRGP4 $270
JUMPV
LABELV $274
line 506
;505:		}
;506:		*out++ = tolower( *in++ );
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
line 507
;507:	}
LABELV $270
line 497
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $269
line 509
;508:
;509:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 510
;510:}
LABELV $268
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 520
;511:
;512:/*
;513:==================
;514:ClientNumberFromString
;515:
;516:Returns a player number for either a number or name string
;517:Returns -1 if invalid
;518:==================
;519:*/
;520:int ClientNumberFromString( gentity_t *to, char *s ) {
line 527
;521:	gclient_t	*cl;
;522:	int			idnum;
;523:	char		s2[MAX_STRING_CHARS];
;524:	char		n2[MAX_STRING_CHARS];
;525:
;526:	// numeric values are just slot numbers
;527:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $277
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $277
line 528
;528:		idnum = atoi( s );
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
line 529
;529:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $282
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $279
LABELV $282
line 530
;530:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $283
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 531
;531:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $276
JUMPV
LABELV $279
line 534
;532:		}
;533:
;534:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3452
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 535
;535:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $284
line 536
;536:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $286
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 537
;537:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $276
JUMPV
LABELV $284
line 539
;538:		}
;539:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $276
JUMPV
LABELV $277
line 543
;540:	}
;541:
;542:	// check for a name match
;543:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 544
;544:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $290
JUMPV
LABELV $287
line 545
;545:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $292
line 546
;546:			continue;
ADDRGP4 $288
JUMPV
LABELV $292
line 548
;547:		}
;548:		SanitizeString( cl->pers.netname, n2 );
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
line 549
;549:		if ( !strcmp( n2, s2 ) ) {
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
NEI4 $294
line 550
;550:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $276
JUMPV
LABELV $294
line 552
;551:		}
;552:	}
LABELV $288
line 544
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3452
ADDP4
ASGNP4
LABELV $290
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $287
line 554
;553:
;554:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $296
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 555
;555:	return -1;
CNSTI4 -1
RETI4
LABELV $276
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 566
;556:}
;557:
;558:/*
;559:==================
;560:Cmd_Give_f
;561:
;562:Give items to a client
;563:==================
;564:*/
;565:void Cmd_Give_f (gentity_t *ent)
;566:{
line 574
;567:	char		*name;
;568:	gitem_t		*it;
;569:	int			i;
;570:	qboolean	give_all;
;571:	gentity_t		*it_ent;
;572:	trace_t		trace;
;573:
;574:	if ( !CheatsOk( ent ) ) {
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
NEI4 $298
line 575
;575:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 578
;576:	}
;577:
;578:	name = ConcatArgs( 1 );
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
line 580
;579:
;580:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $300
line 581
;581:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $301
JUMPV
LABELV $300
line 583
;582:	else
;583:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $301
line 585
;584:
;585:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $306
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $303
LABELV $306
line 586
;586:	{
line 587
;587:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
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
line 588
;588:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $307
line 589
;589:			return;
ADDRGP4 $297
JUMPV
LABELV $307
line 590
;590:	}
LABELV $303
line 592
;591:
;592:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $312
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $311
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $309
LABELV $312
line 593
;593:	{
line 594
;594:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 596
;595:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;596:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $313
line 597
;597:			return;
ADDRGP4 $297
JUMPV
LABELV $313
line 598
;598:	}
LABELV $309
line 600
;599:
;600:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $318
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $315
LABELV $318
line 601
;601:	{
line 602
;602:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $319
line 603
;603:			ent->client->ps.ammo[i] = 999;
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
line 604
;604:		}
LABELV $320
line 602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $319
line 605
;605:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $323
line 606
;606:			return;
ADDRGP4 $297
JUMPV
LABELV $323
line 607
;607:	}
LABELV $315
line 609
;608:
;609:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $328
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $325
LABELV $328
line 610
;610:	{
line 611
;611:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 613
;612:
;613:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $329
line 614
;614:			return;
ADDRGP4 $297
JUMPV
LABELV $329
line 615
;615:	}
LABELV $325
line 617
;616:
;617:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $331
line 618
;618:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 619
;619:		return;
ADDRGP4 $297
JUMPV
LABELV $331
line 621
;620:	}
;621:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $334
line 622
;622:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 623
;623:		return;
ADDRGP4 $297
JUMPV
LABELV $334
line 625
;624:	}
;625:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $337
line 626
;626:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 627
;627:		return;
ADDRGP4 $297
JUMPV
LABELV $337
line 629
;628:	}
;629:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $340
line 630
;630:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
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
line 631
;631:		return;
ADDRGP4 $297
JUMPV
LABELV $340
line 633
;632:	}
;633:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $343
line 634
;634:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
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
line 635
;635:		return;
ADDRGP4 $297
JUMPV
LABELV $343
line 639
;636:	}
;637:
;638:	// spawn a specific item right on the player
;639:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $346
line 640
;640:		it = BG_FindItem (name);
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
line 641
;641:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $348
line 642
;642:			return;
ADDRGP4 $297
JUMPV
LABELV $348
line 645
;643:		}
;644:
;645:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 646
;646:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
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
line 647
;647:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 648
;648:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 649
;649:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 650
;650:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 651
;651:		Touch_Item (it_ent, ent, &trace);
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
line 652
;652:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $350
line 653
;653:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 654
;654:		}
LABELV $350
line 655
;655:	}
LABELV $346
line 656
;656:}
LABELV $297
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 669
;657:
;658:
;659:/*
;660:==================
;661:Cmd_God_f
;662:
;663:Sets client to godmode
;664:
;665:argv(0) god
;666:==================
;667:*/
;668:void Cmd_God_f (gentity_t *ent)
;669:{
line 672
;670:	char	*msg;
;671:
;672:	if ( !CheatsOk( ent ) ) {
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
NEI4 $353
line 673
;673:		return;
ADDRGP4 $352
JUMPV
LABELV $353
line 676
;674:	}
;675:
;676:	ent->flags ^= FL_GODMODE;
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
line 677
;677:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $355
line 678
;678:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $357
ASGNP4
ADDRGP4 $356
JUMPV
LABELV $355
line 680
;679:	else
;680:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $358
ASGNP4
LABELV $356
line 682
;681:
;682:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $359
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 683
;683:}
LABELV $352
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 695
;684:
;685:
;686:/*
;687:==================
;688:Cmd_Notarget_f
;689:
;690:Sets client to notarget
;691:
;692:argv(0) notarget
;693:==================
;694:*/
;695:void Cmd_Notarget_f( gentity_t *ent ) {
line 698
;696:	char	*msg;
;697:
;698:	if ( !CheatsOk( ent ) ) {
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
NEI4 $361
line 699
;699:		return;
ADDRGP4 $360
JUMPV
LABELV $361
line 702
;700:	}
;701:
;702:	ent->flags ^= FL_NOTARGET;
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
line 703
;703:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $363
line 704
;704:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $365
ASGNP4
ADDRGP4 $364
JUMPV
LABELV $363
line 706
;705:	else
;706:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $366
ASGNP4
LABELV $364
line 708
;707:
;708:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $359
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 709
;709:}
LABELV $360
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 719
;710:
;711:
;712:/*
;713:==================
;714:Cmd_Noclip_f
;715:
;716:argv(0) noclip
;717:==================
;718:*/
;719:void Cmd_Noclip_f( gentity_t *ent ) {
line 722
;720:	char	*msg;
;721:
;722:	if ( !CheatsOk( ent ) ) {
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
NEI4 $368
line 723
;723:		return;
ADDRGP4 $367
JUMPV
LABELV $368
line 726
;724:	}
;725:
;726:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 727
;727:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $372
ASGNP4
line 728
;728:	} else {
ADDRGP4 $371
JUMPV
LABELV $370
line 729
;729:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $373
ASGNP4
line 730
;730:	}
LABELV $371
line 731
;731:	ent->client->noclip = !ent->client->noclip;
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
NEI4 $375
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $376
JUMPV
LABELV $375
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $376
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 733
;732:
;733:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $359
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 734
;734:}
LABELV $367
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 747
;735:
;736:
;737:/*
;738:==================
;739:Cmd_LevelShot_f
;740:
;741:This is just to help generate the level pictures
;742:for the menus.  It goes to the intermission immediately
;743:and sends over a command to the client to resize the view,
;744:hide the scoreboard, and take a special screenshot
;745:==================
;746:*/
;747:void Cmd_LevelShot_f( gentity_t *ent ) {
line 748
;748:	if ( !CheatsOk( ent ) ) {
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
NEI4 $378
line 749
;749:		return;
ADDRGP4 $377
JUMPV
LABELV $378
line 753
;750:	}
;751:
;752:	// doesn't work in single player
;753:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $380
line 754
;754:		trap_SendServerCommand( ent-g_entities, 
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $383
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 756
;755:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;756:		return;
ADDRGP4 $377
JUMPV
LABELV $380
line 759
;757:	}
;758:
;759:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 760
;760:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $384
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 761
;761:}
LABELV $377
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 774
;762:
;763:
;764:/*
;765:==================
;766:Cmd_LevelShot_f
;767:
;768:This is just to help generate the level pictures
;769:for the menus.  It goes to the intermission immediately
;770:and sends over a command to the client to resize the view,
;771:hide the scoreboard, and take a special screenshot
;772:==================
;773:*/
;774:void Cmd_TeamTask_f( gentity_t *ent ) {
line 778
;775:	char userinfo[MAX_INFO_STRING];
;776:	char		arg[MAX_TOKEN_CHARS];
;777:	int task;
;778:	int client = ent->client - level.clients;
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
CNSTI4 3452
DIVI4
ASGNI4
line 780
;779:
;780:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $386
line 781
;781:		return;
ADDRGP4 $385
JUMPV
LABELV $386
line 783
;782:	}
;783:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 784
;784:	task = atoi( arg );
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
line 786
;785:
;786:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
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
line 787
;787:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $389
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
ADDRGP4 $388
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 788
;788:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 789
;789:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 790
;790:}
LABELV $385
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 799
;791:
;792:
;793:
;794:/*
;795:=================
;796:Cmd_Kill_f
;797:=================
;798:*/
;799:void Cmd_Kill_f( gentity_t *ent ) {
line 800
;800:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $391
line 801
;801:		return;
ADDRGP4 $390
JUMPV
LABELV $391
line 803
;802:	}
;803:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $393
line 804
;804:		return;
ADDRGP4 $390
JUMPV
LABELV $393
line 806
;805:	}
;806:	ent->flags &= ~FL_GODMODE;
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
line 807
;807:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
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
line 808
;808:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 809
;809:}
LABELV $390
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 819
;810:
;811:/*
;812:=================
;813:BroadCastTeamChange
;814:
;815:Let everyone know about a team change
;816:=================
;817:*/
;818:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;819:{
line 820
;820:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $396
line 821
;821:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $398
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
line 823
;822:			client->pers.netname) );
;823:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $397
JUMPV
LABELV $396
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $399
line 824
;824:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $401
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
line 826
;825:		client->pers.netname));
;826:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $400
JUMPV
LABELV $399
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
NEI4 $402
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $402
line 828
;827:		
;828:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $404
line 829
;829:		{
line 831
;830:		
;831:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $406
line 832
;832:			{
line 833
;833:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $409
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
line 834
;834:			}
LABELV $406
line 835
;835:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $403
line 836
;836:			{
line 837
;837:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $413
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
line 838
;838:			}
line 839
;839:		} 
ADDRGP4 $403
JUMPV
LABELV $404
line 842
;840:
;841:		else 
;842:		{
line 843
;843:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $414
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
line 844
;844:		}
line 846
;845:
;846:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $403
JUMPV
LABELV $402
ADDRFP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $415
line 847
;847:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $417
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
line 849
;848:		client->pers.netname));
;849:	}
LABELV $415
LABELV $403
LABELV $400
LABELV $397
line 850
;850:}
LABELV $395
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 857
;851:
;852:/*
;853:=================
;854:SetTeam
;855:=================
;856:*/
;857:void SetTeam( gentity_t *ent, char *s ) {
line 868
;858:	int					team, oldTeam;
;859:	gclient_t			*client;
;860:	int					clientNum;
;861:	spectatorState_t	specState;
;862:	int					specClient;
;863:	int					teamLeader;
;864:
;865:	//
;866:	// see what change is requested
;867:	//
;868:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 870
;869:
;870:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ASGNI4
line 871
;871:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 872
;872:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 873
;873:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $423
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $419
LABELV $423
line 874
;874:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 875
;875:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 876
;876:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $420
JUMPV
LABELV $419
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $424
line 877
;877:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 878
;878:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 879
;879:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 880
;880:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $425
JUMPV
LABELV $424
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $427
line 881
;881:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 882
;882:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 883
;883:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 884
;884:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $428
JUMPV
LABELV $427
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $434
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $433
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $430
LABELV $434
line 885
;885:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 886
;886:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 887
;887:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $431
JUMPV
LABELV $430
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $435
line 889
;888:		// if running a team game, assign player to one of the teams
;889:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 890
;890:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $442
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $438
LABELV $442
line 891
;891:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 892
;892:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $439
JUMPV
LABELV $438
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $445
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $447
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $443
LABELV $447
line 893
;893:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 894
;894:		} else {
ADDRGP4 $444
JUMPV
LABELV $443
line 896
;895:			// pick the team with the least number of players
;896:			team = PickTeam( clientNum );
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
line 897
;897:		}
LABELV $444
LABELV $439
line 899
;898:
;899:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $436
line 902
;900:			int		counts[TEAM_NUM_TEAMS];
;901:
;902:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
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
line 903
;903:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
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
line 906
;904:
;905:			// We allow a spread of two
;906:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $453
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $453
line 907
;907:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 909
;908:					"cp \"Red team has too many players.\n\"" );
;909:				return; // ignore the request
ADDRGP4 $418
JUMPV
LABELV $453
line 911
;910:			}
;911:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $436
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $436
line 912
;912:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $462
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 914
;913:					"cp \"Blue team has too many players.\n\"" );
;914:				return; // ignore the request
ADDRGP4 $418
JUMPV
line 918
;915:			}
;916:
;917:			// It's ok, the team we are switching to has less or same number of players
;918:		}
line 920
;919:
;920:	} else {
LABELV $435
line 922
;921:		// force them to spectators if there aren't any spots free
;922:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 923
;923:	}
LABELV $436
LABELV $431
LABELV $428
LABELV $425
LABELV $420
line 926
;924:
;925:	// override decision if limiting the players
;926:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $463
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $463
line 927
;927:		&& level.numNonSpectatorClients >= 2 ) {
line 928
;928:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 929
;929:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $464
JUMPV
LABELV $463
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $467
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $467
line 930
;930:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 931
;931:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 932
;932:	}
LABELV $467
LABELV $464
line 937
;933:
;934:	//
;935:	// decide if we will allow the change
;936:	//
;937:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 938
;938:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $472
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $472
line 939
;939:		return;
ADDRGP4 $418
JUMPV
LABELV $472
line 947
;940:	}
;941:
;942:	//
;943:	// execute the team change
;944:	//
;945:
;946:	// if the player was dead leave the body
;947:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $474
line 948
;948:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 949
;949:	}
LABELV $474
line 952
;950:
;951:	// he starts at 'base'
;952:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 953
;953:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $476
line 955
;954:		// Kill him (makes sure he loses flags, etc)
;955:		ent->flags &= ~FL_GODMODE;
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
line 956
;956:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
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
line 957
;957:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 959
;958:
;959:	}
LABELV $476
line 961
;960:	// they go to the end of the line for tournements
;961:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $478
line 962
;962:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 963
;963:	}
LABELV $478
line 965
;964:
;965:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 966
;966:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 967
;967:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 969
;968:
;969:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 970
;970:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $483
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $481
LABELV $483
line 971
;971:		teamLeader = TeamLeader( team );
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
line 973
;972:		// if there is no team leader or the team leader is a bot and this client is not a bot
;973:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $490
ADDRLP4 68
CNSTI4 876
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
NEI4 $484
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
EQI4 $484
LABELV $490
line 974
;974:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 975
;975:		}
LABELV $484
line 976
;976:	}
LABELV $481
line 978
;977:	// make sure there is a team leader on the team the player came from
;978:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $493
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $491
LABELV $493
line 979
;979:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 980
;980:	}
LABELV $491
line 982
;981:
;982:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 985
;983:
;984:	// get and distribute relevent paramters
;985:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 987
;986:
;987:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 988
;988:}
LABELV $418
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 998
;989:
;990:/*
;991:=================
;992:StopFollowing
;993:
;994:If the client being followed leaves the game, or you just want to drop
;995:to free floating spectator mode
;996:=================
;997:*/
;998:void StopFollowing( gentity_t *ent ) {
line 999
;999:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1000
;1000:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 3
ASGNI4
line 1001
;1001:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1002
;1002:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
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
line 1003
;1003:	ent->r.svFlags &= ~SVF_BOT;
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
line 1004
;1004:	ent->client->ps.clientNum = ent - g_entities;
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
CNSTI4 876
DIVI4
ASGNI4
line 1005
;1005:}
LABELV $494
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 1012
;1006:
;1007:/*
;1008:=================
;1009:Cmd_Team_f
;1010:=================
;1011:*/
;1012:void Cmd_Team_f( gentity_t *ent ) {
line 1016
;1013:	int			oldTeam;
;1014:	char		s[MAX_TOKEN_CHARS];
;1015:
;1016:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $496
line 1017
;1017:		oldTeam = ent->client->sess.sessionTeam;
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
line 1018
;1018:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $495
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $495
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $508
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $508
address $504
address $502
address $500
address $506
code
LABELV $500
line 1020
;1019:		case TEAM_BLUE:
;1020:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $501
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1021
;1021:			break;
ADDRGP4 $495
JUMPV
LABELV $502
line 1023
;1022:		case TEAM_RED:
;1023:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $503
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1024
;1024:			break;
ADDRGP4 $495
JUMPV
LABELV $504
line 1026
;1025:		case TEAM_FREE:
;1026:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $505
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1027
;1027:			break;
ADDRGP4 $495
JUMPV
LABELV $506
line 1029
;1028:		case TEAM_SPECTATOR:
;1029:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $507
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1030
;1030:			break;
line 1032
;1031:		}
;1032:		return;
ADDRGP4 $495
JUMPV
LABELV $496
line 1035
;1033:	}
;1034:
;1035:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $509
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $509
line 1036
;1036:	{
line 1038
;1037:
;1038:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $513
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1039
;1039:		return;
ADDRGP4 $495
JUMPV
LABELV $509
line 1043
;1040:	}
;1041:
;1042:
;1043:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $514
line 1044
;1044:	{
line 1045
;1045:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $521
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $517
LABELV $521
line 1046
;1046:		{
line 1048
;1047:		
;1048:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $522
line 1049
;1049:			{
line 1051
;1050:				
;1051:				if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $524
line 1052
;1052:				{
line 1053
;1053:					trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1054
;1054:					return;
ADDRGP4 $495
JUMPV
LABELV $524
line 1056
;1055:				}
;1056:				if (level.firstStrike == qtrue)
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $527
line 1057
;1057:				{
line 1058
;1058:					trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $530
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1059
;1059:					return;
ADDRGP4 $495
JUMPV
LABELV $527
line 1062
;1060:				}
;1061:
;1062:			}
LABELV $522
line 1063
;1063:		}
LABELV $517
line 1066
;1064:
;1065:
;1066:	}
LABELV $514
line 1073
;1067:
;1068:
;1069:	
;1070:
;1071:
;1072:	// if they are playing a tournement game, count as a loss
;1073:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $531
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $531
line 1074
;1074:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1075
;1075:		ent->client->sess.losses++;
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
line 1076
;1076:	}
LABELV $531
line 1078
;1077:
;1078:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1080
;1079:
;1080:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1082
;1081:
;1082:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1083
;1083:}
LABELV $495
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 1091
;1084:
;1085:
;1086:/*
;1087:=================
;1088:Cmd_Follow_f
;1089:=================
;1090:*/
;1091:void Cmd_Follow_f( gentity_t *ent ) {
line 1095
;1092:	int		i;
;1093:	char	arg[MAX_TOKEN_CHARS];
;1094:
;1095:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $536
line 1096
;1096:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $535
line 1097
;1097:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1098
;1098:		}
line 1099
;1099:		return;
ADDRGP4 $535
JUMPV
LABELV $536
line 1102
;1100:	}
;1101:
;1102:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1103
;1103:	i = ClientNumberFromString( ent, arg );
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
line 1104
;1104:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $540
line 1105
;1105:		return;
ADDRGP4 $535
JUMPV
LABELV $540
line 1109
;1106:	}
;1107:
;1108:	// can't follow self
;1109:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3452
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
NEU4 $542
line 1110
;1110:		return;
ADDRGP4 $535
JUMPV
LABELV $542
line 1114
;1111:	}
;1112:
;1113:	// can't follow another spectator
;1114:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3452
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
NEI4 $544
line 1115
;1115:		return;
ADDRGP4 $535
JUMPV
LABELV $544
line 1119
;1116:	}
;1117:
;1118:	// if they are playing a tournement game, count as a loss
;1119:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $546
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $546
line 1120
;1120:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1121
;1121:		ent->client->sess.losses++;
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
line 1122
;1122:	}
LABELV $546
line 1125
;1123:
;1124:	// first set them to spectator
;1125:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $549
line 1126
;1126:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1127
;1127:	}
LABELV $549
line 1129
;1128:
;1129:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1130
;1130:	ent->client->sess.spectatorClient = i;
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
line 1131
;1131:}
LABELV $535
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 1138
;1132:
;1133:/*
;1134:=================
;1135:Cmd_FollowCycle_f
;1136:=================
;1137:*/
;1138:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 1143
;1139:	int		clientnum;
;1140:	int		original;
;1141:
;1142:	// if they are playing a tournement game, count as a loss
;1143:	if ( (g_gametype.integer == GT_TOURNAMENT )
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
line 1144
;1144:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1145
;1145:		ent->client->sess.losses++;
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
line 1146
;1146:	}
LABELV $552
line 1148
;1147:	// first set them to spectator
;1148:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $555
line 1149
;1149:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1150
;1150:	}
LABELV $555
line 1152
;1151:
;1152:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $557
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $557
line 1153
;1153:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $559
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1154
;1154:	}
LABELV $557
line 1156
;1155:
;1156:	clientnum = ent->client->sess.spectatorClient;
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
line 1157
;1157:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $560
line 1158
;1158:	do {
line 1159
;1159:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1160
;1160:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $563
line 1161
;1161:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1162
;1162:		}
LABELV $563
line 1163
;1163:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $566
line 1164
;1164:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1165
;1165:		}
LABELV $566
line 1168
;1166:
;1167:		// can only follow connected clients
;1168:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3452
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
EQI4 $569
line 1169
;1169:			continue;
ADDRGP4 $561
JUMPV
LABELV $569
line 1173
;1170:		}
;1171:
;1172:		// can't follow another spectator
;1173:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3452
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
NEI4 $571
line 1174
;1174:			continue;
ADDRGP4 $561
JUMPV
LABELV $571
line 1178
;1175:		}
;1176:
;1177:		// this is good, we can use it
;1178:		ent->client->sess.spectatorClient = clientnum;
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
line 1179
;1179:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 2
ASGNI4
line 1180
;1180:		return;
ADDRGP4 $551
JUMPV
LABELV $561
line 1181
;1181:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $560
line 1184
;1182:
;1183:	// leave it where it was
;1184:}
LABELV $551
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1195
;1185:
;1186:
;1187:/*
;1188:==================
;1189:G_Say
;1190:==================
;1191:*/
;1192:
;1193:
;1194:
;1195:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1196
;1196:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $574
line 1197
;1197:		return;
ADDRGP4 $573
JUMPV
LABELV $574
line 1199
;1198:	}
;1199:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $576
line 1200
;1200:		return;
ADDRGP4 $573
JUMPV
LABELV $576
line 1202
;1201:	}
;1202:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $578
line 1203
;1203:		return;
ADDRGP4 $573
JUMPV
LABELV $578
line 1205
;1204:	}
;1205:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $580
line 1206
;1206:		return;
ADDRGP4 $573
JUMPV
LABELV $580
line 1208
;1207:	}
;1208:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $582
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
NEI4 $582
line 1209
;1209:		return;
ADDRGP4 $573
JUMPV
LABELV $582
line 1212
;1210:	}
;1211:	// no chatting to players in tournements
;1212:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $584
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
NEI4 $584
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
EQI4 $584
line 1214
;1213:		&& other->client->sess.sessionTeam == TEAM_FREE
;1214:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1215
;1215:		return;
ADDRGP4 $573
JUMPV
LABELV $584
line 1218
;1216:	}
;1217:
;1218:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $587
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $591
ADDRLP4 16
ADDRGP4 $588
ASGNP4
ADDRGP4 $592
JUMPV
LABELV $591
ADDRLP4 16
ADDRGP4 $589
ASGNP4
LABELV $592
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1221
;1219:		mode == SAY_TEAM ? "tchat" : "chat",
;1220:		name, Q_COLOR_ESCAPE, color, message));
;1221:}
LABELV $573
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1225
;1222:
;1223:#define EC		"\x19"
;1224:
;1225:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1234
;1226:	int			j;
;1227:	gentity_t	*other;
;1228:	int			color;
;1229:	char		name[64];
;1230:	// don't let text be too long for malicious reasons
;1231:	char		text[MAX_SAY_TEXT];
;1232:	char		location[64];
;1233:
;1234:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $594
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $594
line 1235
;1235:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1236
;1236:	}
LABELV $594
line 1238
;1237:
;1238:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LTI4 $597
ADDRLP4 292
INDIRI4
CNSTI4 3
GTI4 $597
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $617
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $617
address $599
address $602
address $608
address $614
code
LABELV $597
LABELV $599
line 1241
;1239:	default:
;1240:	case SAY_ALL:
;1241:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $600
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
line 1242
;1242:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $601
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
line 1243
;1243:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1244
;1244:		break;
ADDRGP4 $598
JUMPV
LABELV $602
line 1246
;1245:	case SAY_TEAM:
;1246:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $603
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
line 1247
;1247:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
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
EQI4 $604
line 1248
;1248:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $606
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
ADDRGP4 $605
JUMPV
LABELV $604
line 1251
;1249:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1250:		else
;1251:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $607
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
LABELV $605
line 1253
;1252:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1253:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1254
;1254:		break;
ADDRGP4 $598
JUMPV
LABELV $608
line 1256
;1255:	case SAY_TELL:
;1256:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $609
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $609
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
NEI4 $609
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
EQI4 $609
line 1259
;1257:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1258:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1259:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
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
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $610
JUMPV
LABELV $609
line 1261
;1260:		else
;1261:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
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
LABELV $610
line 1262
;1262:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1263
;1263:		break;
ADDRGP4 $598
JUMPV
LABELV $614
line 1265
;1264:	case SAY_INVAL:
;1265:		G_LogPrintf( "Invalid During Intermission: %s: %s\n", ent->client->pers.netname, chatText );
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
line 1266
;1266:		Com_sprintf (name, sizeof(name), "[Invalid During Intermission%c%c]: ", Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $616
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1267
;1267:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1268
;1268:		target = ent;
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1269
;1269:		break;
LABELV $598
line 1272
;1270:	}
;1271:
;1272:	Q_strncpyz( text, chatText, sizeof(text) );
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
line 1274
;1273:
;1274:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
line 1275
;1275:		G_SayTo( ent, target, mode, color, name, text );
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
line 1276
;1276:		return;
ADDRGP4 $593
JUMPV
LABELV $618
line 1280
;1277:	}
;1278:
;1279:	// echo the text to the console
;1280:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $620
line 1281
;1281:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $623
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1282
;1282:	}
LABELV $620
line 1285
;1283:
;1284:	// send it to all the apropriate clients
;1285:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $627
JUMPV
LABELV $624
line 1286
;1286:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 876
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1287
;1287:		G_SayTo( ent, other, mode, color, name, text );
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
line 1288
;1288:	}
LABELV $625
line 1285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $627
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $624
line 1289
;1289:}
LABELV $593
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1297
;1290:
;1291:
;1292:/*
;1293:==================
;1294:Cmd_Say_f
;1295:==================
;1296:*/
;1297:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1300
;1298:	char		*p;
;1299:
;1300:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $630
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $630
line 1301
;1301:		return;
ADDRGP4 $629
JUMPV
LABELV $630
line 1304
;1302:	}
;1303:
;1304:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $632
line 1305
;1305:	{
line 1306
;1306:		p = ConcatArgs( 0 );
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
line 1307
;1307:	}
ADDRGP4 $633
JUMPV
LABELV $632
line 1309
;1308:	else
;1309:	{
line 1310
;1310:		p = ConcatArgs( 1 );
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
line 1311
;1311:	}
LABELV $633
line 1313
;1312:
;1313:	G_Say( ent, NULL, mode, p );
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
line 1314
;1314:}
LABELV $629
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1321
;1315:
;1316:/*
;1317:==================
;1318:Cmd_Tell_f
;1319:==================
;1320:*/
;1321:static void Cmd_Tell_f( gentity_t *ent ) {
line 1327
;1322:	int			targetNum;
;1323:	gentity_t	*target;
;1324:	char		*p;
;1325:	char		arg[MAX_TOKEN_CHARS];
;1326:
;1327:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $635
line 1328
;1328:		return;
ADDRGP4 $634
JUMPV
LABELV $635
line 1331
;1329:	}
;1330:
;1331:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1332
;1332:	targetNum = atoi( arg );
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
line 1333
;1333:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $640
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $637
LABELV $640
line 1334
;1334:		return;
ADDRGP4 $634
JUMPV
LABELV $637
line 1337
;1335:	}
;1336:
;1337:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 876
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1338
;1338:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $644
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $644
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $641
LABELV $644
line 1339
;1339:		return;
ADDRGP4 $634
JUMPV
LABELV $641
line 1342
;1340:	}
;1341:
;1342:	p = ConcatArgs( 2 );
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
line 1344
;1343:
;1344:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $645
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
line 1345
;1345:	G_Say( ent, target, SAY_TELL, p );
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
line 1348
;1346:	// don't tell to the player self if it was already directed to this player
;1347:	// also don't send the chat back to a bot
;1348:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $646
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $646
line 1349
;1349:		G_Say( ent, ent, SAY_TELL, p );
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
line 1350
;1350:	}
LABELV $646
line 1351
;1351:}
LABELV $634
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1354
;1352:
;1353:
;1354:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1358
;1355:	int color;
;1356:	char *cmd;
;1357:
;1358:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $649
line 1359
;1359:		return;
ADDRGP4 $648
JUMPV
LABELV $649
line 1361
;1360:	}
;1361:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $651
line 1362
;1362:		return;
ADDRGP4 $648
JUMPV
LABELV $651
line 1364
;1363:	}
;1364:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $653
line 1365
;1365:		return;
ADDRGP4 $648
JUMPV
LABELV $653
line 1367
;1366:	}
;1367:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $655
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
NEI4 $655
line 1368
;1368:		return;
ADDRGP4 $648
JUMPV
LABELV $655
line 1371
;1369:	}
;1370:	// no chatting to players in tournements
;1371:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $657
line 1372
;1372:		return;
ADDRGP4 $648
JUMPV
LABELV $657
line 1375
;1373:	}
;1374:
;1375:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $660
line 1376
;1376:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1377
;1377:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $662
ASGNP4
line 1378
;1378:	}
ADDRGP4 $661
JUMPV
LABELV $660
line 1379
;1379:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $663
line 1380
;1380:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1381
;1381:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $665
ASGNP4
line 1382
;1382:	}
ADDRGP4 $664
JUMPV
LABELV $663
line 1383
;1383:	else {
line 1384
;1384:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1385
;1385:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $666
ASGNP4
line 1386
;1386:	}
LABELV $664
LABELV $661
line 1388
;1387:
;1388:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $667
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1389
;1389:}
LABELV $648
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1391
;1390:
;1391:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1395
;1392:	int			j;
;1393:	gentity_t	*other;
;1394:
;1395:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $669
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $669
line 1396
;1396:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1397
;1397:	}
LABELV $669
line 1399
;1398:
;1399:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $672
line 1400
;1400:		G_VoiceTo( ent, target, mode, id, voiceonly );
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
line 1401
;1401:		return;
ADDRGP4 $668
JUMPV
LABELV $672
line 1405
;1402:	}
;1403:
;1404:	// echo the text to the console
;1405:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $674
line 1406
;1406:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $677
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
line 1407
;1407:	}
LABELV $674
line 1410
;1408:
;1409:	// send it to all the apropriate clients
;1410:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $681
JUMPV
LABELV $678
line 1411
;1411:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 876
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1412
;1412:		G_VoiceTo( ent, other, mode, id, voiceonly );
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
line 1413
;1413:	}
LABELV $679
line 1410
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $681
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $678
line 1414
;1414:}
LABELV $668
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1421
;1415:
;1416:/*
;1417:==================
;1418:Cmd_Voice_f
;1419:==================
;1420:*/
;1421:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1424
;1422:	char		*p;
;1423:
;1424:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $684
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $684
line 1425
;1425:		return;
ADDRGP4 $683
JUMPV
LABELV $684
line 1428
;1426:	}
;1427:
;1428:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $686
line 1429
;1429:	{
line 1430
;1430:		p = ConcatArgs( 0 );
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
line 1431
;1431:	}
ADDRGP4 $687
JUMPV
LABELV $686
line 1433
;1432:	else
;1433:	{
line 1434
;1434:		p = ConcatArgs( 1 );
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
line 1435
;1435:	}
LABELV $687
line 1437
;1436:
;1437:	G_Voice( ent, NULL, mode, p, voiceonly );
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
line 1438
;1438:}
LABELV $683
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1445
;1439:
;1440:/*
;1441:==================
;1442:Cmd_VoiceTell_f
;1443:==================
;1444:*/
;1445:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1451
;1446:	int			targetNum;
;1447:	gentity_t	*target;
;1448:	char		*id;
;1449:	char		arg[MAX_TOKEN_CHARS];
;1450:
;1451:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $689
line 1452
;1452:		return;
ADDRGP4 $688
JUMPV
LABELV $689
line 1455
;1453:	}
;1454:
;1455:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1456
;1456:	targetNum = atoi( arg );
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
line 1457
;1457:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $694
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $691
LABELV $694
line 1458
;1458:		return;
ADDRGP4 $688
JUMPV
LABELV $691
line 1461
;1459:	}
;1460:
;1461:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 876
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1462
;1462:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $698
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $698
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $695
LABELV $698
line 1463
;1463:		return;
ADDRGP4 $688
JUMPV
LABELV $695
line 1466
;1464:	}
;1465:
;1466:	id = ConcatArgs( 2 );
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
line 1468
;1467:
;1468:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $699
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
line 1469
;1469:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
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
line 1472
;1470:	// don't tell to the player self if it was already directed to this player
;1471:	// also don't send the chat back to a bot
;1472:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $700
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $700
line 1473
;1473:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
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
line 1474
;1474:	}
LABELV $700
line 1475
;1475:}
LABELV $688
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1483
;1476:
;1477:
;1478:/*
;1479:==================
;1480:Cmd_VoiceTaunt_f
;1481:==================
;1482:*/
;1483:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1487
;1484:	gentity_t *who;
;1485:	int i;
;1486:
;1487:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $703
line 1488
;1488:		return;
ADDRGP4 $702
JUMPV
LABELV $703
line 1492
;1489:	}
;1490:
;1491:	// insult someone who just killed you
;1492:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
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
EQU4 $705
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
EQU4 $705
ADDRLP4 20
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $705
line 1494
;1493:		// i am a dead corpse
;1494:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
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
NEI4 $707
line 1495
;1495:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $709
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1496
;1496:		}
LABELV $707
line 1497
;1497:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $710
line 1498
;1498:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $709
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1499
;1499:		}
LABELV $710
line 1500
;1500:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 1501
;1501:		return;
ADDRGP4 $702
JUMPV
LABELV $705
line 1504
;1502:	}
;1503:	// insult someone you just killed
;1504:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
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
LTI4 $712
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $712
line 1505
;1505:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 876
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
line 1506
;1506:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $714
line 1508
;1507:			// who is the person I just killed
;1508:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2660
ADDP4
INDIRI4
CNSTI4 2
NEI4 $716
line 1509
;1509:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $718
line 1510
;1510:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $720
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1511
;1511:				}
LABELV $718
line 1512
;1512:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $717
line 1513
;1513:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
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
ADDRGP4 $720
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1514
;1514:				}
line 1515
;1515:			} else {
ADDRGP4 $717
JUMPV
LABELV $716
line 1516
;1516:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $723
line 1517
;1517:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $725
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1518
;1518:				}
LABELV $723
line 1519
;1519:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $726
line 1520
;1520:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
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
ADDRGP4 $725
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1521
;1521:				}
LABELV $726
line 1522
;1522:			}
LABELV $717
line 1523
;1523:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 -1
ASGNI4
line 1524
;1524:			return;
ADDRGP4 $702
JUMPV
LABELV $714
line 1526
;1525:		}
;1526:	}
LABELV $712
line 1528
;1527:
;1528:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $728
line 1530
;1529:		// praise a team mate who just got a reward
;1530:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $731
line 1531
;1531:			who = g_entities + i;
ADDRLP4 0
CNSTI4 876
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1532
;1532:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
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
EQU4 $735
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
EQU4 $735
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
NEI4 $735
line 1533
;1533:				if (who->client->rewardTime > level.time) {
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
LEI4 $737
line 1534
;1534:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $740
line 1535
;1535:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $742
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1536
;1536:					}
LABELV $740
line 1537
;1537:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $702
line 1538
;1538:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
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
ADDRGP4 $742
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1539
;1539:					}
line 1540
;1540:					return;
ADDRGP4 $702
JUMPV
LABELV $737
line 1542
;1541:				}
;1542:			}
LABELV $735
line 1543
;1543:		}
LABELV $732
line 1530
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $731
line 1544
;1544:	}
LABELV $728
line 1547
;1545:
;1546:	// just say something
;1547:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
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
ADDRGP4 $745
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1548
;1548:}
LABELV $702
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $746
address $747
address $748
address $749
address $750
address $751
address $752
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1562
;1549:
;1550:
;1551:
;1552:static char	*gc_orders[] = {
;1553:	"hold your position",
;1554:	"hold this position",
;1555:	"come here",
;1556:	"cover me",
;1557:	"guard location",
;1558:	"search and destroy",
;1559:	"report"
;1560:};
;1561:
;1562:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1567
;1563:	int		player;
;1564:	int		order;
;1565:	char	str[MAX_TOKEN_CHARS];
;1566:
;1567:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1568
;1568:	player = atoi( str );
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
line 1569
;1569:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1570
;1570:	order = atoi( str );
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
line 1572
;1571:
;1572:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $756
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $754
LABELV $756
line 1573
;1573:		return;
ADDRGP4 $753
JUMPV
LABELV $754
line 1575
;1574:	}
;1575:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $759
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $757
LABELV $759
line 1576
;1576:		return;
ADDRGP4 $753
JUMPV
LABELV $757
line 1578
;1577:	}
;1578:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 876
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
line 1579
;1579:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
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
line 1580
;1580:}
LABELV $753
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1587
;1581:
;1582:/*
;1583:==================
;1584:Cmd_Where_f
;1585:==================
;1586:*/
;1587:void Cmd_Where_f( gentity_t *ent ) {
line 1588
;1588:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $761
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1589
;1589:}
LABELV $760
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $762
address $763
address $764
address $765
address $766
address $767
address $768
address $769
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3136 24
line 1607
;1590:
;1591:static const char *gameNames[] = {
;1592:	"Free For All",
;1593:	"Tournament",
;1594:	"Single Player",
;1595:	"Team Deathmatch",
;1596:	"Capture the Flag",
;1597:	"One Flag CTF",
;1598:	"Overload",
;1599:	"Harvester"
;1600:};
;1601:
;1602:/*
;1603:==================
;1604:Cmd_CallVote_f
;1605:==================
;1606:*/
;1607:void Cmd_CallVote_f( gentity_t *ent ) {
line 1612
;1608:	int		i;
;1609:	char	arg1[MAX_STRING_TOKENS];
;1610:	char	arg2[MAX_STRING_TOKENS];
;1611:
;1612:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $771
line 1613
;1613:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $774
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1614
;1614:		return;
ADDRGP4 $770
JUMPV
LABELV $771
line 1617
;1615:	}
;1616:
;1617:	if ( level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
EQI4 $775
line 1618
;1618:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $778
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1619
;1619:		return;
ADDRGP4 $770
JUMPV
LABELV $775
line 1621
;1620:	}
;1621:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $779
line 1622
;1622:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $781
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1623
;1623:		return;
ADDRGP4 $770
JUMPV
LABELV $779
line 1625
;1624:	}
;1625:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $782
line 1626
;1626:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $784
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1627
;1627:		return;
ADDRGP4 $770
JUMPV
LABELV $782
line 1631
;1628:	}
;1629:
;1630:	// make sure it is a valid command to vote on
;1631:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1632
;1632:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1634
;1633:
;1634:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $787
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
EQU4 $785
LABELV $787
line 1635
;1635:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $788
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1636
;1636:		return;
ADDRGP4 $770
JUMPV
LABELV $785
line 1639
;1637:	}
;1638:
;1639:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $791
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $789
line 1640
;1640:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $790
JUMPV
LABELV $789
ADDRLP4 4
ARGP4
ADDRGP4 $794
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $792
line 1641
;1641:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $793
JUMPV
LABELV $792
ADDRLP4 4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $795
line 1642
;1642:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $796
JUMPV
LABELV $795
ADDRLP4 4
ARGP4
ADDRGP4 $800
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $798
line 1643
;1643:	} else if ( !Q_stricmp( arg1, "balanceteams" ) ) {
ADDRGP4 $799
JUMPV
LABELV $798
ADDRLP4 4
ARGP4
ADDRGP4 $803
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $801
line 1644
;1644:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $802
JUMPV
LABELV $801
ADDRLP4 4
ARGP4
ADDRGP4 $806
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $804
line 1645
;1645:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $805
JUMPV
LABELV $804
ADDRLP4 4
ARGP4
ADDRGP4 $809
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $807
line 1646
;1646:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $808
JUMPV
LABELV $807
ADDRLP4 4
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $810
line 1647
;1647:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 4
ARGP4
ADDRGP4 $815
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $813
line 1648
;1648:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $814
JUMPV
LABELV $813
ADDRLP4 4
ARGP4
ADDRGP4 $818
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $816
line 1649
;1649:	} else {
ADDRGP4 $817
JUMPV
LABELV $816
line 1650
;1650:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $788
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1651
;1651:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $819
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1652
;1652:		return;
ADDRGP4 $770
JUMPV
LABELV $817
LABELV $814
LABELV $811
LABELV $808
LABELV $805
LABELV $802
LABELV $799
LABELV $796
LABELV $793
LABELV $790
line 1656
;1653:	}
;1654:
;1655:	// if there is still a vote to be executed
;1656:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2420
INDIRI4
CNSTI4 0
EQI4 $820
line 1657
;1657:		level.voteExecuteTime = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1658
;1658:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $824
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
line 1659
;1659:	}
LABELV $820
line 1662
;1660:
;1661:	// special case for g_gametype, check for bad values
;1662:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $800
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $826
line 1663
;1663:		i = atoi( arg2 );
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
line 1664
;1664:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $831
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $831
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $828
LABELV $831
line 1665
;1665:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $832
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1666
;1666:			return;
ADDRGP4 $770
JUMPV
LABELV $828
line 1669
;1667:		}
;1668:
;1669:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $835
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1670
;1670:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $838
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
line 1671
;1671:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $827
JUMPV
LABELV $826
ADDRLP4 4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $839
line 1676
;1672:		// special case for map changes, we want to reset the nextmap setting
;1673:		// this allows a player to change maps, but not upset the map rotation
;1674:		char	s[MAX_STRING_CHARS];
;1675:
;1676:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $794
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1677
;1677:		if (*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $841
line 1678
;1678:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $845
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
line 1679
;1679:		} else {
ADDRGP4 $842
JUMPV
LABELV $841
line 1680
;1680:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $838
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1681
;1681:		}
LABELV $842
line 1682
;1682:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1683
;1683:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $840
JUMPV
LABELV $839
ADDRLP4 4
ARGP4
ADDRGP4 $794
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $852
line 1686
;1684:		char	s[MAX_STRING_CHARS];
;1685:
;1686:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $794
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1687
;1687:		if (!*s) {
ADDRLP4 2112
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $854
line 1688
;1688:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $856
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1689
;1689:			return;
ADDRGP4 $770
JUMPV
LABELV $854
line 1691
;1690:		}
;1691:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $859
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1692
;1692:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1693
;1693:	} else {
ADDRGP4 $853
JUMPV
LABELV $852
line 1694
;1694:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $865
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1695
;1695:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $850
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1696
;1696:	}
LABELV $853
LABELV $840
LABELV $827
line 1698
;1697:
;1698:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $869
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
line 1701
;1699:
;1700:	// start the voting, the caller autoamtically votes yes
;1701:	level.voteTime = level.time;
ADDRGP4 level+2416
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1702
;1702:	level.voteYes = 1;
ADDRGP4 level+2424
CNSTI4 1
ASGNI4
line 1703
;1703:	level.voteNo = 0;
ADDRGP4 level+2428
CNSTI4 0
ASGNI4
line 1705
;1704:
;1705:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $874
line 1706
;1706:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 3452
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
line 1707
;1707:	}
LABELV $875
line 1705
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $877
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $874
line 1708
;1708:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1710
;1709:
;1710:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $879
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
line 1711
;1711:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1392
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1712
;1712:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $879
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
line 1713
;1713:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $879
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
line 1714
;1714:}
LABELV $770
endproc Cmd_CallVote_f 3136 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1721
;1715:
;1716:/*
;1717:==================
;1718:Cmd_Vote_f
;1719:==================
;1720:*/
;1721:void Cmd_Vote_f( gentity_t *ent ) {
line 1724
;1722:	char		msg[64];
;1723:
;1724:	if ( !level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
NEI4 $885
line 1725
;1725:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $888
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1726
;1726:		return;
ADDRGP4 $884
JUMPV
LABELV $885
line 1728
;1727:	}
;1728:	if ( ent->client->ps.eFlags & EF_VOTED ) {
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
EQI4 $889
line 1729
;1729:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $891
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1730
;1730:		return;
ADDRGP4 $884
JUMPV
LABELV $889
line 1732
;1731:	}
;1732:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $892
line 1733
;1733:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $894
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1734
;1734:		return;
ADDRGP4 $884
JUMPV
LABELV $892
line 1737
;1735:	}
;1736:
;1737:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $895
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1739
;1738:
;1739:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1741
;1740:
;1741:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1743
;1742:
;1743:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $901
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $901
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $896
LABELV $901
line 1744
;1744:		level.voteYes++;
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
line 1745
;1745:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $879
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
line 1746
;1746:	} else {
ADDRGP4 $897
JUMPV
LABELV $896
line 1747
;1747:		level.voteNo++;
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
line 1748
;1748:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $879
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
line 1749
;1749:	}
LABELV $897
line 1753
;1750:
;1751:	// a majority will be determined in CheckVote, which will also account
;1752:	// for players entering or leaving
;1753:}
LABELV $884
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1760
;1754:
;1755:/*
;1756:==================
;1757:Cmd_CallTeamVote_f
;1758:==================
;1759:*/
;1760:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1765
;1761:	int		i, team, cs_offset;
;1762:	char	arg1[MAX_STRING_TOKENS];
;1763:	char	arg2[MAX_STRING_TOKENS];
;1764:
;1765:	team = ent->client->sess.sessionTeam;
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
line 1766
;1766:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $907
line 1767
;1767:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $908
JUMPV
LABELV $907
line 1768
;1768:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $906
line 1769
;1769:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1771
;1770:	else
;1771:		return;
LABELV $910
LABELV $908
line 1773
;1772:
;1773:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $911
line 1774
;1774:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $774
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1775
;1775:		return;
ADDRGP4 $906
JUMPV
LABELV $911
line 1778
;1776:	}
;1777:
;1778:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $914
line 1779
;1779:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $917
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1780
;1780:		return;
ADDRGP4 $906
JUMPV
LABELV $914
line 1782
;1781:	}
;1782:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $918
line 1783
;1783:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $920
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1784
;1784:		return;
ADDRGP4 $906
JUMPV
LABELV $918
line 1786
;1785:	}
;1786:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $921
line 1787
;1787:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $784
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1788
;1788:		return;
ADDRGP4 $906
JUMPV
LABELV $921
line 1792
;1789:	}
;1790:
;1791:	// make sure it is a valid command to vote on
;1792:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1793
;1793:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1794
;1794:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $926
JUMPV
LABELV $923
line 1795
;1795:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $927
line 1796
;1796:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $929
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $927
line 1797
;1797:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
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
line 1798
;1798:	}
LABELV $924
line 1794
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $926
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $923
line 1800
;1799:
;1800:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $932
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
EQU4 $930
LABELV $932
line 1801
;1801:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $788
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1802
;1802:		return;
ADDRGP4 $906
JUMPV
LABELV $930
line 1805
;1803:	}
;1804:
;1805:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $935
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $933
line 1808
;1806:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1807:
;1808:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $936
line 1809
;1809:			i = ent->client->ps.clientNum;
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
line 1810
;1810:		}
ADDRGP4 $937
JUMPV
LABELV $936
line 1811
;1811:		else {
line 1813
;1812:			// numeric values are just slot numbers
;1813:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $938
line 1814
;1814:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
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
EQI4 $945
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $945
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $942
LABELV $945
line 1815
;1815:					break;
ADDRGP4 $940
JUMPV
LABELV $942
line 1816
;1816:			}
LABELV $939
line 1813
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $938
LABELV $940
line 1817
;1817:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $948
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $946
LABELV $948
line 1818
;1818:				i = atoi( arg2 );
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
line 1819
;1819:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $952
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $949
LABELV $952
line 1820
;1820:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $283
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1821
;1821:					return;
ADDRGP4 $906
JUMPV
LABELV $949
line 1824
;1822:				}
;1823:
;1824:				if ( !g_entities[i].inuse ) {
CNSTI4 876
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $947
line 1825
;1825:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $286
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1826
;1826:					return;
ADDRGP4 $906
JUMPV
line 1828
;1827:				}
;1828:			}
LABELV $946
line 1829
;1829:			else {
line 1830
;1830:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1831
;1831:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1832
;1832:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $959
JUMPV
LABELV $956
line 1833
;1833:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3452
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
NEI4 $961
line 1834
;1834:						continue;
ADDRGP4 $957
JUMPV
LABELV $961
line 1835
;1835:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3452
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
EQI4 $963
line 1836
;1836:						continue;
ADDRGP4 $957
JUMPV
LABELV $963
line 1837
;1837:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3452
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
line 1838
;1838:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1839
;1839:					if ( !Q_stricmp(netname, leader) ) {
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
NEI4 $965
line 1840
;1840:						break;
ADDRGP4 $958
JUMPV
LABELV $965
line 1842
;1841:					}
;1842:				}
LABELV $957
line 1832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $959
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $956
LABELV $958
line 1843
;1843:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $967
line 1844
;1844:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $970
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1845
;1845:					return;
ADDRGP4 $906
JUMPV
LABELV $967
line 1847
;1846:				}
;1847:			}
LABELV $947
line 1848
;1848:		}
LABELV $937
line 1849
;1849:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $389
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1850
;1850:	} else {
ADDRGP4 $934
JUMPV
LABELV $933
line 1851
;1851:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $788
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1852
;1852:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $971
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1853
;1853:		return;
ADDRGP4 $906
JUMPV
LABELV $934
line 1856
;1854:	}
;1855:
;1856:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $838
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1858
;1857:
;1858:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $977
JUMPV
LABELV $974
line 1859
;1859:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3452
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
NEI4 $979
line 1860
;1860:			continue;
ADDRGP4 $975
JUMPV
LABELV $979
line 1861
;1861:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3452
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
NEI4 $981
line 1862
;1862:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $983
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
LABELV $981
line 1863
;1863:	}
LABELV $975
line 1858
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $977
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $974
line 1866
;1864:
;1865:	// start the voting, the caller autoamtically votes yes
;1866:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1867
;1867:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 1
ASGNI4
line 1868
;1868:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 1870
;1869:
;1870:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $991
JUMPV
LABELV $988
line 1871
;1871:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3452
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
line 1872
;1872:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3452
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
LABELV $993
line 1873
;1873:	}
LABELV $989
line 1870
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $991
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $988
line 1874
;1874:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1876
;1875:
;1876:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $879
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
line 1877
;1877:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
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
line 1878
;1878:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $879
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
line 1879
;1879:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $879
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
line 1880
;1880:}
LABELV $906
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 1887
;1881:
;1882:/*
;1883:==================
;1884:Cmd_TeamVote_f
;1885:==================
;1886:*/
;1887:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1891
;1888:	int			team, cs_offset;
;1889:	char		msg[64];
;1890:
;1891:	team = ent->client->sess.sessionTeam;
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
line 1892
;1892:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1000
line 1893
;1893:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1001
JUMPV
LABELV $1000
line 1894
;1894:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $999
line 1895
;1895:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1897
;1896:	else
;1897:		return;
LABELV $1003
LABELV $1001
line 1899
;1898:
;1899:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1004
line 1900
;1900:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $1007
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1901
;1901:		return;
ADDRGP4 $999
JUMPV
LABELV $1004
line 1903
;1902:	}
;1903:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
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
EQI4 $1008
line 1904
;1904:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $1010
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1905
;1905:		return;
ADDRGP4 $999
JUMPV
LABELV $1008
line 1907
;1906:	}
;1907:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1011
line 1908
;1908:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $894
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1909
;1909:		return;
ADDRGP4 $999
JUMPV
LABELV $1011
line 1912
;1910:	}
;1911:
;1912:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRGP4 $1013
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1914
;1913:
;1914:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1916
;1915:
;1916:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1918
;1917:
;1918:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1019
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1019
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1014
LABELV $1019
line 1919
;1919:		level.teamVoteYes[cs_offset]++;
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
line 1920
;1920:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $879
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
line 1921
;1921:	} else {
ADDRGP4 $1015
JUMPV
LABELV $1014
line 1922
;1922:		level.teamVoteNo[cs_offset]++;
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
line 1923
;1923:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $879
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
line 1924
;1924:	}
LABELV $1015
line 1928
;1925:
;1926:	// a majority will be determined in TeamCheckVote, which will also account
;1927:	// for players entering or leaving
;1928:}
LABELV $999
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 1936
;1929:
;1930:
;1931:/*
;1932:=================
;1933:Cmd_SetViewpos_f
;1934:=================
;1935:*/
;1936:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1941
;1937:	vec3_t		origin, angles;
;1938:	char		buffer[MAX_TOKEN_CHARS];
;1939:	int			i;
;1940:
;1941:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1025
line 1942
;1942:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $252
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1943
;1943:		return;
ADDRGP4 $1024
JUMPV
LABELV $1025
line 1945
;1944:	}
;1945:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1028
line 1946
;1946:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1030
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
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1947
;1947:		return;
ADDRGP4 $1024
JUMPV
LABELV $1028
line 1950
;1948:	}
;1949:
;1950:	VectorClear( angles );
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
line 1951
;1951:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1033
line 1952
;1952:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
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
line 1953
;1953:		origin[i] = atof( buffer );
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
line 1954
;1954:	}
LABELV $1034
line 1951
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1033
line 1956
;1955:
;1956:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1957
;1957:	angles[YAW] = atof( buffer );
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
line 1959
;1958:
;1959:	TeleportPlayer( ent, origin, angles );
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
line 1960
;1960:}
LABELV $1024
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 1969
;1961:
;1962:
;1963:
;1964:/*
;1965:=================
;1966:Cmd_Stats_f
;1967:=================
;1968:*/
;1969:void Cmd_Stats_f( gentity_t *ent ) {
line 1984
;1970:/*
;1971:	int max, n, i;
;1972:
;1973:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1974:
;1975:	n = 0;
;1976:	for ( i = 0; i < max; i++ ) {
;1977:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1978:			n++;
;1979:	}
;1980:
;1981:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1982:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1983:*/
;1984:}
LABELV $1038
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1188 16
line 1991
;1985:
;1986:/*
;1987:=================
;1988:ClientCommand
;1989:=================
;1990:*/
;1991:void ClientCommand( int clientNum ) {
line 1995
;1992:	gentity_t *ent;
;1993:	char	cmd[MAX_TOKEN_CHARS];
;1994:
;1995:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 876
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1996
;1996:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1040
line 1997
;1997:		return;		// not fully in game yet
ADDRGP4 $1039
JUMPV
LABELV $1040
line 2001
;1998:	}
;1999:
;2000:
;2001:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2003
;2002:
;2003:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1044
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1042
line 2004
;2004:		Cmd_Say_f (ent, SAY_ALL, qfalse);
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
line 2005
;2005:		return;
ADDRGP4 $1039
JUMPV
LABELV $1042
line 2007
;2006:	}
;2007:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1047
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1045
line 2008
;2008:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
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
line 2009
;2009:		return;
ADDRGP4 $1039
JUMPV
LABELV $1045
line 2011
;2010:	}
;2011:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1050
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1048
line 2012
;2012:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2013
;2013:		return;
ADDRGP4 $1039
JUMPV
LABELV $1048
line 2015
;2014:	}
;2015:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1053
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1051
line 2016
;2016:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
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
line 2017
;2017:		return;
ADDRGP4 $1039
JUMPV
LABELV $1051
line 2019
;2018:	}
;2019:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1056
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1054
line 2020
;2020:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
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
line 2021
;2021:		return;
ADDRGP4 $1039
JUMPV
LABELV $1054
line 2023
;2022:	}
;2023:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1057
line 2024
;2024:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2025
;2025:		return;
ADDRGP4 $1039
JUMPV
LABELV $1057
line 2027
;2026:	}
;2027:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1061
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1059
line 2028
;2028:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
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
line 2029
;2029:		return;
ADDRGP4 $1039
JUMPV
LABELV $1059
line 2031
;2030:	}
;2031:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1064
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1062
line 2032
;2032:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
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
line 2033
;2033:		return;
ADDRGP4 $1039
JUMPV
LABELV $1062
line 2035
;2034:	}
;2035:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1067
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1065
line 2036
;2036:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2037
;2037:		return;
ADDRGP4 $1039
JUMPV
LABELV $1065
line 2039
;2038:	}
;2039:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1070
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1068
line 2040
;2040:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2041
;2041:		return;
ADDRGP4 $1039
JUMPV
LABELV $1068
line 2043
;2042:	}
;2043:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1071
line 2044
;2044:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2045
;2045:		return;
ADDRGP4 $1039
JUMPV
LABELV $1071
line 2049
;2046:	}
;2047:
;2048:	// ignore all other commands when at intermission
;2049:	if (level.intermissiontime) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $1073
line 2050
;2050:		Cmd_Say_f (ent, SAY_INVAL, qtrue);
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
line 2051
;2051:		return;
ADDRGP4 $1039
JUMPV
LABELV $1073
line 2054
;2052:	}
;2053:
;2054:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1076
line 2055
;2055:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $1077
JUMPV
LABELV $1076
line 2056
;2056:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1081
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1079
line 2057
;2057:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1080
JUMPV
LABELV $1079
line 2058
;2058:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1084
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1082
line 2059
;2059:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1083
JUMPV
LABELV $1082
line 2060
;2060:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1087
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1085
line 2061
;2061:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1086
JUMPV
LABELV $1085
line 2062
;2062:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1090
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1088
line 2063
;2063:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1089
JUMPV
LABELV $1088
line 2064
;2064:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $388
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1091
line 2065
;2065:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1092
JUMPV
LABELV $1091
line 2066
;2066:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1095
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1093
line 2067
;2067:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1094
JUMPV
LABELV $1093
line 2068
;2068:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1098
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1096
line 2069
;2069:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1097
JUMPV
LABELV $1096
line 2070
;2070:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1101
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1099
line 2071
;2071:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1100
JUMPV
LABELV $1099
line 2072
;2072:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1104
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1102
line 2073
;2073:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1103
JUMPV
LABELV $1102
line 2074
;2074:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1107
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1105
line 2075
;2075:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1106
JUMPV
LABELV $1105
line 2076
;2076:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1110
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1108
line 2077
;2077:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1109
JUMPV
LABELV $1108
line 2078
;2078:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1113
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1111
line 2079
;2079:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1112
JUMPV
LABELV $1111
line 2080
;2080:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1116
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1114
line 2081
;2081:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1115
JUMPV
LABELV $1114
line 2082
;2082:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1119
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1117
line 2083
;2083:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1118
JUMPV
LABELV $1117
line 2084
;2084:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1122
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1120
line 2085
;2085:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1121
JUMPV
LABELV $1120
line 2086
;2086:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1125
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1123
line 2087
;2087:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1124
JUMPV
LABELV $1123
line 2088
;2088:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1128
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1126
line 2089
;2089:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1127
JUMPV
LABELV $1126
line 2090
;2090:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1131
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1129
line 2091
;2091:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2092
;2092:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1134
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1132
line 2093
;2093:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2094
;2094:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1135
line 2095
;2095:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $1136
JUMPV
LABELV $1135
line 2096
;2096:	else if (Q_stricmp (cmd, "spawnturret") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1140
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1138
line 2097
;2097:		Cmd_SpawnTurret_f( ent, 0 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2098
;2098:	else if (Q_stricmp (cmd, "spawnturret2") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1143
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1141
line 2099
;2099:		Cmd_SpawnTurret_f( ent, 1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1142
JUMPV
LABELV $1141
line 2100
;2100:	else if (Q_stricmp (cmd, "spawnturret3") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1146
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1144
line 2101
;2101:		Cmd_SpawnTurret_f( ent, 2 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2102
;2102:	else if (Q_stricmp (cmd, "spawngen") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1149
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1147
line 2103
;2103:		Cmd_SpawnGenerator_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnGenerator_f
CALLV
pop
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2104
;2104:	else if (Q_stricmp (cmd, "spawnmc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $1150
line 2105
;2105:		Cmd_SpawnMC_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnMC_f
CALLV
pop
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2106
;2106:	else if (Q_stricmp (cmd, "spawntd") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $1153
line 2107
;2107:		Cmd_SpawnDisplacer_f( ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnDisplacer_f
CALLV
pop
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2108
;2108:	else if (Q_stricmp (cmd, "test") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1156
line 2109
;2109:		Cmd_Test_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Test_f
CALLV
pop
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2111
;2110:	else
;2111:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1159
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
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
LABELV $1121
LABELV $1118
LABELV $1115
LABELV $1112
LABELV $1109
LABELV $1106
LABELV $1103
LABELV $1100
LABELV $1097
LABELV $1094
LABELV $1092
LABELV $1089
LABELV $1086
LABELV $1083
LABELV $1080
LABELV $1077
line 2112
;2112:}
LABELV $1039
endproc ClientCommand 1188 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 2122
;2113:
;2114:/*
;2115:============================
;2116:G_SendCommandToClient
;2117:Send the given command to the specified (or all) clients
;2118:Shafe - Trep - This is for the Radar
;2119:============================
;2120:*/
;2121:void G_SendCommandToClient (gentity_t *to, char *cmd)
;2122:{
line 2123
;2123:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1161
line 2124
;2124:	{
line 2126
;2125:		// send to all clients 
;2126:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2127
;2127:	} else {
ADDRGP4 $1162
JUMPV
LABELV $1161
line 2129
;2128:    // send to specified client
;2129:    trap_SendServerCommand ( to-g_entities, cmd);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2130
;2130:	}
LABELV $1162
line 2131
;2131:}
LABELV $1160
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
LABELV $1159
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
LABELV $1158
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1155
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $1152
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $1149
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
LABELV $1146
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
LABELV $1143
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
LABELV $1140
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
LABELV $1137
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
LABELV $1134
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $1131
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1128
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
LABELV $1125
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1122
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
LABELV $1119
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
LABELV $1116
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1113
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
LABELV $1110
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1107
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1104
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
LABELV $1101
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
LABELV $1098
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1095
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
LABELV $1090
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1087
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1084
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
LABELV $1081
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1078
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1070
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1067
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1064
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
LABELV $1061
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1056
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
LABELV $1053
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1050
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1047
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
LABELV $1044
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1030
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
LABELV $1013
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
LABELV $1010
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
LABELV $1007
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
LABELV $983
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
LABELV $971
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
LABELV $970
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
LABELV $935
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $929
byte 1 32
byte 1 0
align 1
LABELV $920
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
LABELV $917
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
LABELV $895
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
LABELV $894
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
LABELV $891
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
LABELV $888
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
LABELV $879
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $869
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
LABELV $865
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $859
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
LABELV $856
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
LABELV $850
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $845
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
LABELV $838
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $835
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $832
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
LABELV $824
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $819
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
LABELV $818
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
LABELV $815
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
LABELV $812
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
LABELV $809
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
LABELV $806
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $803
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
LABELV $800
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
LABELV $797
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $794
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $791
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
LABELV $788
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
LABELV $784
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
LABELV $781
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
LABELV $778
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
LABELV $774
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
LABELV $769
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
LABELV $768
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
LABELV $767
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
LABELV $766
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
LABELV $765
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
LABELV $764
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
LABELV $763
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
LABELV $762
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
LABELV $761
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
LABELV $752
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $751
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
LABELV $750
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
LABELV $749
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
LABELV $748
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
LABELV $747
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
LABELV $746
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
LABELV $745
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $742
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $725
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
LABELV $720
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
LABELV $709
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
LABELV $699
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
LABELV $677
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
LABELV $667
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
LABELV $666
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $665
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $662
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $645
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
LABELV $623
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $616
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
LABELV $615
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
LABELV $613
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
LABELV $612
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
LABELV $607
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
LABELV $606
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
LABELV $603
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
LABELV $601
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
LABELV $600
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
LABELV $589
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $588
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $587
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
LABELV $559
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
LABELV $530
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
LABELV $526
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
LABELV $513
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
LABELV $507
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
LABELV $505
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
LABELV $503
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
LABELV $501
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
LABELV $462
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
LABELV $457
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
LABELV $446
byte 1 98
byte 1 0
align 1
LABELV $445
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $441
byte 1 114
byte 1 0
align 1
LABELV $440
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $433
byte 1 115
byte 1 0
align 1
LABELV $432
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
LABELV $429
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $426
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $422
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $421
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
LABELV $417
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
LABELV $414
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
LABELV $409
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
LABELV $401
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
LABELV $398
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
LABELV $389
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $388
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
LABELV $384
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
LABELV $383
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
LABELV $373
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
LABELV $372
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
LABELV $366
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
LABELV $365
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
LABELV $359
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
LABELV $358
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
LABELV $357
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
LABELV $345
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $342
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $339
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
LABELV $336
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
LABELV $333
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
LABELV $327
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $317
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $311
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $305
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $302
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $296
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
LABELV $286
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
LABELV $283
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
LABELV $255
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
LABELV $252
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
LABELV $242
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
LABELV $240
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
LABELV $238
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
LABELV $236
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
LABELV $234
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
LABELV $232
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
LABELV $228
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
LABELV $216
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
LABELV $209
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
LABELV $191
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
LABELV $188
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
LABELV $185
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
LABELV $138
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
LABELV $135
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
LABELV $98
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
LABELV $95
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
LABELV $76
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
LABELV $73
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
