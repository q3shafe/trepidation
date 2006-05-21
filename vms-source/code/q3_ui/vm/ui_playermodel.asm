data
align 4
LABELV playermodel_artlist
address $67
address $68
address $69
address $70
address $71
address $72
address $73
address $74
address $75
address $76
byte 4 0
code
proc PlayerModel_UpdateGrid 28 0
file "../ui_playermodel.c"
line 93
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define MODEL_BACK0			"menu/art/back_0"
;6:#define MODEL_BACK1			"menu/art/back_1"
;7:#define MODEL_SELECT		"menu/art/opponents_select"
;8:#define MODEL_SELECTED		"menu/art/opponents_selected"
;9:#define MODEL_FRAMEL		"menu/art/frame1_l"
;10:#define MODEL_FRAMER		"menu/art/frame1_r"
;11:#define MODEL_PORTS			"menu/art/player_models_ports"
;12:#define MODEL_ARROWS		"menu/art/gs_arrows_0"
;13:#define MODEL_ARROWSL		"menu/art/gs_arrows_l"
;14:#define MODEL_ARROWSR		"menu/art/gs_arrows_r"
;15:
;16:#define LOW_MEMORY			(5 * 1024 * 1024)
;17:
;18:static char* playermodel_artlist[] =
;19:{
;20:	MODEL_BACK0,	
;21:	MODEL_BACK1,	
;22:	MODEL_SELECT,
;23:	MODEL_SELECTED,
;24:	MODEL_FRAMEL,
;25:	MODEL_FRAMER,
;26:	MODEL_PORTS,	
;27:	MODEL_ARROWS,
;28:	MODEL_ARROWSL,
;29:	MODEL_ARROWSR,
;30:	NULL
;31:};
;32:
;33:#define PLAYERGRID_COLS		4
;34:#define PLAYERGRID_ROWS		4
;35:#define MAX_MODELSPERPAGE	(PLAYERGRID_ROWS*PLAYERGRID_COLS)
;36:
;37:#define MAX_PLAYERMODELS	256
;38:
;39:#define ID_PLAYERPIC0		0
;40:#define ID_PLAYERPIC1		1
;41:#define ID_PLAYERPIC2		2
;42:#define ID_PLAYERPIC3		3
;43:#define ID_PLAYERPIC4		4
;44:#define ID_PLAYERPIC5		5
;45:#define ID_PLAYERPIC6		6
;46:#define ID_PLAYERPIC7		7
;47:#define ID_PLAYERPIC8		8
;48:#define ID_PLAYERPIC9		9
;49:#define ID_PLAYERPIC10		10
;50:#define ID_PLAYERPIC11		11
;51:#define ID_PLAYERPIC12		12
;52:#define ID_PLAYERPIC13		13
;53:#define ID_PLAYERPIC14		14
;54:#define ID_PLAYERPIC15		15
;55:#define ID_PREVPAGE			100
;56:#define ID_NEXTPAGE			101
;57:#define ID_BACK				102
;58:
;59:typedef struct
;60:{
;61:	menuframework_s	menu;
;62:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;63:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;64:	menubitmap_s	framel;
;65:	menubitmap_s	framer;
;66:	menubitmap_s	ports;
;67:	menutext_s		banner;
;68:	menubitmap_s	back;
;69:	menubitmap_s	player;
;70:	menubitmap_s	arrows;
;71:	menubitmap_s	left;
;72:	menubitmap_s	right;
;73:	menutext_s		modelname;
;74:	menutext_s		skinname;
;75:	menutext_s		playername;
;76:	playerInfo_t	playerinfo;
;77:	int				nummodels;
;78:	char			modelnames[MAX_PLAYERMODELS][128];
;79:	int				modelpage;
;80:	int				numpages;
;81:	char			modelskin[64];
;82:	int				selectedmodel;
;83:} playermodel_t;
;84:
;85:static playermodel_t s_playermodel;
;86:
;87:/*
;88:=================
;89:PlayerModel_UpdateGrid
;90:=================
;91:*/
;92:static void PlayerModel_UpdateGrid( void )
;93:{
line 97
;94:	int	i;
;95:    int	j;
;96:
;97:	j = s_playermodel.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 98
;98:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++,j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $80
line 99
;99:	{
line 100
;100:		if (j < s_playermodel.nummodels)
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5204
INDIRI4
GEI4 $84
line 101
;101:		{ 
line 103
;102:			// model/skin portrait
;103: 			s_playermodel.pics[i].generic.name         = s_playermodel.modelnames[j];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5208
ADDP4
ASGNP4
line 104
;104:			s_playermodel.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 105
;105:		}
ADDRGP4 $85
JUMPV
LABELV $84
line 107
;106:		else
;107:		{
line 109
;108:			// dead slot
;109: 			s_playermodel.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+4
ADDP4
CNSTP4 0
ASGNP4
line 110
;110:			s_playermodel.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 111
;111:		}
LABELV $85
line 113
;112:
;113: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 114
;114: 		s_playermodel.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+68
ADDP4
CNSTI4 0
ASGNI4
line 115
;115: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 116
;116:	}
LABELV $81
line 98
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $80
line 118
;117:
;118:	if (s_playermodel.selectedmodel/MAX_MODELSPERPAGE == s_playermodel.modelpage)
ADDRGP4 s_playermodel+38048
INDIRI4
CNSTI4 16
DIVI4
ADDRGP4 s_playermodel+37976
INDIRI4
NEI4 $102
line 119
;119:	{
line 121
;120:		// set selected model
;121:		i = s_playermodel.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 s_playermodel+38048
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 123
;122:
;123:		s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 124
;124:		s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 125
;125:	}
LABELV $102
line 127
;126:
;127:	if (s_playermodel.numpages > 1)
ADDRGP4 s_playermodel+37980
INDIRI4
CNSTI4 1
LEI4 $111
line 128
;128:	{
line 129
;129:		if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 0
LEI4 $114
line 130
;130:			s_playermodel.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3704+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRGP4 $115
JUMPV
LABELV $114
line 132
;131:		else
;132:			s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_playermodel+3704+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
LABELV $115
line 134
;133:
;134:		if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+37976
INDIRI4
ADDRGP4 s_playermodel+37980
INDIRI4
CNSTI4 1
SUBI4
GEI4 $121
line 135
;135:			s_playermodel.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_playermodel+3792+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRGP4 $112
JUMPV
LABELV $121
line 137
;136:		else
;137:			s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 s_playermodel+3792+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 138
;138:	}
ADDRGP4 $112
JUMPV
LABELV $111
line 140
;139:	else
;140:	{
line 142
;141:		// hide left/right markers
;142:		s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3704+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 143
;143:		s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_playermodel+3792+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 144
;144:	}
LABELV $112
line 145
;145:}
LABELV $78
endproc PlayerModel_UpdateGrid 28 0
proc PlayerModel_UpdateModel 28 28
line 153
;146:
;147:/*
;148:=================
;149:PlayerModel_UpdateModel
;150:=================
;151:*/
;152:static void PlayerModel_UpdateModel( void )
;153:{
line 157
;154:	vec3_t	viewangles;
;155:	vec3_t	moveangles;
;156:
;157:	memset( &s_playermodel.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playermodel+4096
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 159
;158:	
;159:	viewangles[YAW]   = 180 - 30;
ADDRLP4 0+4
CNSTF4 1125515264
ASGNF4
line 160
;160:	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 161
;161:	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 162
;162:	VectorClear( moveangles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 164
;163:
;164:	UI_PlayerInfo_SetModel( &s_playermodel.playerinfo, s_playermodel.modelskin );
ADDRGP4 s_playermodel+4096
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 165
;165:	UI_PlayerInfo_SetInfo( &s_playermodel.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, moveangles, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playermodel+4096
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 166
;166:}
LABELV $133
endproc PlayerModel_UpdateModel 28 28
proc PlayerModel_SaveChanges 0 8
line 174
;167:
;168:/*
;169:=================
;170:PlayerModel_SaveChanges
;171:=================
;172:*/
;173:static void PlayerModel_SaveChanges( void )
;174:{
line 175
;175:	trap_Cvar_Set( "model", s_playermodel.modelskin );
ADDRGP4 $143
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 176
;176:	trap_Cvar_Set( "headmodel", s_playermodel.modelskin );
ADDRGP4 $145
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 177
;177:	trap_Cvar_Set( "team_model", s_playermodel.modelskin );
ADDRGP4 $147
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 178
;178:	trap_Cvar_Set( "team_headmodel", s_playermodel.modelskin );
ADDRGP4 $149
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 179
;179:}
LABELV $142
endproc PlayerModel_SaveChanges 0 8
proc PlayerModel_MenuEvent 12 0
line 187
;180:
;181:/*
;182:=================
;183:PlayerModel_MenuEvent
;184:=================
;185:*/
;186:static void PlayerModel_MenuEvent( void* ptr, int event )
;187:{
line 188
;188:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $152
line 189
;189:		return;
ADDRGP4 $151
JUMPV
LABELV $152
line 191
;190:
;191:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $157
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $162
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $168
ADDRGP4 $154
JUMPV
line 192
;192:	{
LABELV $157
line 194
;193:		case ID_PREVPAGE:
;194:			if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 0
LEI4 $155
line 195
;195:			{
line 196
;196:				s_playermodel.modelpage--;
ADDRLP4 8
ADDRGP4 s_playermodel+37976
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 197
;197:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 198
;198:			}
line 199
;199:			break;
ADDRGP4 $155
JUMPV
LABELV $162
line 202
;200:
;201:		case ID_NEXTPAGE:
;202:			if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+37976
INDIRI4
ADDRGP4 s_playermodel+37980
INDIRI4
CNSTI4 1
SUBI4
GEI4 $155
line 203
;203:			{
line 204
;204:				s_playermodel.modelpage++;
ADDRLP4 8
ADDRGP4 s_playermodel+37976
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 205
;205:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 206
;206:			}
line 207
;207:			break;
ADDRGP4 $155
JUMPV
LABELV $168
line 210
;208:
;209:		case ID_BACK:
;210:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 211
;211:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 212
;212:			break;
LABELV $154
LABELV $155
line 214
;213:	}
;214:}
LABELV $151
endproc PlayerModel_MenuEvent 12 0
proc PlayerModel_MenuKey 52 8
line 222
;215:
;216:/*
;217:=================
;218:PlayerModel_MenuKey
;219:=================
;220:*/
;221:static sfxHandle_t PlayerModel_MenuKey( int key )
;222:{
line 226
;223:	menucommon_s*	m;
;224:	int				picnum;
;225:
;226:	switch (key)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 134
EQI4 $172
ADDRLP4 12
CNSTI4 135
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $181
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $195
LABELV $194
ADDRFP4 0
INDIRI4
CNSTI4 27
EQI4 $193
ADDRGP4 $170
JUMPV
LABELV $195
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 163
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $172
ADDRLP4 16
INDIRI4
CNSTI4 165
EQI4 $181
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $170
LABELV $196
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $193
ADDRGP4 $170
JUMPV
line 227
;227:	{
LABELV $172
line 230
;228:		case K_KP_LEFTARROW:
;229:		case K_LEFTARROW:
;230:			m = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 24
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 231
;231:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 232
;232:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $171
ADDRLP4 28
INDIRI4
CNSTI4 15
GTI4 $171
line 233
;233:			{
line 234
;234:				if (picnum > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $175
line 235
;235:				{
line 236
;236:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-1);
ADDRLP4 32
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 237
;237:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $175
line 240
;238:					
;239:				}
;240:				else if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 0
LEI4 $177
line 241
;241:				{
line 242
;242:					s_playermodel.modelpage--;
ADDRLP4 32
ADDRGP4 s_playermodel+37976
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 243
;243:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+15);
ADDRLP4 36
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 244
;244:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 245
;245:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $177
line 248
;246:				}
;247:				else
;248:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
line 250
;249:			}
;250:			break;
LABELV $181
line 254
;251:
;252:		case K_KP_RIGHTARROW:
;253:		case K_RIGHTARROW:
;254:			m = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 32
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 255
;255:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 256
;256:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 36
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $171
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $171
line 257
;257:			{
line 258
;258:				if ((picnum < 15) && (s_playermodel.modelpage*MAX_MODELSPERPAGE + picnum+1 < s_playermodel.nummodels))
ADDRLP4 40
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 15
GEI4 $184
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRGP4 s_playermodel+5204
INDIRI4
GEI4 $184
line 259
;259:				{
line 260
;260:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+1);
ADDRLP4 44
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 261
;261:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $184
line 263
;262:				}					
;263:				else if ((picnum == 15) && (s_playermodel.modelpage < s_playermodel.numpages-1))
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $188
ADDRGP4 s_playermodel+37976
INDIRI4
ADDRGP4 s_playermodel+37980
INDIRI4
CNSTI4 1
SUBI4
GEI4 $188
line 264
;264:				{
line 265
;265:					s_playermodel.modelpage++;
ADDRLP4 44
ADDRGP4 s_playermodel+37976
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 266
;266:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-15);
ADDRLP4 48
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 15
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 267
;267:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 268
;268:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
LABELV $188
line 271
;269:				}
;270:				else
;271:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $169
JUMPV
line 273
;272:			}
;273:			break;
LABELV $193
line 277
;274:			
;275:		case K_MOUSE2:
;276:		case K_ESCAPE:
;277:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 278
;278:			break;
LABELV $170
LABELV $171
line 281
;279:	}
;280:
;281:	return ( Menu_DefaultKey( &s_playermodel.menu, key ) );
ADDRGP4 s_playermodel
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
LABELV $169
endproc PlayerModel_MenuKey 52 8
proc PlayerModel_PicEvent 48 12
line 290
;282:}
;283:
;284:/*
;285:=================
;286:PlayerModel_PicEvent
;287:=================
;288:*/
;289:static void PlayerModel_PicEvent( void* ptr, int event )
;290:{
line 297
;291:	int				modelnum;
;292:	int				maxlen;
;293:	char*			buffptr;
;294:	char*			pdest;
;295:	int				i;
;296:
;297:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $198
line 298
;298:		return;
ADDRGP4 $197
JUMPV
LABELV $198
line 300
;299:
;300:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $200
line 301
;301:	{
line 303
;302:		// reset
;303: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 304
;304: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 305
;305:	}
LABELV $201
line 300
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $200
line 308
;306:
;307:	// set selected
;308:	i = ((menucommon_s*)ptr)->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 309
;309:	s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 310
;310:	s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 313
;311:
;312:	// get model and strip icon_
;313:	modelnum = s_playermodel.modelpage*MAX_MODELSPERPAGE + i;
ADDRLP4 16
ADDRGP4 s_playermodel+37976
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 314
;314:	buffptr  = s_playermodel.modelnames[modelnum] + strlen("models/players/");
ADDRGP4 $214
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5208
ADDP4
ADDP4
ASGNP4
line 315
;315:	pdest    = strstr(buffptr,"icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 316
;316:	if (pdest)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
line 317
;317:	{
line 319
;318:		// track the whole model/skin name
;319:		Q_strncpyz(s_playermodel.modelskin,buffptr,pdest-buffptr+1);
ADDRGP4 s_playermodel+37984
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 320
;320:		strcat(s_playermodel.modelskin,pdest + 5);
ADDRGP4 s_playermodel+37984
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 323
;321:
;322:		// seperate the model name
;323:		maxlen = pdest-buffptr;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 324
;324:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $220
line 325
;325:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $220
line 326
;326:		Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 327
;327:		Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 330
;328:
;329:		// seperate the skin name
;330:		maxlen = strlen(pdest+5)+1;
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 331
;331:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $226
line 332
;332:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $226
line 333
;333:		Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 334
;334:		Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 336
;335:
;336:		s_playermodel.selectedmodel = modelnum;
ADDRGP4 s_playermodel+38048
ADDRLP4 16
INDIRI4
ASGNI4
line 338
;337:
;338:		if( trap_MemoryRemaining() > LOW_MEMORY ) {
ADDRLP4 44
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 5242880
LEI4 $233
line 339
;339:			PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 340
;340:		}
LABELV $233
line 341
;341:	}
LABELV $216
line 342
;342:}
LABELV $197
endproc PlayerModel_PicEvent 48 12
proc PlayerModel_DrawPlayer 12 24
line 350
;343:
;344:/*
;345:=================
;346:PlayerModel_DrawPlayer
;347:=================
;348:*/
;349:static void PlayerModel_DrawPlayer( void *self )
;350:{
line 353
;351:	menubitmap_s*	b;
;352:
;353:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 355
;354:
;355:	if( trap_MemoryRemaining() <= LOW_MEMORY ) {
ADDRLP4 4
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5242880
GTI4 $236
line 356
;356:		UI_DrawProportionalString( b->generic.x, b->generic.y + b->height / 2, "LOW MEMORY", UI_LEFT, color_red );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ARGI4
ADDRGP4 $238
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 357
;357:		return;
ADDRGP4 $235
JUMPV
LABELV $236
line 360
;358:	}
;359:
;360:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playermodel.playerinfo, uis.realtime/2 );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playermodel+4096
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 361
;361:}
LABELV $235
endproc PlayerModel_DrawPlayer 12 24
proc PlayerModel_BuildList 4244 20
line 369
;362:
;363:/*
;364:=================
;365:PlayerModel_BuildList
;366:=================
;367:*/
;368:static void PlayerModel_BuildList( void )
;369:{
line 383
;370:	int		numdirs;
;371:	int		numfiles;
;372:	char	dirlist[2048];
;373:	char	filelist[2048];
;374:	char	skinname[64];
;375:	char*	dirptr;
;376:	char*	fileptr;
;377:	int		i;
;378:	int		j;
;379:	int		dirlen;
;380:	int		filelen;
;381:	qboolean precache;
;382:
;383:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $242
ARGP4
ADDRLP4 4196
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 4196
INDIRF4
CVFI4 4
ASGNI4
line 385
;384:
;385:	s_playermodel.modelpage = 0;
ADDRGP4 s_playermodel+37976
CNSTI4 0
ASGNI4
line 386
;386:	s_playermodel.nummodels = 0;
ADDRGP4 s_playermodel+5204
CNSTI4 0
ASGNI4
line 389
;387:
;388:	// iterate directory of all player models
;389:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $245
ARGP4
ADDRGP4 $246
ARGP4
ADDRLP4 2148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 4200
INDIRI4
ASGNI4
line 390
;390:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2148
ASGNP4
line 391
;391:	for (i=0; i<numdirs && s_playermodel.nummodels < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 392
;392:	{
line 393
;393:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4204
INDIRI4
ASGNI4
line 395
;394:		
;395:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $252
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $252
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $252
line 397
;396:
;397:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 4212
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $258
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 4216
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $254
LABELV $258
line 398
;398:			continue;
ADDRGP4 $248
JUMPV
LABELV $254
line 401
;399:			
;400:		// iterate all skin files in directory
;401:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $259
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4224
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 4224
INDIRI4
ASGNI4
line 402
;402:		fileptr  = filelist;
ADDRLP4 0
ADDRLP4 96
ASGNP4
line 403
;403:		for (j=0; j<numfiles && s_playermodel.nummodels < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $264
JUMPV
LABELV $261
line 404
;404:		{
line 405
;405:			filelen = strlen(fileptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 4228
INDIRI4
ASGNI4
line 407
;406:
;407:			COM_StripExtension(fileptr,skinname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 410
;408:
;409:			// look for icon_????
;410:			if (!Q_stricmpn(skinname,"icon_",5))
ADDRLP4 4
ARGP4
ADDRGP4 $215
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4232
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $266
line 411
;411:			{
line 412
;412:				Com_sprintf( s_playermodel.modelnames[s_playermodel.nummodels++],
ADDRLP4 4240
ADDRGP4 s_playermodel+5204
ASGNP4
ADDRLP4 4236
ADDRLP4 4240
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4240
INDIRP4
ADDRLP4 4236
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4236
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5208
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $272
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 417
;413:					sizeof( s_playermodel.modelnames[s_playermodel.nummodels] ),
;414:					"models/players/%s/%s", dirptr, skinname );
;415:				//if (s_playermodel.nummodels >= MAX_PLAYERMODELS)
;416:				//	return;
;417:			}
LABELV $266
line 419
;418:
;419:			if( precache ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $273
line 420
;420:				trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", skinname), qfalse );
ADDRGP4 $275
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 421
;421:			}
LABELV $273
line 422
;422:		}
LABELV $262
line 403
ADDRLP4 4228
CNSTI4 1
ASGNI4
ADDRLP4 68
ADDRLP4 68
INDIRI4
ADDRLP4 4228
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 72
INDIRI4
ADDRLP4 4228
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $264
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $276
ADDRGP4 s_playermodel+5204
INDIRI4
CNSTI4 256
LTI4 $261
LABELV $276
line 423
;423:	}	
LABELV $248
line 391
ADDRLP4 4204
CNSTI4 1
ASGNI4
ADDRLP4 92
ADDRLP4 92
INDIRI4
ADDRLP4 4204
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 88
INDIRI4
ADDRLP4 4204
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $250
ADDRLP4 92
INDIRI4
ADDRLP4 2144
INDIRI4
GEI4 $277
ADDRGP4 s_playermodel+5204
INDIRI4
CNSTI4 256
LTI4 $247
LABELV $277
line 427
;424:
;425:	//APSFIXME - Degenerate no models case
;426:
;427:	s_playermodel.numpages = s_playermodel.nummodels/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+37980
ADDRGP4 s_playermodel+5204
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 428
;428:	if (s_playermodel.nummodels % MAX_MODELSPERPAGE)
ADDRGP4 s_playermodel+5204
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $280
line 429
;429:		s_playermodel.numpages++;
ADDRLP4 4208
ADDRGP4 s_playermodel+37980
ASGNP4
ADDRLP4 4208
INDIRP4
ADDRLP4 4208
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $280
line 430
;430:}
LABELV $241
endproc PlayerModel_BuildList 4244 20
proc PlayerModel_SetMenuItems 96 12
line 438
;431:
;432:/*
;433:=================
;434:PlayerModel_SetMenuItems
;435:=================
;436:*/
;437:static void PlayerModel_SetMenuItems( void )
;438:{
line 446
;439:	int				i;
;440:	int				maxlen;
;441:	char			modelskin[64];
;442:	char*			buffptr;
;443:	char*			pdest;
;444:
;445:	// name
;446:	trap_Cvar_VariableStringBuffer( "name", s_playermodel.playername.string, 16 );
ADDRGP4 $285
ARGP4
ADDRGP4 s_playermodel+4024+60
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 447
;447:	Q_CleanStr( s_playermodel.playername.string );
ADDRGP4 s_playermodel+4024+60
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 450
;448:
;449:	// model
;450:	trap_Cvar_VariableStringBuffer( "model", s_playermodel.modelskin, 64 );
ADDRGP4 $143
ARGP4
ADDRGP4 s_playermodel+37984
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 453
;451:	
;452:	// find model in our list
;453:	for (i=0; i<s_playermodel.nummodels; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $291
line 454
;454:	{
line 456
;455:		// strip icon_
;456:		buffptr  = s_playermodel.modelnames[i] + strlen("models/players/");
ADDRGP4 $214
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5208
ADDP4
ADDP4
ASGNP4
line 457
;457:		pdest    = strstr(buffptr,"icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 84
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 84
INDIRP4
ASGNP4
line 458
;458:		if (pdest)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
line 459
;459:		{
line 460
;460:			Q_strncpyz(modelskin,buffptr,pdest-buffptr+1);
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 461
;461:			strcat(modelskin,pdest + 5);
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 462
;462:		}
line 464
;463:		else
;464:			continue;
LABELV $298
line 466
;465:
;466:		if (!Q_stricmp( s_playermodel.modelskin, modelskin ))
ADDRGP4 s_playermodel+37984
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $299
line 467
;467:		{
line 469
;468:			// found pic, set selection here		
;469:			s_playermodel.selectedmodel = i;
ADDRGP4 s_playermodel+38048
ADDRLP4 4
INDIRI4
ASGNI4
line 470
;470:			s_playermodel.modelpage     = i/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+37976
ADDRLP4 4
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 473
;471:
;472:			// seperate the model name
;473:			maxlen = pdest-buffptr;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 474
;474:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $304
line 475
;475:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $304
line 476
;476:			Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 477
;477:			Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 480
;478:
;479:			// seperate the skin name
;480:			maxlen = strlen(pdest+5)+1;
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 481
;481:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $310
line 482
;482:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $310
line 483
;483:			Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 484
;484:			Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 485
;485:			break;
ADDRGP4 $293
JUMPV
LABELV $299
line 487
;486:		}
;487:	}
LABELV $292
line 453
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $294
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5204
INDIRI4
LTI4 $291
LABELV $293
line 488
;488:}
LABELV $284
endproc PlayerModel_SetMenuItems 96 12
bss
align 1
LABELV $317
skip 32
align 1
LABELV $318
skip 32
align 1
LABELV $319
skip 32
code
proc PlayerModel_MenuInit 28 12
line 496
;489:
;490:/*
;491:=================
;492:PlayerModel_MenuInit
;493:=================
;494:*/
;495:static void PlayerModel_MenuInit( void )
;496:{
line 507
;497:	int			i;
;498:	int			j;
;499:	int			k;
;500:	int			x;
;501:	int			y;
;502:	static char	playername[32];
;503:	static char	modelname[32];
;504:	static char	skinname[32];
;505:
;506:	// zero set all our globals
;507:	memset( &s_playermodel, 0 ,sizeof(playermodel_t) );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 0
ARGI4
CNSTI4 38052
ARGI4
ADDRGP4 memset
CALLP4
pop
line 509
;508:
;509:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 511
;510:
;511:	s_playermodel.menu.key        = PlayerModel_MenuKey;
ADDRGP4 s_playermodel+272
ADDRGP4 PlayerModel_MenuKey
ASGNP4
line 512
;512:	s_playermodel.menu.wrapAround = qtrue;
ADDRGP4 s_playermodel+276
CNSTI4 1
ASGNI4
line 513
;513:	s_playermodel.menu.fullscreen = qtrue;
ADDRGP4 s_playermodel+280
CNSTI4 1
ASGNI4
line 515
;514:
;515:	s_playermodel.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playermodel+3368
CNSTI4 10
ASGNI4
line 516
;516:	s_playermodel.banner.generic.x     = 320;
ADDRGP4 s_playermodel+3368+12
CNSTI4 320
ASGNI4
line 517
;517:	s_playermodel.banner.generic.y     = 16;
ADDRGP4 s_playermodel+3368+16
CNSTI4 16
ASGNI4
line 518
;518:	s_playermodel.banner.string        = "PLAYER MODEL";
ADDRGP4 s_playermodel+3368+60
ADDRGP4 $330
ASGNP4
line 519
;519:	s_playermodel.banner.color         = color_white;
ADDRGP4 s_playermodel+3368+68
ADDRGP4 color_white
ASGNP4
line 520
;520:	s_playermodel.banner.style         = UI_CENTER;
ADDRGP4 s_playermodel+3368+64
CNSTI4 1
ASGNI4
line 522
;521:
;522:	s_playermodel.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3104
CNSTI4 6
ASGNI4
line 523
;523:	s_playermodel.framel.generic.name  = MODEL_FRAMEL;
ADDRGP4 s_playermodel+3104+4
ADDRGP4 $71
ASGNP4
line 524
;524:	s_playermodel.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3104+44
CNSTU4 16388
ASGNU4
line 525
;525:	s_playermodel.framel.generic.x     = 0;
ADDRGP4 s_playermodel+3104+12
CNSTI4 0
ASGNI4
line 526
;526:	s_playermodel.framel.generic.y     = 78;
ADDRGP4 s_playermodel+3104+16
CNSTI4 78
ASGNI4
line 527
;527:	s_playermodel.framel.width         = 256;
ADDRGP4 s_playermodel+3104+76
CNSTI4 256
ASGNI4
line 528
;528:	s_playermodel.framel.height        = 329;
ADDRGP4 s_playermodel+3104+80
CNSTI4 329
ASGNI4
line 530
;529:
;530:	s_playermodel.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3192
CNSTI4 6
ASGNI4
line 531
;531:	s_playermodel.framer.generic.name  = MODEL_FRAMER;
ADDRGP4 s_playermodel+3192+4
ADDRGP4 $72
ASGNP4
line 532
;532:	s_playermodel.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3192+44
CNSTU4 16388
ASGNU4
line 533
;533:	s_playermodel.framer.generic.x     = 376;
ADDRGP4 s_playermodel+3192+12
CNSTI4 376
ASGNI4
line 534
;534:	s_playermodel.framer.generic.y     = 76;
ADDRGP4 s_playermodel+3192+16
CNSTI4 76
ASGNI4
line 535
;535:	s_playermodel.framer.width         = 256;
ADDRGP4 s_playermodel+3192+76
CNSTI4 256
ASGNI4
line 536
;536:	s_playermodel.framer.height        = 334;
ADDRGP4 s_playermodel+3192+80
CNSTI4 334
ASGNI4
line 538
;537:
;538:	s_playermodel.ports.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3280
CNSTI4 6
ASGNI4
line 539
;539:	s_playermodel.ports.generic.name  = MODEL_PORTS;
ADDRGP4 s_playermodel+3280+4
ADDRGP4 $73
ASGNP4
line 540
;540:	s_playermodel.ports.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3280+44
CNSTU4 16388
ASGNU4
line 541
;541:	s_playermodel.ports.generic.x     = 50;
ADDRGP4 s_playermodel+3280+12
CNSTI4 50
ASGNI4
line 542
;542:	s_playermodel.ports.generic.y     = 59;
ADDRGP4 s_playermodel+3280+16
CNSTI4 59
ASGNI4
line 543
;543:	s_playermodel.ports.width         = 274;
ADDRGP4 s_playermodel+3280+76
CNSTI4 274
ASGNI4
line 544
;544:	s_playermodel.ports.height        = 274;
ADDRGP4 s_playermodel+3280+80
CNSTI4 274
ASGNI4
line 546
;545:
;546:	y =	59;
ADDRLP4 8
CNSTI4 59
ASGNI4
line 547
;547:	for (i=0,k=0; i<PLAYERGRID_ROWS; i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $374
line 548
;548:	{
line 549
;549:		x =	50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 550
;550:		for (j=0; j<PLAYERGRID_COLS; j++,k++)
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $378
line 551
;551:		{
line 552
;552:			s_playermodel.pics[k].generic.type	   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288
ADDP4
CNSTI4 6
ASGNI4
line 553
;553:			s_playermodel.pics[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
CNSTU4 16388
ASGNU4
line 554
;554:			s_playermodel.pics[k].generic.x		   = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 555
;555:			s_playermodel.pics[k].generic.y		   = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 556
;556:			s_playermodel.pics[k].width  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+76
ADDP4
CNSTI4 64
ASGNI4
line 557
;557:			s_playermodel.pics[k].height  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+80
ADDP4
CNSTI4 64
ASGNI4
line 558
;558:			s_playermodel.pics[k].focuspic         = MODEL_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+60
ADDP4
ADDRGP4 $70
ASGNP4
line 559
;559:			s_playermodel.pics[k].focuscolor       = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 561
;560:
;561:			s_playermodel.picbuttons[k].generic.type	 = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696
ADDP4
CNSTI4 6
ASGNI4
line 562
;562:			s_playermodel.picbuttons[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
CNSTU4 33028
ASGNU4
line 563
;563:			s_playermodel.picbuttons[k].generic.id	     = ID_PLAYERPIC0+k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 564
;564:			s_playermodel.picbuttons[k].generic.callback = PlayerModel_PicEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+48
ADDP4
ADDRGP4 PlayerModel_PicEvent
ASGNP4
line 565
;565:			s_playermodel.picbuttons[k].generic.x    	 = x - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 566
;566:			s_playermodel.picbuttons[k].generic.y		 = y - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 567
;567:			s_playermodel.picbuttons[k].generic.left	 = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 568
;568:			s_playermodel.picbuttons[k].generic.top		 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 569
;569:			s_playermodel.picbuttons[k].generic.right	 = x + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 570
;570:			s_playermodel.picbuttons[k].generic.bottom   = y + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 571
;571:			s_playermodel.picbuttons[k].width  		     = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+76
ADDP4
CNSTI4 128
ASGNI4
line 572
;572:			s_playermodel.picbuttons[k].height  		 = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+80
ADDP4
CNSTI4 128
ASGNI4
line 573
;573:			s_playermodel.picbuttons[k].focuspic  		 = MODEL_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+60
ADDP4
ADDRGP4 $69
ASGNP4
line 574
;574:			s_playermodel.picbuttons[k].focuscolor  	 = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 576
;575:
;576:			x += 64+6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 577
;577:		}
LABELV $379
line 550
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $378
line 578
;578:		y += 64+6;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 579
;579:	}
LABELV $375
line 547
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $377
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $374
line 581
;580:
;581:	s_playermodel.playername.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4024
CNSTI4 9
ASGNI4
line 582
;582:	s_playermodel.playername.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+4024+44
CNSTU4 16392
ASGNU4
line 583
;583:	s_playermodel.playername.generic.x	   = 320;
ADDRGP4 s_playermodel+4024+12
CNSTI4 320
ASGNI4
line 584
;584:	s_playermodel.playername.generic.y	   = 440;
ADDRGP4 s_playermodel+4024+16
CNSTI4 440
ASGNI4
line 585
;585:	s_playermodel.playername.string	       = playername;
ADDRGP4 s_playermodel+4024+60
ADDRGP4 $317
ASGNP4
line 586
;586:	s_playermodel.playername.style		   = UI_CENTER;
ADDRGP4 s_playermodel+4024+64
CNSTI4 1
ASGNI4
line 587
;587:	s_playermodel.playername.color         = text_color_normal;
ADDRGP4 s_playermodel+4024+68
ADDRGP4 text_color_normal
ASGNP4
line 589
;588:
;589:	s_playermodel.modelname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+3880
CNSTI4 9
ASGNI4
line 590
;590:	s_playermodel.modelname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3880+44
CNSTU4 16392
ASGNU4
line 591
;591:	s_playermodel.modelname.generic.x	  = 497;
ADDRGP4 s_playermodel+3880+12
CNSTI4 497
ASGNI4
line 592
;592:	s_playermodel.modelname.generic.y	  = 54;
ADDRGP4 s_playermodel+3880+16
CNSTI4 54
ASGNI4
line 593
;593:	s_playermodel.modelname.string	      = modelname;
ADDRGP4 s_playermodel+3880+60
ADDRGP4 $318
ASGNP4
line 594
;594:	s_playermodel.modelname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+3880+64
CNSTI4 1
ASGNI4
line 595
;595:	s_playermodel.modelname.color         = text_color_normal;
ADDRGP4 s_playermodel+3880+68
ADDRGP4 text_color_normal
ASGNP4
line 597
;596:
;597:	s_playermodel.skinname.generic.type   = MTYPE_PTEXT;
ADDRGP4 s_playermodel+3952
CNSTI4 9
ASGNI4
line 598
;598:	s_playermodel.skinname.generic.flags  = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3952+44
CNSTU4 16392
ASGNU4
line 599
;599:	s_playermodel.skinname.generic.x	  = 497;
ADDRGP4 s_playermodel+3952+12
CNSTI4 497
ASGNI4
line 600
;600:	s_playermodel.skinname.generic.y	  = 394;
ADDRGP4 s_playermodel+3952+16
CNSTI4 394
ASGNI4
line 601
;601:	s_playermodel.skinname.string	      = skinname;
ADDRGP4 s_playermodel+3952+60
ADDRGP4 $319
ASGNP4
line 602
;602:	s_playermodel.skinname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+3952+64
CNSTI4 1
ASGNI4
line 603
;603:	s_playermodel.skinname.color          = text_color_normal;
ADDRGP4 s_playermodel+3952+68
ADDRGP4 text_color_normal
ASGNP4
line 605
;604:
;605:	s_playermodel.player.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3528
CNSTI4 6
ASGNI4
line 606
;606:	s_playermodel.player.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_playermodel+3528+44
CNSTU4 16384
ASGNU4
line 607
;607:	s_playermodel.player.generic.ownerdraw = PlayerModel_DrawPlayer;
ADDRGP4 s_playermodel+3528+56
ADDRGP4 PlayerModel_DrawPlayer
ASGNP4
line 608
;608:	s_playermodel.player.generic.x	       = 400;
ADDRGP4 s_playermodel+3528+12
CNSTI4 400
ASGNI4
line 609
;609:	s_playermodel.player.generic.y	       = -40;
ADDRGP4 s_playermodel+3528+16
CNSTI4 -40
ASGNI4
line 610
;610:	s_playermodel.player.width	           = 32*10;
ADDRGP4 s_playermodel+3528+76
CNSTI4 320
ASGNI4
line 611
;611:	s_playermodel.player.height            = 56*10;
ADDRGP4 s_playermodel+3528+80
CNSTI4 560
ASGNI4
line 613
;612:
;613:	s_playermodel.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3616
CNSTI4 6
ASGNI4
line 614
;614:	s_playermodel.arrows.generic.name		= MODEL_ARROWS;
ADDRGP4 s_playermodel+3616+4
ADDRGP4 $74
ASGNP4
line 615
;615:	s_playermodel.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playermodel+3616+44
CNSTU4 16384
ASGNU4
line 616
;616:	s_playermodel.arrows.generic.x			= 125;
ADDRGP4 s_playermodel+3616+12
CNSTI4 125
ASGNI4
line 617
;617:	s_playermodel.arrows.generic.y			= 340;
ADDRGP4 s_playermodel+3616+16
CNSTI4 340
ASGNI4
line 618
;618:	s_playermodel.arrows.width				= 128;
ADDRGP4 s_playermodel+3616+76
CNSTI4 128
ASGNI4
line 619
;619:	s_playermodel.arrows.height				= 32;
ADDRGP4 s_playermodel+3616+80
CNSTI4 32
ASGNI4
line 621
;620:
;621:	s_playermodel.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3704
CNSTI4 6
ASGNI4
line 622
;622:	s_playermodel.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3704+44
CNSTU4 260
ASGNU4
line 623
;623:	s_playermodel.left.generic.callback		= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3704+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 624
;624:	s_playermodel.left.generic.id			= ID_PREVPAGE;
ADDRGP4 s_playermodel+3704+8
CNSTI4 100
ASGNI4
line 625
;625:	s_playermodel.left.generic.x			= 125;
ADDRGP4 s_playermodel+3704+12
CNSTI4 125
ASGNI4
line 626
;626:	s_playermodel.left.generic.y			= 340;
ADDRGP4 s_playermodel+3704+16
CNSTI4 340
ASGNI4
line 627
;627:	s_playermodel.left.width  				= 64;
ADDRGP4 s_playermodel+3704+76
CNSTI4 64
ASGNI4
line 628
;628:	s_playermodel.left.height  				= 32;
ADDRGP4 s_playermodel+3704+80
CNSTI4 32
ASGNI4
line 629
;629:	s_playermodel.left.focuspic				= MODEL_ARROWSL;
ADDRGP4 s_playermodel+3704+60
ADDRGP4 $75
ASGNP4
line 631
;630:
;631:	s_playermodel.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3792
CNSTI4 6
ASGNI4
line 632
;632:	s_playermodel.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3792+44
CNSTU4 260
ASGNU4
line 633
;633:	s_playermodel.right.generic.callback	= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3792+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 634
;634:	s_playermodel.right.generic.id			= ID_NEXTPAGE;
ADDRGP4 s_playermodel+3792+8
CNSTI4 101
ASGNI4
line 635
;635:	s_playermodel.right.generic.x			= 125+61;
ADDRGP4 s_playermodel+3792+12
CNSTI4 186
ASGNI4
line 636
;636:	s_playermodel.right.generic.y			= 340;
ADDRGP4 s_playermodel+3792+16
CNSTI4 340
ASGNI4
line 637
;637:	s_playermodel.right.width  				= 64;
ADDRGP4 s_playermodel+3792+76
CNSTI4 64
ASGNI4
line 638
;638:	s_playermodel.right.height  		    = 32;
ADDRGP4 s_playermodel+3792+80
CNSTI4 32
ASGNI4
line 639
;639:	s_playermodel.right.focuspic			= MODEL_ARROWSR;
ADDRGP4 s_playermodel+3792+60
ADDRGP4 $76
ASGNP4
line 641
;640:
;641:	s_playermodel.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3440
CNSTI4 6
ASGNI4
line 642
;642:	s_playermodel.back.generic.name     = MODEL_BACK0;
ADDRGP4 s_playermodel+3440+4
ADDRGP4 $67
ASGNP4
line 643
;643:	s_playermodel.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3440+44
CNSTU4 260
ASGNU4
line 644
;644:	s_playermodel.back.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3440+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 645
;645:	s_playermodel.back.generic.id	    = ID_BACK;
ADDRGP4 s_playermodel+3440+8
CNSTI4 102
ASGNI4
line 646
;646:	s_playermodel.back.generic.x		= 0;
ADDRGP4 s_playermodel+3440+12
CNSTI4 0
ASGNI4
line 647
;647:	s_playermodel.back.generic.y		= 480-64;
ADDRGP4 s_playermodel+3440+16
CNSTI4 416
ASGNI4
line 648
;648:	s_playermodel.back.width  		    = 128;
ADDRGP4 s_playermodel+3440+76
CNSTI4 128
ASGNI4
line 649
;649:	s_playermodel.back.height  		    = 64;
ADDRGP4 s_playermodel+3440+80
CNSTI4 64
ASGNI4
line 650
;650:	s_playermodel.back.focuspic         = MODEL_BACK1;
ADDRGP4 s_playermodel+3440+60
ADDRGP4 $68
ASGNP4
line 652
;651:
;652:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.banner );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 653
;653:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framel );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 654
;654:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framer );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 655
;655:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.ports );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3280
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 656
;656:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.playername );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 657
;657:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.modelname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 658
;658:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.skinname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 660
;659:
;660:	for (i=0; i<MAX_MODELSPERPAGE; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $549
line 661
;661:	{
line 662
;662:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.pics[i] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 s_playermodel+288
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 663
;663:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.picbuttons[i] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 664
;664:	}
LABELV $550
line 660
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $549
line 666
;665:
;666:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.player );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 667
;667:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.arrows );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 668
;668:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.left );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3704
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 669
;669:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.right );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 670
;670:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.back );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3440
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 676
;671:
;672:	// find all available models
;673://	PlayerModel_BuildList();
;674:
;675:	// set initial states
;676:	PlayerModel_SetMenuItems();
ADDRGP4 PlayerModel_SetMenuItems
CALLV
pop
line 679
;677:
;678:	// update user interface
;679:	PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 680
;680:	PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 681
;681:}
LABELV $316
endproc PlayerModel_MenuInit 28 12
export PlayerModel_Cache
proc PlayerModel_Cache 4 4
line 689
;682:
;683:/*
;684:=================
;685:PlayerModel_Cache
;686:=================
;687:*/
;688:void PlayerModel_Cache( void )
;689:{
line 692
;690:	int	i;
;691:
;692:	for( i = 0; playermodel_artlist[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $564
JUMPV
LABELV $561
line 693
;693:		trap_R_RegisterShaderNoMip( playermodel_artlist[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 694
;694:	}
LABELV $562
line 692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $561
line 696
;695:
;696:	PlayerModel_BuildList();
ADDRGP4 PlayerModel_BuildList
CALLV
pop
line 697
;697:	for( i = 0; i < s_playermodel.nummodels; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $568
JUMPV
LABELV $565
line 698
;698:		trap_R_RegisterShaderNoMip( s_playermodel.modelnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5208
ADDP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 699
;699:	}
LABELV $566
line 697
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $568
ADDRLP4 0
INDIRI4
ADDRGP4 s_playermodel+5204
INDIRI4
LTI4 $565
line 700
;700:}
LABELV $560
endproc PlayerModel_Cache 4 4
export UI_PlayerModelMenu
proc UI_PlayerModelMenu 0 8
line 703
;701:
;702:void UI_PlayerModelMenu(void)
;703:{
line 704
;704:	PlayerModel_MenuInit();
ADDRGP4 PlayerModel_MenuInit
CALLV
pop
line 706
;705:
;706:	UI_PushMenu( &s_playermodel.menu );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 708
;707:
;708:	Menu_SetCursorToItem( &s_playermodel.menu, &s_playermodel.pics[s_playermodel.selectedmodel % MAX_MODELSPERPAGE] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRGP4 s_playermodel+38048
INDIRI4
CNSTI4 16
MODI4
MULI4
ADDRGP4 s_playermodel+288
ADDP4
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 709
;709:}
LABELV $571
endproc UI_PlayerModelMenu 0 8
bss
align 4
LABELV s_playermodel
skip 38052
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
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
LABELV $330
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $285
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $275
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $272
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $260
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $259
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $257
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $256
byte 1 46
byte 1 0
align 1
LABELV $246
byte 1 47
byte 1 0
align 1
LABELV $245
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $238
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 77
byte 1 69
byte 1 77
byte 1 79
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $215
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $214
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $145
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $143
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $75
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $74
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $73
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $71
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $70
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $69
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $68
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $67
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
