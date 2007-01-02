data
align 4
LABELV playermodel_artlist
address $69
address $70
address $71
address $72
address $73
address $74
address $75
address $76
address $77
address $78
byte 4 0
code
proc PlayerModel_UpdateGrid 28 0
file "../ui_playermodel.c"
line 96
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
;79:	char			iconnames[MAX_PLAYERMODELS][128];
;80:	int				modelpage;
;81:	int				numpages;
;82:	char			modelskin[64];
;83:	int				selectedmodel;
;84:	char			efmodel[MAX_PLAYERMODELS][1];
;85:	
;86:} playermodel_t;
;87:
;88:static playermodel_t s_playermodel;
;89:
;90:/*
;91:=================
;92:PlayerModel_UpdateGrid
;93:=================
;94:*/
;95:static void PlayerModel_UpdateGrid( void )
;96:{
line 100
;97:	int	i;
;98:    int	j;
;99:
;100:	j = s_playermodel.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 101
;101:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++,j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $82
line 102
;102:	{
line 103
;103:		if (j < s_playermodel.nummodels)
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5208
INDIRI4
GEI4 $86
line 104
;104:		{ 
line 106
;105:			// model/skin portrait
;106: 			s_playermodel.pics[i].generic.name         = s_playermodel.iconnames[j];//s_playermodel.modelnames[j];
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
ADDRGP4 s_playermodel+37980
ADDP4
ASGNP4
line 108
;107:			//Com_Printf( "s_playermodel.pics[i].generic.name: %s  n", s_playermodel.iconnames[j] );	
;108:			s_playermodel.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
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
line 109
;109:		}
ADDRGP4 $87
JUMPV
LABELV $86
line 111
;110:		else
;111:		{
line 113
;112:			// dead slot
;113: 			s_playermodel.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+4
ADDP4
CNSTP4 0
ASGNP4
line 114
;114:			s_playermodel.picbuttons[i].generic.flags |= QMF_INACTIVE;
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
line 115
;115:		}
LABELV $87
line 117
;116:
;117: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
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
line 118
;118: 		s_playermodel.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+68
ADDP4
CNSTI4 0
ASGNI4
line 119
;119: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
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
line 120
;120:	}
LABELV $83
line 101
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
LTI4 $82
line 122
;121:
;122:	if (s_playermodel.selectedmodel/MAX_MODELSPERPAGE == s_playermodel.modelpage)
ADDRGP4 s_playermodel+70820
INDIRI4
CNSTI4 16
DIVI4
ADDRGP4 s_playermodel+70748
INDIRI4
NEI4 $104
line 123
;123:	{
line 125
;124:		// set selected model
;125:		i = s_playermodel.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 s_playermodel+70820
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 127
;126:
;127:		s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
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
line 128
;128:		s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 129
;129:	}
LABELV $104
line 131
;130:
;131:	if (s_playermodel.numpages > 1)
ADDRGP4 s_playermodel+70752
INDIRI4
CNSTI4 1
LEI4 $113
line 132
;132:	{
line 133
;133:		if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 0
LEI4 $116
line 134
;134:			s_playermodel.left.generic.flags &= ~QMF_INACTIVE;
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
ADDRGP4 $117
JUMPV
LABELV $116
line 136
;135:		else
;136:			s_playermodel.left.generic.flags |= QMF_INACTIVE;
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
LABELV $117
line 138
;137:
;138:		if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+70748
INDIRI4
ADDRGP4 s_playermodel+70752
INDIRI4
CNSTI4 1
SUBI4
GEI4 $123
line 139
;139:			s_playermodel.right.generic.flags &= ~QMF_INACTIVE;
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
ADDRGP4 $114
JUMPV
LABELV $123
line 141
;140:		else
;141:			s_playermodel.right.generic.flags |= QMF_INACTIVE;
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
line 142
;142:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 144
;143:	else
;144:	{
line 146
;145:		// hide left/right markers
;146:		s_playermodel.left.generic.flags |= QMF_INACTIVE;
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
line 147
;147:		s_playermodel.right.generic.flags |= QMF_INACTIVE;
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
line 148
;148:	}
LABELV $114
line 149
;149:}
LABELV $80
endproc PlayerModel_UpdateGrid 28 0
proc PlayerModel_UpdateModel 28 28
line 157
;150:
;151:/*
;152:=================
;153:PlayerModel_UpdateModel
;154:=================
;155:*/
;156:static void PlayerModel_UpdateModel( void )
;157:{
line 161
;158:	vec3_t	viewangles;
;159:	vec3_t	moveangles;
;160:
;161:	memset( &s_playermodel.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playermodel+4096
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 163
;162:	
;163:	viewangles[YAW]   = 180 - 30;
ADDRLP4 0+4
CNSTF4 1125515264
ASGNF4
line 164
;164:	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 165
;165:	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 166
;166:	VectorClear( moveangles );
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
line 168
;167:
;168:	UI_PlayerInfo_SetModel( &s_playermodel.playerinfo, s_playermodel.modelskin );
ADDRGP4 s_playermodel+4096
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 169
;169:	UI_PlayerInfo_SetInfo( &s_playermodel.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, moveangles, WP_MACHINEGUN, qfalse );
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
line 170
;170:}
LABELV $135
endproc PlayerModel_UpdateModel 28 28
proc PlayerModel_SaveChanges 0 8
line 178
;171:
;172:/*
;173:=================
;174:PlayerModel_SaveChanges
;175:=================
;176:*/
;177:static void PlayerModel_SaveChanges( void )
;178:{
line 179
;179:	trap_Cvar_Set( "model", s_playermodel.modelskin );
ADDRGP4 $145
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 180
;180:	trap_Cvar_Set( "headmodel", s_playermodel.modelskin );
ADDRGP4 $147
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 181
;181:	trap_Cvar_Set( "team_model", s_playermodel.modelskin );
ADDRGP4 $149
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 182
;182:	trap_Cvar_Set( "team_headmodel", s_playermodel.modelskin );
ADDRGP4 $151
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 183
;183:}
LABELV $144
endproc PlayerModel_SaveChanges 0 8
proc PlayerModel_MenuEvent 12 0
line 191
;184:
;185:/*
;186:=================
;187:PlayerModel_MenuEvent
;188:=================
;189:*/
;190:static void PlayerModel_MenuEvent( void* ptr, int event )
;191:{
line 192
;192:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $154
line 193
;193:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 195
;194:
;195:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $159
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $164
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $170
ADDRGP4 $156
JUMPV
line 196
;196:	{
LABELV $159
line 198
;197:		case ID_PREVPAGE:
;198:			if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 0
LEI4 $157
line 199
;199:			{
line 200
;200:				s_playermodel.modelpage--;
ADDRLP4 8
ADDRGP4 s_playermodel+70748
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 201
;201:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 202
;202:			}
line 203
;203:			break;
ADDRGP4 $157
JUMPV
LABELV $164
line 206
;204:
;205:		case ID_NEXTPAGE:
;206:			if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+70748
INDIRI4
ADDRGP4 s_playermodel+70752
INDIRI4
CNSTI4 1
SUBI4
GEI4 $157
line 207
;207:			{
line 208
;208:				s_playermodel.modelpage++;
ADDRLP4 8
ADDRGP4 s_playermodel+70748
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 209
;209:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 210
;210:			}
line 211
;211:			break;
ADDRGP4 $157
JUMPV
LABELV $170
line 214
;212:
;213:		case ID_BACK:
;214:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 215
;215:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 216
;216:			break;
LABELV $156
LABELV $157
line 218
;217:	}
;218:}
LABELV $153
endproc PlayerModel_MenuEvent 12 0
proc PlayerModel_MenuKey 52 8
line 226
;219:
;220:/*
;221:=================
;222:PlayerModel_MenuKey
;223:=================
;224:*/
;225:static sfxHandle_t PlayerModel_MenuKey( int key )
;226:{
line 230
;227:	menucommon_s*	m;
;228:	int				picnum;
;229:
;230:	switch (key)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 134
EQI4 $174
ADDRLP4 12
CNSTI4 135
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $183
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $197
LABELV $196
ADDRFP4 0
INDIRI4
CNSTI4 27
EQI4 $195
ADDRGP4 $172
JUMPV
LABELV $197
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
EQI4 $174
ADDRLP4 16
INDIRI4
CNSTI4 165
EQI4 $183
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $172
LABELV $198
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $195
ADDRGP4 $172
JUMPV
line 231
;231:	{
LABELV $174
line 234
;232:		case K_KP_LEFTARROW:
;233:		case K_LEFTARROW:
;234:			m = Menu_ItemAtCursor(&s_playermodel.menu);
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
line 235
;235:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 236
;236:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $173
ADDRLP4 28
INDIRI4
CNSTI4 15
GTI4 $173
line 237
;237:			{
line 238
;238:				if (picnum > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $177
line 239
;239:				{
line 240
;240:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-1);
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
line 241
;241:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
LABELV $177
line 244
;242:					
;243:				}
;244:				else if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 0
LEI4 $179
line 245
;245:				{
line 246
;246:					s_playermodel.modelpage--;
ADDRLP4 32
ADDRGP4 s_playermodel+70748
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 247
;247:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+15);
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
line 248
;248:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 249
;249:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
LABELV $179
line 252
;250:				}
;251:				else
;252:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
line 254
;253:			}
;254:			break;
LABELV $183
line 258
;255:
;256:		case K_KP_RIGHTARROW:
;257:		case K_RIGHTARROW:
;258:			m = Menu_ItemAtCursor(&s_playermodel.menu);
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
line 259
;259:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 260
;260:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 36
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $173
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $173
line 261
;261:			{
line 262
;262:				if ((picnum < 15) && (s_playermodel.modelpage*MAX_MODELSPERPAGE + picnum+1 < s_playermodel.nummodels))
ADDRLP4 40
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 15
GEI4 $186
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRGP4 s_playermodel+5208
INDIRI4
GEI4 $186
line 263
;263:				{
line 264
;264:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+1);
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
line 265
;265:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
LABELV $186
line 267
;266:				}					
;267:				else if ((picnum == 15) && (s_playermodel.modelpage < s_playermodel.numpages-1))
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $190
ADDRGP4 s_playermodel+70748
INDIRI4
ADDRGP4 s_playermodel+70752
INDIRI4
CNSTI4 1
SUBI4
GEI4 $190
line 268
;268:				{
line 269
;269:					s_playermodel.modelpage++;
ADDRLP4 44
ADDRGP4 s_playermodel+70748
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 270
;270:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-15);
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
line 271
;271:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 272
;272:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
LABELV $190
line 275
;273:				}
;274:				else
;275:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $171
JUMPV
line 277
;276:			}
;277:			break;
LABELV $195
line 281
;278:			
;279:		case K_MOUSE2:
;280:		case K_ESCAPE:
;281:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 282
;282:			break;
LABELV $172
LABELV $173
line 285
;283:	}
;284:
;285:	return ( Menu_DefaultKey( &s_playermodel.menu, key ) );
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
LABELV $171
endproc PlayerModel_MenuKey 52 8
proc PlayerModel_PicEvent 48 12
line 294
;286:}
;287:
;288:/*
;289:=================
;290:PlayerModel_PicEvent
;291:=================
;292:*/
;293:static void PlayerModel_PicEvent( void* ptr, int event )
;294:{
line 301
;295:	int				modelnum;
;296:	int				maxlen;
;297:	char*			buffptr;
;298:	char*			pdest;
;299:	int				i;
;300:
;301:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $200
line 302
;302:		return;
ADDRGP4 $199
JUMPV
LABELV $200
line 304
;303:
;304:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $202
line 305
;305:	{
line 307
;306:		// reset
;307: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
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
line 308
;308: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
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
line 309
;309:	}
LABELV $203
line 304
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $202
line 312
;310:
;311:	// set selected
;312:	i = ((menucommon_s*)ptr)->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 313
;313:	s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
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
line 314
;314:	s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 317
;315:
;316:	// get model and strip icon_
;317:	modelnum = s_playermodel.modelpage*MAX_MODELSPERPAGE + i;
ADDRLP4 16
ADDRGP4 s_playermodel+70748
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 320
;318:	
;319:
;320:	buffptr  = s_playermodel.modelnames[modelnum] + strlen("models/players/");
ADDRGP4 $216
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
ADDRGP4 s_playermodel+5212
ADDP4
ADDP4
ASGNP4
line 322
;321:		
;322:	pdest    = strstr(buffptr,"icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 323
;323:	if (pdest)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 324
;324:	{
line 326
;325:		// track the whole model/skin name
;326:		Q_strncpyz(s_playermodel.modelskin,buffptr,pdest-buffptr+1);
ADDRGP4 s_playermodel+70756
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
line 327
;327:		strcat(s_playermodel.modelskin,pdest + 5);
ADDRGP4 s_playermodel+70756
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 331
;328:
;329:		// seperate the model name
;330:
;331:		maxlen = pdest-buffptr;
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
line 332
;332:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $222
line 333
;333:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $222
line 334
;334:		Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
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
line 335
;335:		Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 338
;336:
;337:		// seperate the skin name
;338:		maxlen = strlen(pdest+5)+1;
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
line 339
;339:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $228
line 340
;340:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $228
line 341
;341:		Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
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
line 342
;342:		Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 344
;343:
;344:		s_playermodel.selectedmodel = modelnum;
ADDRGP4 s_playermodel+70820
ADDRLP4 16
INDIRI4
ASGNI4
line 346
;345:
;346:		if( trap_MemoryRemaining() > LOW_MEMORY ) {
ADDRLP4 44
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 5242880
LEI4 $235
line 347
;347:			PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 348
;348:		}
LABELV $235
line 349
;349:	}
LABELV $218
line 350
;350:}
LABELV $199
endproc PlayerModel_PicEvent 48 12
proc PlayerModel_DrawPlayer 12 24
line 358
;351:
;352:/*
;353:=================
;354:PlayerModel_DrawPlayer
;355:=================
;356:*/
;357:static void PlayerModel_DrawPlayer( void *self )
;358:{
line 361
;359:	menubitmap_s*	b;
;360:
;361:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 363
;362:
;363:	if( trap_MemoryRemaining() <= LOW_MEMORY ) {
ADDRLP4 4
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5242880
GTI4 $238
line 364
;364:		UI_DrawProportionalString( b->generic.x, b->generic.y + b->height / 2, "LOW MEMORY", UI_LEFT, color_red );
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
ADDRGP4 $240
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 365
;365:		return;
ADDRGP4 $237
JUMPV
LABELV $238
line 368
;366:	}
;367:
;368:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playermodel.playerinfo, uis.realtime/2 );
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
line 369
;369:}
LABELV $237
endproc PlayerModel_DrawPlayer 12 24
proc PlayerModel_BuildList 6300 20
line 377
;370:
;371:/*
;372:=================
;373:PlayerModel_BuildList
;374:=================
;375:*/
;376:static void PlayerModel_BuildList( void )
;377:{
line 392
;378:	int		numdirs;
;379:	int		numfiles;
;380:	char	dirlist[2048];
;381:	char	dirlist2[2048];
;382:	char	filelist[2048];
;383:	char	skinname[64];
;384:	char*	dirptr;
;385:	char*	fileptr;
;386:	int		i;
;387:	int		j;
;388:	int		dirlen;
;389:	int		filelen;
;390:	qboolean precache;
;391:
;392:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $244
ARGP4
ADDRLP4 6244
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 6244
INDIRF4
CVFI4 4
ASGNI4
line 394
;393:
;394:	s_playermodel.modelpage = 0;
ADDRGP4 s_playermodel+70748
CNSTI4 0
ASGNI4
line 395
;395:	s_playermodel.nummodels = 0;
ADDRGP4 s_playermodel+5208
CNSTI4 0
ASGNI4
line 398
;396:
;397:	// iterate directory of all player models
;398:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $247
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 2148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6248
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 6248
INDIRI4
ASGNI4
line 399
;399:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2148
ASGNP4
line 400
;400:	for (i=0; i<numdirs && s_playermodel.nummodels < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $249
line 401
;401:	{
line 402
;402:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6252
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 6252
INDIRI4
ASGNI4
line 404
;403:		
;404:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $254
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
NEI4 $254
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $254
line 406
;405:
;406:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 6260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6260
INDIRI4
CNSTI4 0
EQI4 $260
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 6264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6264
INDIRI4
CNSTI4 0
NEI4 $256
LABELV $260
line 407
;407:			continue;
ADDRGP4 $250
JUMPV
LABELV $256
line 410
;408:			
;409:		// iterate all skin files in directory
;410:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $261
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6268
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6268
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6272
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 6272
INDIRI4
ASGNI4
line 411
;411:		fileptr  = filelist;
ADDRLP4 64
ADDRLP4 96
ASGNP4
line 412
;412:		for (j=0; j<numfiles && s_playermodel.nummodels < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $263
line 413
;413:		{
line 414
;414:			filelen = strlen(fileptr);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 6276
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 6276
INDIRI4
ASGNI4
line 416
;415:
;416:			COM_StripExtension(fileptr,skinname);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 419
;417:
;418:			// look for icon_????
;419:			if (!Q_stricmpn(skinname,"icon_",5))
ADDRLP4 0
ARGP4
ADDRGP4 $217
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 6280
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 6280
INDIRI4
CNSTI4 0
NEI4 $268
line 420
;420:			{
line 422
;421:				
;422:				Com_sprintf( s_playermodel.iconnames[s_playermodel.nummodels],
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+37980
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 426
;423:					sizeof( s_playermodel.iconnames[s_playermodel.nummodels] ),
;424:					"models/players/%s/%s", dirptr, skinname );
;425:
;426:				Com_sprintf( s_playermodel.modelnames[s_playermodel.nummodels++],
ADDRLP4 6288
ADDRGP4 s_playermodel+5208
ASGNP4
ADDRLP4 6284
ADDRLP4 6288
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 6288
INDIRP4
ADDRLP4 6284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 6284
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5212
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 434
;427:					sizeof( s_playermodel.modelnames[s_playermodel.nummodels] ),
;428:					"models/players/%s/%s", dirptr, skinname );
;429:				
;430:
;431:				
;432:				//if (s_playermodel.nummodels >= MAX_PLAYERMODELS)
;433:				//	return;
;434:			}
LABELV $268
line 436
;435:
;436:			if( precache ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $279
line 437
;437:				trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", skinname), qfalse );
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 6284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6284
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 438
;438:			}
LABELV $279
line 439
;439:		}
LABELV $264
line 412
ADDRLP4 6276
CNSTI4 1
ASGNI4
ADDRLP4 68
ADDRLP4 68
INDIRI4
ADDRLP4 6276
INDIRI4
ADDI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
ADDRLP4 6276
INDIRI4
ADDI4
ADDRLP4 64
INDIRP4
ADDP4
ASGNP4
LABELV $266
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $282
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 256
LTI4 $263
LABELV $282
line 440
;440:	}	
LABELV $250
line 400
ADDRLP4 6252
CNSTI4 1
ASGNI4
ADDRLP4 92
ADDRLP4 92
INDIRI4
ADDRLP4 6252
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 88
INDIRI4
ADDRLP4 6252
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $252
ADDRLP4 92
INDIRI4
ADDRLP4 2144
INDIRI4
GEI4 $283
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 256
LTI4 $249
LABELV $283
line 446
;441:
;442:	//APSFIXME - Degenerate no models case
;443:
;444:
;445:	// iterate directory of all player models
;446:	numdirs = trap_FS_GetFileList("models/players2", "/", dirlist2, 2048 );
ADDRGP4 $284
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 4196
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6256
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 6256
INDIRI4
ASGNI4
line 447
;447:	dirptr  = dirlist2;
ADDRLP4 76
ADDRLP4 4196
ASGNP4
line 448
;448:	for (i=0; i<numdirs && s_playermodel.nummodels < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 449
;449:	{
line 450
;450:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 6260
INDIRI4
ASGNI4
line 452
;451:		
;452:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $290
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
NEI4 $290
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $290
line 454
;453:
;454:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 6268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6268
INDIRI4
CNSTI4 0
EQI4 $294
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 6272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6272
INDIRI4
CNSTI4 0
NEI4 $292
LABELV $294
line 455
;455:			continue;
ADDRGP4 $286
JUMPV
LABELV $292
line 458
;456:			
;457:		// iterate all skin files in directory
;458:		numfiles = trap_FS_GetFileList( va("models/players2/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $295
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6276
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6280
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 6280
INDIRI4
ASGNI4
line 459
;459:		fileptr  = filelist;
ADDRLP4 64
ADDRLP4 96
ASGNP4
line 460
;460:		for (j=0; j<numfiles && s_playermodel.nummodels < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $296
line 461
;461:		{
line 462
;462:			filelen = strlen(fileptr);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 6284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 6284
INDIRI4
ASGNI4
line 464
;463:
;464:			COM_StripExtension(fileptr,skinname);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 467
;465:			
;466:			// look for icon_????
;467:			if (!Q_stricmpn(skinname,"icon_",5))
ADDRLP4 0
ARGP4
ADDRGP4 $217
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 6288
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 6288
INDIRI4
CNSTI4 0
NEI4 $301
line 468
;468:			{
line 471
;469:				
;470:				
;471:				Com_sprintf( s_playermodel.iconnames[s_playermodel.nummodels],
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+37980
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $307
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 475
;472:					sizeof( s_playermodel.iconnames[s_playermodel.nummodels] ),
;473:					"models/players2/%s/%s", dirptr, skinname );
;474:				
;475:				Com_sprintf( s_playermodel.modelnames[s_playermodel.nummodels++],
ADDRLP4 6296
ADDRGP4 s_playermodel+5208
ASGNP4
ADDRLP4 6292
ADDRLP4 6296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 6296
INDIRP4
ADDRLP4 6292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 6292
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5212
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 484
;476:					sizeof( s_playermodel.modelnames[s_playermodel.nummodels] ),
;477:					"models/players/%s/%s", dirptr, skinname );
;478:
;479:
;480:				
;481:				
;482:				//if (s_playermodel.nummodels >= MAX_PLAYERMODELS)
;483:				//	return;
;484:			}
LABELV $301
line 486
;485:
;486:			if( precache ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $312
line 487
;487:				trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", skinname), qfalse );
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 6292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6292
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 488
;488:			}
LABELV $312
line 489
;489:		}
LABELV $297
line 460
ADDRLP4 6284
CNSTI4 1
ASGNI4
ADDRLP4 68
ADDRLP4 68
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ADDRLP4 64
INDIRP4
ADDP4
ASGNP4
LABELV $299
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $314
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 256
LTI4 $296
LABELV $314
line 490
;490:	}	
LABELV $286
line 448
ADDRLP4 6260
CNSTI4 1
ASGNI4
ADDRLP4 92
ADDRLP4 92
INDIRI4
ADDRLP4 6260
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 88
INDIRI4
ADDRLP4 6260
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $288
ADDRLP4 92
INDIRI4
ADDRLP4 2144
INDIRI4
GEI4 $315
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 256
LTI4 $285
LABELV $315
line 500
;491:
;492:	//APSFIXME - Degenerate no models case
;493:
;494:
;495:
;496:
;497:
;498:
;499:
;500:	s_playermodel.numpages = s_playermodel.nummodels/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+70752
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 501
;501:	if (s_playermodel.nummodels % MAX_MODELSPERPAGE)
ADDRGP4 s_playermodel+5208
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $318
line 502
;502:		s_playermodel.numpages++;
ADDRLP4 6264
ADDRGP4 s_playermodel+70752
ASGNP4
ADDRLP4 6264
INDIRP4
ADDRLP4 6264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
line 503
;503:}
LABELV $243
endproc PlayerModel_BuildList 6300 20
proc PlayerModel_SetMenuItems 104 12
line 511
;504:
;505:/*
;506:=================
;507:PlayerModel_SetMenuItems
;508:=================
;509:*/
;510:static void PlayerModel_SetMenuItems( void )
;511:{
line 519
;512:	int				i;
;513:	int				maxlen;
;514:	char			modelskin[64];
;515:	char*			buffptr;
;516:	char*			pdest;
;517:	qboolean		gotmodel;
;518:
;519:	gotmodel = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 522
;520:
;521:	// name
;522:	trap_Cvar_VariableStringBuffer( "name", s_playermodel.playername.string, 16 );
ADDRGP4 $323
ARGP4
ADDRGP4 s_playermodel+4024+60
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 523
;523:	Q_CleanStr( s_playermodel.playername.string );
ADDRGP4 s_playermodel+4024+60
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 526
;524:
;525:	// model
;526:	trap_Cvar_VariableStringBuffer( "model", s_playermodel.modelskin, 64 );
ADDRGP4 $145
ARGP4
ADDRGP4 s_playermodel+70756
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 529
;527:	
;528:	// find model in our list
;529:	for (i=0; i<s_playermodel.nummodels; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $329
line 530
;530:	{
line 532
;531:		// strip icon_
;532:		buffptr  = s_playermodel.modelnames[i] + strlen("models/players/");
ADDRGP4 $216
ARGP4
ADDRLP4 84
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5212
ADDP4
ADDP4
ASGNP4
line 533
;533:		pdest    = strstr(buffptr,"icon_");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 88
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 534
;534:		if (pdest)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
line 535
;535:		{
line 536
;536:			Q_strncpyz(modelskin,buffptr,pdest-buffptr+1);
ADDRLP4 20
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
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
line 537
;537:			strcat(modelskin,pdest + 5);
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 538
;538:			gotmodel = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 539
;539:		}
LABELV $335
line 542
;540:		
;541:		//q3 didnt work, now try for ef
;542:		if (gotmodel == qfalse)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $337
line 543
;543:		{
line 544
;544:			buffptr  = s_playermodel.modelnames[i] + strlen("models/players2/");
ADDRGP4 $340
ARGP4
ADDRLP4 92
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5212
ADDP4
ADDP4
ASGNP4
line 545
;545:			pdest    = strstr(buffptr,"icon_");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 96
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 546
;546:			if (pdest)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
line 547
;547:			{
line 548
;548:				Q_strncpyz(modelskin,buffptr,pdest-buffptr+1);
ADDRLP4 20
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
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
line 549
;549:				strcat(modelskin,pdest + 5);
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 550
;550:				gotmodel = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 551
;551:			}
LABELV $341
line 552
;552:		}
LABELV $337
line 554
;553:
;554:		if (gotmodel == qfalse)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $343
line 555
;555:		{
line 556
;556:			continue;
ADDRGP4 $330
JUMPV
LABELV $343
line 559
;557:		}
;558:
;559:		if (!Q_stricmp( s_playermodel.modelskin, modelskin ))
ADDRGP4 s_playermodel+70756
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $345
line 560
;560:		{
line 562
;561:			// found pic, set selection here		
;562:			s_playermodel.selectedmodel = i;
ADDRGP4 s_playermodel+70820
ADDRLP4 8
INDIRI4
ASGNI4
line 563
;563:			s_playermodel.modelpage     = i/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+70748
ADDRLP4 8
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 566
;564:
;565:			// seperate the model name
;566:			maxlen = pdest-buffptr;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 567
;567:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $350
line 568
;568:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $350
line 569
;569:			Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 570
;570:			Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+3880+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 573
;571:
;572:			// seperate the skin name
;573:			maxlen = strlen(pdest+5)+1;
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 574
;574:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $356
line 575
;575:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $356
line 576
;576:			Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
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
line 577
;577:			Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+3952+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 578
;578:			break;
ADDRGP4 $331
JUMPV
LABELV $345
line 580
;579:		}
;580:	}
LABELV $330
line 529
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $332
ADDRLP4 8
INDIRI4
ADDRGP4 s_playermodel+5208
INDIRI4
LTI4 $329
LABELV $331
line 581
;581:}
LABELV $322
endproc PlayerModel_SetMenuItems 104 12
bss
align 1
LABELV $363
skip 32
align 1
LABELV $364
skip 32
align 1
LABELV $365
skip 32
code
proc PlayerModel_MenuInit 28 12
line 589
;582:
;583:/*
;584:=================
;585:PlayerModel_MenuInit
;586:=================
;587:*/
;588:static void PlayerModel_MenuInit( void )
;589:{
line 600
;590:	int			i;
;591:	int			j;
;592:	int			k;
;593:	int			x;
;594:	int			y;
;595:	static char	playername[32];
;596:	static char	modelname[32];
;597:	static char	skinname[32];
;598:
;599:	// zero set all our globals
;600:	memset( &s_playermodel, 0 ,sizeof(playermodel_t) );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 0
ARGI4
CNSTI4 71080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 602
;601:
;602:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 604
;603:
;604:	s_playermodel.menu.key        = PlayerModel_MenuKey;
ADDRGP4 s_playermodel+272
ADDRGP4 PlayerModel_MenuKey
ASGNP4
line 605
;605:	s_playermodel.menu.wrapAround = qtrue;
ADDRGP4 s_playermodel+276
CNSTI4 1
ASGNI4
line 606
;606:	s_playermodel.menu.fullscreen = qtrue;
ADDRGP4 s_playermodel+280
CNSTI4 1
ASGNI4
line 608
;607:
;608:	s_playermodel.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playermodel+3368
CNSTI4 10
ASGNI4
line 609
;609:	s_playermodel.banner.generic.x     = 320;
ADDRGP4 s_playermodel+3368+12
CNSTI4 320
ASGNI4
line 610
;610:	s_playermodel.banner.generic.y     = 16;
ADDRGP4 s_playermodel+3368+16
CNSTI4 16
ASGNI4
line 611
;611:	s_playermodel.banner.string        = "PLAYER MODEL";
ADDRGP4 s_playermodel+3368+60
ADDRGP4 $376
ASGNP4
line 612
;612:	s_playermodel.banner.color         = color_white;
ADDRGP4 s_playermodel+3368+68
ADDRGP4 color_white
ASGNP4
line 613
;613:	s_playermodel.banner.style         = UI_CENTER;
ADDRGP4 s_playermodel+3368+64
CNSTI4 1
ASGNI4
line 615
;614:
;615:	s_playermodel.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3104
CNSTI4 6
ASGNI4
line 616
;616:	s_playermodel.framel.generic.name  = MODEL_FRAMEL;
ADDRGP4 s_playermodel+3104+4
ADDRGP4 $73
ASGNP4
line 617
;617:	s_playermodel.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3104+44
CNSTU4 16388
ASGNU4
line 618
;618:	s_playermodel.framel.generic.x     = 0;
ADDRGP4 s_playermodel+3104+12
CNSTI4 0
ASGNI4
line 619
;619:	s_playermodel.framel.generic.y     = 78;
ADDRGP4 s_playermodel+3104+16
CNSTI4 78
ASGNI4
line 620
;620:	s_playermodel.framel.width         = 256;
ADDRGP4 s_playermodel+3104+76
CNSTI4 256
ASGNI4
line 621
;621:	s_playermodel.framel.height        = 329;
ADDRGP4 s_playermodel+3104+80
CNSTI4 329
ASGNI4
line 623
;622:
;623:	s_playermodel.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3192
CNSTI4 6
ASGNI4
line 624
;624:	s_playermodel.framer.generic.name  = MODEL_FRAMER;
ADDRGP4 s_playermodel+3192+4
ADDRGP4 $74
ASGNP4
line 625
;625:	s_playermodel.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3192+44
CNSTU4 16388
ASGNU4
line 626
;626:	s_playermodel.framer.generic.x     = 376;
ADDRGP4 s_playermodel+3192+12
CNSTI4 376
ASGNI4
line 627
;627:	s_playermodel.framer.generic.y     = 76;
ADDRGP4 s_playermodel+3192+16
CNSTI4 76
ASGNI4
line 628
;628:	s_playermodel.framer.width         = 256;
ADDRGP4 s_playermodel+3192+76
CNSTI4 256
ASGNI4
line 629
;629:	s_playermodel.framer.height        = 334;
ADDRGP4 s_playermodel+3192+80
CNSTI4 334
ASGNI4
line 631
;630:
;631:	s_playermodel.ports.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3280
CNSTI4 6
ASGNI4
line 632
;632:	s_playermodel.ports.generic.name  = MODEL_PORTS;
ADDRGP4 s_playermodel+3280+4
ADDRGP4 $75
ASGNP4
line 633
;633:	s_playermodel.ports.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3280+44
CNSTU4 16388
ASGNU4
line 634
;634:	s_playermodel.ports.generic.x     = 50;
ADDRGP4 s_playermodel+3280+12
CNSTI4 50
ASGNI4
line 635
;635:	s_playermodel.ports.generic.y     = 59;
ADDRGP4 s_playermodel+3280+16
CNSTI4 59
ASGNI4
line 636
;636:	s_playermodel.ports.width         = 274;
ADDRGP4 s_playermodel+3280+76
CNSTI4 274
ASGNI4
line 637
;637:	s_playermodel.ports.height        = 274;
ADDRGP4 s_playermodel+3280+80
CNSTI4 274
ASGNI4
line 639
;638:
;639:	y =	59;
ADDRLP4 8
CNSTI4 59
ASGNI4
line 640
;640:	for (i=0,k=0; i<PLAYERGRID_ROWS; i++)
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
ADDRGP4 $423
JUMPV
LABELV $420
line 641
;641:	{
line 642
;642:		x =	50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 643
;643:		for (j=0; j<PLAYERGRID_COLS; j++,k++)
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $424
line 644
;644:		{
line 645
;645:			s_playermodel.pics[k].generic.type	   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288
ADDP4
CNSTI4 6
ASGNI4
line 646
;646:			s_playermodel.pics[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
CNSTU4 16388
ASGNU4
line 647
;647:			s_playermodel.pics[k].generic.x		   = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 648
;648:			s_playermodel.pics[k].generic.y		   = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 649
;649:			s_playermodel.pics[k].width  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+76
ADDP4
CNSTI4 64
ASGNI4
line 650
;650:			s_playermodel.pics[k].height  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+80
ADDP4
CNSTI4 64
ASGNI4
line 651
;651:			s_playermodel.pics[k].focuspic         = MODEL_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+60
ADDP4
ADDRGP4 $72
ASGNP4
line 652
;652:			s_playermodel.pics[k].focuscolor       = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+288+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 654
;653:
;654:			s_playermodel.picbuttons[k].generic.type	 = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696
ADDP4
CNSTI4 6
ASGNI4
line 655
;655:			s_playermodel.picbuttons[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+44
ADDP4
CNSTU4 33028
ASGNU4
line 656
;656:			s_playermodel.picbuttons[k].generic.id	     = ID_PLAYERPIC0+k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 657
;657:			s_playermodel.picbuttons[k].generic.callback = PlayerModel_PicEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+48
ADDP4
ADDRGP4 PlayerModel_PicEvent
ASGNP4
line 658
;658:			s_playermodel.picbuttons[k].generic.x    	 = x - 16;
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
line 659
;659:			s_playermodel.picbuttons[k].generic.y		 = y - 16;
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
line 660
;660:			s_playermodel.picbuttons[k].generic.left	 = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 661
;661:			s_playermodel.picbuttons[k].generic.top		 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 662
;662:			s_playermodel.picbuttons[k].generic.right	 = x + 64;
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
line 663
;663:			s_playermodel.picbuttons[k].generic.bottom   = y + 64;
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
line 664
;664:			s_playermodel.picbuttons[k].width  		     = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+76
ADDP4
CNSTI4 128
ASGNI4
line 665
;665:			s_playermodel.picbuttons[k].height  		 = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+80
ADDP4
CNSTI4 128
ASGNI4
line 666
;666:			s_playermodel.picbuttons[k].focuspic  		 = MODEL_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+60
ADDP4
ADDRGP4 $71
ASGNP4
line 667
;667:			s_playermodel.picbuttons[k].focuscolor  	 = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1696+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 669
;668:
;669:			x += 64+6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 670
;670:		}
LABELV $425
line 643
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
LTI4 $424
line 671
;671:		y += 64+6;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 672
;672:	}
LABELV $421
line 640
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $423
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $420
line 674
;673:
;674:	s_playermodel.playername.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4024
CNSTI4 9
ASGNI4
line 675
;675:	s_playermodel.playername.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+4024+44
CNSTU4 16392
ASGNU4
line 676
;676:	s_playermodel.playername.generic.x	   = 320;
ADDRGP4 s_playermodel+4024+12
CNSTI4 320
ASGNI4
line 677
;677:	s_playermodel.playername.generic.y	   = 440;
ADDRGP4 s_playermodel+4024+16
CNSTI4 440
ASGNI4
line 678
;678:	s_playermodel.playername.string	       = playername;
ADDRGP4 s_playermodel+4024+60
ADDRGP4 $363
ASGNP4
line 679
;679:	s_playermodel.playername.style		   = UI_CENTER;
ADDRGP4 s_playermodel+4024+64
CNSTI4 1
ASGNI4
line 680
;680:	s_playermodel.playername.color         = text_color_normal;
ADDRGP4 s_playermodel+4024+68
ADDRGP4 text_color_normal
ASGNP4
line 682
;681:
;682:	s_playermodel.modelname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+3880
CNSTI4 9
ASGNI4
line 683
;683:	s_playermodel.modelname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3880+44
CNSTU4 16392
ASGNU4
line 684
;684:	s_playermodel.modelname.generic.x	  = 497;
ADDRGP4 s_playermodel+3880+12
CNSTI4 497
ASGNI4
line 685
;685:	s_playermodel.modelname.generic.y	  = 54;
ADDRGP4 s_playermodel+3880+16
CNSTI4 54
ASGNI4
line 686
;686:	s_playermodel.modelname.string	      = modelname;
ADDRGP4 s_playermodel+3880+60
ADDRGP4 $364
ASGNP4
line 687
;687:	s_playermodel.modelname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+3880+64
CNSTI4 1
ASGNI4
line 688
;688:	s_playermodel.modelname.color         = text_color_normal;
ADDRGP4 s_playermodel+3880+68
ADDRGP4 text_color_normal
ASGNP4
line 690
;689:
;690:	s_playermodel.skinname.generic.type   = MTYPE_PTEXT;
ADDRGP4 s_playermodel+3952
CNSTI4 9
ASGNI4
line 691
;691:	s_playermodel.skinname.generic.flags  = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3952+44
CNSTU4 16392
ASGNU4
line 692
;692:	s_playermodel.skinname.generic.x	  = 497;
ADDRGP4 s_playermodel+3952+12
CNSTI4 497
ASGNI4
line 693
;693:	s_playermodel.skinname.generic.y	  = 394;
ADDRGP4 s_playermodel+3952+16
CNSTI4 394
ASGNI4
line 694
;694:	s_playermodel.skinname.string	      = skinname;
ADDRGP4 s_playermodel+3952+60
ADDRGP4 $365
ASGNP4
line 695
;695:	s_playermodel.skinname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+3952+64
CNSTI4 1
ASGNI4
line 696
;696:	s_playermodel.skinname.color          = text_color_normal;
ADDRGP4 s_playermodel+3952+68
ADDRGP4 text_color_normal
ASGNP4
line 698
;697:
;698:	s_playermodel.player.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3528
CNSTI4 6
ASGNI4
line 699
;699:	s_playermodel.player.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_playermodel+3528+44
CNSTU4 16384
ASGNU4
line 700
;700:	s_playermodel.player.generic.ownerdraw = PlayerModel_DrawPlayer;
ADDRGP4 s_playermodel+3528+56
ADDRGP4 PlayerModel_DrawPlayer
ASGNP4
line 701
;701:	s_playermodel.player.generic.x	       = 400;
ADDRGP4 s_playermodel+3528+12
CNSTI4 400
ASGNI4
line 702
;702:	s_playermodel.player.generic.y	       = -40;
ADDRGP4 s_playermodel+3528+16
CNSTI4 -40
ASGNI4
line 703
;703:	s_playermodel.player.width	           = 32*10;
ADDRGP4 s_playermodel+3528+76
CNSTI4 320
ASGNI4
line 704
;704:	s_playermodel.player.height            = 56*10;
ADDRGP4 s_playermodel+3528+80
CNSTI4 560
ASGNI4
line 706
;705:
;706:	s_playermodel.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3616
CNSTI4 6
ASGNI4
line 707
;707:	s_playermodel.arrows.generic.name		= MODEL_ARROWS;
ADDRGP4 s_playermodel+3616+4
ADDRGP4 $76
ASGNP4
line 708
;708:	s_playermodel.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playermodel+3616+44
CNSTU4 16384
ASGNU4
line 709
;709:	s_playermodel.arrows.generic.x			= 125;
ADDRGP4 s_playermodel+3616+12
CNSTI4 125
ASGNI4
line 710
;710:	s_playermodel.arrows.generic.y			= 340;
ADDRGP4 s_playermodel+3616+16
CNSTI4 340
ASGNI4
line 711
;711:	s_playermodel.arrows.width				= 128;
ADDRGP4 s_playermodel+3616+76
CNSTI4 128
ASGNI4
line 712
;712:	s_playermodel.arrows.height				= 32;
ADDRGP4 s_playermodel+3616+80
CNSTI4 32
ASGNI4
line 714
;713:
;714:	s_playermodel.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3704
CNSTI4 6
ASGNI4
line 715
;715:	s_playermodel.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3704+44
CNSTU4 260
ASGNU4
line 716
;716:	s_playermodel.left.generic.callback		= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3704+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 717
;717:	s_playermodel.left.generic.id			= ID_PREVPAGE;
ADDRGP4 s_playermodel+3704+8
CNSTI4 100
ASGNI4
line 718
;718:	s_playermodel.left.generic.x			= 125;
ADDRGP4 s_playermodel+3704+12
CNSTI4 125
ASGNI4
line 719
;719:	s_playermodel.left.generic.y			= 340;
ADDRGP4 s_playermodel+3704+16
CNSTI4 340
ASGNI4
line 720
;720:	s_playermodel.left.width  				= 64;
ADDRGP4 s_playermodel+3704+76
CNSTI4 64
ASGNI4
line 721
;721:	s_playermodel.left.height  				= 32;
ADDRGP4 s_playermodel+3704+80
CNSTI4 32
ASGNI4
line 722
;722:	s_playermodel.left.focuspic				= MODEL_ARROWSL;
ADDRGP4 s_playermodel+3704+60
ADDRGP4 $77
ASGNP4
line 724
;723:
;724:	s_playermodel.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3792
CNSTI4 6
ASGNI4
line 725
;725:	s_playermodel.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3792+44
CNSTU4 260
ASGNU4
line 726
;726:	s_playermodel.right.generic.callback	= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3792+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 727
;727:	s_playermodel.right.generic.id			= ID_NEXTPAGE;
ADDRGP4 s_playermodel+3792+8
CNSTI4 101
ASGNI4
line 728
;728:	s_playermodel.right.generic.x			= 125+61;
ADDRGP4 s_playermodel+3792+12
CNSTI4 186
ASGNI4
line 729
;729:	s_playermodel.right.generic.y			= 340;
ADDRGP4 s_playermodel+3792+16
CNSTI4 340
ASGNI4
line 730
;730:	s_playermodel.right.width  				= 64;
ADDRGP4 s_playermodel+3792+76
CNSTI4 64
ASGNI4
line 731
;731:	s_playermodel.right.height  		    = 32;
ADDRGP4 s_playermodel+3792+80
CNSTI4 32
ASGNI4
line 732
;732:	s_playermodel.right.focuspic			= MODEL_ARROWSR;
ADDRGP4 s_playermodel+3792+60
ADDRGP4 $78
ASGNP4
line 734
;733:
;734:	s_playermodel.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3440
CNSTI4 6
ASGNI4
line 735
;735:	s_playermodel.back.generic.name     = MODEL_BACK0;
ADDRGP4 s_playermodel+3440+4
ADDRGP4 $69
ASGNP4
line 736
;736:	s_playermodel.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3440+44
CNSTU4 260
ASGNU4
line 737
;737:	s_playermodel.back.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3440+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 738
;738:	s_playermodel.back.generic.id	    = ID_BACK;
ADDRGP4 s_playermodel+3440+8
CNSTI4 102
ASGNI4
line 739
;739:	s_playermodel.back.generic.x		= 0;
ADDRGP4 s_playermodel+3440+12
CNSTI4 0
ASGNI4
line 740
;740:	s_playermodel.back.generic.y		= 480-64;
ADDRGP4 s_playermodel+3440+16
CNSTI4 416
ASGNI4
line 741
;741:	s_playermodel.back.width  		    = 128;
ADDRGP4 s_playermodel+3440+76
CNSTI4 128
ASGNI4
line 742
;742:	s_playermodel.back.height  		    = 64;
ADDRGP4 s_playermodel+3440+80
CNSTI4 64
ASGNI4
line 743
;743:	s_playermodel.back.focuspic         = MODEL_BACK1;
ADDRGP4 s_playermodel+3440+60
ADDRGP4 $70
ASGNP4
line 745
;744:
;745:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.banner );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 746
;746:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framel );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 747
;747:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framer );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 748
;748:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.ports );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3280
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 749
;749:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.playername );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 750
;750:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.modelname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 751
;751:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.skinname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 753
;752:
;753:	for (i=0; i<MAX_MODELSPERPAGE; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $595
line 754
;754:	{
line 755
;755:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.pics[i] );
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
line 756
;756:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.picbuttons[i] );
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
line 757
;757:	}
LABELV $596
line 753
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $595
line 759
;758:
;759:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.player );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 760
;760:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.arrows );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 761
;761:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.left );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3704
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 762
;762:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.right );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 763
;763:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.back );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3440
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 769
;764:
;765:	// find all available models
;766://	PlayerModel_BuildList();
;767:
;768:	// set initial states
;769:	PlayerModel_SetMenuItems();
ADDRGP4 PlayerModel_SetMenuItems
CALLV
pop
line 772
;770:
;771:	// update user interface
;772:	PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 773
;773:	PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 774
;774:}
LABELV $362
endproc PlayerModel_MenuInit 28 12
export PlayerModel_Cache
proc PlayerModel_Cache 4 4
line 782
;775:
;776:/*
;777:=================
;778:PlayerModel_Cache
;779:=================
;780:*/
;781:void PlayerModel_Cache( void )
;782:{
line 785
;783:	int	i;
;784:
;785:	for( i = 0; playermodel_artlist[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $610
JUMPV
LABELV $607
line 786
;786:		trap_R_RegisterShaderNoMip( playermodel_artlist[i] );
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
line 787
;787:	}
LABELV $608
line 785
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $610
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $607
line 789
;788:
;789:	PlayerModel_BuildList();
ADDRGP4 PlayerModel_BuildList
CALLV
pop
line 790
;790:	for( i = 0; i < s_playermodel.nummodels; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $614
JUMPV
LABELV $611
line 791
;791:		trap_R_RegisterShaderNoMip( s_playermodel.modelnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5212
ADDP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 792
;792:	}
LABELV $612
line 790
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $614
ADDRLP4 0
INDIRI4
ADDRGP4 s_playermodel+5208
INDIRI4
LTI4 $611
line 793
;793:}
LABELV $606
endproc PlayerModel_Cache 4 4
export UI_PlayerModelMenu
proc UI_PlayerModelMenu 0 8
line 796
;794:
;795:void UI_PlayerModelMenu(void)
;796:{
line 797
;797:	PlayerModel_MenuInit();
ADDRGP4 PlayerModel_MenuInit
CALLV
pop
line 799
;798:
;799:	UI_PushMenu( &s_playermodel.menu );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 801
;800:
;801:	Menu_SetCursorToItem( &s_playermodel.menu, &s_playermodel.pics[s_playermodel.selectedmodel % MAX_MODELSPERPAGE] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRGP4 s_playermodel+70820
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
line 802
;802:}
LABELV $617
endproc UI_PlayerModelMenu 0 8
bss
align 4
LABELV s_playermodel
skip 71080
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
import UI_DynamicCommandMenu_f
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
import UI_DynamicCommandMenu
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
import ui_browserMasterNum
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
LABELV $376
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
LABELV $340
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
byte 1 50
byte 1 47
byte 1 0
align 1
LABELV $323
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $307
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
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $295
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
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $284
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
byte 1 50
byte 1 0
align 1
LABELV $281
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
LABELV $274
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
LABELV $262
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $261
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
LABELV $259
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $258
byte 1 46
byte 1 0
align 1
LABELV $248
byte 1 47
byte 1 0
align 1
LABELV $247
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
LABELV $244
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
LABELV $240
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
LABELV $217
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $216
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
LABELV $151
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
LABELV $149
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
LABELV $147
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
LABELV $145
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $78
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
LABELV $77
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
byte 1 48
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
