export Cmd_SpawnMC_f
code
proc Cmd_SpawnMC_f 4 8
file "../g_cmds.c"
line 19
;1:// 2016 Trepidation Licensed under the GPL2
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
;28:	// You can only Build MC's in GameMode 3 or single player
;29:	if ((g_GameMode.integer == 3) || (g_GameMode.integer == 999) )
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $62
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $58
LABELV $62
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $63
line 33
;33:		{
line 34
;34:			if (level.redMC == 0) { 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
NEI4 $65
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
ADDRGP4 $66
JUMPV
LABELV $65
line 38
;38:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 39
;39:			}
LABELV $66
line 40
;40:		}
LABELV $63
line 41
;41:		if(ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $68
line 42
;42:		{
line 43
;43:			if (level.blueMC == 0) { 
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
NEI4 $70
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
ADDRGP4 $71
JUMPV
LABELV $70
line 47
;47:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 48
;48:			}
LABELV $71
line 49
;49:		}	
LABELV $68
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
EQI4 $73
line 54
;54:	{
line 56
;55:		// FIXME: Play Error Sound
;56:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"There is Already A Power Core.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $75
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
ADDRGP4 $77
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $75
line 57
;57:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Power Core Not Allowed.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $78
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
ADDRGP4 $80
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $78
line 60
;58:		//G_AddEvent( ent, EV_ERROR, 0 );
;59:
;60:	}
LABELV $73
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
GTI4 $82
line 70
;70:	{ // Don't do anything when you are dead -Vincent
line 71
;71:	return;
ADDRGP4 $81
JUMPV
LABELV $82
line 75
;72:	}
;73:
;74:	// You can only Build Generators in GameMode 3
;75:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $84
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $87
line 79
;79:		{
line 80
;80:			if (level.redGen > 1)
ADDRGP4 level+9256
INDIRI4
CNSTI4 1
LEI4 $89
line 81
;81:			{
line 82
;82:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 83
;83:			} else {
ADDRGP4 $90
JUMPV
LABELV $89
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
LABELV $90
line 87
;87:		}
LABELV $87
line 88
;88:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $92
line 89
;89:		{
line 90
;90:			if (level.blueGen > 1)
ADDRGP4 level+9260
INDIRI4
CNSTI4 1
LEI4 $94
line 91
;91:			{
line 92
;92:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 93
;93:			} else {
ADDRGP4 $95
JUMPV
LABELV $94
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
LABELV $95
line 97
;97:		}
LABELV $92
line 98
;98:	}
LABELV $84
line 101
;99:	
;100:	// If it couldn't be built tell them why
;101:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $97
line 102
;102:	{
line 104
;103:		// FIXME: Play Error Sound
;104:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Shield Generators..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $99
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
ADDRGP4 $101
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $99
line 105
;105:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Sheild Generators Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $102
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
ADDRGP4 $104
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $102
line 107
;106:		//G_AddEvent( ent, EV_ERROR, 0 );
;107:	}						
LABELV $97
line 109
;108:
;109:}
LABELV $81
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
GTI4 $106
line 120
;120:	{ // Don't do anything when you are dead -Vincent
line 121
;121:	return;
ADDRGP4 $105
JUMPV
LABELV $106
line 126
;122:	}
;123:  
;124:
;125:	// You can only Build Displacers in GameMode 3
;126:	if (g_GameMode.integer == 3) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $108
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
GEI4 $115
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
ADDRGP4 $117
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 136
;136:			return;
ADDRGP4 $105
JUMPV
LABELV $115
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $118
line 141
;141:		{
line 142
;142:			if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $120
line 143
;143:			{
line 144
;144:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 145
;145:			} else {
ADDRGP4 $121
JUMPV
LABELV $120
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
LABELV $121
line 149
;149:		}
LABELV $118
line 150
;150:		if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $123
line 151
;151:		{
line 152
;152:			if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $125
line 153
;153:			{
line 154
;154:				iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 155
;155:			} else {
ADDRGP4 $126
JUMPV
LABELV $125
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
LABELV $126
line 159
;159:		}
LABELV $123
line 160
;160:	}
LABELV $108
line 162
;161:	
;162:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $128
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $128
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
NEI4 $131
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $131
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $134
line 168
;168:			{
line 169
;169:				if (level.redTD > 1)
ADDRGP4 level+9308
INDIRI4
CNSTI4 1
LEI4 $136
line 170
;170:				{
line 171
;171:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 172
;172:				} else {
ADDRGP4 $137
JUMPV
LABELV $136
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
LABELV $137
line 177
;177:			}
LABELV $134
line 178
;178:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $140
line 179
;179:			{
line 180
;180:				if (level.blueTD > 1)
ADDRGP4 level+9304
INDIRI4
CNSTI4 1
LEI4 $142
line 181
;181:				{
line 182
;182:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 183
;183:				} else {
ADDRGP4 $143
JUMPV
LABELV $142
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
LABELV $143
line 188
;188:			}
LABELV $140
line 189
;189:		}
LABELV $131
line 192
;190:
;191:
;192:	}		
LABELV $128
line 195
;193:
;194:	// If it couldn't be built tell them why
;195:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $146
line 196
;196:	{
line 198
;197:		// FIXME: Play Error Sound
;198:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Immobilizers..\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $148
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
ADDRGP4 $150
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $148
line 199
;199:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizers Not Allowed.\"" );}
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $151
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
ADDRGP4 $153
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $151
line 200
;200:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Immobilizer Not Available Yet.\"" );} // Redundant now?
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $154
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
ADDRGP4 $117
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $154
line 202
;201:		//G_AddEvent( ent, EV_ERROR, 0 );
;202:	}						
LABELV $146
line 204
;203:
;204:}
LABELV $105
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
GTI4 $157
line 213
;213:	{ // Don't do anything when you are dead -Vincent
line 214
;214:	return;
ADDRGP4 $156
JUMPV
LABELV $157
line 218
;215:	}
;216:
;217:	// If Playing GM 3 Check the rules
;218:	if (g_GameMode.integer == 3) {
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $159
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
GEI4 $166
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $166
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $166
line 224
;224:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
ADDRLP4 4
INDIRI4
CNSTI4 6
GEI4 $168
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $168
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $168
line 226
;225:
;226:		if (iserror == 1)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $170
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $172
line 230
;230:			{
line 231
;231:				if (level.blueTurrets > 5)  // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
CNSTI4 5
LEI4 $174
line 232
;232:				{
line 233
;233:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 234
;234:				} else {
ADDRGP4 $175
JUMPV
LABELV $174
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
LABELV $175
line 238
;238:			}
LABELV $172
line 239
;239:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $177
line 240
;240:			{
line 241
;241:				if (level.redTurrets > 5) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
CNSTI4 5
LEI4 $179
line 242
;242:				{
line 243
;243:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 244
;244:				} else {
ADDRGP4 $180
JUMPV
LABELV $179
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
LABELV $180
line 248
;248:			}
LABELV $177
line 249
;249:		}
LABELV $170
line 250
;250:	}
LABELV $159
line 254
;251:
;252:	// If playing CTF Make sure that we dont have too many 
;253:	// Turrets on our team.
;254:	if (g_gametype.integer == GT_CTF && iserror == 1) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $182
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $182
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
NEI4 $185
ADDRGP4 g_Turrets+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $185
line 258
;258:		{
line 259
;259:			if(ent->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $188
line 260
;260:			{
line 261
;261:				if (level.blueTurrets > g_MaxTurrets.integer-1) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9268
INDIRI4
ADDRGP4 g_MaxTurrets+12
INDIRI4
CNSTI4 1
SUBI4
LEI4 $190
line 262
;262:				{
line 263
;263:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 264
;264:				} else {
ADDRGP4 $191
JUMPV
LABELV $190
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
LABELV $191
line 269
;269:			}
LABELV $188
line 270
;270:			if(ent->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $195
line 271
;271:			{
line 272
;272:				if (level.redTurrets > g_MaxTurrets.integer-1) // Maybe Max # of Turrets Should be A Cvar so admins can change
ADDRGP4 level+9264
INDIRI4
ADDRGP4 g_MaxTurrets+12
INDIRI4
CNSTI4 1
SUBI4
LEI4 $197
line 273
;273:				{
line 274
;274:					iserror = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 275
;275:				} else {
ADDRGP4 $198
JUMPV
LABELV $197
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
LABELV $198
line 280
;280:			}
LABELV $195
line 281
;281:		}
LABELV $185
line 282
;282:	}
LABELV $182
line 285
;283:	
;284:	// If it couldn't be built tell them why
;285:	if (iserror != 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $202
line 286
;286:	{
line 288
;287:		// FIXME Play Error Sound
;288:		if (iserror == 3) { trap_SendServerCommand( ent-g_entities, "cp \"Turret Type Not Available Yet.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $204
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
ADDRGP4 $206
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $204
line 289
;289:		if (iserror == 2) { trap_SendServerCommand( ent-g_entities, "cp \"Too Many Turrets On Your Team.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $207
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
ADDRGP4 $209
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $207
line 290
;290:		if (iserror == 1) { trap_SendServerCommand( ent-g_entities, "cp \"Turrets Not Allowed Here.\"" ); }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $210
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
ADDRGP4 $212
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $210
line 292
;291:		//G_AddEvent( ent, EV_ERROR, 0 );
;292:	}
LABELV $202
line 294
;293:
;294:}
LABELV $156
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
ADDRGP4 $218
JUMPV
LABELV $215
line 328
;326:		int		ping;
;327:
;328:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3480
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
NEI4 $220
line 331
;331:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 332
;332:		} else {
ADDRGP4 $221
JUMPV
LABELV $220
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
GEI4 $223
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $224
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 337
;336://unlagged - true ping
;337:		}
LABELV $221
line 340
;338:
;339:
;340:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
line 341
;341:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
DIVI4
ASGNI4
line 342
;342:		}
ADDRGP4 $226
JUMPV
LABELV $225
line 343
;343:		else {
line 344
;344:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 345
;345:		}
LABELV $226
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
NEI4 $228
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $228
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $229
JUMPV
LABELV $228
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $229
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
ADDRGP4 $230
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
CNSTI4 2492
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
LEI4 $235
line 365
;365:			break;
ADDRGP4 $217
JUMPV
LABELV $235
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
LABELV $216
line 325
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $215
LABELV $217
line 370
;369:
;370:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $237
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
LABELV $213
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_TeleGren_f
proc Cmd_TeleGren_f 24 32
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
GTI4 $243
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
EQI4 $242
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
ADDRGP4 $242
JUMPV
LABELV $243
line 399
;395:	}
;396:
;397:
;398:	
;399:		if ( ent->istelepoint == 1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 1
NEI4 $247
line 400
;400:		{
line 402
;401:			// Shafe The old way was just to drop it now we return flags to base if you try to teleport with one
;402:			if (ent->client->ps.powerups[PW_REDFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 403
;403:			{
line 404
;404:				Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 405
;405:				ent->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 406
;406:			}
LABELV $249
line 407
;407:			if (ent->client->ps.powerups[PW_BLUEFLAG]) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $251
line 408
;408:			{
line 409
;409:				Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 410
;410:				ent->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 411
;411:			}
LABELV $251
line 413
;412:
;413:			VectorCopy( ent->teleloc, ent->client->ps.origin );
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
line 414
;414:			ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 415
;415:			VectorClear( ent->teleloc );
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
line 418
;416:
;417:			// Do a check here
;418:			if(!CanPDGHere(ent)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CanPDGHere
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $248
line 419
;419:			{
line 422
;420:				// They went into a wall - kill them
;421:				//player_die (ent, ent, ent, 100000, MOD_CRUSH);
;422:				G_Damage ( ent, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 424
;423:
;424:			}
line 425
;425:		} 
ADDRGP4 $248
JUMPV
LABELV $247
line 427
;426:		else 
;427:		{
line 428
;428:			G_Printf( S_COLOR_GREEN "PDG Lock Not Established\n" );
ADDRGP4 $255
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 429
;429:		}
LABELV $248
line 432
;430:
;431:	
;432:}
LABELV $242
endproc Cmd_TeleGren_f 24 32
lit
align 4
LABELV $257
byte 4 3246391296
byte 4 3246391296
byte 4 0
align 4
LABELV $258
byte 4 1098907648
byte 4 1098907648
byte 4 1098907648
align 4
LABELV $259
byte 4 3255566336
byte 4 3255566336
byte 4 3255566336
align 4
LABELV $260
byte 4 1108082688
byte 4 1108082688
byte 4 1108082688
export CanPDGHere
code
proc CanPDGHere 268 28
line 442
;433:
;434:/*
;435:=================
;436:CanPDGHere
;437:
;438:This checks if we can teleport here
;439:=================
;440:*/
;441:qboolean CanPDGHere(gentity_t *playerent)
;442:{
line 445
;443:	trace_t		tr;
;444:	trace_t		trd;
;445:	vec3_t		fwd, pos, dest, mins = {-16,-16, 0}, maxs = {16,16,16};
ADDRLP4 160
ADDRGP4 $257
INDIRB
ASGNB 12
ADDRLP4 172
ADDRGP4 $258
INDIRB
ASGNB 12
line 446
;446:	vec3_t		down, dpos, ddest, dmins = {-35,-35, -35}, dmaxs = {35,35,35};
ADDRLP4 184
ADDRGP4 $259
INDIRB
ASGNB 12
ADDRLP4 196
ADDRGP4 $260
INDIRB
ASGNB 12
line 454
;447:	//vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
;448:	qboolean	f;
;449:	qboolean	d;			
;450:	
;451:
;452:	// can we place this in front of us?
;453:	//AngleVectors (playerent->., fwd, NULL, NULL);
;454:	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 240
CNSTP4 0
ASGNP4
ADDRLP4 240
INDIRP4
ARGP4
ADDRLP4 240
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 455
;455:	fwd[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 456
;456:	down[0] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 457
;457:	VectorMA(playerent->client->ps.origin, 64, fwd, dest);
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 248
CNSTF4 1115684864
ASGNF4
ADDRLP4 12
ADDRLP4 244
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 248
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 244
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 248
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 458
;458:	trap_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
ADDRLP4 48
ARGP4
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 172
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 252
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 460
;459:	
;460:	VectorMA(playerent->client->ps.origin, 74, down, ddest);
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 260
CNSTF4 1116995584
ASGNF4
ADDRLP4 36
ADDRLP4 256
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 260
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 256
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 260
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1116995584
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 461
;461:	trap_Trace (&trd, playerent->client->ps.origin, dmins, dmaxs, ddest, playerent->s.number, MASK_SHOT );
ADDRLP4 104
ARGP4
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 184
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 264
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 464
;462:	
;463:
;464:	if (tr.fraction > 0.9)
ADDRLP4 48+8
INDIRF4
CNSTF4 1063675494
LEF4 $270
line 465
;465:	{//room in front
line 466
;466:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $256
JUMPV
LABELV $270
line 469
;467:	}
;468:	
;469:	if (trd.fraction > 0.9)
ADDRLP4 104+8
INDIRF4
CNSTF4 1063675494
LEF4 $273
line 470
;470:	{//room in below
line 471
;471:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $256
JUMPV
LABELV $273
line 474
;472:	}
;473:	// no room
;474:	return qfalse;
CNSTI4 0
RETI4
LABELV $256
endproc CanPDGHere 268 28
export Cmd_DropFlag_f
proc Cmd_DropFlag_f 0 4
line 487
;475:}
;476:
;477:/*
;478:
;479:=================
;480:
;481:Cmd_DropFlag_f
;482:Shafe - Trep - PDG
;483:=================
;484:*/
;485:
;486:void Cmd_DropFlag_f (gentity_t *ent) 
;487:{
line 488
;488:Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 489
;489:}
LABELV $276
endproc Cmd_DropFlag_f 0 4
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 500
;490:
;491:
;492:/*
;493:==================
;494:Cmd_Score_f
;495:
;496:Request current scoreboard information
;497:==================
;498:*/
;499:void Cmd_Score_f( gentity_t *ent )
;500:{
line 501
;501:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 502
;502:}
LABELV $277
endproc Cmd_Score_f 0 4
export Cmd_Test_f
proc Cmd_Test_f 32 8
line 506
;503:
;504:
;505:void Cmd_Test_f (gentity_t *ent) 
;506:{
line 507
;507:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluegenerators %i\n\"", level.blueGen ));		
ADDRGP4 $279
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
line 508
;508:		trap_SendServerCommand( ent-g_entities, va("print \" level.redgenerators %i\n\"", level.redGen ));		
ADDRGP4 $281
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
line 509
;509:		trap_SendServerCommand( ent-g_entities, va("print \" level.blueturrets %i\n\"", level.blueTurrets ));		
ADDRGP4 $283
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
line 510
;510:		trap_SendServerCommand( ent-g_entities, va("print \" level.redturrets %i\n\"", level.redTurrets ));		
ADDRGP4 $285
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
line 511
;511:		trap_SendServerCommand( ent-g_entities, va("print \" level.redmc %i\n\"", level.redMC ));		
ADDRGP4 $287
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
line 512
;512:		trap_SendServerCommand( ent-g_entities, va("print \" level.blumc %i\n\"", level.blueMC ));		
ADDRGP4 $289
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
line 513
;513:		trap_SendServerCommand( ent-g_entities, va("print \" level.redscorelatched %i\n\"", level.redScoreLatched ));		
ADDRGP4 $291
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
line 514
;514:		trap_SendServerCommand( ent-g_entities, va("print \" level.bluescorelatched %i\n\"", level.blueScoreLatched ));		
ADDRGP4 $293
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
line 516
;515:		//trap_SendServerCommand( ent-g_entities, va("print \" level.scoreTime %i\n\"", (level.time-level.scoreTime) ));		
;516:}
LABELV $278
endproc Cmd_Test_f 32 8
export CheatsOk
proc CheatsOk 4 8
line 525
;517:
;518:
;519:/*
;520:==================
;521:CheatsOk
;522:==================
;523:*/
;524:qboolean	CheatsOk( gentity_t *ent ) 
;525:{
line 526
;526:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $296
line 527
;527:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $299
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
line 528
;528:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $295
JUMPV
LABELV $296
line 531
;529:	}
;530:
;531:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $300
line 532
;532:      trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\"")); 
ADDRGP4 $302
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
line 533
;533:      return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $295
JUMPV
LABELV $300
line 535
;534:   }
;535:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $303
line 536
;536:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $302
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
line 537
;537:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $295
JUMPV
LABELV $303
line 539
;538:	}
;539:	return qtrue;
CNSTI4 1
RETI4
LABELV $295
endproc CheatsOk 4 8
bss
align 1
LABELV $306
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 548
;540:}
;541:
;542:
;543:/*
;544:==================
;545:ConcatArgs
;546:==================
;547:*/
;548:char	*ConcatArgs( int start ) {
line 554
;549:	int		i, c, tlen;
;550:	static char	line[MAX_STRING_CHARS];
;551:	int		len;
;552:	char	arg[MAX_STRING_CHARS];
;553:
;554:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 555
;555:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 556
;556:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $307
line 557
;557:		trap_Argv( i, arg, sizeof( arg ) );
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
line 558
;558:		tlen = strlen( arg );
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
line 559
;559:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $311
line 560
;560:			break;
ADDRGP4 $309
JUMPV
LABELV $311
line 562
;561:		}
;562:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $306
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
line 563
;563:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 564
;564:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $313
line 565
;565:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $306
ADDP4
CNSTI1 32
ASGNI1
line 566
;566:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 567
;567:		}
LABELV $313
line 568
;568:	}
LABELV $308
line 556
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $310
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $307
LABELV $309
line 570
;569:
;570:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $306
ADDP4
CNSTI1 0
ASGNI1
line 572
;571:
;572:	return line;
ADDRGP4 $306
RETP4
LABELV $305
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 582
;573:}
;574:
;575:/*
;576:==================
;577:SanitizeString
;578:
;579:Remove case and control characters
;580:==================
;581:*/
;582:void SanitizeString( char *in, char *out ) {
ADDRGP4 $317
JUMPV
LABELV $316
line 583
;583:	while ( *in ) {
line 584
;584:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $319
line 585
;585:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 586
;586:			continue;
ADDRGP4 $317
JUMPV
LABELV $319
line 588
;587:		}
;588:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $321
line 589
;589:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 590
;590:			continue;
ADDRGP4 $317
JUMPV
LABELV $321
line 592
;591:		}
;592:		*out++ = tolower( *in++ );
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
line 593
;593:	}
LABELV $317
line 583
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $316
line 595
;594:
;595:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 596
;596:}
LABELV $315
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 606
;597:
;598:/*
;599:==================
;600:ClientNumberFromString
;601:
;602:Returns a player number for either a number or name string
;603:Returns -1 if invalid
;604:==================
;605:*/
;606:int ClientNumberFromString( gentity_t *to, char *s ) {
line 613
;607:	gclient_t	*cl;
;608:	int			idnum;
;609:	char		s2[MAX_STRING_CHARS];
;610:	char		n2[MAX_STRING_CHARS];
;611:
;612:	// numeric values are just slot numbers
;613:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $324
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $324
line 614
;614:		idnum = atoi( s );
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
line 615
;615:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $329
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $326
LABELV $329
line 616
;616:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $330
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
line 617
;617:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $323
JUMPV
LABELV $326
line 620
;618:		}
;619:
;620:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3480
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 621
;621:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $331
line 622
;622:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $333
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
line 623
;623:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $323
JUMPV
LABELV $331
line 625
;624:		}
;625:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $323
JUMPV
LABELV $324
line 629
;626:	}
;627:
;628:	// check for a name match
;629:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 630
;630:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $334
line 631
;631:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $339
line 632
;632:			continue;
ADDRGP4 $335
JUMPV
LABELV $339
line 634
;633:		}
;634:		SanitizeString( cl->pers.netname, n2 );
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
line 635
;635:		if ( !strcmp( n2, s2 ) ) {
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
NEI4 $341
line 636
;636:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $323
JUMPV
LABELV $341
line 638
;637:		}
;638:	}
LABELV $335
line 630
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3480
ADDP4
ASGNP4
LABELV $337
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $334
line 640
;639:
;640:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $343
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
line 641
;641:	return -1;
CNSTI4 -1
RETI4
LABELV $323
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 652
;642:}
;643:
;644:/*
;645:==================
;646:Cmd_Give_f
;647:
;648:Give items to a client
;649:==================
;650:*/
;651:void Cmd_Give_f (gentity_t *ent)
;652:{
line 660
;653:	char		*name;
;654:	gitem_t		*it;
;655:	int			i;
;656:	qboolean	give_all;
;657:	gentity_t		*it_ent;
;658:	trace_t		trace;
;659:
;660:	if ( !CheatsOk( ent ) ) {
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
NEI4 $345
line 661
;661:		return;
ADDRGP4 $344
JUMPV
LABELV $345
line 664
;662:	}
;663:
;664:	name = ConcatArgs( 1 );
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
line 666
;665:
;666:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $347
line 667
;667:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $348
JUMPV
LABELV $347
line 669
;668:	else
;669:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $348
line 671
;670:
;671:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $353
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $350
LABELV $353
line 672
;672:	{
line 673
;673:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
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
line 674
;674:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $354
line 675
;675:			return;
ADDRGP4 $344
JUMPV
LABELV $354
line 676
;676:	}
LABELV $350
line 678
;677:
;678:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $359
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $356
LABELV $359
line 679
;679:	{
line 680
;680:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 682
;681:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;682:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $360
line 683
;683:			return;
ADDRGP4 $344
JUMPV
LABELV $360
line 684
;684:	}
LABELV $356
line 686
;685:
;686:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $365
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $362
LABELV $365
line 687
;687:	{
line 688
;688:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $366
line 689
;689:			ent->client->ps.ammo[i] = 999;
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
line 690
;690:		}
LABELV $367
line 688
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $366
line 691
;691:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $370
line 692
;692:			return;
ADDRGP4 $344
JUMPV
LABELV $370
line 693
;693:	}
LABELV $362
line 695
;694:
;695:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $375
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $372
LABELV $375
line 696
;696:	{
line 697
;697:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 699
;698:
;699:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $376
line 700
;700:			return;
ADDRGP4 $344
JUMPV
LABELV $376
line 701
;701:	}
LABELV $372
line 703
;702:
;703:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $378
line 704
;704:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 705
;705:		return;
ADDRGP4 $344
JUMPV
LABELV $378
line 707
;706:	}
;707:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $381
line 708
;708:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 709
;709:		return;
ADDRGP4 $344
JUMPV
LABELV $381
line 711
;710:	}
;711:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $384
line 712
;712:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 713
;713:		return;
ADDRGP4 $344
JUMPV
LABELV $384
line 715
;714:	}
;715:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $387
line 716
;716:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
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
line 717
;717:		return;
ADDRGP4 $344
JUMPV
LABELV $387
line 719
;718:	}
;719:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $390
line 720
;720:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
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
line 721
;721:		return;
ADDRGP4 $344
JUMPV
LABELV $390
line 725
;722:	}
;723:
;724:	// spawn a specific item right on the player
;725:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $393
line 726
;726:		it = BG_FindItem (name);
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
line 727
;727:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $395
line 728
;728:			return;
ADDRGP4 $344
JUMPV
LABELV $395
line 731
;729:		}
;730:
;731:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 732
;732:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
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
line 733
;733:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 734
;734:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 735
;735:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 736
;736:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 737
;737:		Touch_Item (it_ent, ent, &trace);
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
line 738
;738:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $397
line 739
;739:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 740
;740:		}
LABELV $397
line 741
;741:	}
LABELV $393
line 742
;742:}
LABELV $344
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 755
;743:
;744:
;745:/*
;746:==================
;747:Cmd_God_f
;748:
;749:Sets client to godmode
;750:
;751:argv(0) god
;752:==================
;753:*/
;754:void Cmd_God_f (gentity_t *ent)
;755:{
line 758
;756:	char	*msg;
;757:
;758:	if ( !CheatsOk( ent ) ) {
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
NEI4 $400
line 759
;759:		return;
ADDRGP4 $399
JUMPV
LABELV $400
line 762
;760:	}
;761:
;762:	ent->flags ^= FL_GODMODE;
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
line 763
;763:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $402
line 764
;764:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $404
ASGNP4
ADDRGP4 $403
JUMPV
LABELV $402
line 766
;765:	else
;766:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $405
ASGNP4
LABELV $403
line 768
;767:
;768:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $406
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
line 769
;769:}
LABELV $399
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 781
;770:
;771:
;772:/*
;773:==================
;774:Cmd_Notarget_f
;775:
;776:Sets client to notarget
;777:
;778:argv(0) notarget
;779:==================
;780:*/
;781:void Cmd_Notarget_f( gentity_t *ent ) {
line 784
;782:	char	*msg;
;783:
;784:	if ( !CheatsOk( ent ) ) {
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
NEI4 $408
line 785
;785:		return;
ADDRGP4 $407
JUMPV
LABELV $408
line 788
;786:	}
;787:
;788:	ent->flags ^= FL_NOTARGET;
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
line 789
;789:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $410
line 790
;790:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $412
ASGNP4
ADDRGP4 $411
JUMPV
LABELV $410
line 792
;791:	else
;792:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $413
ASGNP4
LABELV $411
line 794
;793:
;794:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $406
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
line 795
;795:}
LABELV $407
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 805
;796:
;797:
;798:/*
;799:==================
;800:Cmd_Noclip_f
;801:
;802:argv(0) noclip
;803:==================
;804:*/
;805:void Cmd_Noclip_f( gentity_t *ent ) {
line 808
;806:	char	*msg;
;807:
;808:	if ( !CheatsOk( ent ) ) {
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
NEI4 $415
line 809
;809:		return;
ADDRGP4 $414
JUMPV
LABELV $415
line 812
;810:	}
;811:
;812:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
line 813
;813:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $419
ASGNP4
line 814
;814:	} else {
ADDRGP4 $418
JUMPV
LABELV $417
line 815
;815:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $420
ASGNP4
line 816
;816:	}
LABELV $418
line 817
;817:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $422
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $423
JUMPV
LABELV $422
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $423
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 819
;818:
;819:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $406
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
line 820
;820:}
LABELV $414
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 833
;821:
;822:
;823:/*
;824:==================
;825:Cmd_LevelShot_f
;826:
;827:This is just to help generate the level pictures
;828:for the menus.  It goes to the intermission immediately
;829:and sends over a command to the client to resize the view,
;830:hide the scoreboard, and take a special screenshot
;831:==================
;832:*/
;833:void Cmd_LevelShot_f( gentity_t *ent ) {
line 834
;834:	if ( !CheatsOk( ent ) ) {
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
NEI4 $425
line 835
;835:		return;
ADDRGP4 $424
JUMPV
LABELV $425
line 839
;836:	}
;837:
;838:	// doesn't work in single player
;839:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $427
line 840
;840:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $430
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 842
;841:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;842:		return;
ADDRGP4 $424
JUMPV
LABELV $427
line 845
;843:	}
;844:
;845:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 846
;846:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $431
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 847
;847:}
LABELV $424
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 860
;848:
;849:
;850:/*
;851:==================
;852:Cmd_LevelShot_f
;853:
;854:This is just to help generate the level pictures
;855:for the menus.  It goes to the intermission immediately
;856:and sends over a command to the client to resize the view,
;857:hide the scoreboard, and take a special screenshot
;858:==================
;859:*/
;860:void Cmd_TeamTask_f( gentity_t *ent ) {
line 864
;861:	char userinfo[MAX_INFO_STRING];
;862:	char		arg[MAX_TOKEN_CHARS];
;863:	int task;
;864:	int client = ent->client - level.clients;
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
CNSTI4 3480
DIVI4
ASGNI4
line 866
;865:
;866:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $433
line 867
;867:		return;
ADDRGP4 $432
JUMPV
LABELV $433
line 869
;868:	}
;869:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 870
;870:	task = atoi( arg );
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
line 872
;871:
;872:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
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
line 873
;873:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $436
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
ADDRGP4 $435
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 874
;874:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 875
;875:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 876
;876:}
LABELV $432
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 885
;877:
;878:
;879:
;880:/*
;881:=================
;882:Cmd_Kill_f
;883:=================
;884:*/
;885:void Cmd_Kill_f( gentity_t *ent ) {
line 886
;886:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $438
line 887
;887:		return;
ADDRGP4 $437
JUMPV
LABELV $438
line 889
;888:	}
;889:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $440
line 890
;890:		return;
ADDRGP4 $437
JUMPV
LABELV $440
line 892
;891:	}
;892:	ent->flags &= ~FL_GODMODE;
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
line 893
;893:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
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
line 894
;894:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 895
;895:}
LABELV $437
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 905
;896:
;897:/*
;898:=================
;899:BroadCastTeamChange
;900:
;901:Let everyone know about a team change
;902:=================
;903:*/
;904:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;905:{
line 906
;906:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $443
line 907
;907:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $445
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
line 909
;908:			client->pers.netname) );
;909:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $444
JUMPV
LABELV $443
ADDRFP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $446
line 910
;910:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $448
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
line 912
;911:		client->pers.netname));
;912:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $447
JUMPV
LABELV $446
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $449
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $449
line 914
;913:		
;914:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $451
line 915
;915:		{
line 917
;916:		
;917:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $453
line 918
;918:			{
line 919
;919:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $456
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
line 920
;920:			}
LABELV $453
line 921
;921:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $457
line 922
;922:			{
line 923
;923:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $460
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
line 924
;924:			}
LABELV $457
line 926
;925:
;926:			if (g_GameMode.integer == 5) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 5
NEI4 $450
line 927
;927:			{
line 928
;928:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Is Frozen!.\n\"", client->pers.netname));
ADDRGP4 $464
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
line 929
;929:			}
line 930
;930:		} 
ADDRGP4 $450
JUMPV
LABELV $451
line 933
;931:
;932:		else 
;933:		{
line 934
;934:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $465
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
line 935
;935:		}
line 937
;936:
;937:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $450
JUMPV
LABELV $449
ADDRFP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $466
line 938
;938:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $468
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
line 940
;939:		client->pers.netname));
;940:	}
LABELV $466
LABELV $450
LABELV $447
LABELV $444
line 941
;941:}
LABELV $442
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 948
;942:
;943:/*
;944:=================
;945:SetTeam
;946:=================
;947:*/
;948:void SetTeam( gentity_t *ent, char *s ) {
line 959
;949:	int					team, oldTeam;
;950:	gclient_t			*client;
;951:	int					clientNum;
;952:	spectatorState_t	specState;
;953:	int					specClient;
;954:	int					teamLeader;
;955:
;956:	//
;957:	// see what change is requested
;958:	//
;959:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 961
;960:
;961:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3480
DIVI4
ASGNI4
line 962
;962:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 963
;963:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 964
;964:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $472
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $474
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $470
LABELV $474
line 965
;965:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 966
;966:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 967
;967:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $471
JUMPV
LABELV $470
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $477
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $475
line 968
;968:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 969
;969:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 970
;970:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 971
;971:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $476
JUMPV
LABELV $475
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $480
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $478
line 972
;972:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 973
;973:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 974
;974:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 975
;975:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $479
JUMPV
LABELV $478
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $485
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $484
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $481
LABELV $485
line 976
;976:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 977
;977:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 978
;978:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $482
JUMPV
LABELV $481
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $486
line 980
;979:		// if running a team game, assign player to one of the teams
;980:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 981
;981:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $493
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $489
LABELV $493
line 982
;982:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 983
;983:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $490
JUMPV
LABELV $489
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $496
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $498
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $497
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $494
LABELV $498
line 984
;984:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 985
;985:		} else {
ADDRGP4 $495
JUMPV
LABELV $494
line 987
;986:			// pick the team with the least number of players
;987:			team = PickTeam( clientNum );
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
line 988
;988:		}
LABELV $495
LABELV $490
line 990
;989:
;990:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $487
line 993
;991:			int		counts[TEAM_NUM_TEAMS];
;992:
;993:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
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
line 994
;994:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
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
line 997
;995:
;996:			// We allow a spread of two
;997:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $504
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $504
line 998
;998:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $508
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1000
;999:					"cp \"Red team has too many players.\n\"" );
;1000:				return; // ignore the request
ADDRGP4 $469
JUMPV
LABELV $504
line 1002
;1001:			}
;1002:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $487
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $487
line 1003
;1003:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $513
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1005
;1004:					"cp \"Blue team has too many players.\n\"" );
;1005:				return; // ignore the request
ADDRGP4 $469
JUMPV
line 1009
;1006:			}
;1007:
;1008:			// It's ok, the team we are switching to has less or same number of players
;1009:		}
line 1011
;1010:
;1011:	} else {
LABELV $486
line 1013
;1012:		// force them to spectators if there aren't any spots free
;1013:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1014
;1014:	}
LABELV $487
LABELV $482
LABELV $479
LABELV $476
LABELV $471
line 1017
;1015:
;1016:	// override decision if limiting the players
;1017:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $514
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $514
line 1018
;1018:		&& level.numNonSpectatorClients >= 2 ) {
line 1019
;1019:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1020
;1020:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $515
JUMPV
LABELV $514
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $518
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $518
line 1021
;1021:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 1022
;1022:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1023
;1023:	}
LABELV $518
LABELV $515
line 1028
;1024:
;1025:	//
;1026:	// decide if we will allow the change
;1027:	//
;1028:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ASGNI4
line 1029
;1029:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $523
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $523
line 1030
;1030:		return;
ADDRGP4 $469
JUMPV
LABELV $523
line 1038
;1031:	}
;1032:
;1033:	//
;1034:	// execute the team change
;1035:	//
;1036:
;1037:	// if the player was dead leave the body
;1038:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $525
line 1039
;1039:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 1040
;1040:	}
LABELV $525
line 1043
;1041:
;1042:	// he starts at 'base'
;1043:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1044
;1044:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $527
line 1046
;1045:		// Kill him (makes sure he loses flags, etc)
;1046:		ent->flags &= ~FL_GODMODE;
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
line 1047
;1047:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
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
line 1048
;1048:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 1050
;1049:
;1050:	}
LABELV $527
line 1052
;1051:	// they go to the end of the line for tournements
;1052:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $529
line 1053
;1053:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1054
;1054:	}
LABELV $529
line 1056
;1055:
;1056:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1057
;1057:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1058
;1058:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2568
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1060
;1059:
;1060:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2580
ADDP4
CNSTI4 0
ASGNI4
line 1061
;1061:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $534
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $532
LABELV $534
line 1062
;1062:		teamLeader = TeamLeader( team );
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
line 1064
;1063:		// if there is no team leader or the team leader is a bot and this client is not a bot
;1064:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $541
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
NEI4 $535
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
EQI4 $535
LABELV $541
line 1065
;1065:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1066
;1066:		}
LABELV $535
line 1067
;1067:	}
LABELV $532
line 1069
;1068:	// make sure there is a team leader on the team the player came from
;1069:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $544
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $542
LABELV $544
line 1070
;1070:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 1071
;1071:	}
LABELV $542
line 1073
;1072:
;1073:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1076
;1074:
;1075:	// get and distribute relevent paramters
;1076:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1078
;1077:
;1078:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1079
;1079:}
LABELV $469
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 1089
;1080:
;1081:/*
;1082:=================
;1083:StopFollowing
;1084:
;1085:If the client being followed leaves the game, or you just want to drop
;1086:to free floating spectator mode
;1087:=================
;1088:*/
;1089:void StopFollowing( gentity_t *ent ) {
line 1090
;1090:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1091
;1091:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
CNSTI4 3
ASGNI4
line 1092
;1092:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 1
ASGNI4
line 1093
;1093:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
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
line 1094
;1094:	ent->r.svFlags &= ~SVF_BOT;
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
line 1095
;1095:	ent->client->ps.clientNum = ent - g_entities;
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
line 1096
;1096:}
LABELV $545
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 1103
;1097:
;1098:/*
;1099:=================
;1100:Cmd_Team_f
;1101:=================
;1102:*/
;1103:void Cmd_Team_f( gentity_t *ent ) {
line 1107
;1104:	int			oldTeam;
;1105:	char		s[MAX_TOKEN_CHARS];
;1106:
;1107:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $547
line 1108
;1108:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ASGNI4
line 1109
;1109:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $546
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $546
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $559
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $559
address $555
address $553
address $551
address $557
code
LABELV $551
line 1111
;1110:		case TEAM_BLUE:
;1111:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
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
ADDRGP4 $552
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1112
;1112:			break;
ADDRGP4 $546
JUMPV
LABELV $553
line 1114
;1113:		case TEAM_RED:
;1114:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
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
ADDRGP4 $554
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1115
;1115:			break;
ADDRGP4 $546
JUMPV
LABELV $555
line 1117
;1116:		case TEAM_FREE:
;1117:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
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
ADDRGP4 $556
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1118
;1118:			break;
ADDRGP4 $546
JUMPV
LABELV $557
line 1120
;1119:		case TEAM_SPECTATOR:
;1120:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
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
ADDRGP4 $558
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1121
;1121:			break;
line 1123
;1122:		}
;1123:		return;
ADDRGP4 $546
JUMPV
LABELV $547
line 1126
;1124:	}
;1125:
;1126:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $560
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $560
line 1127
;1127:	{
line 1129
;1128:
;1129:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
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
ADDRGP4 $564
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1130
;1130:		return;
ADDRGP4 $546
JUMPV
LABELV $560
line 1134
;1131:	}
;1132:
;1133:
;1134:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $565
line 1135
;1135:	{
line 1136
;1136:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $574
ADDRLP4 1032
CNSTI4 2
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $574
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 1032
INDIRI4
NEI4 $568
LABELV $574
line 1137
;1137:		{
line 1139
;1138:		
;1139:			if (ent->client->pers.Frozen == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 1
NEI4 $575
line 1140
;1140:			{
line 1141
;1141:				trap_SendServerCommand( ent-g_entities, "cp \"You Cannot Rejoin Until You Are Thawed..\"" );
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
ADDRGP4 $577
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1142
;1142:				return;
ADDRGP4 $546
JUMPV
LABELV $575
line 1145
;1143:
;1144:			} else 
;1145:			{
line 1147
;1146:
;1147:				if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $578
line 1148
;1148:				{
line 1150
;1149:				
;1150:					if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $580
line 1151
;1151:					{
line 1152
;1152:						trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
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
ADDRGP4 $582
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1153
;1153:						return;
ADDRGP4 $546
JUMPV
LABELV $580
line 1155
;1154:					}
;1155:					if (level.firstStrike == qtrue)
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $583
line 1156
;1156:					{
line 1157
;1157:						trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
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
ADDRGP4 $586
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1158
;1158:						return;
ADDRGP4 $546
JUMPV
LABELV $583
line 1161
;1159:					}
;1160:
;1161:				}
LABELV $578
line 1162
;1162:			}
line 1163
;1163:		}
LABELV $568
line 1166
;1164:
;1165:
;1166:	}
LABELV $565
line 1173
;1167:
;1168:
;1169:	
;1170:
;1171:
;1172:	// if they are playing a tournement game, count as a loss
;1173:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $587
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $587
line 1174
;1174:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1175
;1175:		ent->client->sess.losses++;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
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
line 1176
;1176:	}
LABELV $587
line 1178
;1177:
;1178:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1180
;1179:
;1180:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1182
;1181:
;1182:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1183
;1183:}
LABELV $546
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 1191
;1184:
;1185:
;1186:/*
;1187:=================
;1188:Cmd_Follow_f
;1189:=================
;1190:*/
;1191:void Cmd_Follow_f( gentity_t *ent ) {
line 1195
;1192:	int		i;
;1193:	char	arg[MAX_TOKEN_CHARS];
;1194:
;1195:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $592
line 1196
;1196:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $591
line 1197
;1197:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1198
;1198:		}
line 1199
;1199:		return;
ADDRGP4 $591
JUMPV
LABELV $592
line 1202
;1200:	}
;1201:
;1202:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1203
;1203:	i = ClientNumberFromString( ent, arg );
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
line 1204
;1204:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $596
line 1205
;1205:		return;
ADDRGP4 $591
JUMPV
LABELV $596
line 1209
;1206:	}
;1207:
;1208:	// can't follow self
;1209:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3480
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
NEU4 $598
line 1210
;1210:		return;
ADDRGP4 $591
JUMPV
LABELV $598
line 1214
;1211:	}
;1212:
;1213:	// can't follow another spectator
;1214:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $600
line 1215
;1215:		return;
ADDRGP4 $591
JUMPV
LABELV $600
line 1219
;1216:	}
;1217:
;1218:	// if they are playing a tournement game, count as a loss
;1219:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $602
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $602
line 1220
;1220:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1221
;1221:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
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
line 1222
;1222:	}
LABELV $602
line 1225
;1223:
;1224:	// first set them to spectator
;1225:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
EQI4 $605
line 1226
;1226:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1227
;1227:	}
LABELV $605
line 1229
;1228:
;1229:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 2
ASGNI4
line 1230
;1230:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1231
;1231:}
LABELV $591
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 1238
;1232:
;1233:/*
;1234:=================
;1235:Cmd_FollowCycle_f
;1236:=================
;1237:*/
;1238:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 1243
;1239:	int		clientnum;
;1240:	int		original;
;1241:
;1242:	// if they are playing a tournement game, count as a loss
;1243:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $608
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $608
line 1244
;1244:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1245
;1245:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
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
line 1246
;1246:	}
LABELV $608
line 1248
;1247:	// first set them to spectator
;1248:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $611
line 1249
;1249:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1250
;1250:	}
LABELV $611
line 1252
;1251:
;1252:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $613
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $613
line 1253
;1253:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $615
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1254
;1254:	}
LABELV $613
line 1256
;1255:
;1256:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ASGNI4
line 1257
;1257:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $616
line 1258
;1258:	do {
line 1259
;1259:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1260
;1260:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $619
line 1261
;1261:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1262
;1262:		}
LABELV $619
line 1263
;1263:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $622
line 1264
;1264:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1265
;1265:		}
LABELV $622
line 1268
;1266:
;1267:		// can only follow connected clients
;1268:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3480
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
EQI4 $625
line 1269
;1269:			continue;
ADDRGP4 $617
JUMPV
LABELV $625
line 1273
;1270:		}
;1271:
;1272:		// can't follow another spectator
;1273:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $627
line 1274
;1274:			continue;
ADDRGP4 $617
JUMPV
LABELV $627
line 1278
;1275:		}
;1276:
;1277:		// this is good, we can use it
;1278:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1279
;1279:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 2
ASGNI4
line 1280
;1280:		return;
ADDRGP4 $607
JUMPV
LABELV $617
line 1281
;1281:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $616
line 1284
;1282:
;1283:	// leave it where it was
;1284:}
LABELV $607
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1295
;1285:
;1286:
;1287:/*
;1288:==================
;1289:G_Say
;1290:==================
;1291:*/
;1292:
;1293:
;1294:
;1295:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1296
;1296:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $630
line 1297
;1297:		return;
ADDRGP4 $629
JUMPV
LABELV $630
line 1299
;1298:	}
;1299:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $632
line 1300
;1300:		return;
ADDRGP4 $629
JUMPV
LABELV $632
line 1302
;1301:	}
;1302:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $634
line 1303
;1303:		return;
ADDRGP4 $629
JUMPV
LABELV $634
line 1305
;1304:	}
;1305:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $636
line 1306
;1306:		return;
ADDRGP4 $629
JUMPV
LABELV $636
line 1308
;1307:	}
;1308:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $638
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
NEI4 $638
line 1309
;1309:		return;
ADDRGP4 $629
JUMPV
LABELV $638
line 1312
;1310:	}
;1311:	// no chatting to players in tournements
;1312:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $640
ADDRLP4 4
CNSTI4 524
ASGNI4
ADDRLP4 8
CNSTI4 2556
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
NEI4 $640
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
EQI4 $640
line 1314
;1313:		&& other->client->sess.sessionTeam == TEAM_FREE
;1314:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1315
;1315:		return;
ADDRGP4 $629
JUMPV
LABELV $640
line 1318
;1316:	}
;1317:
;1318:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $643
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $647
ADDRLP4 16
ADDRGP4 $644
ASGNP4
ADDRGP4 $648
JUMPV
LABELV $647
ADDRLP4 16
ADDRGP4 $645
ASGNP4
LABELV $648
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
line 1321
;1319:		mode == SAY_TEAM ? "tchat" : "chat",
;1320:		name, Q_COLOR_ESCAPE, color, message));
;1321:}
LABELV $629
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1325
;1322:
;1323:#define EC		"\x19"
;1324:
;1325:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1334
;1326:	int			j;
;1327:	gentity_t	*other;
;1328:	int			color;
;1329:	char		name[64];
;1330:	// don't let text be too long for malicious reasons
;1331:	char		text[MAX_SAY_TEXT];
;1332:	char		location[64];
;1333:
;1334:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $650
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $650
line 1335
;1335:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1336
;1336:	}
LABELV $650
line 1338
;1337:
;1338:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LTI4 $653
ADDRLP4 292
INDIRI4
CNSTI4 3
GTI4 $653
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $673
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $673
address $655
address $658
address $664
address $670
code
LABELV $653
LABELV $655
line 1341
;1339:	default:
;1340:	case SAY_ALL:
;1341:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $656
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
line 1342
;1342:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $657
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
line 1343
;1343:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1344
;1344:		break;
ADDRGP4 $654
JUMPV
LABELV $658
line 1346
;1345:	case SAY_TEAM:
;1346:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $659
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
line 1347
;1347:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
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
EQI4 $660
line 1348
;1348:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $662
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
ADDRGP4 $661
JUMPV
LABELV $660
line 1351
;1349:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1350:		else
;1351:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $663
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
LABELV $661
line 1353
;1352:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1353:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1354
;1354:		break;
ADDRGP4 $654
JUMPV
LABELV $664
line 1356
;1355:	case SAY_TELL:
;1356:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $665
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $665
ADDRLP4 304
CNSTI4 524
ASGNI4
ADDRLP4 308
CNSTI4 2556
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
NEI4 $665
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
EQI4 $665
line 1359
;1357:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1358:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1359:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $668
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
ADDRGP4 $666
JUMPV
LABELV $665
line 1361
;1360:		else
;1361:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $669
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
LABELV $666
line 1362
;1362:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1363
;1363:		break;
ADDRGP4 $654
JUMPV
LABELV $670
line 1365
;1364:	case SAY_INVAL:
;1365:		G_LogPrintf( "Invalid During Intermission: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $671
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
line 1366
;1366:		Com_sprintf (name, sizeof(name), "[Invalid During Intermission%c%c]: ", Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $672
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1367
;1367:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1368
;1368:		target = ent;
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1369
;1369:		break;
LABELV $654
line 1372
;1370:	}
;1371:
;1372:	Q_strncpyz( text, chatText, sizeof(text) );
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
line 1374
;1373:
;1374:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $674
line 1375
;1375:		G_SayTo( ent, target, mode, color, name, text );
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
line 1376
;1376:		return;
ADDRGP4 $649
JUMPV
LABELV $674
line 1380
;1377:	}
;1378:
;1379:	// echo the text to the console
;1380:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $676
line 1381
;1381:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $679
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1382
;1382:	}
LABELV $676
line 1385
;1383:
;1384:	// send it to all the apropriate clients
;1385:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $683
JUMPV
LABELV $680
line 1386
;1386:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1387
;1387:		G_SayTo( ent, other, mode, color, name, text );
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
line 1388
;1388:	}
LABELV $681
line 1385
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $683
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $680
line 1389
;1389:}
LABELV $649
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1397
;1390:
;1391:
;1392:/*
;1393:==================
;1394:Cmd_Say_f
;1395:==================
;1396:*/
;1397:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1400
;1398:	char		*p;
;1399:
;1400:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $686
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $686
line 1401
;1401:		return;
ADDRGP4 $685
JUMPV
LABELV $686
line 1404
;1402:	}
;1403:
;1404:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $688
line 1405
;1405:	{
line 1406
;1406:		p = ConcatArgs( 0 );
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
line 1407
;1407:	}
ADDRGP4 $689
JUMPV
LABELV $688
line 1409
;1408:	else
;1409:	{
line 1410
;1410:		p = ConcatArgs( 1 );
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
line 1411
;1411:	}
LABELV $689
line 1413
;1412:
;1413:	G_Say( ent, NULL, mode, p );
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
line 1414
;1414:}
LABELV $685
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1421
;1415:
;1416:/*
;1417:==================
;1418:Cmd_Tell_f
;1419:==================
;1420:*/
;1421:static void Cmd_Tell_f( gentity_t *ent ) {
line 1427
;1422:	int			targetNum;
;1423:	gentity_t	*target;
;1424:	char		*p;
;1425:	char		arg[MAX_TOKEN_CHARS];
;1426:
;1427:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $691
line 1428
;1428:		return;
ADDRGP4 $690
JUMPV
LABELV $691
line 1431
;1429:	}
;1430:
;1431:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1432
;1432:	targetNum = atoi( arg );
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
line 1433
;1433:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $696
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $693
LABELV $696
line 1434
;1434:		return;
ADDRGP4 $690
JUMPV
LABELV $693
line 1437
;1435:	}
;1436:
;1437:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1438
;1438:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $700
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $700
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $697
LABELV $700
line 1439
;1439:		return;
ADDRGP4 $690
JUMPV
LABELV $697
line 1442
;1440:	}
;1441:
;1442:	p = ConcatArgs( 2 );
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
line 1444
;1443:
;1444:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $701
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
line 1445
;1445:	G_Say( ent, target, SAY_TELL, p );
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
line 1448
;1446:	// don't tell to the player self if it was already directed to this player
;1447:	// also don't send the chat back to a bot
;1448:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $702
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $702
line 1449
;1449:		G_Say( ent, ent, SAY_TELL, p );
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
line 1450
;1450:	}
LABELV $702
line 1451
;1451:}
LABELV $690
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1454
;1452:
;1453:
;1454:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1458
;1455:	int color;
;1456:	char *cmd;
;1457:
;1458:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $705
line 1459
;1459:		return;
ADDRGP4 $704
JUMPV
LABELV $705
line 1461
;1460:	}
;1461:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $707
line 1462
;1462:		return;
ADDRGP4 $704
JUMPV
LABELV $707
line 1464
;1463:	}
;1464:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $709
line 1465
;1465:		return;
ADDRGP4 $704
JUMPV
LABELV $709
line 1467
;1466:	}
;1467:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $711
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
NEI4 $711
line 1468
;1468:		return;
ADDRGP4 $704
JUMPV
LABELV $711
line 1471
;1469:	}
;1470:	// no chatting to players in tournements
;1471:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $713
line 1472
;1472:		return;
ADDRGP4 $704
JUMPV
LABELV $713
line 1475
;1473:	}
;1474:
;1475:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $716
line 1476
;1476:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1477
;1477:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $718
ASGNP4
line 1478
;1478:	}
ADDRGP4 $717
JUMPV
LABELV $716
line 1479
;1479:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $719
line 1480
;1480:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1481
;1481:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $721
ASGNP4
line 1482
;1482:	}
ADDRGP4 $720
JUMPV
LABELV $719
line 1483
;1483:	else {
line 1484
;1484:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1485
;1485:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $722
ASGNP4
line 1486
;1486:	}
LABELV $720
LABELV $717
line 1488
;1487:
;1488:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $723
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
line 1489
;1489:}
LABELV $704
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1491
;1490:
;1491:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1495
;1492:	int			j;
;1493:	gentity_t	*other;
;1494:
;1495:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $725
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $725
line 1496
;1496:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1497
;1497:	}
LABELV $725
line 1499
;1498:
;1499:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $728
line 1500
;1500:		G_VoiceTo( ent, target, mode, id, voiceonly );
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
line 1501
;1501:		return;
ADDRGP4 $724
JUMPV
LABELV $728
line 1505
;1502:	}
;1503:
;1504:	// echo the text to the console
;1505:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $730
line 1506
;1506:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $733
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
line 1507
;1507:	}
LABELV $730
line 1510
;1508:
;1509:	// send it to all the apropriate clients
;1510:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $737
JUMPV
LABELV $734
line 1511
;1511:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1512
;1512:		G_VoiceTo( ent, other, mode, id, voiceonly );
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
line 1513
;1513:	}
LABELV $735
line 1510
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $737
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $734
line 1514
;1514:}
LABELV $724
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1521
;1515:
;1516:/*
;1517:==================
;1518:Cmd_Voice_f
;1519:==================
;1520:*/
;1521:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1524
;1522:	char		*p;
;1523:
;1524:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $740
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $740
line 1525
;1525:		return;
ADDRGP4 $739
JUMPV
LABELV $740
line 1528
;1526:	}
;1527:
;1528:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $742
line 1529
;1529:	{
line 1530
;1530:		p = ConcatArgs( 0 );
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
line 1531
;1531:	}
ADDRGP4 $743
JUMPV
LABELV $742
line 1533
;1532:	else
;1533:	{
line 1534
;1534:		p = ConcatArgs( 1 );
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
line 1535
;1535:	}
LABELV $743
line 1537
;1536:
;1537:	G_Voice( ent, NULL, mode, p, voiceonly );
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
line 1538
;1538:}
LABELV $739
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1545
;1539:
;1540:/*
;1541:==================
;1542:Cmd_VoiceTell_f
;1543:==================
;1544:*/
;1545:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1551
;1546:	int			targetNum;
;1547:	gentity_t	*target;
;1548:	char		*id;
;1549:	char		arg[MAX_TOKEN_CHARS];
;1550:
;1551:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $745
line 1552
;1552:		return;
ADDRGP4 $744
JUMPV
LABELV $745
line 1555
;1553:	}
;1554:
;1555:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1556
;1556:	targetNum = atoi( arg );
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
line 1557
;1557:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $750
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $747
LABELV $750
line 1558
;1558:		return;
ADDRGP4 $744
JUMPV
LABELV $747
line 1561
;1559:	}
;1560:
;1561:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1562
;1562:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $754
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $754
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $751
LABELV $754
line 1563
;1563:		return;
ADDRGP4 $744
JUMPV
LABELV $751
line 1566
;1564:	}
;1565:
;1566:	id = ConcatArgs( 2 );
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
line 1568
;1567:
;1568:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $755
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
line 1569
;1569:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
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
line 1572
;1570:	// don't tell to the player self if it was already directed to this player
;1571:	// also don't send the chat back to a bot
;1572:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $756
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $756
line 1573
;1573:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
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
line 1574
;1574:	}
LABELV $756
line 1575
;1575:}
LABELV $744
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1583
;1576:
;1577:
;1578:/*
;1579:==================
;1580:Cmd_VoiceTaunt_f
;1581:==================
;1582:*/
;1583:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1587
;1584:	gentity_t *who;
;1585:	int i;
;1586:
;1587:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $759
line 1588
;1588:		return;
ADDRGP4 $758
JUMPV
LABELV $759
line 1592
;1589:	}
;1590:
;1591:	// insult someone who just killed you
;1592:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
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
EQU4 $761
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
EQU4 $761
ADDRLP4 20
INDIRP4
CNSTI4 2656
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $761
line 1594
;1593:		// i am a dead corpse
;1594:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
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
NEI4 $763
line 1595
;1595:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $765
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1596
;1596:		}
LABELV $763
line 1597
;1597:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $766
line 1598
;1598:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $765
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1599
;1599:		}
LABELV $766
line 1600
;1600:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 1601
;1601:		return;
ADDRGP4 $758
JUMPV
LABELV $761
line 1604
;1602:	}
;1603:	// insult someone you just killed
;1604:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
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
CNSTI4 2656
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $768
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $768
line 1605
;1605:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1606
;1606:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $770
line 1608
;1607:			// who is the person I just killed
;1608:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
CNSTI4 2
NEI4 $772
line 1609
;1609:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $774
line 1610
;1610:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $776
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1611
;1611:				}
LABELV $774
line 1612
;1612:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $773
line 1613
;1613:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
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
ADDRGP4 $776
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1614
;1614:				}
line 1615
;1615:			} else {
ADDRGP4 $773
JUMPV
LABELV $772
line 1616
;1616:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $779
line 1617
;1617:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $781
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1618
;1618:				}
LABELV $779
line 1619
;1619:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $782
line 1620
;1620:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
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
ADDRGP4 $781
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1621
;1621:				}
LABELV $782
line 1622
;1622:			}
LABELV $773
line 1623
;1623:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
ADDP4
CNSTI4 -1
ASGNI4
line 1624
;1624:			return;
ADDRGP4 $758
JUMPV
LABELV $770
line 1626
;1625:		}
;1626:	}
LABELV $768
line 1628
;1627:
;1628:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $784
line 1630
;1629:		// praise a team mate who just got a reward
;1630:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $787
line 1631
;1631:			who = g_entities + i;
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1632
;1632:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
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
EQU4 $791
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
EQU4 $791
ADDRLP4 48
CNSTI4 2556
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
NEI4 $791
line 1633
;1633:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $793
line 1634
;1634:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $796
line 1635
;1635:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $798
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1636
;1636:					}
LABELV $796
line 1637
;1637:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $758
line 1638
;1638:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
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
ADDRGP4 $798
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1639
;1639:					}
line 1640
;1640:					return;
ADDRGP4 $758
JUMPV
LABELV $793
line 1642
;1641:				}
;1642:			}
LABELV $791
line 1643
;1643:		}
LABELV $788
line 1630
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $787
line 1644
;1644:	}
LABELV $784
line 1647
;1645:
;1646:	// just say something
;1647:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
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
ADDRGP4 $801
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1648
;1648:}
LABELV $758
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $802
address $803
address $804
address $805
address $806
address $807
address $808
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1662
;1649:
;1650:
;1651:
;1652:static char	*gc_orders[] = {
;1653:	"hold your position",
;1654:	"hold this position",
;1655:	"come here",
;1656:	"cover me",
;1657:	"guard location",
;1658:	"search and destroy",
;1659:	"report"
;1660:};
;1661:
;1662:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1667
;1663:	int		player;
;1664:	int		order;
;1665:	char	str[MAX_TOKEN_CHARS];
;1666:
;1667:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1668
;1668:	player = atoi( str );
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
line 1669
;1669:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1670
;1670:	order = atoi( str );
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
line 1672
;1671:
;1672:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $812
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $810
LABELV $812
line 1673
;1673:		return;
ADDRGP4 $809
JUMPV
LABELV $810
line 1675
;1674:	}
;1675:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $815
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $813
LABELV $815
line 1676
;1676:		return;
ADDRGP4 $809
JUMPV
LABELV $813
line 1678
;1677:	}
;1678:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
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
line 1679
;1679:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
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
line 1680
;1680:}
LABELV $809
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1687
;1681:
;1682:/*
;1683:==================
;1684:Cmd_Where_f
;1685:==================
;1686:*/
;1687:void Cmd_Where_f( gentity_t *ent ) {
line 1688
;1688:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $817
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
line 1689
;1689:}
LABELV $816
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $818
address $819
address $820
address $821
address $822
address $823
address $824
address $825
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3136 24
line 1707
;1690:
;1691:static const char *gameNames[] = {
;1692:	"Free For All",
;1693:	"Tournament",
;1694:	"Single Player",
;1695:	"Team Deathmatch",
;1696:	"Capture the Flag",
;1697:	"One Flag CTF",
;1698:	"Overload",
;1699:	"Harvester"
;1700:};
;1701:
;1702:/*
;1703:==================
;1704:Cmd_CallVote_f
;1705:==================
;1706:*/
;1707:void Cmd_CallVote_f( gentity_t *ent ) {
line 1712
;1708:	int		i;
;1709:	char	arg1[MAX_STRING_TOKENS];
;1710:	char	arg2[MAX_STRING_TOKENS];
;1711:
;1712:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $827
line 1713
;1713:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $830
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1714
;1714:		return;
ADDRGP4 $826
JUMPV
LABELV $827
line 1717
;1715:	}
;1716:
;1717:	if ( level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
EQI4 $831
line 1718
;1718:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
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
ADDRGP4 $834
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1719
;1719:		return;
ADDRGP4 $826
JUMPV
LABELV $831
line 1721
;1720:	}
;1721:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $835
line 1722
;1722:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
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
ADDRGP4 $837
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1723
;1723:		return;
ADDRGP4 $826
JUMPV
LABELV $835
line 1725
;1724:	}
;1725:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $838
line 1726
;1726:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
line 1727
;1727:		return;
ADDRGP4 $826
JUMPV
LABELV $838
line 1731
;1728:	}
;1729:
;1730:	// make sure it is a valid command to vote on
;1731:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1732
;1732:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1734
;1733:
;1734:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $843
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
EQU4 $841
LABELV $843
line 1735
;1735:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $844
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1736
;1736:		return;
ADDRGP4 $826
JUMPV
LABELV $841
line 1739
;1737:	}
;1738:
;1739:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $847
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $845
line 1740
;1740:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $846
JUMPV
LABELV $845
ADDRLP4 4
ARGP4
ADDRGP4 $850
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $848
line 1741
;1741:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $849
JUMPV
LABELV $848
ADDRLP4 4
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $851
line 1742
;1742:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $852
JUMPV
LABELV $851
ADDRLP4 4
ARGP4
ADDRGP4 $856
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $854
line 1743
;1743:	} else if ( !Q_stricmp( arg1, "balanceteams" ) ) {
ADDRGP4 $855
JUMPV
LABELV $854
ADDRLP4 4
ARGP4
ADDRGP4 $859
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $857
line 1744
;1744:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $858
JUMPV
LABELV $857
ADDRLP4 4
ARGP4
ADDRGP4 $862
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $860
line 1745
;1745:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $861
JUMPV
LABELV $860
ADDRLP4 4
ARGP4
ADDRGP4 $865
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $863
line 1746
;1746:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $864
JUMPV
LABELV $863
ADDRLP4 4
ARGP4
ADDRGP4 $868
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $866
line 1747
;1747:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $867
JUMPV
LABELV $866
ADDRLP4 4
ARGP4
ADDRGP4 $871
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $869
line 1748
;1748:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $870
JUMPV
LABELV $869
ADDRLP4 4
ARGP4
ADDRGP4 $874
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $872
line 1749
;1749:	} else {
ADDRGP4 $873
JUMPV
LABELV $872
line 1750
;1750:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $844
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1751
;1751:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
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
ADDRGP4 $875
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1752
;1752:		return;
ADDRGP4 $826
JUMPV
LABELV $873
LABELV $870
LABELV $867
LABELV $864
LABELV $861
LABELV $858
LABELV $855
LABELV $852
LABELV $849
LABELV $846
line 1756
;1753:	}
;1754:
;1755:	// if there is still a vote to be executed
;1756:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2420
INDIRI4
CNSTI4 0
EQI4 $876
line 1757
;1757:		level.voteExecuteTime = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1758
;1758:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $880
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
line 1759
;1759:	}
LABELV $876
line 1762
;1760:
;1761:	// special case for g_gametype, check for bad values
;1762:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $856
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $882
line 1763
;1763:		i = atoi( arg2 );
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
line 1764
;1764:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $887
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $887
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $884
LABELV $887
line 1765
;1765:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
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
ADDRGP4 $888
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1766
;1766:			return;
ADDRGP4 $826
JUMPV
LABELV $884
line 1769
;1767:		}
;1768:
;1769:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $891
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1770
;1770:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $894
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
line 1771
;1771:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $883
JUMPV
LABELV $882
ADDRLP4 4
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $895
line 1776
;1772:		// special case for map changes, we want to reset the nextmap setting
;1773:		// this allows a player to change maps, but not upset the map rotation
;1774:		char	s[MAX_STRING_CHARS];
;1775:
;1776:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $850
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1777
;1777:		if (*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $897
line 1778
;1778:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $901
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
line 1779
;1779:		} else {
ADDRGP4 $898
JUMPV
LABELV $897
line 1780
;1780:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $894
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1781
;1781:		}
LABELV $898
line 1782
;1782:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $906
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1783
;1783:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $896
JUMPV
LABELV $895
ADDRLP4 4
ARGP4
ADDRGP4 $850
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $908
line 1786
;1784:		char	s[MAX_STRING_CHARS];
;1785:
;1786:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $850
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1787
;1787:		if (!*s) {
ADDRLP4 2112
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $910
line 1788
;1788:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
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
line 1789
;1789:			return;
ADDRGP4 $826
JUMPV
LABELV $910
line 1791
;1790:		}
;1791:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $915
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1792
;1792:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $906
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1793
;1793:	} else {
ADDRGP4 $909
JUMPV
LABELV $908
line 1794
;1794:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $921
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1795
;1795:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $906
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1796
;1796:	}
LABELV $909
LABELV $896
LABELV $883
line 1798
;1797:
;1798:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $925
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
line 1801
;1799:
;1800:	// start the voting, the caller autoamtically votes yes
;1801:	level.voteTime = level.time;
ADDRGP4 level+2416
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1802
;1802:	level.voteYes = 1;
ADDRGP4 level+2424
CNSTI4 1
ASGNI4
line 1803
;1803:	level.voteNo = 0;
ADDRGP4 level+2428
CNSTI4 0
ASGNI4
line 1805
;1804:
;1805:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $933
JUMPV
LABELV $930
line 1806
;1806:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 3480
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
line 1807
;1807:	}
LABELV $931
line 1805
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $933
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $930
line 1808
;1808:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1810
;1809:
;1810:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $935
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
line 1811
;1811:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1392
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1812
;1812:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $935
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
line 1813
;1813:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $935
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
line 1814
;1814:}
LABELV $826
endproc Cmd_CallVote_f 3136 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1821
;1815:
;1816:/*
;1817:==================
;1818:Cmd_Vote_f
;1819:==================
;1820:*/
;1821:void Cmd_Vote_f( gentity_t *ent ) {
line 1824
;1822:	char		msg[64];
;1823:
;1824:	if ( !level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
NEI4 $941
line 1825
;1825:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
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
ADDRGP4 $944
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1826
;1826:		return;
ADDRGP4 $940
JUMPV
LABELV $941
line 1828
;1827:	}
;1828:	if ( ent->client->ps.eFlags & EF_VOTED ) {
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
EQI4 $945
line 1829
;1829:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
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
ADDRGP4 $947
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1830
;1830:		return;
ADDRGP4 $940
JUMPV
LABELV $945
line 1832
;1831:	}
;1832:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $948
line 1833
;1833:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $950
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1834
;1834:		return;
ADDRGP4 $940
JUMPV
LABELV $948
line 1837
;1835:	}
;1836:
;1837:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
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
ADDRGP4 $951
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1839
;1838:
;1839:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1841
;1840:
;1841:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1843
;1842:
;1843:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $957
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $957
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $952
LABELV $957
line 1844
;1844:		level.voteYes++;
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
line 1845
;1845:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $935
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
line 1846
;1846:	} else {
ADDRGP4 $953
JUMPV
LABELV $952
line 1847
;1847:		level.voteNo++;
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
line 1848
;1848:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $935
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
line 1849
;1849:	}
LABELV $953
line 1853
;1850:
;1851:	// a majority will be determined in CheckVote, which will also account
;1852:	// for players entering or leaving
;1853:}
LABELV $940
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1860
;1854:
;1855:/*
;1856:==================
;1857:Cmd_CallTeamVote_f
;1858:==================
;1859:*/
;1860:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1865
;1861:	int		i, team, cs_offset;
;1862:	char	arg1[MAX_STRING_TOKENS];
;1863:	char	arg2[MAX_STRING_TOKENS];
;1864:
;1865:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ASGNI4
line 1866
;1866:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $963
line 1867
;1867:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $964
JUMPV
LABELV $963
line 1868
;1868:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $962
line 1869
;1869:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1871
;1870:	else
;1871:		return;
LABELV $966
LABELV $964
line 1873
;1872:
;1873:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $967
line 1874
;1874:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $830
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1875
;1875:		return;
ADDRGP4 $962
JUMPV
LABELV $967
line 1878
;1876:	}
;1877:
;1878:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $970
line 1879
;1879:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
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
ADDRGP4 $973
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1880
;1880:		return;
ADDRGP4 $962
JUMPV
LABELV $970
line 1882
;1881:	}
;1882:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $974
line 1883
;1883:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
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
ADDRGP4 $976
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1884
;1884:		return;
ADDRGP4 $962
JUMPV
LABELV $974
line 1886
;1885:	}
;1886:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $977
line 1887
;1887:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
line 1888
;1888:		return;
ADDRGP4 $962
JUMPV
LABELV $977
line 1892
;1889:	}
;1890:
;1891:	// make sure it is a valid command to vote on
;1892:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1893
;1893:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1894
;1894:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $982
JUMPV
LABELV $979
line 1895
;1895:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $983
line 1896
;1896:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $985
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $983
line 1897
;1897:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
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
line 1898
;1898:	}
LABELV $980
line 1894
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $982
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $979
line 1900
;1899:
;1900:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $988
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
EQU4 $986
LABELV $988
line 1901
;1901:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $844
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1902
;1902:		return;
ADDRGP4 $962
JUMPV
LABELV $986
line 1905
;1903:	}
;1904:
;1905:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $991
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $989
line 1908
;1906:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1907:
;1908:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $992
line 1909
;1909:			i = ent->client->ps.clientNum;
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
line 1910
;1910:		}
ADDRGP4 $993
JUMPV
LABELV $992
line 1911
;1911:		else {
line 1913
;1912:			// numeric values are just slot numbers
;1913:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $994
line 1914
;1914:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
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
EQI4 $1001
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $1001
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $998
LABELV $1001
line 1915
;1915:					break;
ADDRGP4 $996
JUMPV
LABELV $998
line 1916
;1916:			}
LABELV $995
line 1913
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $994
LABELV $996
line 1917
;1917:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $1004
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1002
LABELV $1004
line 1918
;1918:				i = atoi( arg2 );
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
line 1919
;1919:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1008
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1005
LABELV $1008
line 1920
;1920:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $330
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
line 1921
;1921:					return;
ADDRGP4 $962
JUMPV
LABELV $1005
line 1924
;1922:				}
;1923:
;1924:				if ( !g_entities[i].inuse ) {
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1003
line 1925
;1925:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $333
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
line 1926
;1926:					return;
ADDRGP4 $962
JUMPV
line 1928
;1927:				}
;1928:			}
LABELV $1002
line 1929
;1929:			else {
line 1930
;1930:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1931
;1931:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1932
;1932:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1015
JUMPV
LABELV $1012
line 1933
;1933:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3480
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
NEI4 $1017
line 1934
;1934:						continue;
ADDRGP4 $1013
JUMPV
LABELV $1017
line 1935
;1935:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $1019
line 1936
;1936:						continue;
ADDRGP4 $1013
JUMPV
LABELV $1019
line 1937
;1937:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3480
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
line 1938
;1938:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1939
;1939:					if ( !Q_stricmp(netname, leader) ) {
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
NEI4 $1021
line 1940
;1940:						break;
ADDRGP4 $1014
JUMPV
LABELV $1021
line 1942
;1941:					}
;1942:				}
LABELV $1013
line 1932
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1015
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1012
LABELV $1014
line 1943
;1943:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1023
line 1944
;1944:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $1026
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
line 1945
;1945:					return;
ADDRGP4 $962
JUMPV
LABELV $1023
line 1947
;1946:				}
;1947:			}
LABELV $1003
line 1948
;1948:		}
LABELV $993
line 1949
;1949:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $436
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1950
;1950:	} else {
ADDRGP4 $990
JUMPV
LABELV $989
line 1951
;1951:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $844
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1952
;1952:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $1027
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1953
;1953:		return;
ADDRGP4 $962
JUMPV
LABELV $990
line 1956
;1954:	}
;1955:
;1956:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $894
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1958
;1957:
;1958:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1033
JUMPV
LABELV $1030
line 1959
;1959:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3480
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
NEI4 $1035
line 1960
;1960:			continue;
ADDRGP4 $1031
JUMPV
LABELV $1035
line 1961
;1961:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1037
line 1962
;1962:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $1039
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
LABELV $1037
line 1963
;1963:	}
LABELV $1031
line 1958
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1033
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1030
line 1966
;1964:
;1965:	// start the voting, the caller autoamtically votes yes
;1966:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1967
;1967:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 1
ASGNI4
line 1968
;1968:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 1970
;1969:
;1970:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1047
JUMPV
LABELV $1044
line 1971
;1971:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1049
line 1972
;1972:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3480
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
LABELV $1049
line 1973
;1973:	}
LABELV $1045
line 1970
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1047
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1044
line 1974
;1974:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1976
;1975:
;1976:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $935
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
line 1977
;1977:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
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
line 1978
;1978:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $935
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
line 1979
;1979:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $935
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
line 1980
;1980:}
LABELV $962
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_ListPlayers_f
proc Cmd_ListPlayers_f 2108 16
line 1991
;1981:
;1982:
;1983:
;1984:/*
;1985:======================================
;1986:  ListPlayers
;1987:
;1988:  Please clean this up
;1989:======================================
;1990:*/
;1991:void Cmd_ListPlayers_f ( gentity_t *ent ) {
line 2004
;1992:
;1993:int		i;
;1994:int		j;
;1995:int		l;
;1996:int		h;
;1997:int		clientNum;
;1998:int		ping;
;1999:int		score;
;2000:char	userinfo[MAX_INFO_STRING];
;2001:char	*value;
;2002:char		n2[MAX_STRING_CHARS];
;2003:		
;2004:		trap_SendServerCommand( ent-g_entities, va("print \"CLIENT LIST\""));
ADDRGP4 $1056
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
line 2005
;2005:		trap_SendServerCommand( ent-g_entities, va("print \"Client  -  Name                   - Ping   -  Score - GUID\""));
ADDRGP4 $1057
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
line 2006
;2006:		trap_SendServerCommand( ent-g_entities, va("print \"---------------------------------------------------------------------------------------\""));
ADDRGP4 $1058
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
line 2008
;2007:
;2008:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1062
JUMPV
LABELV $1059
line 2010
;2009:	
;2010:			if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3480
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
NEI4 $1064
line 2011
;2011:				continue;
ADDRGP4 $1060
JUMPV
LABELV $1064
line 2014
;2012:			}
;2013:				
;2014:			clientNum = level.clients[i].ps.clientNum;
ADDRLP4 12
CNSTI4 3480
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
line 2016
;2015:			
;2016:			ping = level.clients[i].ps.ping;
ADDRLP4 2068
CNSTI4 3480
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
line 2017
;2017:			score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 2072
CNSTI4 3480
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
line 2019
;2018:			
;2019:			trap_SendServerCommand( ent-g_entities, va("print \"%i  - %s\"", clientNum, level.clients[i].pers.netname ));
ADDRGP4 $1066
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3480
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
line 2021
;2020:			
;2021:			SanitizeString( level.clients[i].pers.netname, n2 );
CNSTI4 3480
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
line 2022
;2022:			Q_CleanStr(n2);
ADDRLP4 1040
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2023
;2023:			l = strlen(n2);
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
line 2024
;2024:			h = 20 - l;
ADDRLP4 4
CNSTI4 20
ADDRLP4 2064
INDIRI4
SUBI4
ASGNI4
line 2025
;2025:				for ( j = 0 ; j < h ; j++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1070
JUMPV
LABELV $1067
line 2026
;2026:					G_Printf(" ");
ADDRGP4 $985
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2027
;2027:				}
LABELV $1068
line 2025
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1070
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1067
line 2028
;2028:			trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 2029
;2029:			value = Info_ValueForKey (userinfo, "cl_guid");
ADDRLP4 16
ARGP4
ADDRGP4 $1071
ARGP4
ADDRLP4 2100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2076
ADDRLP4 2100
INDIRP4
ASGNP4
line 2030
;2030:			trap_SendServerCommand( ent-g_entities, va("print \"  -  %i  -  %i  -  %s\n\"", ping, score, value ));
ADDRGP4 $1072
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
line 2032
;2031:		
;2032:		}
LABELV $1060
line 2008
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1062
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1059
line 2034
;2033:
;2034:}
LABELV $1055
endproc Cmd_ListPlayers_f 2108 16
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 2041
;2035:
;2036:/*
;2037:==================
;2038:Cmd_TeamVote_f
;2039:==================
;2040:*/
;2041:void Cmd_TeamVote_f( gentity_t *ent ) {
line 2045
;2042:	int			team, cs_offset;
;2043:	char		msg[64];
;2044:
;2045:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ASGNI4
line 2046
;2046:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1074
line 2047
;2047:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1075
JUMPV
LABELV $1074
line 2048
;2048:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $1073
line 2049
;2049:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 2051
;2050:	else
;2051:		return;
LABELV $1077
LABELV $1075
line 2053
;2052:
;2053:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1078
line 2054
;2054:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
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
ADDRGP4 $1081
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2055
;2055:		return;
ADDRGP4 $1073
JUMPV
LABELV $1078
line 2057
;2056:	}
;2057:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
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
EQI4 $1082
line 2058
;2058:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
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
ADDRGP4 $1084
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2059
;2059:		return;
ADDRGP4 $1073
JUMPV
LABELV $1082
line 2061
;2060:	}
;2061:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1085
line 2062
;2062:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $950
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2063
;2063:		return;
ADDRGP4 $1073
JUMPV
LABELV $1085
line 2066
;2064:	}
;2065:
;2066:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
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
ADDRGP4 $1087
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2068
;2067:
;2068:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 2070
;2069:
;2070:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2072
;2071:
;2072:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1093
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1093
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1088
LABELV $1093
line 2073
;2073:		level.teamVoteYes[cs_offset]++;
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
line 2074
;2074:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $935
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
line 2075
;2075:	} else {
ADDRGP4 $1089
JUMPV
LABELV $1088
line 2076
;2076:		level.teamVoteNo[cs_offset]++;
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
line 2077
;2077:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $935
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
line 2078
;2078:	}
LABELV $1089
line 2082
;2079:
;2080:	// a majority will be determined in TeamCheckVote, which will also account
;2081:	// for players entering or leaving
;2082:}
LABELV $1073
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2090
;2083:
;2084:
;2085:/*
;2086:=================
;2087:Cmd_SetViewpos_f
;2088:=================
;2089:*/
;2090:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 2095
;2091:	vec3_t		origin, angles;
;2092:	char		buffer[MAX_TOKEN_CHARS];
;2093:	int			i;
;2094:
;2095:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1099
line 2096
;2096:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $299
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
line 2097
;2097:		return;
ADDRGP4 $1098
JUMPV
LABELV $1099
line 2099
;2098:	}
;2099:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1102
line 2100
;2100:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1104
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
line 2101
;2101:		return;
ADDRGP4 $1098
JUMPV
LABELV $1102
line 2104
;2102:	}
;2103:
;2104:	VectorClear( angles );
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
line 2105
;2105:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1107
line 2106
;2106:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
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
line 2107
;2107:		origin[i] = atof( buffer );
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
line 2108
;2108:	}
LABELV $1108
line 2105
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1107
line 2110
;2109:
;2110:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2111
;2111:	angles[YAW] = atof( buffer );
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
line 2113
;2112:
;2113:	TeleportPlayer( ent, origin, angles );
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
line 2114
;2114:}
LABELV $1098
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 2123
;2115:
;2116:
;2117:
;2118:/*
;2119:=================
;2120:Cmd_Stats_f
;2121:=================
;2122:*/
;2123:void Cmd_Stats_f( gentity_t *ent ) {
line 2138
;2124:/*
;2125:	int max, n, i;
;2126:
;2127:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;2128:
;2129:	n = 0;
;2130:	for ( i = 0; i < max; i++ ) {
;2131:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;2132:			n++;
;2133:	}
;2134:
;2135:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;2136:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;2137:*/
;2138:}
LABELV $1112
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1192 16
line 2145
;2139:
;2140:/*
;2141:=================
;2142:ClientCommand
;2143:=================
;2144:*/
;2145:void ClientCommand( int clientNum ) {
line 2149
;2146:	gentity_t *ent;
;2147:	char	cmd[MAX_TOKEN_CHARS];
;2148:
;2149:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2150
;2150:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1114
line 2151
;2151:		return;		// not fully in game yet
ADDRGP4 $1113
JUMPV
LABELV $1114
line 2155
;2152:	}
;2153:
;2154:
;2155:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2157
;2156:
;2157:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1118
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1116
line 2158
;2158:		Cmd_Say_f (ent, SAY_ALL, qfalse);
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
line 2159
;2159:		return;
ADDRGP4 $1113
JUMPV
LABELV $1116
line 2161
;2160:	}
;2161:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1121
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1119
line 2162
;2162:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
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
line 2163
;2163:		return;
ADDRGP4 $1113
JUMPV
LABELV $1119
line 2165
;2164:	}
;2165:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1124
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1122
line 2166
;2166:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2167
;2167:		return;
ADDRGP4 $1113
JUMPV
LABELV $1122
line 2169
;2168:	}
;2169:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1127
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1125
line 2170
;2170:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
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
line 2171
;2171:		return;
ADDRGP4 $1113
JUMPV
LABELV $1125
line 2173
;2172:	}
;2173:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1130
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1128
line 2174
;2174:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
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
line 2175
;2175:		return;
ADDRGP4 $1113
JUMPV
LABELV $1128
line 2177
;2176:	}
;2177:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1131
line 2178
;2178:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2179
;2179:		return;
ADDRGP4 $1113
JUMPV
LABELV $1131
line 2181
;2180:	}
;2181:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1135
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1133
line 2182
;2182:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
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
line 2183
;2183:		return;
ADDRGP4 $1113
JUMPV
LABELV $1133
line 2185
;2184:	}
;2185:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1138
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1136
line 2186
;2186:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
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
line 2187
;2187:		return;
ADDRGP4 $1113
JUMPV
LABELV $1136
line 2189
;2188:	}
;2189:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1141
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1139
line 2190
;2190:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2191
;2191:		return;
ADDRGP4 $1113
JUMPV
LABELV $1139
line 2193
;2192:	}
;2193:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1144
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1142
line 2194
;2194:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2195
;2195:		return;
ADDRGP4 $1113
JUMPV
LABELV $1142
line 2197
;2196:	}
;2197:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1145
line 2198
;2198:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2199
;2199:		return;
ADDRGP4 $1113
JUMPV
LABELV $1145
line 2203
;2200:	}
;2201:
;2202:	// ignore all other commands when at intermission
;2203:	if (level.intermissiontime) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $1147
line 2204
;2204:		Cmd_Say_f (ent, SAY_INVAL, qtrue);
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
line 2205
;2205:		return;
ADDRGP4 $1113
JUMPV
LABELV $1147
line 2208
;2206:	}
;2207:
;2208:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1150
line 2209
;2209:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2210
;2210:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1153
line 2211
;2211:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2212
;2212:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1156
line 2213
;2213:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2214
;2214:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1159
line 2215
;2215:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1160
JUMPV
LABELV $1159
line 2216
;2216:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1164
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1162
line 2217
;2217:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1163
JUMPV
LABELV $1162
line 2218
;2218:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $435
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1165
line 2219
;2219:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2220
;2220:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1169
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1167
line 2221
;2221:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1168
JUMPV
LABELV $1167
line 2222
;2222:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1172
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1170
line 2223
;2223:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1171
JUMPV
LABELV $1170
line 2224
;2224:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1175
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1173
line 2225
;2225:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1174
JUMPV
LABELV $1173
line 2226
;2226:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1178
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1176
line 2227
;2227:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1177
JUMPV
LABELV $1176
line 2228
;2228:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1181
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1179
line 2229
;2229:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1180
JUMPV
LABELV $1179
line 2230
;2230:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1184
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1182
line 2231
;2231:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1183
JUMPV
LABELV $1182
line 2232
;2232:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1187
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1185
line 2233
;2233:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1186
JUMPV
LABELV $1185
line 2234
;2234:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1190
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1188
line 2235
;2235:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1189
JUMPV
LABELV $1188
line 2236
;2236:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1193
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1191
line 2237
;2237:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1192
JUMPV
LABELV $1191
line 2238
;2238:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1196
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1194
line 2239
;2239:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1195
JUMPV
LABELV $1194
line 2240
;2240:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1199
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1197
line 2241
;2241:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1198
JUMPV
LABELV $1197
line 2242
;2242:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1200
line 2243
;2243:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1201
JUMPV
LABELV $1200
line 2244
;2244:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1205
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1203
line 2245
;2245:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1204
JUMPV
LABELV $1203
line 2246
;2246:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1208
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1206
line 2247
;2247:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $1207
JUMPV
LABELV $1206
line 2248
;2248:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1211
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1209
line 2249
;2249:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $1210
JUMPV
LABELV $1209
line 2250
;2250:	else if (Q_stricmp (cmd, "spawnturret") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1214
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1212
line 2251
;2251:		Cmd_SpawnTurret_f( ent, 0 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2252
;2252:	else if (Q_stricmp (cmd, "spawnturret2") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1217
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1215
line 2253
;2253:		Cmd_SpawnTurret_f( ent, 1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1216
JUMPV
LABELV $1215
line 2254
;2254:	else if (Q_stricmp (cmd, "spawnturret3") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1220
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1218
line 2255
;2255:		Cmd_SpawnTurret_f( ent, 2 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1219
JUMPV
LABELV $1218
line 2256
;2256:	else if (Q_stricmp (cmd, "spawngen") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1223
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1221
line 2257
;2257:		Cmd_SpawnGenerator_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnGenerator_f
CALLV
pop
ADDRGP4 $1222
JUMPV
LABELV $1221
line 2258
;2258:	else if (Q_stricmp (cmd, "spawnmc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1226
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $1224
line 2259
;2259:		Cmd_SpawnMC_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnMC_f
CALLV
pop
ADDRGP4 $1225
JUMPV
LABELV $1224
line 2260
;2260:	else if (Q_stricmp (cmd, "spawntd") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1229
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $1227
line 2261
;2261:		Cmd_SpawnDisplacer_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnDisplacer_f
CALLV
pop
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2262
;2262:	else if (Q_stricmp (cmd, "listplayers") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1232
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1230
line 2263
;2263:		Cmd_ListPlayers_f( ent ); 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ListPlayers_f
CALLV
pop
ADDRGP4 $1231
JUMPV
LABELV $1230
line 2264
;2264:	else if (Q_stricmp (cmd, "test") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1235
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1233
line 2265
;2265:		Cmd_Test_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Test_f
CALLV
pop
ADDRGP4 $1234
JUMPV
LABELV $1233
line 2267
;2266:	else
;2267:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1236
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
LABELV $1234
LABELV $1231
LABELV $1228
LABELV $1225
LABELV $1222
LABELV $1219
LABELV $1216
LABELV $1213
LABELV $1210
LABELV $1207
LABELV $1204
LABELV $1201
LABELV $1198
LABELV $1195
LABELV $1192
LABELV $1189
LABELV $1186
LABELV $1183
LABELV $1180
LABELV $1177
LABELV $1174
LABELV $1171
LABELV $1168
LABELV $1166
LABELV $1163
LABELV $1160
LABELV $1157
LABELV $1154
LABELV $1151
line 2268
;2268:}
LABELV $1113
endproc ClientCommand 1192 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 2278
;2269:
;2270:/*
;2271:============================
;2272:G_SendCommandToClient
;2273:Send the given command to the specified (or all) clients
;2274:Shafe - Trep - This is for the Radar
;2275:============================
;2276:*/
;2277:void G_SendCommandToClient (gentity_t *to, char *cmd)
;2278:{
line 2279
;2279:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1238
line 2280
;2280:	{
line 2282
;2281:		// send to all clients 
;2282:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2283
;2283:	} else {
ADDRGP4 $1239
JUMPV
LABELV $1238
line 2285
;2284:    // send to specified client
;2285:    trap_SendServerCommand ( to-g_entities, cmd);
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
line 2286
;2286:	}
LABELV $1239
line 2287
;2287:}
LABELV $1237
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
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_mapfile
import g_ReverseCTF
import g_GuassRate
import g_GuassSelfDamage
import g_GuassKnockBack
import g_GuassJump
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
LABELV $1236
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
LABELV $1235
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1232
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
LABELV $1229
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $1226
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $1223
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
LABELV $1220
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
LABELV $1217
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
LABELV $1214
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
LABELV $1211
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
LABELV $1208
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $1205
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1202
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
LABELV $1199
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1196
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
LABELV $1193
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
LABELV $1190
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1187
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
LABELV $1184
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1181
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1178
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
LABELV $1175
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
LABELV $1172
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1169
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
LABELV $1164
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1161
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1158
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
LABELV $1155
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1152
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1144
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1141
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1138
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
LABELV $1135
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1130
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
LABELV $1127
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1124
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1121
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
LABELV $1118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1104
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
LABELV $1087
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
LABELV $1084
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
LABELV $1081
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
LABELV $1072
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
LABELV $1071
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $1066
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
LABELV $1058
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
LABELV $1057
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
LABELV $1056
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
LABELV $1039
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
LABELV $1027
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
LABELV $1026
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
LABELV $991
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $985
byte 1 32
byte 1 0
align 1
LABELV $976
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
LABELV $973
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
LABELV $951
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
LABELV $950
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
LABELV $947
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
LABELV $944
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
LABELV $935
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $925
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
LABELV $921
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $915
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
LABELV $912
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
LABELV $906
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $901
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
LABELV $894
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $891
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
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
LABELV $880
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $875
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
LABELV $874
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
LABELV $871
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
LABELV $868
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
LABELV $865
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
LABELV $862
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $859
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
LABELV $856
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
LABELV $853
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $850
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $847
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
LABELV $840
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
LABELV $837
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
LABELV $834
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
LABELV $830
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
LABELV $825
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
LABELV $824
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
LABELV $823
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
LABELV $822
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
LABELV $821
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
LABELV $820
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
LABELV $819
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
LABELV $818
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
LABELV $817
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
LABELV $808
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $807
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
LABELV $806
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
LABELV $805
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
LABELV $804
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
LABELV $803
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
LABELV $802
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
LABELV $801
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $798
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $781
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
LABELV $776
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
LABELV $765
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
LABELV $755
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
LABELV $733
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
LABELV $723
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
LABELV $722
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $721
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $718
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $701
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
LABELV $679
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $672
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
LABELV $671
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
LABELV $669
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
LABELV $668
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
LABELV $663
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
LABELV $662
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
LABELV $659
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
LABELV $657
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
LABELV $656
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
LABELV $645
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $644
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $643
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
LABELV $615
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
LABELV $586
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
LABELV $582
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
LABELV $577
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 85
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 97
byte 1 119
byte 1 101
byte 1 100
byte 1 46
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $564
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
LABELV $558
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
LABELV $556
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
LABELV $554
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
LABELV $552
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
LABELV $513
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
LABELV $508
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
LABELV $497
byte 1 98
byte 1 0
align 1
LABELV $496
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $492
byte 1 114
byte 1 0
align 1
LABELV $491
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $484
byte 1 115
byte 1 0
align 1
LABELV $483
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
LABELV $480
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $477
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $473
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $472
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
LABELV $468
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
LABELV $465
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
LABELV $464
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 73
byte 1 115
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 122
byte 1 101
byte 1 110
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $460
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
LABELV $456
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
LABELV $448
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
LABELV $445
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
LABELV $436
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $435
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
LABELV $431
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
LABELV $430
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
LABELV $420
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
LABELV $419
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
LABELV $413
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
LABELV $412
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
LABELV $406
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
LABELV $405
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
LABELV $404
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
LABELV $392
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $389
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $386
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
LABELV $383
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
LABELV $380
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
LABELV $374
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $364
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $358
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $352
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $349
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $343
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
LABELV $333
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
LABELV $330
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
LABELV $302
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
LABELV $299
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
LABELV $293
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
LABELV $291
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
LABELV $289
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
LABELV $287
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
LABELV $285
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
LABELV $283
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
LABELV $281
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
LABELV $279
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
LABELV $255
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
LABELV $237
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
LABELV $230
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
LABELV $212
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
LABELV $209
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
LABELV $206
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
LABELV $153
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
LABELV $150
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
LABELV $117
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
LABELV $104
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
LABELV $101
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
LABELV $80
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
LABELV $77
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
