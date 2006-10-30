data
export color_background
align 4
LABELV color_background
byte 4 0
byte 4 1051931443
byte 4 1060152279
byte 4 1065353216
export color_headertext
align 4
LABELV color_headertext
byte 4 1057467924
byte 4 1061494456
byte 4 1065353216
byte 4 1065353216
export color_maintext
align 4
LABELV color_maintext
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export credits
align 4
LABELV credits
address $71
byte 4 16417
address color_headertext
address $72
byte 4 17
address color_headertext
address $73
byte 4 17
address color_blue
address $74
byte 4 16417
address color_headertext
address $73
byte 4 17
address color_blue
address $75
byte 4 17
address color_headertext
address $76
byte 4 17
address color_maintext
address $77
byte 4 17
address color_maintext
address $78
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $79
byte 4 17
address color_headertext
address $80
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $81
byte 4 17
address color_headertext
address $82
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $83
byte 4 17
address color_headertext
address $84
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $85
byte 4 17
address color_headertext
address $86
byte 4 17
address color_maintext
address $87
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $88
byte 4 17
address color_headertext
address $86
byte 4 17
address color_maintext
address $77
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $89
byte 4 16417
address color_headertext
address $73
byte 4 17
address color_blue
address $90
byte 4 17
address color_maintext
address $91
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $92
byte 4 17
address color_headertext
address $93
byte 4 17
address color_maintext
address $94
byte 4 17
address color_maintext
address $95
byte 4 17
address color_maintext
address $96
byte 4 17
address color_maintext
address $97
byte 4 17
address color_maintext
address $98
byte 4 17
address color_maintext
address $99
byte 4 17
address color_maintext
address $100
byte 4 17
address color_maintext
address $101
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $73
byte 4 17
address color_blue
address $102
byte 4 17
address color_headertext
address $72
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $73
byte 4 17
address color_blue
address $73
byte 4 17
address color_blue
address $73
byte 4 17
address color_blue
address $103
byte 4 17
address color_maintext
address $104
byte 4 17
address color_maintext
byte 4 0
skip 8
code
proc UI_CreditMenu_Key 4 8
file "../ui_credits.c"
line 129
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CREDITS  - Used from code3arena
;7:
;8:=======================================================================
;9:*/
;10:
;11:// INCLUDE FILES
;12:#include "ui_local.h"
;13:
;14:// CONSTANT DEFINITIONS
;15:
;16:#define SCROLLSPEED	2.00 // The scrolling speed in pixels per second.
;17:                          // modify as appropriate for our credits
;18:#define BACKGROUND_SHADER			"menu/art/frame1_r"
;19:// uncomment this to use a background shader, otherwise a solid color
;20:// defined in the vec4_t "color_background" is filled to the screen
;21:                            
;22:// STRUCTURES
;23:
;24:typedef struct {
;25:	menuframework_s	menu;
;26:} creditsmenu_t;
;27:
;28:static creditsmenu_t	s_credits;
;29:
;30:int starttime; // game time at which credits are started
;31:float mvolume; // records the original music volume level, as we will
;32:               // modify it for the credits
;33:
;34:// change this to change the background colour on credits
;35:vec4_t color_background	        = {0.00, 0.35, 0.69, 1.00};
;36:// these are just example colours that are used in credits[] 
;37:vec4_t color_headertext			= {0.53, 0.77, 1.00, 1.00};
;38:vec4_t color_maintext			= {1.00, 1.00, 1.00, 1.00};
;39:
;40:qhandle_t	BackgroundShader; // definition of the background shader pointer
;41:
;42:typedef struct
;43:{
;44:	char *string;
;45:	int style;
;46:	vec4_t *colour;
;47:} cr_line;
;48:
;49:cr_line credits[] = { // edit this as necessary for your credits
;50:	
;51:{ "Trepidation", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;52:{ "www.PlanetTrepidation.com", UI_CENTER|UI_SMALLFONT, &color_headertext },
;53:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;54:
;55:{ "Development Team:", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;56:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;57:
;58:{ "Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;59:{ "Scott Hanke, Petee, Gigon", UI_CENTER|UI_SMALLFONT, &color_maintext },
;60:{ "Gigabyte123, Laz, Dr. Preston", UI_CENTER|UI_SMALLFONT, &color_maintext },
;61:{ "[FC]Pope John Paul III", UI_CENTER|UI_SMALLFONT, &color_maintext },
;62:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;63:
;64:{ "Voice and Sounds:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;65:{ "Dave Cunningham", UI_CENTER|UI_SMALLFONT, &color_maintext },
;66:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;67:
;68:{ "Sound Design & Music:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;69:{ "Chris Begg", UI_CENTER|UI_SMALLFONT, &color_maintext },
;70:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;71:
;72:{ "Programming:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;73:{ "Brian Shaffer", UI_CENTER|UI_SMALLFONT, &color_maintext },
;74:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;75:
;76:
;77:{ "Models:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;78:{ "Petee, DrAkOn, Gigon", UI_CENTER|UI_SMALLFONT, &color_maintext },
;79:{ "Gigabyte123", UI_CENTER|UI_SMALLFONT, &color_maintext },
;80:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;81:
;82:{ "Mapping:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;83:{ "Petee, DrAkOn, Gigon", UI_CENTER|UI_SMALLFONT, &color_maintext },
;84:{ "Gigabyte123, Laz, Dr. Preston", UI_CENTER|UI_SMALLFONT, &color_maintext },
;85:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;86:
;87:{ "Test Team:", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;88:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;89:{ "Blue, Prodie, Unknown, Tuvok", UI_CENTER|UI_SMALLFONT, &color_maintext },
;90:{ "Dredge, Camper, Frago", UI_CENTER|UI_SMALLFONT, &color_maintext },
;91:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;92:
;93:
;94:{ "Special Thanks To:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;95:{ "SourceForge.net", UI_CENTER|UI_SMALLFONT, &color_maintext },
;96:{ "Open Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;97:{ "Code 3 Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;98:{ "Tremulous / Dark Legion Development", UI_CENTER|UI_SMALLFONT, &color_maintext },
;99:{ "Icculus.org IOQ3 Project", UI_CENTER|UI_SMALLFONT, &color_maintext },
;100:{ "Thilo Schultz", UI_CENTER|UI_SMALLFONT, &color_maintext },
;101:{ "Mathieu Olivier (dpmaster)", UI_CENTER|UI_SMALLFONT, &color_maintext },
;102:{ "Neil Toronto", UI_CENTER|UI_SMALLFONT, &color_maintext },
;103:{ "ID Software", UI_CENTER|UI_SMALLFONT, &color_maintext },
;104:
;105:
;106:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;107:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;108:
;109:{ "Visit Us On The Web @", UI_CENTER|UI_SMALLFONT, &color_headertext },
;110:{ "www.PlanetTrepidation.com", UI_CENTER|UI_SMALLFONT, &color_maintext },
;111:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;112:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;113:
;114:
;115:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;116:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;117:{ "(c)2006 Trepidation Development Team", UI_CENTER|UI_SMALLFONT, &color_maintext },
;118:{ "General Public License", UI_CENTER|UI_SMALLFONT, &color_maintext },
;119:
;120:  {NULL}
;121:};
;122:
;123:
;124:/*
;125:=================
;126:UI_CreditMenu_Key
;127:=================
;128:*/
;129:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 130
;130:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $106
line 131
;131:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $106
line 137
;132:	}
;133:
;134:	// pressing the escape key or clicking the mouse will exit
;135:	// we also reset the music volume to the user's original
;136:	// choice here,  by setting s_musicvolume to the stored var
;137:	trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $108
ARGP4
ADDRGP4 mvolume
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 139
;138:                         va("s_musicvolume %f; quit\n", mvolume));
;139:	return 0;
CNSTI4 0
RETI4
LABELV $105
endproc UI_CreditMenu_Key 4 8
lit
align 4
LABELV $110
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc ScrollingCredits_Draw 48 20
line 150
;140:}
;141:
;142:/*
;143:=================
;144:ScrollingCredits_Draw
;145:This is the main drawing function for the credits. 
;146:Most of the code is self-explanatory.
;147:=================
;148:*/
;149:static void ScrollingCredits_Draw(void)
;150:{
line 151
;151:  int x = 320, y, n, ysize = 0, fadetime = 0;
ADDRLP4 12
CNSTI4 320
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 152
;152:  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };
ADDRLP4 20
ADDRGP4 $110
INDIRB
ASGNB 16
line 157
;153:
;154:  // ysize is used to determine the entire length 
;155:  // of the credits in pixels. 
;156:  // We can then use this in further calculations
;157:  if(!ysize) // ysize not calculated, so calculate it dammit!
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $111
line 158
;158:  {
line 160
;159:    // loop through entire credits array
;160:    for(n = 0; n <= sizeof(credits) - 1; n++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
line 161
;161:    {
line 163
;162:      // it is a small character
;163:      if(credits[n].style & UI_SMALLFONT) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $117
line 164
;164:      {
line 166
;165:        // add small character height
;166:        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 169
;167:        
;168:      // it is a big character
;169:      }else if(credits[n].style & UI_BIGFONT) 
ADDRGP4 $118
JUMPV
LABELV $117
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $120
line 170
;170:      {
line 172
;171:        // add big character size
;172:        ysize += PROP_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 175
;173:        
;174:      // it is a huge character
;175:      }else if(credits[n].style & UI_GIANTFONT) 
ADDRGP4 $121
JUMPV
LABELV $120
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $123
line 176
;176:      {
line 178
;177:        // add giant character size.
;178:        ysize += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE); 
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 179
;179:      }
LABELV $123
LABELV $121
LABELV $118
line 180
;180:    }
LABELV $114
line 160
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $116
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 635
LEU4 $113
line 181
;181:  }
LABELV $111
line 186
;182:
;183:  // first, fill the background with the specified colour/shader
;184:  // we are drawing a shader
;185:#ifdef BACKGROUND_SHADER 
;186:    UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, BackgroundShader);
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 BackgroundShader
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 195
;187:  
;188:  // we are just filling a color
;189:#else 
;190:    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_background);
;191:#endif
;192:
;193:  // let's draw the stuff
;194:  // set initial y location
;195:  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
ADDRLP4 4
CNSTF4 1139802112
CNSTF4 1073741824
ADDRGP4 uis+4
INDIRI4
ADDRGP4 starttime
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 198
;196:  
;197:  // loop through the entire credits sequence
;198:  for(n = 0; n <= sizeof(credits) - 1; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $127
line 199
;199:  {
line 201
;200:    // this NULL string marks the end of the credits struct
;201:    if(credits[n].string == NULL) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $131
line 202
;202:    {
line 203
;203:      if(y < -16) // credits sequence is completely off screen
ADDRLP4 4
INDIRI4
CNSTI4 -16
GEI4 $129
line 204
;204:      {
line 205
;205:        trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $108
ARGP4
ADDRGP4 mvolume
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 207
;206:                         va("s_musicvolume %f; quit\n", mvolume));
;207:        break; // end of credits
ADDRGP4 $129
JUMPV
line 209
;208:      }
;209:      break;
LABELV $131
line 212
;210:    }
;211:		
;212:    if( strlen(credits[n].string) == 1) // spacer string, no need to draw
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $135
line 213
;213:      continue;
ADDRGP4 $128
JUMPV
LABELV $135
line 215
;214:
;215:    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 3255828480
LEF4 $137
line 217
;216:      // the line is within the visible range of the screen
;217:      UI_DrawProportionalString(x, y, credits[n].string, 
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 44
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 credits
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ADDRGP4 credits+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRGP4 credits+8
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $137
line 221
;218:                                credits[n].style, *credits[n].colour );
;219:		
;220:    // re-adjust y for next line
;221:    if(credits[n].style & UI_SMALLFONT)
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $141
line 222
;222:    {
line 223
;223:      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 224
;224:    }else if(credits[n].style & UI_BIGFONT)
ADDRGP4 $142
JUMPV
LABELV $141
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $144
line 225
;225:    {
line 226
;226:      y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 227
;227:    }else if(credits[n].style & UI_GIANTFONT)
ADDRGP4 $145
JUMPV
LABELV $144
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $147
line 228
;228:    {
line 229
;229:      y += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 230
;230:    }
LABELV $147
LABELV $145
LABELV $142
line 233
;231:
;232:    // if y is off the screen, break out of loop
;233:    if (y > 480)
ADDRLP4 4
INDIRI4
CNSTI4 480
LEI4 $150
line 234
;234:    break;
ADDRGP4 $129
JUMPV
LABELV $150
line 235
;235:  }
LABELV $128
line 198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $130
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 635
LEU4 $127
LABELV $129
line 236
;236:}
LABELV $109
endproc ScrollingCredits_Draw 48 20
export UI_CreditMenu
proc UI_CreditMenu 8 12
line 243
;237:
;238:/*
;239:===============
;240:UI_CreditMenu
;241:===============
;242:*/
;243:void UI_CreditMenu( void ) {
line 244
;244:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 246
;245:
;246:	s_credits.menu.draw = ScrollingCredits_Draw;
ADDRGP4 s_credits+268
ADDRGP4 ScrollingCredits_Draw
ASGNP4
line 247
;247:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 248
;248:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 249
;249:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 251
;250:
;251:	starttime = uis.realtime; // record start time for credits to scroll properly
ADDRGP4 starttime
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 252
;252:	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
ADDRGP4 $157
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 mvolume
ADDRLP4 0
INDIRF4
ASGNF4
line 255
;253:	//if(mvolume < 0.5)
;254:	//	trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
;255:	trap_Cmd_ExecuteText( EXEC_APPEND, "music sound/music/credits\n" );
CNSTI4 2
ARGI4
ADDRGP4 $158
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 259
;256:
;257:	// load the background shader
;258:#ifdef BACKGROUND_SHADER
;259:	BackgroundShader = 
ADDRGP4 $159
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 BackgroundShader
ADDRLP4 4
INDIRI4
ASGNI4
line 262
;260:	  trap_R_RegisterShaderNoMip(BACKGROUND_SHADER);
;261:#endif
;262:}อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
LABELV $152
endproc UI_CreditMenu 8 12
bss
export BackgroundShader
align 4
LABELV BackgroundShader
skip 4
export mvolume
align 4
LABELV mvolume
skip 4
export starttime
align 4
LABELV starttime
skip 4
align 4
LABELV s_credits
skip 288
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
import PlayerModel_Cache
import UI_PlayerModelMenu
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
LABELV $159
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
LABELV $158
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $157
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $108
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 102
byte 1 59
byte 1 32
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 80
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 99
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 40
byte 1 99
byte 1 41
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 32
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $102
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 85
byte 1 115
byte 1 32
byte 1 79
byte 1 110
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 87
byte 1 101
byte 1 98
byte 1 32
byte 1 64
byte 1 0
align 1
LABELV $101
byte 1 73
byte 1 68
byte 1 32
byte 1 83
byte 1 111
byte 1 102
byte 1 116
byte 1 119
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 78
byte 1 101
byte 1 105
byte 1 108
byte 1 32
byte 1 84
byte 1 111
byte 1 114
byte 1 111
byte 1 110
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $99
byte 1 77
byte 1 97
byte 1 116
byte 1 104
byte 1 105
byte 1 101
byte 1 117
byte 1 32
byte 1 79
byte 1 108
byte 1 105
byte 1 118
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 40
byte 1 100
byte 1 112
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 41
byte 1 0
align 1
LABELV $98
byte 1 84
byte 1 104
byte 1 105
byte 1 108
byte 1 111
byte 1 32
byte 1 83
byte 1 99
byte 1 104
byte 1 117
byte 1 108
byte 1 116
byte 1 122
byte 1 0
align 1
LABELV $97
byte 1 73
byte 1 99
byte 1 99
byte 1 117
byte 1 108
byte 1 117
byte 1 115
byte 1 46
byte 1 111
byte 1 114
byte 1 103
byte 1 32
byte 1 73
byte 1 79
byte 1 81
byte 1 51
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $96
byte 1 84
byte 1 114
byte 1 101
byte 1 109
byte 1 117
byte 1 108
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 47
byte 1 32
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 76
byte 1 101
byte 1 103
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $94
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $93
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $92
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $91
byte 1 68
byte 1 114
byte 1 101
byte 1 100
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 44
byte 1 32
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $90
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 101
byte 1 44
byte 1 32
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 44
byte 1 32
byte 1 84
byte 1 117
byte 1 118
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $89
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 0
align 1
LABELV $88
byte 1 77
byte 1 97
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $87
byte 1 71
byte 1 105
byte 1 103
byte 1 97
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 49
byte 1 50
byte 1 51
byte 1 0
align 1
LABELV $86
byte 1 80
byte 1 101
byte 1 116
byte 1 101
byte 1 101
byte 1 44
byte 1 32
byte 1 68
byte 1 114
byte 1 65
byte 1 107
byte 1 79
byte 1 110
byte 1 44
byte 1 32
byte 1 71
byte 1 105
byte 1 103
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $85
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $84
byte 1 66
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 104
byte 1 97
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $83
byte 1 80
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $82
byte 1 67
byte 1 104
byte 1 114
byte 1 105
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $81
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 32
byte 1 38
byte 1 32
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 58
byte 1 0
align 1
LABELV $80
byte 1 68
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 67
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 104
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $79
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $78
byte 1 91
byte 1 70
byte 1 67
byte 1 93
byte 1 80
byte 1 111
byte 1 112
byte 1 101
byte 1 32
byte 1 74
byte 1 111
byte 1 104
byte 1 110
byte 1 32
byte 1 80
byte 1 97
byte 1 117
byte 1 108
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 0
align 1
LABELV $77
byte 1 71
byte 1 105
byte 1 103
byte 1 97
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 49
byte 1 50
byte 1 51
byte 1 44
byte 1 32
byte 1 76
byte 1 97
byte 1 122
byte 1 44
byte 1 32
byte 1 68
byte 1 114
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $76
byte 1 83
byte 1 99
byte 1 111
byte 1 116
byte 1 116
byte 1 32
byte 1 72
byte 1 97
byte 1 110
byte 1 107
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 101
byte 1 116
byte 1 101
byte 1 101
byte 1 44
byte 1 32
byte 1 71
byte 1 105
byte 1 103
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 65
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $74
byte 1 68
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 0
align 1
LABELV $73
byte 1 0
align 1
LABELV $72
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 80
byte 1 108
byte 1 97
byte 1 110
byte 1 101
byte 1 116
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $71
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
