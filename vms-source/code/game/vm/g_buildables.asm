export turret_explode
code
proc turret_explode 48 20
file "../g_buildables.c"
line 46
;1://
;2:// Trepidation Buildable Objects 
;3:// (C)2006-2011 Trepidation
;4:// General Public License
;5://
;6:// Most of the build rules are checked before any of the stuff in here is executed. 
;7:
;8:#include "g_local.h"
;9:extern void BroadCastSound( char *path ); // De-warning -Vincent
;10:extern void BuildableSpawn( gentity_t *base ); //In g_weapon -Vincent
;11:extern qboolean CanBuildHere(gentity_t *playerent); //In g_weapon -Shafe
;12:
;13:/* 
;14:====================================
;15:
;16:   TURRET CONTROL
;17:
;18:==================================== 
;19:*/
;20:#define RANGE 500	// Turret Range
;21:#define IMRANGE 300 // Immobilizer range
;22:
;23:// These control the radius
;24:#define HARC 90
;25:#define DARC 10
;26:#define UARC 45
;27:
;28:#define IHARC 180 
;29:#define IDARC 10
;30:#define IUARC 45
;31:
;32:// Are we using these?
;33:#define TURRET_MG_SPREAD	100
;34:#define	TURRET_MG_DAMAGE	15
;35:#define	TURRET_MG_DAMAGE2	40
;36:
;37:
;38:/*
;39:===========================
;40:turret_explode
;41:We use this to blow up lots of
;42:stuff.. So it's at top
;43:===========================
;44:*/
;45:void turret_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;46:{
line 50
;47:
;48:	vec3_t dir; // needed by the event being adde
;49:
;50:	dir[0] = dir[1] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 51
;51:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 57
;52:
;53:	
;54:
;55:	// Take item away from master level stats
;56:	
;57:	if (self->s.time2 != 666)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 666
EQI4 $58
line 58
;58:	{
line 59
;59:		self->s.time2 = 666;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 666
ASGNI4
line 60
;60:		if (self->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $60
line 61
;61:		{
line 64
;62:			
;63:			
;64:			if ( !Q_stricmp( self->classname, "timedisplacer") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $62
line 65
;65:			{ 
line 66
;66:				level.blueTD--; 			
ADDRLP4 20
ADDRGP4 level+9304
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 67
;67:				G_LogPrintf("Kill: %i %i %i: Blue IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $66
ARGP4
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 70
;68:				//G_Printf("Blue IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname);
;69:				
;70:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $67
line 71
;71:				{
line 72
;72:					trap_SendServerCommand( -1, va("print \"^7Blue IMMOBILIZER was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $70
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 74
;73:
;74:					if (attacker->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $71
line 75
;75:					{ 	
line 76
;76:						AddScore(attacker, self->r.currentOrigin, 1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 77
;77:					} else
ADDRGP4 $72
JUMPV
LABELV $71
line 78
;78:					{
line 79
;79:						AddScore(attacker, self->r.currentOrigin, -1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 80
;80:					}
LABELV $72
line 81
;81:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 82
;82:				}
LABELV $67
line 83
;83:			}
LABELV $62
line 85
;84:			
;85:			if ( !Q_stricmp( self->classname, "generator") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $75
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $73
line 86
;86:			{ 
line 87
;87:				level.blueGen--; 			
ADDRLP4 24
ADDRGP4 level+9260
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 88
;88:				G_LogPrintf("Kill: %i %i %i: Blue Generator was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $77
ARGP4
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 91
;89:				//G_Printf("Blue GENERATOR was destroyed by %s\n", attacker->client->pers.netname);
;90:				
;91:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $78
line 92
;92:				{
line 93
;93:					trap_SendServerCommand( -1, va("print \"^7Blue GENERATOR was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $81
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 94
;94:					if (attacker->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $82
line 95
;95:					{ 	
line 96
;96:						AddScore(attacker, self->r.currentOrigin, 2); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 97
;97:					} else
ADDRGP4 $83
JUMPV
LABELV $82
line 98
;98:					{
line 99
;99:						AddScore(attacker, self->r.currentOrigin, -2); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 100
;100:					}
LABELV $83
line 101
;101:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 102
;102:				}	
LABELV $78
line 103
;103:			}
LABELV $73
line 104
;104:			if ( !Q_stricmp( self->classname, "turret") ) 
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $86
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $84
line 105
;105:			{
line 106
;106:				level.blueTurrets--; 
ADDRLP4 28
ADDRGP4 level+9268
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 107
;107:				G_LogPrintf("Kill: %i %i %i: Blue Turret was shot down by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $88
ARGP4
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 109
;108:				///G_Printf("Blue TURRET was shot down by %s\n", attacker->client->pers.netname);
;109:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $89
line 110
;110:				{
line 111
;111:					trap_SendServerCommand( -1, va("print \"^7Blue TURRET was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $92
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 112
;112:					if (attacker->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $93
line 113
;113:					{ 	
line 114
;114:						AddScore(attacker, self->r.currentOrigin, 1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 115
;115:					} else
ADDRGP4 $94
JUMPV
LABELV $93
line 116
;116:					{
line 117
;117:						AddScore(attacker, self->r.currentOrigin, -1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 118
;118:					}
LABELV $94
line 119
;119:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 120
;120:				}		
LABELV $89
line 121
;121:			}
LABELV $84
line 122
;122:			if ( !Q_stricmp( self->classname, "mc") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $95
line 123
;123:			{ 
line 124
;124:				if (level.blueNeedMC == 0)
ADDRGP4 level+9296
INDIRI4
CNSTI4 0
NEI4 $98
line 125
;125:				{
line 126
;126:					level.blueMC = 0; 
ADDRGP4 level+9284
CNSTI4 0
ASGNI4
line 127
;127:					level.redScoreLatched = 1;
ADDRGP4 level+9288
CNSTI4 1
ASGNI4
line 128
;128:					level.blueNeedMC = 1;
ADDRGP4 level+9296
CNSTI4 1
ASGNI4
line 129
;129:					trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", 0) );
ADDRGP4 $104
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 130
;130:					level.blueCredits = 0;
ADDRGP4 level+9276
CNSTI4 0
ASGNI4
line 131
;131:					G_LogPrintf("Kill: %i %i %i: Blue Power Core was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $106
ARGP4
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 133
;132:					//G_Printf("Blue POWER CORE was shot down by %s\n", attacker->client->pers.netname);
;133:					if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $107
line 134
;134:					{
line 135
;135:						trap_SendServerCommand( -1, va("print \"^7Blue POWERCORE was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $110
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 136
;136:						if (attacker->client->sess.sessionTeam == TEAM_RED) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $111
line 137
;137:						{ 	
line 138
;138:							AddScore(attacker, self->r.currentOrigin, 10); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 139
;139:						} else
ADDRGP4 $112
JUMPV
LABELV $111
line 140
;140:						{
line 141
;141:							AddScore(attacker, self->r.currentOrigin, -10); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 142
;142:						}
LABELV $112
line 143
;143:					}
LABELV $107
line 144
;144:				}
LABELV $98
line 145
;145:			}		
LABELV $95
line 146
;146:		}
LABELV $60
line 147
;147:		if (self->s.team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $113
line 148
;148:		{
line 149
;149:			if ( !Q_stricmp( self->classname, "timedisplacer") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $115
line 150
;150:			{ 
line 151
;151:				level.redTD--;
ADDRLP4 20
ADDRGP4 level+9308
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 152
;152:				G_LogPrintf("Kill: %i %i %i: Red IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $118
ARGP4
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 154
;153:				//G_Printf("Red IMOBILIZER was destroyed by %s\n", attacker->client->pers.netname);
;154:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $119
line 155
;155:				{
line 156
;156:					trap_SendServerCommand( -1, va("print \"^7Red IMMOBILIZER was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $122
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 157
;157:					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $123
line 158
;158:					{ 	
line 159
;159:						AddScore(attacker, self->r.currentOrigin, 1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 160
;160:					} else
ADDRGP4 $124
JUMPV
LABELV $123
line 161
;161:					{
line 162
;162:						AddScore(attacker, self->r.currentOrigin, -1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 163
;163:					}
LABELV $124
line 164
;164:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 165
;165:				}
LABELV $119
line 167
;166:						
;167:			}
LABELV $115
line 169
;168:			
;169:			if ( !Q_stricmp( self->classname, "generator") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $75
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $125
line 170
;170:			{ 
line 171
;171:				level.redGen--;
ADDRLP4 24
ADDRGP4 level+9256
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 172
;172:				G_LogPrintf("Kill: %i %i %i: Red Generator was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $128
ARGP4
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 174
;173:				
;174:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $129
line 175
;175:				{
line 176
;176:					trap_SendServerCommand( -1, va("print \"^7Red GENERATOR was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $132
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 178
;177:					//G_Printf("Red GENERATOR was destroyed by %s\n", attacker->client->pers.netname);
;178:					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $133
line 179
;179:					{ 	
line 180
;180:						AddScore(attacker, self->r.currentOrigin, 2); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 181
;181:					} else
ADDRGP4 $134
JUMPV
LABELV $133
line 182
;182:					{
line 183
;183:						AddScore(attacker, self->r.currentOrigin, -2); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 184
;184:					}
LABELV $134
line 185
;185:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 186
;186:				}
LABELV $129
line 188
;187:						
;188:			}
LABELV $125
line 189
;189:			if ( !Q_stricmp( self->classname, "turret") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $86
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $135
line 190
;190:			{ 
line 191
;191:				level.redTurrets--;
ADDRLP4 28
ADDRGP4 level+9264
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 192
;192:				G_LogPrintf("Kill: %i %i %i: Red Turret was shot down by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $138
ARGP4
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 194
;193:				//G_Printf("Red TURRET was shot down by %s\n", attacker->client->pers.netname);
;194:				if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $139
line 195
;195:				{
line 196
;196:					trap_SendServerCommand( -1, va("print \"^7Red TURRET was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $142
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 197
;197:					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $143
line 198
;198:					{ 	
line 199
;199:						AddScore(attacker, self->r.currentOrigin, 1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 200
;200:					} else
ADDRGP4 $144
JUMPV
LABELV $143
line 201
;201:					{
line 202
;202:						AddScore(attacker, self->r.currentOrigin, -1); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 203
;203:					}
LABELV $144
line 204
;204:					self->nextthink = 30000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30000
ASGNI4
line 205
;205:				}
LABELV $139
line 206
;206:			}
LABELV $135
line 208
;207:		
;208:			if ( !Q_stricmp( self->classname, "mc") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $145
line 209
;209:			{ 
line 210
;210:				if (level.redNeedMC == 0)
ADDRGP4 level+9300
INDIRI4
CNSTI4 0
NEI4 $147
line 211
;211:				{
line 212
;212:					level.redMC= 0; 
ADDRGP4 level+9280
CNSTI4 0
ASGNI4
line 213
;213:					level.blueScoreLatched = 1;
ADDRGP4 level+9292
CNSTI4 1
ASGNI4
line 214
;214:					level.redNeedMC = 1;
ADDRGP4 level+9300
CNSTI4 1
ASGNI4
line 215
;215:					trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", 0) );
ADDRGP4 $153
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 216
;216:					level.redCredits = 0;
ADDRGP4 level+9272
CNSTI4 0
ASGNI4
line 217
;217:					G_LogPrintf("Kill: %i %i %i: Red POWERCORE was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
ADDRGP4 $155
ARGP4
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 219
;218:					//G_Printf("Red POWER CORE was shot down by %s\n", attacker->client->pers.netname);
;219:					if (attacker != &g_entities[ENTITYNUM_WORLD])
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities+944328
CVPU4 4
EQU4 $156
line 220
;220:					{
line 221
;221:						trap_SendServerCommand( -1, va("print \"^7Red POWER CORE was destroyed by %s \n\"", attacker->client->pers.netname ) );
ADDRGP4 $159
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 222
;222:						if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $160
line 223
;223:						{ 	
line 224
;224:							AddScore(attacker, self->r.currentOrigin, 10); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 225
;225:						} else
ADDRGP4 $161
JUMPV
LABELV $160
line 226
;226:						{
line 227
;227:							AddScore(attacker, self->r.currentOrigin, -10); 
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 228
;228:						}
LABELV $161
line 229
;229:					}
LABELV $156
line 230
;230:				}
LABELV $147
line 232
;231:			
;232:			}		
LABELV $145
line 234
;233:
;234:		}
LABELV $113
line 235
;235:	}
LABELV $58
line 237
;236:	// This is an extra check .. Mostly likely redundant now
;237:	if (level.redTurrets < 0) { level.redTurrets = 0; }
ADDRGP4 level+9264
INDIRI4
CNSTI4 0
GEI4 $162
ADDRGP4 level+9264
CNSTI4 0
ASGNI4
LABELV $162
line 238
;238:	if (level.blueTurrets < 0) { level.blueTurrets = 0; }
ADDRGP4 level+9268
INDIRI4
CNSTI4 0
GEI4 $166
ADDRGP4 level+9268
CNSTI4 0
ASGNI4
LABELV $166
line 239
;239:	if (level.redGen < 0) { level.redGen = 0; }
ADDRGP4 level+9256
INDIRI4
CNSTI4 0
GEI4 $170
ADDRGP4 level+9256
CNSTI4 0
ASGNI4
LABELV $170
line 240
;240:	if (level.blueGen < 0) { level.blueGen = 0; }
ADDRGP4 level+9260
INDIRI4
CNSTI4 0
GEI4 $174
ADDRGP4 level+9260
CNSTI4 0
ASGNI4
LABELV $174
line 242
;241:
;242:	if (self->chain) {
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
line 243
;243:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 244
;244:	}
LABELV $178
line 247
;245:	
;246:	
;247:	self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 248
;248:	self->takedamage = qfalse; // Stop multiple explosions -Vincent
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 249
;249:	self->targetname = ""; // And again... -Vincent
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 $180
ASGNP4
line 250
;250:	G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here
ADDRLP4 0
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 251
;251:	self->freeAfterEvent = qtrue; // so the base goes away after the explosion
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 252
;252:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 254
;253:
;254:}
LABELV $55
endproc turret_explode 48 20
export AnnounceBuildables
proc AnnounceBuildables 12 8
line 265
;255:
;256:
;257:
;258:/*
;259:=================
;260:AnnounceBuildables
;261:
;262:This will put a message up when a new buildable is available
;263:=================
;264:*/
;265:void AnnounceBuildables( void) {
line 269
;266:
;267:int cts;
;268:
;269:	cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];
ADDRLP4 0
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
ADDI4
ASGNI4
line 271
;270:
;271:	if (cts == 2) 
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $186
line 272
;272:	{
line 273
;273:		BroadCastSound("sound/world/tim_pump.ogg");
ADDRGP4 $188
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 274
;274:		trap_SendServerCommand( -1, va("cp \"^7Immobilizer Now Available\n\"") );
ADDRGP4 $189
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
line 275
;275:		trap_SendServerCommand( -1, va( "print \"^9Immobilizer Now Available\n\"") );
ADDRGP4 $190
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 276
;276:	}
LABELV $186
line 279
;277:
;278:
;279:	if (cts == 3) 
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $191
line 280
;280:	{
line 281
;281:		BroadCastSound("sound/world/tim_pump.ogg");
ADDRGP4 $188
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 282
;282:		trap_SendServerCommand( -1, va("cp \"^7Shielded Turrets Now Available\n\"") );
ADDRGP4 $193
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
line 283
;283:		trap_SendServerCommand( -1, va( "print \"^9Shielded Turrets Now Available\n\"") );
ADDRGP4 $194
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 284
;284:	}
LABELV $191
line 286
;285:
;286:	if (cts == 6) 
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $195
line 287
;287:	{
line 288
;288:		BroadCastSound("sound/world/tim_pump.ogg");
ADDRGP4 $188
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 289
;289:		trap_SendServerCommand( -1, va("cp \"^7Cloaking Turrets Now Available\n\"") );
ADDRGP4 $197
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
line 290
;290:		trap_SendServerCommand( -1, va( "print \"Cloaking Turrets Now Available\n\"") );
ADDRGP4 $198
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 291
;291:	}
LABELV $195
line 296
;292:
;293:
;294:
;295:
;296:}
LABELV $181
endproc AnnounceBuildables 12 8
export checktarget
proc checktarget 116 28
line 305
;297:
;298:
;299:
;300:/*
;301:===========================
;302:checktarget
;303:===========================
;304:*/
;305:qboolean checktarget(gentity_t *firer,gentity_t *target){
line 315
;306:
;307:	vec3_t		distance;
;308:	trace_t		trace;
;309:	int			angle;
;310:
;311:/*
;312:returns qfalse if the target is not valid. returns qtrue if it is
;313:*/
;314:
;315:if (!target) // Do we have a target?
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $200
line 316
;316:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $200
line 318
;317:
;318:if (!target->inuse) // Does the target still exist?
ADDRFP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $202
line 319
;319:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $202
line 321
;320:
;321:if (target==firer) // is the target us?
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $204
line 322
;322:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $204
line 324
;323:
;324:if(!target->client) // is the target a bot or player?
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $206
line 325
;325:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $206
line 327
;326:
;327:if (target==firer->parent) // is the target the person that created the turret?
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
NEU4 $208
line 328
;328:{
line 330
;329:	// If so are they still on the same team?
;330:	if (target->client->sess.sessionTeam == firer->s.team)
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
NEI4 $210
line 331
;331:	{
line 332
;332:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $210
line 335
;333:	}
;334:
;335:}
LABELV $208
line 340
;336:
;337://if (target==firer->parent) // is the target the person that created the turret?
;338://  103 	return qfalse;
;339:
;340:if (firer->s.team == target->client->sess.sessionTeam) // is the target one of us?
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
NEI4 $212
line 341
;341:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $212
line 343
;342:
;343:if (target->health<0) // is the target still alive?
ADDRFP4 4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GEI4 $214
line 344
;344:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $214
line 347
;345:
;346:
;347:if (!strcmp(firer->classname, "timedisplacer"))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 72
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $216
line 348
;348:{
line 350
;349:	// Immobilizer has less of a range
;350:	VectorSubtract(target->r.currentOrigin,firer->r.currentOrigin,distance);
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 496
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
CNSTI4 500
ASGNI4
ADDRLP4 4+4
ADDRLP4 76
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 92
CNSTI4 504
ASGNI4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 351
;351:	if (VectorLength(distance)>IMRANGE) // is the target within range?
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 1133903872
LEF4 $217
line 352
;352:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
line 353
;353:} 
LABELV $216
line 355
;354:else
;355:{
line 356
;356:	VectorSubtract(target->r.currentOrigin,firer->r.currentOrigin,distance);
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 496
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
CNSTI4 500
ASGNI4
ADDRLP4 4+4
ADDRLP4 76
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 92
CNSTI4 504
ASGNI4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 357
;357:	if (VectorLength(distance)>RANGE) // is the target within range?
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 1140457472
LEF4 $224
line 358
;358:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $224
line 359
;359:}
LABELV $217
line 363
;360:
;361:
;362:
;363:trap_Trace (&trace, firer->s.pos.trBase, NULL, NULL, target->s.pos.trBase, firer->s.number, MASK_SHOT );
ADDRLP4 16
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 24
ASGNI4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 364
;364:if ( trace.contents & CONTENTS_SOLID ) // can we see the target?
ADDRLP4 16+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $226
line 365
;365:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $226
line 371
;366:/*
;367:The last two checks are done last as they require more processing power than the others.
;368:this order is just better from a proccesing load perspective
;369:*/
;370:
;371:	if (!strcmp(firer->classname, "timedisplacer"))
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 88
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $229
line 372
;372:	{
line 374
;373:
;374:		vectoangles (distance,distance);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 375
;375:		VectorSubtract(firer->centerpoint,distance,distance);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 92
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 92
INDIRP4
CNSTI4 912
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 376
;376:		angle=abs((int)distance[1]);
ADDRLP4 4+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 96
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
line 378
;377:		while (angle>=360)
;378:		{
line 379
;379:			angle-=360;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 360
SUBI4
ASGNI4
line 380
;380:		}
LABELV $237
line 377
ADDRLP4 0
INDIRI4
CNSTI4 360
GEI4 $236
line 381
;381:		if ((angle>=IHARC) && (angle<=(360-IHARC)))
ADDRLP4 104
CNSTI4 180
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 104
INDIRI4
LTI4 $239
ADDRLP4 0
INDIRI4
ADDRLP4 104
INDIRI4
GTI4 $239
line 382
;382:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $239
line 383
;383:		angle=abs((int)distance[0]);
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 108
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 108
INDIRI4
ASGNI4
ADDRGP4 $242
JUMPV
LABELV $241
line 385
;384:		while (angle>=360)
;385:		{
line 386
;386:			angle-=360;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 360
SUBI4
ASGNI4
line 387
;387:		}
LABELV $242
line 384
ADDRLP4 0
INDIRI4
CNSTI4 360
GEI4 $241
line 388
;388:		if ((angle>IUARC) && (angle<(360-IDARC)))
ADDRLP4 0
INDIRI4
CNSTI4 45
LEI4 $230
ADDRLP4 0
INDIRI4
CNSTI4 350
GEI4 $230
line 389
;389:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
line 392
;390:
;391:		
;392:	}
LABELV $229
line 394
;393:	else
;394:	{
line 396
;395:
;396:		vectoangles (distance,distance);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 397
;397:		VectorSubtract(firer->centerpoint,distance,distance);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 92
INDIRP4
CNSTI4 908
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 92
INDIRP4
CNSTI4 912
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 398
;398:		angle=abs((int)distance[1]);
ADDRLP4 4+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 96
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 96
INDIRI4
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $251
line 400
;399:		while (angle>=360)
;400:		{
line 401
;401:			angle-=360;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 360
SUBI4
ASGNI4
line 402
;402:		}
LABELV $252
line 399
ADDRLP4 0
INDIRI4
CNSTI4 360
GEI4 $251
line 403
;403:		if ((angle>=HARC) && (angle<=(360-HARC)))
ADDRLP4 0
INDIRI4
CNSTI4 90
LTI4 $254
ADDRLP4 0
INDIRI4
CNSTI4 270
GTI4 $254
line 404
;404:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $254
line 405
;405:		angle=abs((int)distance[0]);
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 104
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 104
INDIRI4
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
line 407
;406:		while (angle>=360)
;407:		{
line 408
;408:			angle-=360;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 360
SUBI4
ASGNI4
line 409
;409:		}
LABELV $257
line 406
ADDRLP4 0
INDIRI4
CNSTI4 360
GEI4 $256
line 410
;410:		if ((angle>UARC) && (angle<(360-DARC)))
ADDRLP4 0
INDIRI4
CNSTI4 45
LEI4 $259
ADDRLP4 0
INDIRI4
CNSTI4 350
GEI4 $259
line 411
;411:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $259
line 414
;412:	
;413:	
;414:	}
LABELV $230
line 416
;415:
;416:return qtrue;
CNSTI4 1
RETI4
LABELV $199
endproc checktarget 116 28
export turret_findenemy
proc turret_findenemy 8 8
line 425
;417:}
;418:
;419:
;420:/*
;421:===========================
;422:turret_findenemy
;423:===========================
;424:*/
;425:void turret_findenemy( gentity_t *ent){
line 428
;426:	gentity_t *target;
;427:
;428:	target = g_entities;
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 430
;429:
;430:	for (; target < &g_entities[level.num_entities]; target++)
ADDRGP4 $265
JUMPV
LABELV $262
line 431
;431:	{
line 432
;432:		if(!checktarget(ent,target))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 checktarget
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $267
line 433
;433:			continue;
ADDRGP4 $263
JUMPV
LABELV $267
line 434
;434:		ent->enemy=target;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 435
;435:		return;
ADDRGP4 $261
JUMPV
LABELV $263
line 430
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
LABELV $265
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTI4 924
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $262
line 438
;436:	}
;437:
;438:	ent->enemy=NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 439
;439:}
LABELV $261
endproc turret_findenemy 8 8
export turret_trackenemy
proc turret_trackenemy 36 8
line 448
;440:
;441:
;442:
;443:/*
;444:===========================
;445:turret_trackenemy
;446:===========================
;447:*/
;448:void turret_trackenemy( gentity_t *ent){
line 451
;449:	vec3_t dir;
;450:
;451:	VectorSubtract(ent->enemy->r.currentOrigin,ent->r.currentOrigin,dir);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 792
ADDP4
ASGNP4
ADDRLP4 20
CNSTI4 496
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 500
ASGNI4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 504
ASGNI4
ADDRLP4 0+8
ADDRLP4 28
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 452
;452:	VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 453
;453:	VectorCopy(dir,ent->turloc);
ADDRFP4 0
INDIRP4
CNSTI4 896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 454
;454:	vectoangles(dir,dir);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 455
;455:	VectorCopy(dir,ent->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 456
;456:	VectorCopy(dir,ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 457
;457:	VectorCopy( dir,ent->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 458
;458:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 460
;459:
;460:}
LABELV $269
endproc turret_trackenemy 36 8
export turret_fireonenemy
proc turret_fireonenemy 4 16
line 471
;461:
;462:
;463:
;464:
;465:/*
;466:===========================
;467:turret_fireonenemy
;468:===========================
;469:*/
;470:
;471:void turret_fireonenemy( gentity_t *ent){
line 473
;472:
;473:	if (!level.intermissiontime) 
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
NEI4 $273
line 474
;474:	{
line 477
;475:	
;476:		// 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
;477:		if (ent->s.time2 > 1)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LEI4 $276
line 478
;478:		{
line 480
;479:			//This is the best turret
;480:			fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qtrue );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 fire_turret
CALLP4
pop
line 481
;481:			if (trep_debug.integer) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $277
ADDRGP4 $281
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 484
;482:			
;483:			
;484:		} else
ADDRGP4 $277
JUMPV
LABELV $276
line 485
;485:		{
line 487
;486:			
;487:			if (ent->s.time2 == 0)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
NEI4 $282
line 488
;488:			{
line 491
;489:				// This is the weakest
;490:				//fire_plasma( ent->activator, ent->r.currentOrigin, ent->turloc );
;491:				fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qfalse );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_turret
CALLP4
pop
line 492
;492:				if (trep_debug.integer) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $283
ADDRGP4 $281
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 494
;493:				
;494:			} else
ADDRGP4 $283
JUMPV
LABELV $282
line 495
;495:			{
line 497
;496:				// Middle Power
;497:				fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qfalse );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_turret
CALLP4
pop
line 498
;498:				if (trep_debug.integer) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $287
ADDRGP4 $281
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $287
line 500
;499:				
;500:			}
LABELV $283
line 503
;501:			
;502:			
;503:		}
LABELV $277
line 505
;504:		
;505:		G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 23
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 506
;506:		ent->count=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 509
;507:
;508:		// decloaks a cloaked turret when firing.
;509:		if (ent->s.time2==2)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $291
line 510
;510:		{
line 511
;511:			ent->s.time2=3;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 512
;512:			ent->chain->s.time2=3;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 513
;513:		}
LABELV $291
line 514
;514:	}
LABELV $273
line 515
;515:}
LABELV $272
endproc turret_fireonenemy 4 16
export Base_think
proc Base_think 20 32
line 522
;516:
;517:/*
;518:===========================
;519:Base_Think
;520:===========================
;521:*/
;522:void Base_think(gentity_t *ent){
line 525
;523:
;524:	gentity_t *attacker;
;525:	attacker = &g_entities[ENTITYNUM_WORLD];
ADDRLP4 0
ADDRGP4 g_entities+944328
ASGNP4
line 531
;526:	// If the mc is gone blow up the turret... Meaning
;527:	// you need an mc before you can build turrets.
;528:	// 
;529:	// This also destroys all turrets when a point is made.
;530:	
;531:	if (ent->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $295
line 532
;532:	{
line 533
;533:		if (level.blueMC == 0) 
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
NEI4 $297
line 534
;534:		{	
line 535
;535:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 536
;536:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 537
;537:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 538
;538:			if (trep_debug.integer) { G_Printf("Destroyed in Base_think: %s\n", ent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $300
ADDRGP4 $303
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $300
line 541
;539:			
;540:	
;541:		}
LABELV $297
line 542
;542:	}
LABELV $295
line 543
;543:	if (ent->s.team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $304
line 544
;544:	{
line 545
;545:		if (level.redMC == 0) 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
NEI4 $306
line 546
;546:		{ 
line 547
;547:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 548
;548:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 549
;549:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 550
;550:			if (trep_debug.integer) { G_Printf("Destroyed in Base_think: %s\n", ent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $309
ADDRGP4 $303
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $309
line 552
;551:	
;552:		}
LABELV $306
line 553
;553:	}
LABELV $304
line 555
;554:	
;555:	ent->think = Base_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Base_think
ASGNP4
line 556
;556:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 559
;557:
;558:// for shielded turrets. regenerates health to 400 at 10 health a second
;559:if ((ent->s.time2==1)&(ent->health<400)){
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $317
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $317
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $318
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 400
GEI4 $319
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $319
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $320
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $313
line 560
;560:	ent->health+=1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 561
;561:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 562
;562:}
LABELV $313
line 565
;563:
;564:// recloaks a turret without a valid target. checks once a second
;565:if ((ent->s.time2==3)&(!ent->chain->enemy))
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 3
NEI4 $326
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $326
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $327
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $328
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $329
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $322
line 566
;566:	{
line 567
;567:	ent->s.time2=2;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 568
;568:	ent->chain->s.time2=2;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 569
;569:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 570
;570:	}
LABELV $322
line 573
;571:
;572:
;573:}
LABELV $293
endproc Base_think 20 32
export turret_think
proc turret_think 8 8
line 581
;574:
;575:/*
;576:============
;577:turret_think
;578:============
;579:*/
;580:
;581:void turret_think( gentity_t *ent){
line 583
;582:
;583:	ent->nextthink=level.time+10;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 585
;584:
;585:	if (!checktarget(ent,ent->enemy))
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 checktarget
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $333
line 586
;586:		turret_findenemy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 turret_findenemy
CALLV
pop
LABELV $333
line 587
;587:	if(!ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $335
line 588
;588:		return;
ADDRGP4 $331
JUMPV
LABELV $335
line 589
;589:	turret_trackenemy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 turret_trackenemy
CALLV
pop
line 590
;590:	if (ent->count<level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $337
line 591
;591:		turret_fireonenemy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 turret_fireonenemy
CALLV
pop
LABELV $337
line 592
;592:}
LABELV $331
endproc turret_think 8 8
export createturretgun
proc createturretgun 28 8
line 602
;593:
;594:
;595:/*
;596:===========================
;597:createturretgun
;598:===========================
;599:*/
;600:// let's add weapon and turret type to this call
;601:void createturretgun(gentity_t *ent)
;602:{
line 605
;603:	gentity_t *turret; 	// The object to hold the turrets details.
;604:
;605:	ent->nextthink=level.time+100; // sets up the thinking for the cloaking or regeneration/
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 606
;606:	ent->think=Base_think; // handles cloaking or regeneration
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Base_think
ASGNP4
line 607
;607:	ent->clipmask = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 608
;608:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 609
;609:	turret=G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 610
;610:	turret->parent=ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 611
;611:	if (trep_debug.integer) { G_Printf("%s Turret Gun Built - Owner: %s\n", turret->parent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $342
ADDRGP4 $345
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $342
line 612
;612:	turret->chain=ent;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 613
;613:	ent->chain=turret;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 614
;614:	turret->s.eType=ET_BUILDABLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 616
;615:	
;616:	turret->s.time2=ent->s.time2;
ADDRLP4 8
CNSTI4 88
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 617
;617:	turret->eventTime=200;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 200
ASGNI4
line 618
;618:	turret->s.number = turret - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ASGNI4
line 625
;619:	
;620:	
;621:	//turret->s.weapon=WP_MACHINEGUN;
;622:	// 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
;623:	// Regular Turret
;624:	
;625:	if (ent->s.time2 == 0)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
NEI4 $346
line 626
;626:	{
line 627
;627:		turret->s.weapon=WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 11
ASGNI4
line 628
;628:		turret->s.modelindex = G_ModelIndex("models/turrets/gun1.md3");
ADDRGP4 $348
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 629
;629:		turret->model = "models/turrets/gun1.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $348
ASGNP4
line 630
;630:		turret->s.modelindex2 = G_ModelIndex("models/turrets/gun1.md3");
ADDRGP4 $348
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 631
;631:	} 
ADDRGP4 $347
JUMPV
LABELV $346
line 633
;632:	else 
;633:	{
line 634
;634:		turret->s.modelindex = G_ModelIndex("models/turrets/gun2.md3");
ADDRGP4 $349
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 635
;635:		turret->model = "models/turrets/gun1.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $348
ASGNP4
line 636
;636:		turret->s.modelindex2 = G_ModelIndex("models/turrets/gun2.md3");
ADDRGP4 $349
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 637
;637:	}
LABELV $347
line 641
;638:	
;639:	// These two are for later in case we want to define them differently
;640:	// Sheilded Turret
;641:	if (ent->s.time2 == 1)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $350
line 642
;642:	{
line 643
;643:		turret->s.weapon=WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 11
ASGNI4
line 644
;644:	}
LABELV $350
line 646
;645:	// Cloaked Turret
;646:	if (ent->s.time2 > 1)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LEI4 $352
line 647
;647:	{
line 648
;648:		turret->s.weapon=WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 11
ASGNI4
line 649
;649:	}
LABELV $352
line 653
;650:	
;651:	
;652:	
;653:	turret->s.team =  ent->s.team;	
ADDRLP4 16
CNSTI4 208
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 656
;654:
;655:	
;656:	turret->think=turret_think;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 turret_think
ASGNP4
line 657
;657:	turret->nextthink=level.time+100;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 658
;658:	G_SetOrigin( turret, ent->r.currentOrigin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 659
;659:	VectorCopy(ent->s.apos.trBase,turret->s.apos.trBase);
ADDRLP4 20
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 660
;660:	VectorCopy(turret->s.apos.trBase,turret->centerpoint);
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 661
;661:	trap_LinkEntity (turret);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 662
;662:	BroadCastSound("sound/items/electro.ogg");
ADDRGP4 $355
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 663
;663:}
LABELV $340
endproc createturretgun 28 8
export turret_retaliate
proc turret_retaliate 0 0
line 671
;664:
;665:/*
;666:===========================
;667:turret_retaliate
;668:===========================
;669:*/
;670:void turret_retaliate(gentity_t *self, gentity_t *attacker, int damage)
;671:{
line 673
;672:// set the guns enemy to the person that shot it. (does not override targeting rules)
;673:if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
line 674
;674:	self->chain->enemy=attacker;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CNSTI4 792
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
LABELV $357
line 677
;675:
;676:// this is here to cause the turret to unshield when its taken a certain amount of damage. (enough to reduce health to below 100)
;677:	if (self->s.time2==1)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $359
line 678
;678:	{
line 679
;679:		if (self->health<100)
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 100
GEI4 $361
line 680
;680:		{
line 681
;681:			self->s.time2=0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 682
;682:			if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $363
line 683
;683:			{
line 684
;684:				self->chain->s.time2=0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 685
;685:			}
LABELV $363
line 686
;686:		}
LABELV $361
line 687
;687:	}
LABELV $359
line 688
;688:}
LABELV $356
endproc turret_retaliate 0 0
export BuildTurret
proc BuildTurret 20 20
line 696
;689:
;690:/*
;691:===========================
;692:BuildTurret
;693:===========================
;694:*/
;695:void BuildTurret( gentity_t *ent , int type )
;696:{
line 700
;697:	// We need to check the turret type and select the appropriate model
;698:	gentity_t	*base;	
;699:
;700:	if (CanBuildHere(ent) == qfalse) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CanBuildHere
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $366
line 701
;701:	{ 
line 702
;702:		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
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
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 703
;703:		return; 
ADDRGP4 $365
JUMPV
LABELV $366
line 706
;704:	}
;705:
;706:	base=G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 707
;707:	base->parent=ent;	
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 708
;708:	if (trep_debug.integer) { G_Printf("%s Turret Built - Owner: %s\n", base->parent->client->pers.netname ); }
ADDRGP4 trep_debug+12
INDIRI4
CNSTI4 0
EQI4 $369
ADDRGP4 $372
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $369
line 710
;709:	
;710:	if (type == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $373
line 711
;711:	{
line 712
;712:		base->s.modelindex = G_ModelIndex("models/turrets/base.md3");
ADDRGP4 $375
ARGP4
ADDRLP4 12
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 713
;713:		base->model = "models/turrets/base.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $375
ASGNP4
line 714
;714:		base->s.modelindex2 = G_ModelIndex("models/turrets/base.md3");
ADDRGP4 $375
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 715
;715:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 717
;716:	else
;717:	{
line 718
;718:		base->s.modelindex = G_ModelIndex("models/turrets/base2.md3");
ADDRGP4 $376
ARGP4
ADDRLP4 12
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 719
;719:		base->model = "models/turrets/base2.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $376
ASGNP4
line 720
;720:		base->s.modelindex2 = G_ModelIndex("models/turrets/base2.md3");
ADDRGP4 $376
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 721
;721:	}
LABELV $374
line 723
;722:
;723:	G_SetOrigin(base,ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 724
;724:	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 12
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 726
;725:	
;726:	if (type==0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $377
line 727
;727:	{
line 728
;728:		base->health=200; // change this to make the turrets tougher or weaker.
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 200
ASGNI4
line 729
;729:	} 
ADDRGP4 $378
JUMPV
LABELV $377
line 731
;730:	else
;731:	{
line 732
;732:		base->health=300; // change this to make the turrets tougher or weaker.
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 300
ASGNI4
line 733
;733:	}
LABELV $378
line 735
;734:	
;735:	base->s.eType=ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 737
;736:	
;737:	if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $379
line 738
;738:	{
line 739
;739:		level.blueTurrets++;
ADDRLP4 16
ADDRGP4 level+9268
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 740
;740:	}
LABELV $379
line 741
;741:	if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $382
line 742
;742:	{
line 743
;743:		level.redTurrets++;
ADDRLP4 16
ADDRGP4 level+9264
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 744
;744:	}	
LABELV $382
line 746
;745:
;746:	base->s.time2=type; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 748
;747:	
;748:	base->classname = "turret";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $86
ASGNP4
line 749
;749:	base->s.team =  ent->client->sess.sessionTeam;	
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 751
;750:
;751:	base->takedamage=qtrue; // so they can be destroyed
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 752
;752:	base->die=turret_explode; // so they actually explode when destroyed
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 turret_explode
ASGNP4
line 753
;753:	base->pain=turret_retaliate; // if they are damaged they switch target to the person attacking (if its a valid target)
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 turret_retaliate
ASGNP4
line 755
;754:
;755:	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 756
;756:	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 757
;757:	base->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 760
;758:	
;759:	// Correction to default numbers -Vincent
;760:	VectorSet( base->r.mins, -16, -16, -16 );
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3246391296
ASGNF4
line 761
;761:	VectorSet( base->r.maxs, 16, 16, 16);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1098907648
ASGNF4
line 763
;762:
;763:	trap_LinkEntity( base );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 765
;764:
;765:	BuildableSpawn( base ); // New spawning -Vincent
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BuildableSpawn
CALLV
pop
line 766
;766:	if( base->s.eType == ET_GENERAL )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $385
line 767
;767:	{ // Clear it!
line 768
;768:	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 g_entities+944328
ARGP4
ADDRGP4 g_entities+944328
ARGP4
CNSTI4 200
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 turret_explode
CALLV
pop
line 769
;769:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 771
;770:	else
;771:	{ // Initalize it!
line 772
;772:	base->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 773
;773:	base->think	    = createturretgun;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 createturretgun
ASGNP4
line 774
;774:	}
LABELV $386
line 775
;775:}
LABELV $365
endproc BuildTurret 20 20
export MC_think
proc MC_think 12 0
line 797
;776:
;777:
;778:/* 
;779:====================================
;780:
;781:   MASTER CONTROLLER // POWER CORE
;782:
;783:==================================== 
;784:*/
;785:
;786:
;787:/*
;788:===========================
;789:MC_think
;790:
;791: Power Core//Master Controller Think.
;792: This controls the shielding 
;793: as well.
;794:===========================
;795:*/
;796:void MC_think(gentity_t *ent)
;797:{
line 800
;798:	int shieldMultiplier;
;799:
;800:	shieldMultiplier = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 802
;801:
;802:	ent->clipmask = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 803
;803:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 806
;804:
;805:	// Determine The Sheilding By Counting Shield Generators
;806:	if (ent->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $391
line 807
;807:	{
line 808
;808:		shieldMultiplier = level.blueGen;
ADDRLP4 0
ADDRGP4 level+9260
INDIRI4
ASGNI4
line 809
;809:		level.blueCredits = ent->health;
ADDRGP4 level+9276
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 811
;810:
;811:	}
LABELV $391
line 812
;812:	if (ent->s.team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $395
line 813
;813:	{
line 814
;814:		shieldMultiplier = level.redGen;
ADDRLP4 0
ADDRGP4 level+9256
INDIRI4
ASGNI4
line 815
;815:		level.redCredits = ent->health;
ADDRGP4 level+9272
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 817
;816:		
;817:	}
LABELV $395
line 819
;818:
;819:	shieldMultiplier++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 822
;820:
;821:	// If there's at least one shield generator and the MC's health is above 35 it'll be shielded
;822:	if (shieldMultiplier > 1) { ent->s.time2 = 1; } else { ent->s.time2 = 0; }
ADDRLP4 0
INDIRI4
CNSTI4 1
LEI4 $399
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $399
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
LABELV $400
line 828
;823:
;824:	 
;825:	
;826:	// It's shielded but health is too low.. 
;827:	// This turns shielding off and regeneration stops.
;828:	if (ent->s.time2==1)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $401
line 829
;829:	{
line 830
;830:		if (ent->health<35) // Was 350
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 35
GEI4 $403
line 831
;831:		{
line 832
;832:			ent->s.time2=0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 833
;833:		}
LABELV $403
line 834
;834:	}
LABELV $401
line 836
;835:	
;836:	if ((ent->s.time2==1) && (shieldMultiplier > 1)) 
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $405
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $405
line 837
;837:	{
line 838
;838:		if (ent->health < (800 * shieldMultiplier) ) 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 800
ADDRLP4 0
INDIRI4
MULI4
GEI4 $407
line 839
;839:		{
line 840
;840:			ent->health+=shieldMultiplier;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 841
;841:			ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 842
;842:		}
LABELV $407
line 843
;843:	}
LABELV $405
line 845
;844:
;845:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 846
;846:}
LABELV $390
endproc MC_think 12 0
export MC_prethink
proc MC_prethink 0 0
line 858
;847:
;848:
;849:/*
;850:===========================
;851:MC_prethink
;852:
;853:The MC as it is in the 
;854:'being built' state
;855:===========================
;856:*/
;857:void MC_prethink(gentity_t *ent)
;858:{
line 859
;859:	if (ent->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $412
line 860
;860:	{
line 861
;861:		level.blueScoreLatched = 0;
ADDRGP4 level+9292
CNSTI4 0
ASGNI4
line 862
;862:	} 
ADDRGP4 $413
JUMPV
LABELV $412
line 864
;863:	else 
;864:	{
line 865
;865:		level.redScoreLatched = 0;
ADDRGP4 level+9288
CNSTI4 0
ASGNI4
line 866
;866:	}
LABELV $413
line 868
;867:
;868:	ent->takedamage=qtrue; // so they can be destroyed
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 870
;869:	// - We'll start it high, so that it cant be destroyed easily right away.
;870:	ent->health=2400; // change this to make the turrets tougher or weaker.
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 2400
ASGNI4
line 871
;871:	ent->die=turret_explode; // so they actually explode when destroyed
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 turret_explode
ASGNP4
line 873
;872:	
;873:	ent->s.time2=1;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 874
;874:	ent->think = MC_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 MC_think
ASGNP4
line 875
;875:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 878
;876:
;877:	// Announce any new buildables available
;878:	AnnounceBuildables();
ADDRGP4 AnnounceBuildables
CALLV
pop
line 879
;879:}
LABELV $411
endproc MC_prethink 0 0
export BuildMC
proc BuildMC 24 20
line 888
;880:
;881:
;882:/*
;883:===========================
;884:BuildMC
;885:===========================
;886:*/
;887:void BuildMC( gentity_t *ent )
;888:{
line 891
;889:	gentity_t	*base;
;890:	
;891:	if (CanBuildHere(ent) == qfalse) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CanBuildHere
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $418
line 892
;892:	{ 
line 893
;893:		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
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
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 894
;894:		return; 
ADDRGP4 $417
JUMPV
LABELV $418
line 897
;895:	}
;896:
;897:	if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $420
line 898
;898:	{
line 899
;899:		level.blueMC++;
ADDRLP4 8
ADDRGP4 level+9284
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 900
;900:		level.blueNeedMC = 0;
ADDRGP4 level+9296
CNSTI4 0
ASGNI4
line 901
;901:	}
LABELV $420
line 902
;902:	if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $424
line 903
;903:	{
line 904
;904:		level.redMC++;
ADDRLP4 8
ADDRGP4 level+9280
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 905
;905:		level.redNeedMC = 0;
ADDRGP4 level+9300
CNSTI4 0
ASGNI4
line 906
;906:	}
LABELV $424
line 908
;907:
;908:	base=G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 909
;909:	base->parent=ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 911
;910:	
;911:	base->s.modelindex = G_ModelIndex("models/turrets/mc.md3");
ADDRGP4 $428
ARGP4
ADDRLP4 12
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 912
;912:	base->model = "models/turrets/mc.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $428
ASGNP4
line 913
;913:	base->s.modelindex2 = G_ModelIndex("models/turrets/mc.md3");
ADDRGP4 $428
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 915
;914:
;915:	G_SetOrigin(base,ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 916
;916:	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 918
;917:	
;918:	base->s.eType=ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 919
;919:	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 9
ASGNI4
line 920
;920:	base->takedamage=qfalse; // so they can be destroyed
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 922
;921:	//base->die=turret_explode; // so they actually explode when destroyed
;922:	base->classname = "mc";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $97
ASGNP4
line 923
;923:	base->s.team =  ent->client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 925
;924:	
;925:	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 926
;926:	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 927
;927:	base->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 930
;928:	
;929:	// Correction to default numbers -Vincent
;930:	VectorSet( base->r.mins, -16, -16, -16 );
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3246391296
ASGNF4
line 931
;931:	VectorSet( base->r.maxs, 16, 16, 16);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1098907648
ASGNF4
line 933
;932:
;933:	trap_LinkEntity( base );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 935
;934:
;935:	BuildableSpawn( base ); // New spawning -Vincent
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BuildableSpawn
CALLV
pop
line 936
;936:	if( base->s.eType == ET_GENERAL )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $429
line 937
;937:	{ // Clear it!
line 938
;938:	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 g_entities+944328
ARGP4
ADDRGP4 g_entities+944328
ARGP4
CNSTI4 200
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 turret_explode
CALLV
pop
line 939
;939:	}
ADDRGP4 $430
JUMPV
LABELV $429
line 941
;940:	else
;941:	{ // Initalize it!
line 942
;942:	base->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 943
;943:	base->think = MC_prethink;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 MC_prethink
ASGNP4
line 944
;944:	}
LABELV $430
line 945
;945:}
LABELV $417
endproc BuildMC 24 20
export GEN_think
proc GEN_think 8 32
line 959
;946:
;947:
;948:
;949:
;950:/* 
;951:====================================
;952:
;953:   SHIELD GENERATORS
;954:
;955:==================================== 
;956:*/
;957:
;958:void GEN_think(gentity_t *ent)
;959:{
line 961
;960:	gentity_t *attacker;
;961:	attacker = &g_entities[ENTITYNUM_WORLD];
ADDRLP4 0
ADDRGP4 g_entities+944328
ASGNP4
line 963
;962:
;963:	ent->clipmask = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 964
;964:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 970
;965:
;966:
;967:	// If the mc is gone blow up the generator... Meaning
;968:	// you need an mc before you can build generators.
;969:	// Otherwise you just sit there looking good.
;970:	if (ent->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $436
line 971
;971:	{
line 973
;972:		// If there is no MC or too many sheild generators blow it up.
;973:		if (level.blueMC == 0 || level.blueGen > 2)  
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
EQI4 $442
ADDRGP4 level+9260
INDIRI4
CNSTI4 2
LEI4 $438
LABELV $442
line 974
;974:		{	
line 975
;975:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 976
;976:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 977
;977:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 978
;978:		}
LABELV $438
line 979
;979:	}
LABELV $436
line 980
;980:	if (ent->s.team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $443
line 981
;981:	{
line 982
;982:		if (level.redMC == 0 || level.redGen > 2) 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
EQI4 $449
ADDRGP4 level+9256
INDIRI4
CNSTI4 2
LEI4 $445
LABELV $449
line 983
;983:		{ 
line 984
;984:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 985
;985:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 986
;986:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 987
;987:		}
LABELV $445
line 988
;988:	}
LABELV $443
line 990
;989:
;990:	ent->think = GEN_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 GEN_think
ASGNP4
line 991
;991:	ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 993
;992:
;993:}
LABELV $434
endproc GEN_think 8 32
export gen_prethink
proc gen_prethink 4 4
line 1005
;994:
;995:/*
;996:===========================
;997:gen_prethink
;998:
;999:The generator in 'being
;1000:built' state
;1001:===========================
;1002:*/
;1003:// Generators Are Never Shielded
;1004:void gen_prethink(gentity_t *ent)
;1005:{
line 1007
;1006:	// Dont count them until they have been built
;1007:	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $452
line 1008
;1008:	{
line 1009
;1009:		level.blueGen++;
ADDRLP4 0
ADDRGP4 level+9260
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1010
;1010:	}
LABELV $452
line 1011
;1011:	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $455
line 1012
;1012:	{
line 1013
;1013:		level.redGen++;
ADDRLP4 0
ADDRGP4 level+9256
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1014
;1014:	}
LABELV $455
line 1016
;1015:
;1016:		BroadCastSound("sound/items/protect.ogg");
ADDRGP4 $458
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 1017
;1017:		ent->s.time2=0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1018
;1018:		ent->think = GEN_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 GEN_think
ASGNP4
line 1019
;1019:		ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1020
;1020:}
LABELV $451
endproc gen_prethink 4 4
export BuildGenerator
proc BuildGenerator 24 20
line 1030
;1021:
;1022:
;1023:/*
;1024:===========================
;1025:BuildGenerator
;1026:===========================
;1027:*/
;1028:
;1029:void BuildGenerator( gentity_t *ent )
;1030:{
line 1034
;1031:
;1032:	gentity_t	*base;
;1033:	
;1034:	if (CanBuildHere(ent) == qfalse) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CanBuildHere
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $461
line 1035
;1035:	{ 
line 1036
;1036:		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
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
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1037
;1037:		return; 
ADDRGP4 $460
JUMPV
LABELV $461
line 1040
;1038:	}
;1039:
;1040:	base=G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1041
;1041:	base->parent=ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1042
;1042:	base->s.modelindex = G_ModelIndex("models/turrets/generator.md3");
ADDRGP4 $463
ARGP4
ADDRLP4 12
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1043
;1043:	base->model = "models/turrets/generator.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $463
ASGNP4
line 1044
;1044:	base->s.modelindex2 = G_ModelIndex("models/turrets/generator.md3");
ADDRGP4 $463
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1046
;1045:
;1046:	G_SetOrigin(base,ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1047
;1047:	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 1049
;1048:
;1049:	base->health=400; // change this to make tougher or weaker.
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 400
ASGNI4
line 1050
;1050:	base->s.eType=ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1052
;1051:	
;1052:	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 9
ASGNI4
line 1053
;1053:	base->takedamage=qtrue; // so they can be destroyed
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1054
;1054:	base->die=turret_explode; // so they actually explode when destroyed
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 turret_explode
ASGNP4
line 1056
;1055:
;1056:	base->classname = "generator";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $75
ASGNP4
line 1057
;1057:	base->s.team =  ent->client->sess.sessionTeam;	
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1059
;1058:		
;1059:	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 1060
;1060:	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1061
;1061:	base->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1064
;1062:	
;1063:	// Correction to default numbers -Vincent
;1064:	VectorSet( base->r.mins, -16, -16, -16 );
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3246391296
ASGNF4
line 1065
;1065:	VectorSet( base->r.maxs, 16, 16, 16);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1098907648
ASGNF4
line 1067
;1066:
;1067:	trap_LinkEntity( base );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1069
;1068:
;1069:	BuildableSpawn( base ); // New spawning -Vincent
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BuildableSpawn
CALLV
pop
line 1070
;1070:	if( base->s.eType == ET_GENERAL )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $464
line 1071
;1071:	{ // Clear it!
line 1072
;1072:	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 g_entities+944328
ARGP4
ADDRGP4 g_entities+944328
ARGP4
CNSTI4 200
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 turret_explode
CALLV
pop
line 1073
;1073:	}
ADDRGP4 $465
JUMPV
LABELV $464
line 1075
;1074:	else
;1075:	{ // Initalize it!
line 1076
;1076:	base->nextthink = level.time + 9000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 9000
ADDI4
ASGNI4
line 1077
;1077:	base->think = gen_prethink;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 gen_prethink
ASGNP4
line 1078
;1078:	}
LABELV $465
line 1079
;1079:}
LABELV $460
endproc BuildGenerator 24 20
export TD_think
proc TD_think 16 32
line 1097
;1080:
;1081:
;1082:
;1083:
;1084:/* 
;1085:====================================
;1086:
;1087:   TIME DISPLACERS Now Called 
;1088:   IMMOBILIZERS
;1089:
;1090:  // Need Some Models
;1091:  
;1092:
;1093:==================================== 
;1094:*/
;1095:
;1096:void TD_think(gentity_t *ent)
;1097:{
line 1102
;1098:
;1099:	gentity_t *target;
;1100:	gentity_t *attacker;
;1101:
;1102:	target = g_entities;
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1103
;1103:	attacker = &g_entities[ENTITYNUM_WORLD];
ADDRLP4 4
ADDRGP4 g_entities+944328
ASGNP4
line 1105
;1104:
;1105: 	ent->clipmask = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 1106
;1106:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1111
;1107:
;1108:	// If the mc is gone blow up the time displacer... Meaning
;1109:	// you need an mc before you can build anything.
;1110:	// Otherwise you just sit there looking good.
;1111:	if (ent->s.team == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $471
line 1112
;1112:	{
line 1114
;1113:		// If there is no MC or too many sheild generators blow it up.
;1114:		if (level.blueMC == 0 || level.blueTD> 2)  
ADDRGP4 level+9284
INDIRI4
CNSTI4 0
EQI4 $477
ADDRGP4 level+9304
INDIRI4
CNSTI4 2
LEI4 $473
LABELV $477
line 1115
;1115:		{	
line 1116
;1116:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 1117
;1117:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1118
;1118:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1119
;1119:		}
LABELV $473
line 1120
;1120:	}
LABELV $471
line 1121
;1121:	if (ent->s.team == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $478
line 1122
;1122:	{
line 1123
;1123:		if (level.redMC == 0 || level.redTD > 2) 
ADDRGP4 level+9280
INDIRI4
CNSTI4 0
EQI4 $484
ADDRGP4 level+9308
INDIRI4
CNSTI4 2
LEI4 $480
LABELV $484
line 1124
;1124:		{ 
line 1125
;1125:			ent->health = 1; 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 1126
;1126:			ent->s.time2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1127
;1127:			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1128
;1128:		}
LABELV $480
line 1129
;1129:	}
LABELV $478
line 1132
;1130:
;1131:	
;1132:	ent->nextthink=level.time+10;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1133
;1133:	ent->think = TD_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 TD_think
ASGNP4
line 1135
;1134:
;1135:	if (!checktarget(ent,ent->enemy))
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 checktarget
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $486
line 1136
;1136:	{
line 1137
;1137:		turret_findenemy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 turret_findenemy
CALLV
pop
line 1138
;1138:	}
LABELV $486
line 1140
;1139:
;1140:	if(!ent->enemy) { 	return; }
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $488
ADDRGP4 $469
JUMPV
LABELV $488
line 1142
;1141:	
;1142:	target = ent->enemy;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
line 1145
;1143:
;1144:
;1145:	if (target->s.eType == ET_BUILDABLE) { return; } // Can't immobilize other buildables - Mantis #0000048 Shafe
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $490
ADDRGP4 $469
JUMPV
LABELV $490
line 1147
;1146:
;1147:	if (ent->count<level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $492
line 1148
;1148:	{	
line 1149
;1149:		target->immobilized = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 1
ASGNI4
line 1150
;1150:	} 
LABELV $492
line 1152
;1151:
;1152:}
LABELV $469
endproc TD_think 16 32
export td_prethink
proc td_prethink 4 4
line 1165
;1153:
;1154:/*
;1155:===========================
;1156:TD_prethink
;1157:
;1158:The Time Displacer in 'being
;1159:built' state
;1160:
;1161:===========================
;1162:*/
;1163:
;1164:void td_prethink(gentity_t *ent)
;1165:{
line 1167
;1166:	// Dont count them until they have been built
;1167:	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $496
line 1168
;1168:	{
line 1169
;1169:		level.blueTD++;
ADDRLP4 0
ADDRGP4 level+9304
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1170
;1170:	}
LABELV $496
line 1171
;1171:	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $499
line 1172
;1172:	{
line 1173
;1173:		level.redTD++;
ADDRLP4 0
ADDRGP4 level+9308
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1174
;1174:	}
LABELV $499
line 1176
;1175:
;1176:		BroadCastSound("sound/items/protect.ogg");
ADDRGP4 $458
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 1177
;1177:		ent->s.time2=0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1178
;1178:		ent->think = TD_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 TD_think
ASGNP4
line 1179
;1179:		ent->nextthink=level.time+100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1180
;1180:}
LABELV $495
endproc td_prethink 4 4
export BuildDisplacer
proc BuildDisplacer 24 20
line 1190
;1181:
;1182:
;1183:/*
;1184:===========================
;1185:BuildDisplacer
;1186:===========================
;1187:*/
;1188:
;1189:void BuildDisplacer( gentity_t *ent )
;1190:{
line 1193
;1191:	gentity_t	*base;
;1192:	
;1193:	if (CanBuildHere(ent) == qfalse) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CanBuildHere
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $504
line 1194
;1194:	{ 
line 1195
;1195:		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
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
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1196
;1196:		return; 
ADDRGP4 $503
JUMPV
LABELV $504
line 1199
;1197:	}
;1198:
;1199:	base=G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1200
;1200:	base->parent=ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1201
;1201:	base->s.modelindex = G_ModelIndex("models/turrets/immobilizer.md3");
ADDRGP4 $506
ARGP4
ADDRLP4 12
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1202
;1202:	base->model = "models/turrets/immobilizer.md3";
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $506
ASGNP4
line 1203
;1203:	base->s.modelindex2 = G_ModelIndex("models/turrets/immobilizer.md3");
ADDRGP4 $506
ARGP4
ADDRLP4 16
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1205
;1204:
;1205:	G_SetOrigin(base,ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1206
;1206:	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 1208
;1207:
;1208:	base->health=150; // change this to make tougher or weaker.
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 150
ASGNI4
line 1209
;1209:	base->s.eType=ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1211
;1210:	
;1211:	base->s.time2=9; 
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 9
ASGNI4
line 1212
;1212:	base->takedamage=qtrue; // so they can be destroyed
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1213
;1213:	base->die=turret_explode; // so they actually explode when destroyed
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 turret_explode
ASGNP4
line 1215
;1214:
;1215:	base->classname = "timedisplacer";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $64
ASGNP4
line 1216
;1216:	base->s.team =  ent->client->sess.sessionTeam;	
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1218
;1217:		
;1218:	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 1219
;1219:	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1221
;1220:		
;1221:	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 1
ASGNI4
line 1222
;1222:	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1223
;1223:	base->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1226
;1224:	
;1225:	// Correction to default numbers -Vincent
;1226:	VectorSet( base->r.mins, -16, -16, -16 );
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 3246391296
ASGNF4
line 1227
;1227:	VectorSet( base->r.maxs, 16, 16, 16);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 1098907648
ASGNF4
line 1229
;1228:
;1229:	trap_LinkEntity( base );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1231
;1230:
;1231:	BuildableSpawn( base ); // New spawning -Vincent
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BuildableSpawn
CALLV
pop
line 1232
;1232:	if( base->s.eType == ET_GENERAL )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $507
line 1233
;1233:	{ // Clear it!
line 1234
;1234:	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 g_entities+944328
ARGP4
ADDRGP4 g_entities+944328
ARGP4
CNSTI4 200
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 turret_explode
CALLV
pop
line 1235
;1235:	}
ADDRGP4 $508
JUMPV
LABELV $507
line 1237
;1236:	else
;1237:	{ // Initalize it!
line 1238
;1238:	base->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1239
;1239:	base->think = td_prethink;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 td_prethink
ASGNP4
line 1240
;1240:	}
LABELV $508
line 1241
;1241:}
LABELV $503
endproc BuildDisplacer 24 20
import CanBuildHere
import BuildableSpawn
import BroadCastSound
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
import fire_bomb
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
LABELV $506
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 105
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
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $463
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $458
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
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $428
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 99
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $376
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $375
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $372
byte 1 37
byte 1 115
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 32
byte 1 45
byte 1 32
byte 1 79
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $368
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 69
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 82
byte 1 111
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
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
LABELV $355
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
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $349
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 117
byte 1 110
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $348
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 117
byte 1 110
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $345
byte 1 37
byte 1 115
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 32
byte 1 45
byte 1 32
byte 1 79
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $303
byte 1 68
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $281
byte 1 37
byte 1 115
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $198
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 111
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 67
byte 1 108
byte 1 111
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $194
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 83
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 101
byte 1 100
byte 1 32
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 83
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 101
byte 1 100
byte 1 32
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $190
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 57
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $189
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 55
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
byte 1 119
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $188
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 95
byte 1 112
byte 1 117
byte 1 109
byte 1 112
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $180
byte 1 0
align 1
LABELV $159
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $155
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $153
byte 1 103
byte 1 95
byte 1 82
byte 1 101
byte 1 100
byte 1 77
byte 1 67
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $142
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 85
byte 1 82
byte 1 82
byte 1 69
byte 1 84
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $138
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $128
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 82
byte 1 101
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
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $122
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $118
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $110
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $106
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
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
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 77
byte 1 67
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $97
byte 1 109
byte 1 99
byte 1 0
align 1
LABELV $92
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 85
byte 1 82
byte 1 82
byte 1 69
byte 1 84
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $88
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $86
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $77
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
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
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $75
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $70
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $66
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 82
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $64
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
