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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 2568
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
CNSTI4 3492
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
CNSTI4 2660
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
CNSTI4 2664
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 2660
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
proc Cmd_Test_f 48 8
line 506
;503:
;504:extern int CountTeamSurvivors();
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
line 515
;515:		trap_SendServerCommand( ent-g_entities, va("print \" Red Team Survivors %i\n\"", CountTeamSurvivors(TEAM_RED) ));		
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 CountTeamSurvivors
CALLI4
ASGNI4
ADDRGP4 $295
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
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
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 516
;516:		trap_SendServerCommand( ent-g_entities, va("print \" Blue Team Survivors %i\n\"", CountTeamSurvivors(TEAM_RED) ));		
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 CountTeamSurvivors
CALLI4
ASGNI4
ADDRGP4 $296
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
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
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 518
;517:		//trap_SendServerCommand( ent-g_entities, va("print \" level.scoreTime %i\n\"", (level.time-level.scoreTime) ));		
;518:}
LABELV $278
endproc Cmd_Test_f 48 8
export CheatsOk
proc CheatsOk 4 8
line 527
;519:
;520:
;521:/*
;522:==================
;523:CheatsOk
;524:==================
;525:*/
;526:qboolean	CheatsOk( gentity_t *ent ) 
;527:{
line 528
;528:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $298
line 529
;529:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $301
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
line 530
;530:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $297
JUMPV
LABELV $298
line 533
;531:	}
;532:
;533:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $302
line 534
;534:      trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\"")); 
ADDRGP4 $304
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
line 535
;535:      return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $297
JUMPV
LABELV $302
line 537
;536:   }
;537:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $305
line 538
;538:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $304
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
line 539
;539:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $297
JUMPV
LABELV $305
line 541
;540:	}
;541:	return qtrue;
CNSTI4 1
RETI4
LABELV $297
endproc CheatsOk 4 8
bss
align 1
LABELV $308
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 550
;542:}
;543:
;544:
;545:/*
;546:==================
;547:ConcatArgs
;548:==================
;549:*/
;550:char	*ConcatArgs( int start ) {
line 556
;551:	int		i, c, tlen;
;552:	static char	line[MAX_STRING_CHARS];
;553:	int		len;
;554:	char	arg[MAX_STRING_CHARS];
;555:
;556:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 557
;557:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 558
;558:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $312
JUMPV
LABELV $309
line 559
;559:		trap_Argv( i, arg, sizeof( arg ) );
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
line 560
;560:		tlen = strlen( arg );
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
line 561
;561:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $313
line 562
;562:			break;
ADDRGP4 $311
JUMPV
LABELV $313
line 564
;563:		}
;564:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $308
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
line 565
;565:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 566
;566:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $315
line 567
;567:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $308
ADDP4
CNSTI1 32
ASGNI1
line 568
;568:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 569
;569:		}
LABELV $315
line 570
;570:	}
LABELV $310
line 558
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $312
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $309
LABELV $311
line 572
;571:
;572:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $308
ADDP4
CNSTI1 0
ASGNI1
line 574
;573:
;574:	return line;
ADDRGP4 $308
RETP4
LABELV $307
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 584
;575:}
;576:
;577:/*
;578:==================
;579:SanitizeString
;580:
;581:Remove case and control characters
;582:==================
;583:*/
;584:void SanitizeString( char *in, char *out ) {
ADDRGP4 $319
JUMPV
LABELV $318
line 585
;585:	while ( *in ) {
line 586
;586:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $321
line 587
;587:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 588
;588:			continue;
ADDRGP4 $319
JUMPV
LABELV $321
line 590
;589:		}
;590:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $323
line 591
;591:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 592
;592:			continue;
ADDRGP4 $319
JUMPV
LABELV $323
line 594
;593:		}
;594:		*out++ = tolower( *in++ );
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
line 595
;595:	}
LABELV $319
line 585
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $318
line 597
;596:
;597:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 598
;598:}
LABELV $317
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 608
;599:
;600:/*
;601:==================
;602:ClientNumberFromString
;603:
;604:Returns a player number for either a number or name string
;605:Returns -1 if invalid
;606:==================
;607:*/
;608:int ClientNumberFromString( gentity_t *to, char *s ) {
line 615
;609:	gclient_t	*cl;
;610:	int			idnum;
;611:	char		s2[MAX_STRING_CHARS];
;612:	char		n2[MAX_STRING_CHARS];
;613:
;614:	// numeric values are just slot numbers
;615:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $326
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $326
line 616
;616:		idnum = atoi( s );
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
line 617
;617:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $331
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $328
LABELV $331
line 618
;618:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $332
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
line 619
;619:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $328
line 622
;620:		}
;621:
;622:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 623
;623:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $333
line 624
;624:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $335
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
line 625
;625:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $333
line 627
;626:		}
;627:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $325
JUMPV
LABELV $326
line 631
;628:	}
;629:
;630:	// check for a name match
;631:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 632
;632:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $339
JUMPV
LABELV $336
line 633
;633:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $341
line 634
;634:			continue;
ADDRGP4 $337
JUMPV
LABELV $341
line 636
;635:		}
;636:		SanitizeString( cl->pers.netname, n2 );
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
line 637
;637:		if ( !strcmp( n2, s2 ) ) {
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
NEI4 $343
line 638
;638:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $325
JUMPV
LABELV $343
line 640
;639:		}
;640:	}
LABELV $337
line 632
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3492
ADDP4
ASGNP4
LABELV $339
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $336
line 642
;641:
;642:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $345
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
line 643
;643:	return -1;
CNSTI4 -1
RETI4
LABELV $325
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 654
;644:}
;645:
;646:/*
;647:==================
;648:Cmd_Give_f
;649:
;650:Give items to a client
;651:==================
;652:*/
;653:void Cmd_Give_f (gentity_t *ent)
;654:{
line 662
;655:	char		*name;
;656:	gitem_t		*it;
;657:	int			i;
;658:	qboolean	give_all;
;659:	gentity_t		*it_ent;
;660:	trace_t		trace;
;661:
;662:	if ( !CheatsOk( ent ) ) {
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
NEI4 $347
line 663
;663:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 666
;664:	}
;665:
;666:	name = ConcatArgs( 1 );
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
line 668
;667:
;668:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $349
line 669
;669:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 671
;670:	else
;671:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $350
line 673
;672:
;673:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $355
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $355
line 674
;674:	{
line 675
;675:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
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
line 676
;676:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $356
line 677
;677:			return;
ADDRGP4 $346
JUMPV
LABELV $356
line 678
;678:	}
LABELV $352
line 680
;679:
;680:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $361
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $358
LABELV $361
line 681
;681:	{
line 682
;682:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 684
;683:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;684:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $362
line 685
;685:			return;
ADDRGP4 $346
JUMPV
LABELV $362
line 686
;686:	}
LABELV $358
line 688
;687:
;688:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $367
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $364
LABELV $367
line 689
;689:	{
line 690
;690:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $368
line 691
;691:			ent->client->ps.ammo[i] = 999;
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
line 692
;692:		}
LABELV $369
line 690
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $368
line 693
;693:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $372
line 694
;694:			return;
ADDRGP4 $346
JUMPV
LABELV $372
line 695
;695:	}
LABELV $364
line 697
;696:
;697:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $377
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $374
LABELV $377
line 698
;698:	{
line 699
;699:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 701
;700:
;701:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $378
line 702
;702:			return;
ADDRGP4 $346
JUMPV
LABELV $378
line 703
;703:	}
LABELV $374
line 705
;704:
;705:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $380
line 706
;706:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 707
;707:		return;
ADDRGP4 $346
JUMPV
LABELV $380
line 709
;708:	}
;709:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $385
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $383
line 710
;710:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 711
;711:		return;
ADDRGP4 $346
JUMPV
LABELV $383
line 713
;712:	}
;713:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $388
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $386
line 714
;714:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 715
;715:		return;
ADDRGP4 $346
JUMPV
LABELV $386
line 717
;716:	}
;717:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $389
line 718
;718:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
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
line 719
;719:		return;
ADDRGP4 $346
JUMPV
LABELV $389
line 721
;720:	}
;721:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $394
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $392
line 722
;722:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
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
line 723
;723:		return;
ADDRGP4 $346
JUMPV
LABELV $392
line 727
;724:	}
;725:
;726:	// spawn a specific item right on the player
;727:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $395
line 728
;728:		it = BG_FindItem (name);
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
line 729
;729:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $397
line 730
;730:			return;
ADDRGP4 $346
JUMPV
LABELV $397
line 733
;731:		}
;732:
;733:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 734
;734:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
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
line 735
;735:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 736
;736:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 737
;737:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 738
;738:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 739
;739:		Touch_Item (it_ent, ent, &trace);
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
line 740
;740:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
line 741
;741:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 742
;742:		}
LABELV $399
line 743
;743:	}
LABELV $395
line 744
;744:}
LABELV $346
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 757
;745:
;746:
;747:/*
;748:==================
;749:Cmd_God_f
;750:
;751:Sets client to godmode
;752:
;753:argv(0) god
;754:==================
;755:*/
;756:void Cmd_God_f (gentity_t *ent)
;757:{
line 760
;758:	char	*msg;
;759:
;760:	if ( !CheatsOk( ent ) ) {
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
NEI4 $402
line 761
;761:		return;
ADDRGP4 $401
JUMPV
LABELV $402
line 764
;762:	}
;763:
;764:	ent->flags ^= FL_GODMODE;
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
line 765
;765:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $404
line 766
;766:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $406
ASGNP4
ADDRGP4 $405
JUMPV
LABELV $404
line 768
;767:	else
;768:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $407
ASGNP4
LABELV $405
line 770
;769:
;770:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $408
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
line 771
;771:}
LABELV $401
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 783
;772:
;773:
;774:/*
;775:==================
;776:Cmd_Notarget_f
;777:
;778:Sets client to notarget
;779:
;780:argv(0) notarget
;781:==================
;782:*/
;783:void Cmd_Notarget_f( gentity_t *ent ) {
line 786
;784:	char	*msg;
;785:
;786:	if ( !CheatsOk( ent ) ) {
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
NEI4 $410
line 787
;787:		return;
ADDRGP4 $409
JUMPV
LABELV $410
line 790
;788:	}
;789:
;790:	ent->flags ^= FL_NOTARGET;
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
line 791
;791:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $412
line 792
;792:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $414
ASGNP4
ADDRGP4 $413
JUMPV
LABELV $412
line 794
;793:	else
;794:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $415
ASGNP4
LABELV $413
line 796
;795:
;796:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $408
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
line 797
;797:}
LABELV $409
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 807
;798:
;799:
;800:/*
;801:==================
;802:Cmd_Noclip_f
;803:
;804:argv(0) noclip
;805:==================
;806:*/
;807:void Cmd_Noclip_f( gentity_t *ent ) {
line 810
;808:	char	*msg;
;809:
;810:	if ( !CheatsOk( ent ) ) {
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
NEI4 $417
line 811
;811:		return;
ADDRGP4 $416
JUMPV
LABELV $417
line 814
;812:	}
;813:
;814:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 815
;815:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $421
ASGNP4
line 816
;816:	} else {
ADDRGP4 $420
JUMPV
LABELV $419
line 817
;817:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $422
ASGNP4
line 818
;818:	}
LABELV $420
line 819
;819:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $424
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $425
JUMPV
LABELV $424
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $425
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 821
;820:
;821:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $408
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
line 822
;822:}
LABELV $416
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 835
;823:
;824:
;825:/*
;826:==================
;827:Cmd_LevelShot_f
;828:
;829:This is just to help generate the level pictures
;830:for the menus.  It goes to the intermission immediately
;831:and sends over a command to the client to resize the view,
;832:hide the scoreboard, and take a special screenshot
;833:==================
;834:*/
;835:void Cmd_LevelShot_f( gentity_t *ent ) {
line 836
;836:	if ( !CheatsOk( ent ) ) {
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
NEI4 $427
line 837
;837:		return;
ADDRGP4 $426
JUMPV
LABELV $427
line 841
;838:	}
;839:
;840:	// doesn't work in single player
;841:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $429
line 842
;842:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $432
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 844
;843:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;844:		return;
ADDRGP4 $426
JUMPV
LABELV $429
line 847
;845:	}
;846:
;847:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 848
;848:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $433
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 849
;849:}
LABELV $426
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 862
;850:
;851:
;852:/*
;853:==================
;854:Cmd_LevelShot_f
;855:
;856:This is just to help generate the level pictures
;857:for the menus.  It goes to the intermission immediately
;858:and sends over a command to the client to resize the view,
;859:hide the scoreboard, and take a special screenshot
;860:==================
;861:*/
;862:void Cmd_TeamTask_f( gentity_t *ent ) {
line 866
;863:	char userinfo[MAX_INFO_STRING];
;864:	char		arg[MAX_TOKEN_CHARS];
;865:	int task;
;866:	int client = ent->client - level.clients;
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
CNSTI4 3492
DIVI4
ASGNI4
line 868
;867:
;868:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $435
line 869
;869:		return;
ADDRGP4 $434
JUMPV
LABELV $435
line 871
;870:	}
;871:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 872
;872:	task = atoi( arg );
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
line 874
;873:
;874:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
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
line 875
;875:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $438
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
ADDRGP4 $437
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 876
;876:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 877
;877:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 878
;878:}
LABELV $434
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 887
;879:
;880:
;881:
;882:/*
;883:=================
;884:Cmd_Kill_f
;885:=================
;886:*/
;887:void Cmd_Kill_f( gentity_t *ent ) {
line 888
;888:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $440
line 889
;889:		return;
ADDRGP4 $439
JUMPV
LABELV $440
line 891
;890:	}
;891:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $442
line 892
;892:		return;
ADDRGP4 $439
JUMPV
LABELV $442
line 894
;893:	}
;894:	ent->flags &= ~FL_GODMODE;
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
line 895
;895:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
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
line 896
;896:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 897
;897:}
LABELV $439
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 907
;898:
;899:/*
;900:=================
;901:BroadCastTeamChange
;902:
;903:Let everyone know about a team change
;904:=================
;905:*/
;906:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;907:{
line 908
;908:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 1
NEI4 $445
line 909
;909:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $447
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
line 911
;910:			client->pers.netname) );
;911:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $446
JUMPV
LABELV $445
ADDRFP4 0
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 2
NEI4 $448
line 912
;912:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $450
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
line 914
;913:		client->pers.netname));
;914:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $451
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $451
line 916
;915:		
;916:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $453
line 917
;917:		{
line 919
;918:		
;919:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $455
line 920
;920:			{
line 921
;921:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $458
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
line 922
;922:			}
LABELV $455
line 923
;923:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $459
line 924
;924:			{
line 925
;925:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $462
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
line 926
;926:			}
LABELV $459
line 928
;927:
;928:			if (g_GameMode.integer == 5) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 5
NEI4 $452
line 929
;929:			{
line 930
;930:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Is Frozen!.\n\"", client->pers.netname));
ADDRGP4 $466
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
line 931
;931:			}
line 932
;932:		} 
ADDRGP4 $452
JUMPV
LABELV $453
line 935
;933:
;934:		else 
;935:		{
line 936
;936:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $467
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
line 937
;937:		}
line 939
;938:
;939:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $452
JUMPV
LABELV $451
ADDRFP4 0
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $468
line 940
;940:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $470
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
line 942
;941:		client->pers.netname));
;942:	}
LABELV $468
LABELV $452
LABELV $449
LABELV $446
line 943
;943:}
LABELV $444
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 950
;944:
;945:/*
;946:=================
;947:SetTeam
;948:=================
;949:*/
;950:void SetTeam( gentity_t *ent, char *s ) {
line 961
;951:	int					team, oldTeam;
;952:	gclient_t			*client;
;953:	int					clientNum;
;954:	spectatorState_t	specState;
;955:	int					specClient;
;956:	int					teamLeader;
;957:
;958:	//
;959:	// see what change is requested
;960:	//
;961:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 963
;962:
;963:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ASGNI4
line 964
;964:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 965
;965:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 966
;966:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $474
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $476
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $472
LABELV $476
line 967
;967:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 968
;968:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 969
;969:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $473
JUMPV
LABELV $472
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $477
line 970
;970:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 971
;971:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 972
;972:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 973
;973:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $478
JUMPV
LABELV $477
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $480
line 974
;974:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 975
;975:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 976
;976:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 977
;977:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $481
JUMPV
LABELV $480
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $487
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $486
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $483
LABELV $487
line 978
;978:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 979
;979:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 980
;980:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $484
JUMPV
LABELV $483
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $488
line 982
;981:		// if running a team game, assign player to one of the teams
;982:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 983
;983:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $493
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $495
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $494
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $491
LABELV $495
line 984
;984:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 985
;985:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $492
JUMPV
LABELV $491
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $500
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $499
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $496
LABELV $500
line 986
;986:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 987
;987:		} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 989
;988:			// pick the team with the least number of players
;989:			team = PickTeam( clientNum );
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
line 990
;990:		}
LABELV $497
LABELV $492
line 992
;991:
;992:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $489
line 995
;993:			int		counts[TEAM_NUM_TEAMS];
;994:
;995:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
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
line 996
;996:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
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
line 999
;997:
;998:			// We allow a spread of two
;999:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $506
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $506
line 1000
;1000:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $510
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1002
;1001:					"cp \"Red team has too many players.\n\"" );
;1002:				return; // ignore the request
ADDRGP4 $471
JUMPV
LABELV $506
line 1004
;1003:			}
;1004:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $489
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $489
line 1005
;1005:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $515
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1007
;1006:					"cp \"Blue team has too many players.\n\"" );
;1007:				return; // ignore the request
ADDRGP4 $471
JUMPV
line 1011
;1008:			}
;1009:
;1010:			// It's ok, the team we are switching to has less or same number of players
;1011:		}
line 1013
;1012:
;1013:	} else {
LABELV $488
line 1015
;1014:		// force them to spectators if there aren't any spots free
;1015:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1016
;1016:	}
LABELV $489
LABELV $484
LABELV $481
LABELV $478
LABELV $473
line 1019
;1017:
;1018:	// override decision if limiting the players
;1019:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $516
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $516
line 1020
;1020:		&& level.numNonSpectatorClients >= 2 ) {
line 1021
;1021:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1022
;1022:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $517
JUMPV
LABELV $516
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $520
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $520
line 1023
;1023:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 1024
;1024:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1025
;1025:	}
LABELV $520
LABELV $517
line 1030
;1026:
;1027:	//
;1028:	// decide if we will allow the change
;1029:	//
;1030:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ASGNI4
line 1031
;1031:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $525
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $525
line 1032
;1032:		return;
ADDRGP4 $471
JUMPV
LABELV $525
line 1040
;1033:	}
;1034:
;1035:	//
;1036:	// execute the team change
;1037:	//
;1038:
;1039:	// if the player was dead leave the body
;1040:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $527
line 1041
;1041:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 1042
;1042:	}
LABELV $527
line 1045
;1043:
;1044:	// he starts at 'base'
;1045:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1046
;1046:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $529
line 1048
;1047:		// Kill him (makes sure he loses flags, etc)
;1048:		ent->flags &= ~FL_GODMODE;
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
line 1049
;1049:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
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
line 1050
;1050:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
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
line 1052
;1051:
;1052:	}
LABELV $529
line 1054
;1053:	// they go to the end of the line for tournements
;1054:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $531
line 1055
;1055:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1056
;1056:	}
LABELV $531
line 1058
;1057:
;1058:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2568
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1059
;1059:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1060
;1060:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2580
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1062
;1061:
;1062:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2592
ADDP4
CNSTI4 0
ASGNI4
line 1063
;1063:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $536
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $534
LABELV $536
line 1064
;1064:		teamLeader = TeamLeader( team );
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
line 1066
;1065:		// if there is no team leader or the team leader is a bot and this client is not a bot
;1066:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $543
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
NEI4 $537
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
EQI4 $537
LABELV $543
line 1067
;1067:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1068
;1068:		}
LABELV $537
line 1069
;1069:	}
LABELV $534
line 1071
;1070:	// make sure there is a team leader on the team the player came from
;1071:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $546
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $544
LABELV $546
line 1072
;1072:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 1073
;1073:	}
LABELV $544
line 1075
;1074:
;1075:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1078
;1076:
;1077:	// get and distribute relevent paramters
;1078:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1080
;1079:
;1080:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1081
;1081:}
LABELV $471
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 1091
;1082:
;1083:/*
;1084:=================
;1085:StopFollowing
;1086:
;1087:If the client being followed leaves the game, or you just want to drop
;1088:to free floating spectator mode
;1089:=================
;1090:*/
;1091:void StopFollowing( gentity_t *ent ) {
line 1092
;1092:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1093
;1093:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
CNSTI4 3
ASGNI4
line 1094
;1094:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 1
ASGNI4
line 1095
;1095:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
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
line 1096
;1096:	ent->r.svFlags &= ~SVF_BOT;
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
line 1097
;1097:	ent->client->ps.clientNum = ent - g_entities;
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
line 1098
;1098:}
LABELV $547
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 1105
;1099:
;1100:/*
;1101:=================
;1102:Cmd_Team_f
;1103:=================
;1104:*/
;1105:void Cmd_Team_f( gentity_t *ent ) {
line 1109
;1106:	int			oldTeam;
;1107:	char		s[MAX_TOKEN_CHARS];
;1108:
;1109:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $549
line 1110
;1110:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ASGNI4
line 1111
;1111:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $561
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $561
address $557
address $555
address $553
address $559
code
LABELV $553
line 1113
;1112:		case TEAM_BLUE:
;1113:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
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
line 1114
;1114:			break;
ADDRGP4 $548
JUMPV
LABELV $555
line 1116
;1115:		case TEAM_RED:
;1116:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
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
line 1117
;1117:			break;
ADDRGP4 $548
JUMPV
LABELV $557
line 1119
;1118:		case TEAM_FREE:
;1119:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
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
line 1120
;1120:			break;
ADDRGP4 $548
JUMPV
LABELV $559
line 1122
;1121:		case TEAM_SPECTATOR:
;1122:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
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
ADDRGP4 $560
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1123
;1123:			break;
line 1125
;1124:		}
;1125:		return;
ADDRGP4 $548
JUMPV
LABELV $549
line 1128
;1126:	}
;1127:
;1128:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $562
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $562
line 1129
;1129:	{
line 1131
;1130:
;1131:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
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
ADDRGP4 $566
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1132
;1132:		return;
ADDRGP4 $548
JUMPV
LABELV $562
line 1136
;1133:	}
;1134:
;1135:
;1136:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $567
line 1137
;1137:	{
line 1138
;1138:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $576
ADDRLP4 1032
CNSTI4 2
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $576
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 1032
INDIRI4
NEI4 $570
LABELV $576
line 1139
;1139:		{
line 1141
;1140:		
;1141:			if (ent->client->pers.Frozen == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 1
NEI4 $577
line 1142
;1142:			{
line 1143
;1143:				trap_SendServerCommand( ent-g_entities, "cp \"You Cannot Rejoin Until You Are Thawed..\"" );
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
ADDRGP4 $579
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1144
;1144:				return;
ADDRGP4 $548
JUMPV
LABELV $577
line 1147
;1145:
;1146:			} else 
;1147:			{
line 1149
;1148:
;1149:				if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $580
line 1150
;1150:				{
line 1152
;1151:				
;1152:					if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $582
line 1153
;1153:					{
line 1154
;1154:						trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
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
ADDRGP4 $584
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1155
;1155:						return;
ADDRGP4 $548
JUMPV
LABELV $582
line 1157
;1156:					}
;1157:					if (level.firstStrike == qtrue)
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $585
line 1158
;1158:					{
line 1159
;1159:						trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
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
ADDRGP4 $588
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1160
;1160:						return;
ADDRGP4 $548
JUMPV
LABELV $585
line 1163
;1161:					}
;1162:
;1163:				}
LABELV $580
line 1164
;1164:			}
line 1165
;1165:		}
LABELV $570
line 1168
;1166:
;1167:
;1168:	}
LABELV $567
line 1175
;1169:
;1170:
;1171:	
;1172:
;1173:
;1174:	// if they are playing a tournement game, count as a loss
;1175:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $589
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $589
line 1176
;1176:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1177
;1177:		ent->client->sess.losses++;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2588
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
line 1178
;1178:	}
LABELV $589
line 1180
;1179:
;1180:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1182
;1181:
;1182:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1184
;1183:
;1184:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1185
;1185:}
LABELV $548
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 1193
;1186:
;1187:
;1188:/*
;1189:=================
;1190:Cmd_Follow_f
;1191:=================
;1192:*/
;1193:void Cmd_Follow_f( gentity_t *ent ) {
line 1197
;1194:	int		i;
;1195:	char	arg[MAX_TOKEN_CHARS];
;1196:
;1197:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $594
line 1198
;1198:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
CNSTI4 2
NEI4 $593
line 1199
;1199:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1200
;1200:		}
line 1201
;1201:		return;
ADDRGP4 $593
JUMPV
LABELV $594
line 1204
;1202:	}
;1203:
;1204:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1205
;1205:	i = ClientNumberFromString( ent, arg );
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
line 1206
;1206:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $598
line 1207
;1207:		return;
ADDRGP4 $593
JUMPV
LABELV $598
line 1211
;1208:	}
;1209:
;1210:	// can't follow self
;1211:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3492
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
NEU4 $600
line 1212
;1212:		return;
ADDRGP4 $593
JUMPV
LABELV $600
line 1216
;1213:	}
;1214:
;1215:	// can't follow another spectator
;1216:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $602
line 1217
;1217:		return;
ADDRGP4 $593
JUMPV
LABELV $602
line 1221
;1218:	}
;1219:
;1220:	// if they are playing a tournement game, count as a loss
;1221:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $604
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $604
line 1222
;1222:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1223
;1223:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2588
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
line 1224
;1224:	}
LABELV $604
line 1227
;1225:
;1226:	// first set them to spectator
;1227:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
EQI4 $607
line 1228
;1228:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $485
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1229
;1229:	}
LABELV $607
line 1231
;1230:
;1231:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 2
ASGNI4
line 1232
;1232:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1233
;1233:}
LABELV $593
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 1240
;1234:
;1235:/*
;1236:=================
;1237:Cmd_FollowCycle_f
;1238:=================
;1239:*/
;1240:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 1245
;1241:	int		clientnum;
;1242:	int		original;
;1243:
;1244:	// if they are playing a tournement game, count as a loss
;1245:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $610
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $610
line 1246
;1246:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1247
;1247:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2588
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
line 1248
;1248:	}
LABELV $610
line 1250
;1249:	// first set them to spectator
;1250:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $613
line 1251
;1251:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $485
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1252
;1252:	}
LABELV $613
line 1254
;1253:
;1254:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $615
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $615
line 1255
;1255:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $617
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1256
;1256:	}
LABELV $615
line 1258
;1257:
;1258:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
INDIRI4
ASGNI4
line 1259
;1259:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $618
line 1260
;1260:	do {
line 1261
;1261:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1262
;1262:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $621
line 1263
;1263:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1264
;1264:		}
LABELV $621
line 1265
;1265:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $624
line 1266
;1266:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1267
;1267:		}
LABELV $624
line 1270
;1268:
;1269:		// can only follow connected clients
;1270:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3492
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
EQI4 $627
line 1271
;1271:			continue;
ADDRGP4 $619
JUMPV
LABELV $627
line 1275
;1272:		}
;1273:
;1274:		// can't follow another spectator
;1275:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $629
line 1276
;1276:			continue;
ADDRGP4 $619
JUMPV
LABELV $629
line 1280
;1277:		}
;1278:
;1279:		// this is good, we can use it
;1280:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1281
;1281:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 2
ASGNI4
line 1282
;1282:		return;
ADDRGP4 $609
JUMPV
LABELV $619
line 1283
;1283:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $618
line 1286
;1284:
;1285:	// leave it where it was
;1286:}
LABELV $609
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 1297
;1287:
;1288:
;1289:/*
;1290:==================
;1291:G_Say
;1292:==================
;1293:*/
;1294:
;1295:
;1296:
;1297:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1298
;1298:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $632
line 1299
;1299:		return;
ADDRGP4 $631
JUMPV
LABELV $632
line 1301
;1300:	}
;1301:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $634
line 1302
;1302:		return;
ADDRGP4 $631
JUMPV
LABELV $634
line 1304
;1303:	}
;1304:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $636
line 1305
;1305:		return;
ADDRGP4 $631
JUMPV
LABELV $636
line 1307
;1306:	}
;1307:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $638
line 1308
;1308:		return;
ADDRGP4 $631
JUMPV
LABELV $638
line 1310
;1309:	}
;1310:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $640
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
NEI4 $640
line 1311
;1311:		return;
ADDRGP4 $631
JUMPV
LABELV $640
line 1314
;1312:	}
;1313:	// no chatting to players in tournements
;1314:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $642
ADDRLP4 4
CNSTI4 524
ASGNI4
ADDRLP4 8
CNSTI4 2568
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
NEI4 $642
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
EQI4 $642
line 1316
;1315:		&& other->client->sess.sessionTeam == TEAM_FREE
;1316:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1317
;1317:		return;
ADDRGP4 $631
JUMPV
LABELV $642
line 1320
;1318:	}
;1319:
;1320:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $645
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $649
ADDRLP4 16
ADDRGP4 $646
ASGNP4
ADDRGP4 $650
JUMPV
LABELV $649
ADDRLP4 16
ADDRGP4 $647
ASGNP4
LABELV $650
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
line 1323
;1321:		mode == SAY_TEAM ? "tchat" : "chat",
;1322:		name, Q_COLOR_ESCAPE, color, message));
;1323:}
LABELV $631
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1327
;1324:
;1325:#define EC		"\x19"
;1326:
;1327:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1336
;1328:	int			j;
;1329:	gentity_t	*other;
;1330:	int			color;
;1331:	char		name[64];
;1332:	// don't let text be too long for malicious reasons
;1333:	char		text[MAX_SAY_TEXT];
;1334:	char		location[64];
;1335:
;1336:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $652
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $652
line 1337
;1337:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1338
;1338:	}
LABELV $652
line 1340
;1339:
;1340:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
LTI4 $655
ADDRLP4 292
INDIRI4
CNSTI4 3
GTI4 $655
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $675
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $675
address $657
address $660
address $666
address $672
code
LABELV $655
LABELV $657
line 1343
;1341:	default:
;1342:	case SAY_ALL:
;1343:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $658
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
line 1344
;1344:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
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
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1345
;1345:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1346
;1346:		break;
ADDRGP4 $656
JUMPV
LABELV $660
line 1348
;1347:	case SAY_TEAM:
;1348:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $661
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
line 1349
;1349:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
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
EQI4 $662
line 1350
;1350:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $664
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
ADDRGP4 $663
JUMPV
LABELV $662
line 1353
;1351:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1352:		else
;1353:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $665
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
LABELV $663
line 1355
;1354:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1355:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1356
;1356:		break;
ADDRGP4 $656
JUMPV
LABELV $666
line 1358
;1357:	case SAY_TELL:
;1358:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $667
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $667
ADDRLP4 304
CNSTI4 524
ASGNI4
ADDRLP4 308
CNSTI4 2568
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
NEI4 $667
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
EQI4 $667
line 1361
;1359:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1360:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1361:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $670
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
ADDRGP4 $668
JUMPV
LABELV $667
line 1363
;1362:		else
;1363:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
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
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $668
line 1364
;1364:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1365
;1365:		break;
ADDRGP4 $656
JUMPV
LABELV $672
line 1367
;1366:	case SAY_INVAL:
;1367:		G_LogPrintf( "Invalid During Intermission: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $673
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
line 1368
;1368:		Com_sprintf (name, sizeof(name), "[Invalid During Intermission%c%c]: ", Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $674
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1369
;1369:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1370
;1370:		target = ent;
ADDRFP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1371
;1371:		break;
LABELV $656
line 1374
;1372:	}
;1373:
;1374:	Q_strncpyz( text, chatText, sizeof(text) );
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
line 1376
;1375:
;1376:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $676
line 1377
;1377:		G_SayTo( ent, target, mode, color, name, text );
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
line 1378
;1378:		return;
ADDRGP4 $651
JUMPV
LABELV $676
line 1382
;1379:	}
;1380:
;1381:	// echo the text to the console
;1382:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $678
line 1383
;1383:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $681
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1384
;1384:	}
LABELV $678
line 1387
;1385:
;1386:	// send it to all the apropriate clients
;1387:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1388
;1388:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1389
;1389:		G_SayTo( ent, other, mode, color, name, text );
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
line 1390
;1390:	}
LABELV $683
line 1387
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $685
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $682
line 1391
;1391:}
LABELV $651
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1399
;1392:
;1393:
;1394:/*
;1395:==================
;1396:Cmd_Say_f
;1397:==================
;1398:*/
;1399:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1402
;1400:	char		*p;
;1401:
;1402:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $688
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $688
line 1403
;1403:		return;
ADDRGP4 $687
JUMPV
LABELV $688
line 1406
;1404:	}
;1405:
;1406:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $690
line 1407
;1407:	{
line 1408
;1408:		p = ConcatArgs( 0 );
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
line 1409
;1409:	}
ADDRGP4 $691
JUMPV
LABELV $690
line 1411
;1410:	else
;1411:	{
line 1412
;1412:		p = ConcatArgs( 1 );
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
line 1413
;1413:	}
LABELV $691
line 1415
;1414:
;1415:	G_Say( ent, NULL, mode, p );
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
line 1416
;1416:}
LABELV $687
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1423
;1417:
;1418:/*
;1419:==================
;1420:Cmd_Tell_f
;1421:==================
;1422:*/
;1423:static void Cmd_Tell_f( gentity_t *ent ) {
line 1429
;1424:	int			targetNum;
;1425:	gentity_t	*target;
;1426:	char		*p;
;1427:	char		arg[MAX_TOKEN_CHARS];
;1428:
;1429:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $693
line 1430
;1430:		return;
ADDRGP4 $692
JUMPV
LABELV $693
line 1433
;1431:	}
;1432:
;1433:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1434
;1434:	targetNum = atoi( arg );
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
line 1435
;1435:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $698
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $695
LABELV $698
line 1436
;1436:		return;
ADDRGP4 $692
JUMPV
LABELV $695
line 1439
;1437:	}
;1438:
;1439:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1440
;1440:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $702
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $702
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $699
LABELV $702
line 1441
;1441:		return;
ADDRGP4 $692
JUMPV
LABELV $699
line 1444
;1442:	}
;1443:
;1444:	p = ConcatArgs( 2 );
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
line 1446
;1445:
;1446:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $703
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
line 1447
;1447:	G_Say( ent, target, SAY_TELL, p );
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
line 1450
;1448:	// don't tell to the player self if it was already directed to this player
;1449:	// also don't send the chat back to a bot
;1450:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $704
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $704
line 1451
;1451:		G_Say( ent, ent, SAY_TELL, p );
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
line 1452
;1452:	}
LABELV $704
line 1453
;1453:}
LABELV $692
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1456
;1454:
;1455:
;1456:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1460
;1457:	int color;
;1458:	char *cmd;
;1459:
;1460:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $707
line 1461
;1461:		return;
ADDRGP4 $706
JUMPV
LABELV $707
line 1463
;1462:	}
;1463:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $709
line 1464
;1464:		return;
ADDRGP4 $706
JUMPV
LABELV $709
line 1466
;1465:	}
;1466:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $711
line 1467
;1467:		return;
ADDRGP4 $706
JUMPV
LABELV $711
line 1469
;1468:	}
;1469:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $713
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
NEI4 $713
line 1470
;1470:		return;
ADDRGP4 $706
JUMPV
LABELV $713
line 1473
;1471:	}
;1472:	// no chatting to players in tournements
;1473:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $715
line 1474
;1474:		return;
ADDRGP4 $706
JUMPV
LABELV $715
line 1477
;1475:	}
;1476:
;1477:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $718
line 1478
;1478:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1479
;1479:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $720
ASGNP4
line 1480
;1480:	}
ADDRGP4 $719
JUMPV
LABELV $718
line 1481
;1481:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $721
line 1482
;1482:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1483
;1483:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $723
ASGNP4
line 1484
;1484:	}
ADDRGP4 $722
JUMPV
LABELV $721
line 1485
;1485:	else {
line 1486
;1486:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1487
;1487:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $724
ASGNP4
line 1488
;1488:	}
LABELV $722
LABELV $719
line 1490
;1489:
;1490:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $725
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
line 1491
;1491:}
LABELV $706
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1493
;1492:
;1493:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1497
;1494:	int			j;
;1495:	gentity_t	*other;
;1496:
;1497:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $727
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $727
line 1498
;1498:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1499
;1499:	}
LABELV $727
line 1501
;1500:
;1501:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $730
line 1502
;1502:		G_VoiceTo( ent, target, mode, id, voiceonly );
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
line 1503
;1503:		return;
ADDRGP4 $726
JUMPV
LABELV $730
line 1507
;1504:	}
;1505:
;1506:	// echo the text to the console
;1507:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $732
line 1508
;1508:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $735
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
line 1509
;1509:	}
LABELV $732
line 1512
;1510:
;1511:	// send it to all the apropriate clients
;1512:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $739
JUMPV
LABELV $736
line 1513
;1513:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1514
;1514:		G_VoiceTo( ent, other, mode, id, voiceonly );
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
line 1515
;1515:	}
LABELV $737
line 1512
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $739
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $736
line 1516
;1516:}
LABELV $726
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1523
;1517:
;1518:/*
;1519:==================
;1520:Cmd_Voice_f
;1521:==================
;1522:*/
;1523:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1526
;1524:	char		*p;
;1525:
;1526:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $742
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $742
line 1527
;1527:		return;
ADDRGP4 $741
JUMPV
LABELV $742
line 1530
;1528:	}
;1529:
;1530:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $744
line 1531
;1531:	{
line 1532
;1532:		p = ConcatArgs( 0 );
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
line 1533
;1533:	}
ADDRGP4 $745
JUMPV
LABELV $744
line 1535
;1534:	else
;1535:	{
line 1536
;1536:		p = ConcatArgs( 1 );
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
line 1537
;1537:	}
LABELV $745
line 1539
;1538:
;1539:	G_Voice( ent, NULL, mode, p, voiceonly );
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
line 1540
;1540:}
LABELV $741
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1547
;1541:
;1542:/*
;1543:==================
;1544:Cmd_VoiceTell_f
;1545:==================
;1546:*/
;1547:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1553
;1548:	int			targetNum;
;1549:	gentity_t	*target;
;1550:	char		*id;
;1551:	char		arg[MAX_TOKEN_CHARS];
;1552:
;1553:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $747
line 1554
;1554:		return;
ADDRGP4 $746
JUMPV
LABELV $747
line 1557
;1555:	}
;1556:
;1557:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1558
;1558:	targetNum = atoi( arg );
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
line 1559
;1559:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $752
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $749
LABELV $752
line 1560
;1560:		return;
ADDRGP4 $746
JUMPV
LABELV $749
line 1563
;1561:	}
;1562:
;1563:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1564
;1564:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $756
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $756
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $753
LABELV $756
line 1565
;1565:		return;
ADDRGP4 $746
JUMPV
LABELV $753
line 1568
;1566:	}
;1567:
;1568:	id = ConcatArgs( 2 );
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
line 1570
;1569:
;1570:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $757
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
line 1571
;1571:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
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
line 1574
;1572:	// don't tell to the player self if it was already directed to this player
;1573:	// also don't send the chat back to a bot
;1574:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
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
EQU4 $758
ADDRLP4 1068
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $758
line 1575
;1575:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
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
line 1576
;1576:	}
LABELV $758
line 1577
;1577:}
LABELV $746
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1585
;1578:
;1579:
;1580:/*
;1581:==================
;1582:Cmd_VoiceTaunt_f
;1583:==================
;1584:*/
;1585:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1589
;1586:	gentity_t *who;
;1587:	int i;
;1588:
;1589:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $761
line 1590
;1590:		return;
ADDRGP4 $760
JUMPV
LABELV $761
line 1594
;1591:	}
;1592:
;1593:	// insult someone who just killed you
;1594:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
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
EQU4 $763
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
EQU4 $763
ADDRLP4 20
INDIRP4
CNSTI4 2668
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $763
line 1596
;1595:		// i am a dead corpse
;1596:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
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
NEI4 $765
line 1597
;1597:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $767
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1598
;1598:		}
LABELV $765
line 1599
;1599:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $768
line 1600
;1600:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
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
ADDRGP4 $767
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1601
;1601:		}
LABELV $768
line 1602
;1602:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 1603
;1603:		return;
ADDRGP4 $760
JUMPV
LABELV $763
line 1606
;1604:	}
;1605:	// insult someone you just killed
;1606:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
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
CNSTI4 2668
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $770
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $770
line 1607
;1607:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2668
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1608
;1608:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $772
line 1610
;1609:			// who is the person I just killed
;1610:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
INDIRI4
CNSTI4 2
NEI4 $774
line 1611
;1611:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $776
line 1612
;1612:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $778
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1613
;1613:				}
LABELV $776
line 1614
;1614:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $775
line 1615
;1615:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
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
ADDRGP4 $778
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1616
;1616:				}
line 1617
;1617:			} else {
ADDRGP4 $775
JUMPV
LABELV $774
line 1618
;1618:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $781
line 1619
;1619:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $783
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1620
;1620:				}
LABELV $781
line 1621
;1621:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $784
line 1622
;1622:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
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
ADDRGP4 $783
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1623
;1623:				}
LABELV $784
line 1624
;1624:			}
LABELV $775
line 1625
;1625:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2668
ADDP4
CNSTI4 -1
ASGNI4
line 1626
;1626:			return;
ADDRGP4 $760
JUMPV
LABELV $772
line 1628
;1627:		}
;1628:	}
LABELV $770
line 1630
;1629:
;1630:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $786
line 1632
;1631:		// praise a team mate who just got a reward
;1632:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $789
line 1633
;1633:			who = g_entities + i;
ADDRLP4 0
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1634
;1634:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
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
EQU4 $793
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
EQU4 $793
ADDRLP4 48
CNSTI4 2568
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
NEI4 $793
line 1635
;1635:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $795
line 1636
;1636:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $798
line 1637
;1637:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $800
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1638
;1638:					}
LABELV $798
line 1639
;1639:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $760
line 1640
;1640:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
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
ADDRGP4 $800
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1641
;1641:					}
line 1642
;1642:					return;
ADDRGP4 $760
JUMPV
LABELV $795
line 1644
;1643:				}
;1644:			}
LABELV $793
line 1645
;1645:		}
LABELV $790
line 1632
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $789
line 1646
;1646:	}
LABELV $786
line 1649
;1647:
;1648:	// just say something
;1649:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
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
ADDRGP4 $803
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1650
;1650:}
LABELV $760
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $804
address $805
address $806
address $807
address $808
address $809
address $810
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1664
;1651:
;1652:
;1653:
;1654:static char	*gc_orders[] = {
;1655:	"hold your position",
;1656:	"hold this position",
;1657:	"come here",
;1658:	"cover me",
;1659:	"guard location",
;1660:	"search and destroy",
;1661:	"report"
;1662:};
;1663:
;1664:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1669
;1665:	int		player;
;1666:	int		order;
;1667:	char	str[MAX_TOKEN_CHARS];
;1668:
;1669:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1670
;1670:	player = atoi( str );
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
line 1671
;1671:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1672
;1672:	order = atoi( str );
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
line 1674
;1673:
;1674:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $814
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $812
LABELV $814
line 1675
;1675:		return;
ADDRGP4 $811
JUMPV
LABELV $812
line 1677
;1676:	}
;1677:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $817
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $815
LABELV $817
line 1678
;1678:		return;
ADDRGP4 $811
JUMPV
LABELV $815
line 1680
;1679:	}
;1680:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
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
line 1681
;1681:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
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
line 1682
;1682:}
LABELV $811
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1689
;1683:
;1684:/*
;1685:==================
;1686:Cmd_Where_f
;1687:==================
;1688:*/
;1689:void Cmd_Where_f( gentity_t *ent ) {
line 1690
;1690:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $819
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
line 1691
;1691:}
LABELV $818
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $820
address $821
address $822
address $823
address $824
address $825
address $826
address $827
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3136 24
line 1709
;1692:
;1693:static const char *gameNames[] = {
;1694:	"Free For All",
;1695:	"Tournament",
;1696:	"Single Player",
;1697:	"Team Deathmatch",
;1698:	"Capture the Flag",
;1699:	"One Flag CTF",
;1700:	"Overload",
;1701:	"Harvester"
;1702:};
;1703:
;1704:/*
;1705:==================
;1706:Cmd_CallVote_f
;1707:==================
;1708:*/
;1709:void Cmd_CallVote_f( gentity_t *ent ) {
line 1714
;1710:	int		i;
;1711:	char	arg1[MAX_STRING_TOKENS];
;1712:	char	arg2[MAX_STRING_TOKENS];
;1713:
;1714:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $829
line 1715
;1715:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $832
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1716
;1716:		return;
ADDRGP4 $828
JUMPV
LABELV $829
line 1719
;1717:	}
;1718:
;1719:	if ( level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
EQI4 $833
line 1720
;1720:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
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
ADDRGP4 $836
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1721
;1721:		return;
ADDRGP4 $828
JUMPV
LABELV $833
line 1723
;1722:	}
;1723:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $837
line 1724
;1724:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
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
ADDRGP4 $839
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1725
;1725:		return;
ADDRGP4 $828
JUMPV
LABELV $837
line 1727
;1726:	}
;1727:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $840
line 1728
;1728:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $842
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1729
;1729:		return;
ADDRGP4 $828
JUMPV
LABELV $840
line 1733
;1730:	}
;1731:
;1732:	// make sure it is a valid command to vote on
;1733:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1734
;1734:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1736
;1735:
;1736:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $845
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
EQU4 $843
LABELV $845
line 1737
;1737:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1738
;1738:		return;
ADDRGP4 $828
JUMPV
LABELV $843
line 1741
;1739:	}
;1740:
;1741:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $849
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $847
line 1742
;1742:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $848
JUMPV
LABELV $847
ADDRLP4 4
ARGP4
ADDRGP4 $852
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $850
line 1743
;1743:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 4
ARGP4
ADDRGP4 $855
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $853
line 1744
;1744:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $854
JUMPV
LABELV $853
ADDRLP4 4
ARGP4
ADDRGP4 $858
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $856
line 1745
;1745:	} else if ( !Q_stricmp( arg1, "balanceteams" ) ) {
ADDRGP4 $857
JUMPV
LABELV $856
ADDRLP4 4
ARGP4
ADDRGP4 $861
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $859
line 1746
;1746:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $860
JUMPV
LABELV $859
ADDRLP4 4
ARGP4
ADDRGP4 $864
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $862
line 1747
;1747:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $863
JUMPV
LABELV $862
ADDRLP4 4
ARGP4
ADDRGP4 $867
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $865
line 1748
;1748:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $866
JUMPV
LABELV $865
ADDRLP4 4
ARGP4
ADDRGP4 $870
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $868
line 1749
;1749:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $869
JUMPV
LABELV $868
ADDRLP4 4
ARGP4
ADDRGP4 $873
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $871
line 1750
;1750:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $872
JUMPV
LABELV $871
ADDRLP4 4
ARGP4
ADDRGP4 $876
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $874
line 1751
;1751:	} else {
ADDRGP4 $875
JUMPV
LABELV $874
line 1752
;1752:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1753
;1753:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
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
line 1754
;1754:		return;
ADDRGP4 $828
JUMPV
LABELV $875
LABELV $872
LABELV $869
LABELV $866
LABELV $863
LABELV $860
LABELV $857
LABELV $854
LABELV $851
LABELV $848
line 1758
;1755:	}
;1756:
;1757:	// if there is still a vote to be executed
;1758:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2420
INDIRI4
CNSTI4 0
EQI4 $878
line 1759
;1759:		level.voteExecuteTime = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1760
;1760:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $882
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
line 1761
;1761:	}
LABELV $878
line 1764
;1762:
;1763:	// special case for g_gametype, check for bad values
;1764:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $858
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $884
line 1765
;1765:		i = atoi( arg2 );
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
line 1766
;1766:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $889
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $889
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $886
LABELV $889
line 1767
;1767:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
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
ADDRGP4 $890
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1768
;1768:			return;
ADDRGP4 $828
JUMPV
LABELV $886
line 1771
;1769:		}
;1770:
;1771:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $893
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1772
;1772:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $896
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
line 1773
;1773:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $885
JUMPV
LABELV $884
ADDRLP4 4
ARGP4
ADDRGP4 $855
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $897
line 1778
;1774:		// special case for map changes, we want to reset the nextmap setting
;1775:		// this allows a player to change maps, but not upset the map rotation
;1776:		char	s[MAX_STRING_CHARS];
;1777:
;1778:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $852
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1779
;1779:		if (*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $899
line 1780
;1780:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $903
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
line 1781
;1781:		} else {
ADDRGP4 $900
JUMPV
LABELV $899
line 1782
;1782:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $896
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1783
;1783:		}
LABELV $900
line 1784
;1784:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $908
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1785
;1785:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $898
JUMPV
LABELV $897
ADDRLP4 4
ARGP4
ADDRGP4 $852
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $910
line 1788
;1786:		char	s[MAX_STRING_CHARS];
;1787:
;1788:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $852
ARGP4
ADDRLP4 2112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1789
;1789:		if (!*s) {
ADDRLP4 2112
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $912
line 1790
;1790:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
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
ADDRGP4 $914
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1791
;1791:			return;
ADDRGP4 $828
JUMPV
LABELV $912
line 1793
;1792:		}
;1793:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $917
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1794
;1794:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $908
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1795
;1795:	} else {
ADDRGP4 $911
JUMPV
LABELV $910
line 1796
;1796:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $923
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1797
;1797:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $908
ARGP4
ADDRGP4 level+368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1798
;1798:	}
LABELV $911
LABELV $898
LABELV $885
line 1800
;1799:
;1800:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $927
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
line 1803
;1801:
;1802:	// start the voting, the caller autoamtically votes yes
;1803:	level.voteTime = level.time;
ADDRGP4 level+2416
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1804
;1804:	level.voteYes = 1;
ADDRGP4 level+2424
CNSTI4 1
ASGNI4
line 1805
;1805:	level.voteNo = 0;
ADDRGP4 level+2428
CNSTI4 0
ASGNI4
line 1807
;1806:
;1807:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $935
JUMPV
LABELV $932
line 1808
;1808:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 3492
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
line 1809
;1809:	}
LABELV $933
line 1807
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $935
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $932
line 1810
;1810:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1812
;1811:
;1812:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $937
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
line 1813
;1813:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1392
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1814
;1814:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $937
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
line 1815
;1815:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $937
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
line 1816
;1816:}
LABELV $828
endproc Cmd_CallVote_f 3136 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1823
;1817:
;1818:/*
;1819:==================
;1820:Cmd_Vote_f
;1821:==================
;1822:*/
;1823:void Cmd_Vote_f( gentity_t *ent ) {
line 1826
;1824:	char		msg[64];
;1825:
;1826:	if ( !level.voteTime ) {
ADDRGP4 level+2416
INDIRI4
CNSTI4 0
NEI4 $943
line 1827
;1827:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
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
ADDRGP4 $946
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1828
;1828:		return;
ADDRGP4 $942
JUMPV
LABELV $943
line 1830
;1829:	}
;1830:	if ( ent->client->ps.eFlags & EF_VOTED ) {
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
EQI4 $947
line 1831
;1831:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
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
ADDRGP4 $949
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1832
;1832:		return;
ADDRGP4 $942
JUMPV
LABELV $947
line 1834
;1833:	}
;1834:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $950
line 1835
;1835:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $952
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1836
;1836:		return;
ADDRGP4 $942
JUMPV
LABELV $950
line 1839
;1837:	}
;1838:
;1839:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
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
ADDRGP4 $953
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1841
;1840:
;1841:	ent->client->ps.eFlags |= EF_VOTED;
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
line 1843
;1842:
;1843:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1845
;1844:
;1845:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $959
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $959
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $954
LABELV $959
line 1846
;1846:		level.voteYes++;
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
line 1847
;1847:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $937
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
line 1848
;1848:	} else {
ADDRGP4 $955
JUMPV
LABELV $954
line 1849
;1849:		level.voteNo++;
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
line 1850
;1850:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $937
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
line 1851
;1851:	}
LABELV $955
line 1855
;1852:
;1853:	// a majority will be determined in CheckVote, which will also account
;1854:	// for players entering or leaving
;1855:}
LABELV $942
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1862
;1856:
;1857:/*
;1858:==================
;1859:Cmd_CallTeamVote_f
;1860:==================
;1861:*/
;1862:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1867
;1863:	int		i, team, cs_offset;
;1864:	char	arg1[MAX_STRING_TOKENS];
;1865:	char	arg2[MAX_STRING_TOKENS];
;1866:
;1867:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ASGNI4
line 1868
;1868:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $965
line 1869
;1869:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $966
JUMPV
LABELV $965
line 1870
;1870:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $964
line 1871
;1871:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1873
;1872:	else
;1873:		return;
LABELV $968
LABELV $966
line 1875
;1874:
;1875:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $969
line 1876
;1876:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $832
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1877
;1877:		return;
ADDRGP4 $964
JUMPV
LABELV $969
line 1880
;1878:	}
;1879:
;1880:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $972
line 1881
;1881:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
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
ADDRGP4 $975
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1882
;1882:		return;
ADDRGP4 $964
JUMPV
LABELV $972
line 1884
;1883:	}
;1884:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $976
line 1885
;1885:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
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
ADDRGP4 $978
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1886
;1886:		return;
ADDRGP4 $964
JUMPV
LABELV $976
line 1888
;1887:	}
;1888:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $979
line 1889
;1889:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $842
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1890
;1890:		return;
ADDRGP4 $964
JUMPV
LABELV $979
line 1894
;1891:	}
;1892:
;1893:	// make sure it is a valid command to vote on
;1894:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1895
;1895:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1896
;1896:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $984
JUMPV
LABELV $981
line 1897
;1897:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $985
line 1898
;1898:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $987
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $985
line 1899
;1899:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
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
line 1900
;1900:	}
LABELV $982
line 1896
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $984
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $981
line 1902
;1901:
;1902:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
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
NEU4 $990
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
EQU4 $988
LABELV $990
line 1903
;1903:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1904
;1904:		return;
ADDRGP4 $964
JUMPV
LABELV $988
line 1907
;1905:	}
;1906:
;1907:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $993
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $991
line 1910
;1908:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1909:
;1910:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $994
line 1911
;1911:			i = ent->client->ps.clientNum;
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
line 1912
;1912:		}
ADDRGP4 $995
JUMPV
LABELV $994
line 1913
;1913:		else {
line 1915
;1914:			// numeric values are just slot numbers
;1915:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $996
line 1916
;1916:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
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
EQI4 $1003
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $1003
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $1000
LABELV $1003
line 1917
;1917:					break;
ADDRGP4 $998
JUMPV
LABELV $1000
line 1918
;1918:			}
LABELV $997
line 1915
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $996
LABELV $998
line 1919
;1919:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $1006
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1004
LABELV $1006
line 1920
;1920:				i = atoi( arg2 );
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
line 1921
;1921:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1010
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1007
LABELV $1010
line 1922
;1922:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $332
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
line 1923
;1923:					return;
ADDRGP4 $964
JUMPV
LABELV $1007
line 1926
;1924:				}
;1925:
;1926:				if ( !g_entities[i].inuse ) {
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1005
line 1927
;1927:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $335
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
line 1928
;1928:					return;
ADDRGP4 $964
JUMPV
line 1930
;1929:				}
;1930:			}
LABELV $1004
line 1931
;1931:			else {
line 1932
;1932:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1933
;1933:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1934
;1934:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1017
JUMPV
LABELV $1014
line 1935
;1935:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3492
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
NEI4 $1019
line 1936
;1936:						continue;
ADDRGP4 $1015
JUMPV
LABELV $1019
line 1937
;1937:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $1021
line 1938
;1938:						continue;
ADDRGP4 $1015
JUMPV
LABELV $1021
line 1939
;1939:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3492
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
line 1940
;1940:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1941
;1941:					if ( !Q_stricmp(netname, leader) ) {
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
NEI4 $1023
line 1942
;1942:						break;
ADDRGP4 $1016
JUMPV
LABELV $1023
line 1944
;1943:					}
;1944:				}
LABELV $1015
line 1934
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1017
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1014
LABELV $1016
line 1945
;1945:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1025
line 1946
;1946:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $1028
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
line 1947
;1947:					return;
ADDRGP4 $964
JUMPV
LABELV $1025
line 1949
;1948:				}
;1949:			}
LABELV $1005
line 1950
;1950:		}
LABELV $995
line 1951
;1951:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $438
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1952
;1952:	} else {
ADDRGP4 $992
JUMPV
LABELV $991
line 1953
;1953:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1954
;1954:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $1029
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1955
;1955:		return;
ADDRGP4 $964
JUMPV
LABELV $992
line 1958
;1956:	}
;1957:
;1958:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2436
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $896
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1960
;1959:
;1960:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1035
JUMPV
LABELV $1032
line 1961
;1961:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3492
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
NEI4 $1037
line 1962
;1962:			continue;
ADDRGP4 $1033
JUMPV
LABELV $1037
line 1963
;1963:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1039
line 1964
;1964:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $1041
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
LABELV $1039
line 1965
;1965:	}
LABELV $1033
line 1960
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1035
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1032
line 1968
;1966:
;1967:	// start the voting, the caller autoamtically votes yes
;1968:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1969
;1969:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 1
ASGNI4
line 1970
;1970:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 1972
;1971:
;1972:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1049
JUMPV
LABELV $1046
line 1973
;1973:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $1051
line 1974
;1974:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3492
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
LABELV $1051
line 1975
;1975:	}
LABELV $1047
line 1972
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1049
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1046
line 1976
;1976:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 1978
;1977:
;1978:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $937
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
line 1979
;1979:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
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
line 1980
;1980:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $937
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
line 1981
;1981:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $937
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
line 1982
;1982:}
LABELV $964
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_ListPlayers_f
proc Cmd_ListPlayers_f 2108 16
line 1993
;1983:
;1984:
;1985:
;1986:/*
;1987:======================================
;1988:  ListPlayers
;1989:
;1990:  Please clean this up
;1991:======================================
;1992:*/
;1993:void Cmd_ListPlayers_f ( gentity_t *ent ) {
line 2006
;1994:
;1995:int		i;
;1996:int		j;
;1997:int		l;
;1998:int		h;
;1999:int		clientNum;
;2000:int		ping;
;2001:int		score;
;2002:char	userinfo[MAX_INFO_STRING];
;2003:char	*value;
;2004:char		n2[MAX_STRING_CHARS];
;2005:		
;2006:		trap_SendServerCommand( ent-g_entities, va("print \"CLIENT LIST\""));
ADDRGP4 $1058
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
line 2007
;2007:		trap_SendServerCommand( ent-g_entities, va("print \"Client  -  Name                   - Ping   -  Score - GUID\""));
ADDRGP4 $1059
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
line 2008
;2008:		trap_SendServerCommand( ent-g_entities, va("print \"---------------------------------------------------------------------------------------\""));
ADDRGP4 $1060
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
line 2010
;2009:
;2010:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1064
JUMPV
LABELV $1061
line 2012
;2011:	
;2012:			if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3492
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
NEI4 $1066
line 2013
;2013:				continue;
ADDRGP4 $1062
JUMPV
LABELV $1066
line 2016
;2014:			}
;2015:				
;2016:			clientNum = level.clients[i].ps.clientNum;
ADDRLP4 12
CNSTI4 3492
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
line 2018
;2017:			
;2018:			ping = level.clients[i].ps.ping;
ADDRLP4 2068
CNSTI4 3492
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
line 2019
;2019:			score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 2072
CNSTI4 3492
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
line 2021
;2020:			
;2021:			trap_SendServerCommand( ent-g_entities, va("print \"%i  - %s\"", clientNum, level.clients[i].pers.netname ));
ADDRGP4 $1068
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3492
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
line 2023
;2022:			
;2023:			SanitizeString( level.clients[i].pers.netname, n2 );
CNSTI4 3492
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
line 2024
;2024:			Q_CleanStr(n2);
ADDRLP4 1040
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2025
;2025:			l = strlen(n2);
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
line 2026
;2026:			h = 20 - l;
ADDRLP4 4
CNSTI4 20
ADDRLP4 2064
INDIRI4
SUBI4
ASGNI4
line 2027
;2027:				for ( j = 0 ; j < h ; j++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1072
JUMPV
LABELV $1069
line 2028
;2028:					G_Printf(" ");
ADDRGP4 $987
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2029
;2029:				}
LABELV $1070
line 2027
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1072
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1069
line 2030
;2030:			trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 2031
;2031:			value = Info_ValueForKey (userinfo, "cl_guid");
ADDRLP4 16
ARGP4
ADDRGP4 $1073
ARGP4
ADDRLP4 2100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2076
ADDRLP4 2100
INDIRP4
ASGNP4
line 2032
;2032:			trap_SendServerCommand( ent-g_entities, va("print \"  -  %i  -  %i  -  %s\n\"", ping, score, value ));
ADDRGP4 $1074
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
line 2034
;2033:		
;2034:		}
LABELV $1062
line 2010
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1064
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1061
line 2036
;2035:
;2036:}
LABELV $1057
endproc Cmd_ListPlayers_f 2108 16
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 2043
;2037:
;2038:/*
;2039:==================
;2040:Cmd_TeamVote_f
;2041:==================
;2042:*/
;2043:void Cmd_TeamVote_f( gentity_t *ent ) {
line 2047
;2044:	int			team, cs_offset;
;2045:	char		msg[64];
;2046:
;2047:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ASGNI4
line 2048
;2048:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1076
line 2049
;2049:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1077
JUMPV
LABELV $1076
line 2050
;2050:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $1075
line 2051
;2051:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 2053
;2052:	else
;2053:		return;
LABELV $1079
LABELV $1077
line 2055
;2054:
;2055:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1080
line 2056
;2056:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
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
ADDRGP4 $1083
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2057
;2057:		return;
ADDRGP4 $1075
JUMPV
LABELV $1080
line 2059
;2058:	}
;2059:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
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
EQI4 $1084
line 2060
;2060:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
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
ADDRGP4 $1086
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2061
;2061:		return;
ADDRGP4 $1075
JUMPV
LABELV $1084
line 2063
;2062:	}
;2063:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1087
line 2064
;2064:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $952
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2065
;2065:		return;
ADDRGP4 $1075
JUMPV
LABELV $1087
line 2068
;2066:	}
;2067:
;2068:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
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
ADDRGP4 $1089
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2070
;2069:
;2070:	ent->client->ps.eFlags |= EF_TEAMVOTED;
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
line 2072
;2071:
;2072:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2074
;2073:
;2074:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1095
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1095
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1090
LABELV $1095
line 2075
;2075:		level.teamVoteYes[cs_offset]++;
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
line 2076
;2076:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $937
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
line 2077
;2077:	} else {
ADDRGP4 $1091
JUMPV
LABELV $1090
line 2078
;2078:		level.teamVoteNo[cs_offset]++;
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
line 2079
;2079:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $937
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
line 2080
;2080:	}
LABELV $1091
line 2084
;2081:
;2082:	// a majority will be determined in TeamCheckVote, which will also account
;2083:	// for players entering or leaving
;2084:}
LABELV $1075
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2092
;2085:
;2086:
;2087:/*
;2088:=================
;2089:Cmd_SetViewpos_f
;2090:=================
;2091:*/
;2092:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 2097
;2093:	vec3_t		origin, angles;
;2094:	char		buffer[MAX_TOKEN_CHARS];
;2095:	int			i;
;2096:
;2097:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1101
line 2098
;2098:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $301
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
line 2099
;2099:		return;
ADDRGP4 $1100
JUMPV
LABELV $1101
line 2101
;2100:	}
;2101:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1104
line 2102
;2102:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1106
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
line 2103
;2103:		return;
ADDRGP4 $1100
JUMPV
LABELV $1104
line 2106
;2104:	}
;2105:
;2106:	VectorClear( angles );
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
line 2107
;2107:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1109
line 2108
;2108:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
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
line 2109
;2109:		origin[i] = atof( buffer );
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
line 2110
;2110:	}
LABELV $1110
line 2107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1109
line 2112
;2111:
;2112:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2113
;2113:	angles[YAW] = atof( buffer );
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
line 2115
;2114:
;2115:	TeleportPlayer( ent, origin, angles );
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
line 2116
;2116:}
LABELV $1100
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 2125
;2117:
;2118:
;2119:
;2120:/*
;2121:=================
;2122:Cmd_Stats_f
;2123:=================
;2124:*/
;2125:void Cmd_Stats_f( gentity_t *ent ) {
line 2140
;2126:/*
;2127:	int max, n, i;
;2128:
;2129:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;2130:
;2131:	n = 0;
;2132:	for ( i = 0; i < max; i++ ) {
;2133:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;2134:			n++;
;2135:	}
;2136:
;2137:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;2138:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;2139:*/
;2140:}
LABELV $1114
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1192 16
line 2147
;2141:
;2142:/*
;2143:=================
;2144:ClientCommand
;2145:=================
;2146:*/
;2147:void ClientCommand( int clientNum ) {
line 2151
;2148:	gentity_t *ent;
;2149:	char	cmd[MAX_TOKEN_CHARS];
;2150:
;2151:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2152
;2152:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1116
line 2153
;2153:		return;		// not fully in game yet
ADDRGP4 $1115
JUMPV
LABELV $1116
line 2157
;2154:	}
;2155:
;2156:
;2157:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2159
;2158:
;2159:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1120
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1118
line 2160
;2160:		Cmd_Say_f (ent, SAY_ALL, qfalse);
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
line 2161
;2161:		return;
ADDRGP4 $1115
JUMPV
LABELV $1118
line 2163
;2162:	}
;2163:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1123
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1121
line 2164
;2164:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
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
line 2165
;2165:		return;
ADDRGP4 $1115
JUMPV
LABELV $1121
line 2167
;2166:	}
;2167:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1126
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1124
line 2168
;2168:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2169
;2169:		return;
ADDRGP4 $1115
JUMPV
LABELV $1124
line 2171
;2170:	}
;2171:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1129
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1127
line 2172
;2172:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
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
line 2173
;2173:		return;
ADDRGP4 $1115
JUMPV
LABELV $1127
line 2175
;2174:	}
;2175:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1132
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1130
line 2176
;2176:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
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
line 2177
;2177:		return;
ADDRGP4 $1115
JUMPV
LABELV $1130
line 2179
;2178:	}
;2179:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $723
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1133
line 2180
;2180:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2181
;2181:		return;
ADDRGP4 $1115
JUMPV
LABELV $1133
line 2183
;2182:	}
;2183:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1135
line 2184
;2184:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
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
line 2185
;2185:		return;
ADDRGP4 $1115
JUMPV
LABELV $1135
line 2187
;2186:	}
;2187:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1140
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1138
line 2188
;2188:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
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
line 2189
;2189:		return;
ADDRGP4 $1115
JUMPV
LABELV $1138
line 2191
;2190:	}
;2191:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1143
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1141
line 2192
;2192:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2193
;2193:		return;
ADDRGP4 $1115
JUMPV
LABELV $1141
line 2195
;2194:	}
;2195:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1146
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1144
line 2196
;2196:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2197
;2197:		return;
ADDRGP4 $1115
JUMPV
LABELV $1144
line 2199
;2198:	}
;2199:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1147
line 2200
;2200:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2201
;2201:		return;
ADDRGP4 $1115
JUMPV
LABELV $1147
line 2205
;2202:	}
;2203:
;2204:	// ignore all other commands when at intermission
;2205:	if (level.intermissiontime) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $1149
line 2206
;2206:		Cmd_Say_f (ent, SAY_INVAL, qtrue);
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
line 2207
;2207:		return;
ADDRGP4 $1115
JUMPV
LABELV $1149
line 2210
;2208:	}
;2209:
;2210:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1154
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1152
line 2211
;2211:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2212
;2212:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1157
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1155
line 2213
;2213:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1156
JUMPV
LABELV $1155
line 2214
;2214:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1160
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1158
line 2215
;2215:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1159
JUMPV
LABELV $1158
line 2216
;2216:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1163
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1161
line 2217
;2217:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1162
JUMPV
LABELV $1161
line 2218
;2218:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1166
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1164
line 2219
;2219:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1165
JUMPV
LABELV $1164
line 2220
;2220:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1167
line 2221
;2221:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1168
JUMPV
LABELV $1167
line 2222
;2222:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1171
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1169
line 2223
;2223:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1170
JUMPV
LABELV $1169
line 2224
;2224:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1174
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1172
line 2225
;2225:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1173
JUMPV
LABELV $1172
line 2226
;2226:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1177
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1175
line 2227
;2227:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1176
JUMPV
LABELV $1175
line 2228
;2228:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1180
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1178
line 2229
;2229:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1179
JUMPV
LABELV $1178
line 2230
;2230:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1183
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1181
line 2231
;2231:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1182
JUMPV
LABELV $1181
line 2232
;2232:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1186
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1184
line 2233
;2233:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1185
JUMPV
LABELV $1184
line 2234
;2234:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1189
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1187
line 2235
;2235:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1188
JUMPV
LABELV $1187
line 2236
;2236:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1192
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1190
line 2237
;2237:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1191
JUMPV
LABELV $1190
line 2238
;2238:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1195
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1193
line 2239
;2239:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1194
JUMPV
LABELV $1193
line 2240
;2240:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1198
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1196
line 2241
;2241:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1197
JUMPV
LABELV $1196
line 2242
;2242:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1201
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1199
line 2243
;2243:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1200
JUMPV
LABELV $1199
line 2244
;2244:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1204
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1202
line 2245
;2245:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1203
JUMPV
LABELV $1202
line 2246
;2246:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1207
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1205
line 2247
;2247:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1206
JUMPV
LABELV $1205
line 2248
;2248:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1210
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1208
line 2249
;2249:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $1209
JUMPV
LABELV $1208
line 2250
;2250:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1213
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1211
line 2251
;2251:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $1212
JUMPV
LABELV $1211
line 2252
;2252:	else if (Q_stricmp (cmd, "spawnturret") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1216
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1214
line 2253
;2253:		Cmd_SpawnTurret_f( ent, 0 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1215
JUMPV
LABELV $1214
line 2254
;2254:	else if (Q_stricmp (cmd, "spawnturret2") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1219
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1217
line 2255
;2255:		Cmd_SpawnTurret_f( ent, 1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1218
JUMPV
LABELV $1217
line 2256
;2256:	else if (Q_stricmp (cmd, "spawnturret3") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1222
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1220
line 2257
;2257:		Cmd_SpawnTurret_f( ent, 2 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Cmd_SpawnTurret_f
CALLV
pop
ADDRGP4 $1221
JUMPV
LABELV $1220
line 2258
;2258:	else if (Q_stricmp (cmd, "spawngen") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1225
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1223
line 2259
;2259:		Cmd_SpawnGenerator_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnGenerator_f
CALLV
pop
ADDRGP4 $1224
JUMPV
LABELV $1223
line 2260
;2260:	else if (Q_stricmp (cmd, "spawnmc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1228
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $1226
line 2261
;2261:		Cmd_SpawnMC_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnMC_f
CALLV
pop
ADDRGP4 $1227
JUMPV
LABELV $1226
line 2262
;2262:	else if (Q_stricmp (cmd, "spawntd") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1231
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $1229
line 2263
;2263:		Cmd_SpawnDisplacer_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SpawnDisplacer_f
CALLV
pop
ADDRGP4 $1230
JUMPV
LABELV $1229
line 2264
;2264:	else if (Q_stricmp (cmd, "listplayers") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1234
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1232
line 2265
;2265:		Cmd_ListPlayers_f( ent ); 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ListPlayers_f
CALLV
pop
ADDRGP4 $1233
JUMPV
LABELV $1232
line 2266
;2266:	else if (Q_stricmp (cmd, "test") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1237
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1235
line 2267
;2267:		Cmd_Test_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Test_f
CALLV
pop
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2269
;2268:	else
;2269:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1238
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
LABELV $1236
LABELV $1233
LABELV $1230
LABELV $1227
LABELV $1224
LABELV $1221
LABELV $1218
LABELV $1215
LABELV $1212
LABELV $1209
LABELV $1206
LABELV $1203
LABELV $1200
LABELV $1197
LABELV $1194
LABELV $1191
LABELV $1188
LABELV $1185
LABELV $1182
LABELV $1179
LABELV $1176
LABELV $1173
LABELV $1170
LABELV $1168
LABELV $1165
LABELV $1162
LABELV $1159
LABELV $1156
LABELV $1153
line 2270
;2270:}
LABELV $1115
endproc ClientCommand 1192 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 2280
;2271:
;2272:/*
;2273:============================
;2274:G_SendCommandToClient
;2275:Send the given command to the specified (or all) clients
;2276:Shafe - Trep - This is for the Radar
;2277:============================
;2278:*/
;2279:void G_SendCommandToClient (gentity_t *to, char *cmd)
;2280:{
line 2281
;2281:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1240
line 2282
;2282:	{
line 2284
;2283:		// send to all clients 
;2284:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2285
;2285:	} else {
ADDRGP4 $1241
JUMPV
LABELV $1240
line 2287
;2286:    // send to specified client
;2287:    trap_SendServerCommand ( to-g_entities, cmd);
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
line 2288
;2288:	}
LABELV $1241
line 2289
;2289:}
LABELV $1239
endproc G_SendCommandToClient 0 8
import CountTeamSurvivors
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
import g_CurrentRound
import g_NumRounds
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
LABELV $1238
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
LABELV $1237
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1234
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
LABELV $1231
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $1228
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $1225
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
LABELV $1222
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
LABELV $1219
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
LABELV $1216
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
LABELV $1213
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
LABELV $1210
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $1207
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1204
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
LABELV $1201
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1198
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
LABELV $1195
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
LABELV $1192
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1189
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
LABELV $1186
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1183
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1180
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
LABELV $1177
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
LABELV $1174
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1171
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
LABELV $1166
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1163
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1160
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
LABELV $1157
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1154
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1146
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1143
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1140
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
LABELV $1137
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1132
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
LABELV $1129
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1126
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1123
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
LABELV $1120
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1106
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
LABELV $1089
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
LABELV $1086
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
LABELV $1083
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
LABELV $1074
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
LABELV $1073
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $1068
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
LABELV $1060
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
LABELV $1059
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
LABELV $1058
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
LABELV $1041
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
LABELV $1029
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
LABELV $1028
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
LABELV $993
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $987
byte 1 32
byte 1 0
align 1
LABELV $978
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
LABELV $975
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
LABELV $953
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
LABELV $952
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
LABELV $949
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
LABELV $946
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
LABELV $937
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $927
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
LABELV $923
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $917
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
LABELV $914
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
LABELV $908
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $903
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
LABELV $896
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $893
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
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
LABELV $882
byte 1 37
byte 1 115
byte 1 10
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
LABELV $876
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
LABELV $873
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
LABELV $870
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
LABELV $867
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
LABELV $864
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $861
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
LABELV $858
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
LABELV $855
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $852
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $849
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
LABELV $846
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
LABELV $842
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
LABELV $839
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
LABELV $836
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
LABELV $832
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
LABELV $827
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
LABELV $826
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
LABELV $825
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
LABELV $824
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
LABELV $823
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
LABELV $822
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
LABELV $821
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
LABELV $820
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
LABELV $819
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
LABELV $810
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $809
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
LABELV $808
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
LABELV $807
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
LABELV $806
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
LABELV $805
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
LABELV $804
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
LABELV $803
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $800
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $783
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
LABELV $778
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
LABELV $767
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
LABELV $757
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
LABELV $735
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
LABELV $725
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
LABELV $724
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $723
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $720
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $703
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
LABELV $681
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $674
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
LABELV $673
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
LABELV $671
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
LABELV $670
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
LABELV $665
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
LABELV $664
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
LABELV $661
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
LABELV $659
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
LABELV $658
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
LABELV $647
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $646
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $645
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
LABELV $617
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
LABELV $588
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
LABELV $584
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
LABELV $579
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
LABELV $566
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
LABELV $560
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
LABELV $558
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
LABELV $556
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
LABELV $554
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
LABELV $515
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
LABELV $510
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
LABELV $499
byte 1 98
byte 1 0
align 1
LABELV $498
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $494
byte 1 114
byte 1 0
align 1
LABELV $493
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $486
byte 1 115
byte 1 0
align 1
LABELV $485
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
LABELV $482
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $479
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $475
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $474
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
LABELV $470
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
LABELV $467
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
LABELV $466
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
LABELV $462
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
LABELV $458
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
LABELV $450
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
LABELV $447
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
LABELV $438
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $437
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
LABELV $433
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
LABELV $432
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
LABELV $422
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
LABELV $421
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
LABELV $415
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
LABELV $414
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
LABELV $408
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
LABELV $407
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
LABELV $406
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
LABELV $394
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $391
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $388
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
LABELV $385
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
LABELV $382
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
LABELV $376
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $366
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $360
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $354
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $351
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $345
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
LABELV $335
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
LABELV $332
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
LABELV $304
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
LABELV $301
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
LABELV $296
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
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
LABELV $295
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
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
