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
address $73
byte 4 17
address color_blue
address $87
byte 4 17
address color_headertext
address $88
byte 4 17
address color_maintext
address $89
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $90
byte 4 17
address color_headertext
address $91
byte 4 17
address color_maintext
address $92
byte 4 17
address color_maintext
address $93
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $94
byte 4 17
address color_headertext
address $91
byte 4 17
address color_maintext
address $77
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $95
byte 4 17
address color_headertext
address $96
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $97
byte 4 17
address color_headertext
address $98
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $99
byte 4 17
address color_headertext
address $100
byte 4 17
address color_maintext
address $101
byte 4 17
address color_maintext
address $102
byte 4 17
address color_maintext
address $103
byte 4 17
address color_maintext
address $104
byte 4 17
address color_maintext
address $105
byte 4 17
address color_maintext
address $106
byte 4 17
address color_maintext
address $107
byte 4 17
address color_maintext
address $108
byte 4 17
address color_maintext
address $73
byte 4 17
address color_blue
address $109
byte 4 17
address color_headertext
address $110
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
address $111
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
address $112
byte 4 17
address color_maintext
byte 4 0
skip 8
code
proc UI_CreditMenu_Key 4 8
file "../ui_credits.c"
line 157
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
;35:vec4_t color_background	        = {0.00f, 0.35f, 0.69f, 1.00f};
;36:// these are just example colours that are used in credits[] 
;37:vec4_t color_headertext			= {0.53f, 0.77f, 1.00f, 1.00f};
;38:vec4_t color_maintext			= {1.00f, 1.00f, 1.00f, 1.00f};
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
;52:{ "trepidation.n5net.com", UI_CENTER|UI_SMALLFONT, &color_headertext },
;53:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;54:
;55:{ "Development Team:", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;56:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;57:
;58:{ "Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;59:{ "Scott Hanke, Petee, Gigon, Xovan", UI_CENTER|UI_SMALLFONT, &color_maintext },
;60:{ "Gigabyte123, Laz, Dr. Preston", UI_CENTER|UI_SMALLFONT, &color_maintext },
;61:{ "[FC]Pope John Paul III", UI_CENTER|UI_SMALLFONT, &color_maintext },
;62:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;63:
;64:{ "Hi Res Q3 Texture Pack:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;65:{ "Paul Marhsall (aka Kpax, Paulo)", UI_CENTER|UI_SMALLFONT, &color_maintext },
;66:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;67:
;68:{ "Voice and Sounds:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;69:{ "Dave Cunningham", UI_CENTER|UI_SMALLFONT, &color_maintext },
;70:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;71:
;72:{ "Sound Design & Title Music:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;73:{ "Chris Begg", UI_CENTER|UI_SMALLFONT, &color_maintext },
;74:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;75:
;76:{ "Soundtrack:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;77:{ "DiViNiTY, Chris Begg", UI_CENTER|UI_SMALLFONT, &color_maintext },
;78:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;79:
;80:
;81:
;82:{ "Programming:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;83:{ "Shafe", UI_CENTER|UI_SMALLFONT, &color_maintext },
;84:{ "VincentK", UI_CENTER|UI_SMALLFONT, &color_maintext },
;85:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;86:
;87:
;88:{ "3D Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;89:{ "Petee, DrAkOn, Gigon", UI_CENTER|UI_SMALLFONT, &color_maintext },
;90:{ "Gigabyte123", UI_CENTER|UI_SMALLFONT, &color_maintext },
;91:{ "LD Ash & Violation Entertainment", UI_CENTER|UI_SMALLFONT, &color_maintext },
;92:
;93:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;94:
;95:{ "Level Design:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;96:{ "Petee, DrAkOn, Gigon", UI_CENTER|UI_SMALLFONT, &color_maintext },
;97:{ "Gigabyte123, Laz, Dr. Preston", UI_CENTER|UI_SMALLFONT, &color_maintext },
;98:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;99:
;100:{ "Mac Build:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;101:{ "Zorb", UI_CENTER|UI_SMALLFONT, &color_maintext },
;102:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;103:
;104:{ "Technical Advisors:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;105:{ "Skylar, Pabst Blue Ribbon, Old Number 7", UI_CENTER|UI_SMALLFONT, &color_maintext },
;106:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;107:
;108:/*
;109:{ "Test Team:", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;110:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;111:{ "Blue, Prodie, Unknown, Tuvok", UI_CENTER|UI_SMALLFONT, &color_maintext },
;112:{ "Dredge, Camper, Frago", UI_CENTER|UI_SMALLFONT, &color_maintext },
;113:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;114:*/
;115:
;116:{ "Special Thanks To:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;117:{ "Todd", UI_CENTER|UI_SMALLFONT, &color_maintext },
;118:{ "Open Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;119:{ "Code 3 Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;120:{ "Tremulous / Dark Legion Development", UI_CENTER|UI_SMALLFONT, &color_maintext },
;121:{ "Icculus.org IOQ3 Project", UI_CENTER|UI_SMALLFONT, &color_maintext },
;122:{ "Thilo Schultz", UI_CENTER|UI_SMALLFONT, &color_maintext },
;123:{ "Mathieu Olivier (dpmaster)", UI_CENTER|UI_SMALLFONT, &color_maintext },
;124:{ "Neil Toronto", UI_CENTER|UI_SMALLFONT, &color_maintext },
;125:{ "ID Software", UI_CENTER|UI_SMALLFONT, &color_maintext },
;126:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;127:
;128:{ "Other Creative Commons Content:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;129:{ "See Docs Folder", UI_CENTER|UI_SMALLFONT, &color_maintext },
;130:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;131:
;132:
;133:
;134:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;135:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;136:
;137:{ "Visit Us On The Web @", UI_CENTER|UI_SMALLFONT, &color_headertext },
;138:{ "trepidation.n5net.com", UI_CENTER|UI_SMALLFONT, &color_maintext },
;139:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;140:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;141:
;142:
;143:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;144:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;145:{ "(c)2006-2017 Team Trepidation", UI_CENTER|UI_SMALLFONT, &color_maintext },
;146://{ "General Public License", UI_CENTER|UI_SMALLFONT, &color_maintext },
;147:
;148:  {NULL}
;149:};
;150:
;151:
;152:/*
;153:=================
;154:UI_CreditMenu_Key
;155:=================
;156:*/
;157:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 158
;158:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $114
line 159
;159:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $113
JUMPV
LABELV $114
line 165
;160:	}
;161:
;162:	// pressing the escape key or clicking the mouse will exit
;163:	// we also reset the music volume to the user's original
;164:	// choice here,  by setting s_musicvolume to the stored var
;165:	trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $116
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
line 167
;166:                         va("s_musicvolume %f; quit\n", mvolume));
;167:	return 0;
CNSTI4 0
RETI4
LABELV $113
endproc UI_CreditMenu_Key 4 8
lit
align 4
LABELV $118
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc ScrollingCredits_Draw 48 20
line 178
;168:}
;169:
;170:/*
;171:=================
;172:ScrollingCredits_Draw
;173:This is the main drawing function for the credits. 
;174:Most of the code is self-explanatory.
;175:=================
;176:*/
;177:static void ScrollingCredits_Draw(void)
;178:{
line 179
;179:  int x = 320, y, n, ysize = 0, fadetime = 0;
ADDRLP4 12
CNSTI4 320
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 180
;180:  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };
ADDRLP4 20
ADDRGP4 $118
INDIRB
ASGNB 16
line 185
;181:
;182:  // ysize is used to determine the entire length 
;183:  // of the credits in pixels. 
;184:  // We can then use this in further calculations
;185:  if(!ysize) // ysize not calculated, so calculate it dammit!
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $119
line 186
;186:  {
line 188
;187:    // loop through entire credits array
;188:    for(n = 0; n <= sizeof(credits) - 1; n++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $121
line 189
;189:    {
line 191
;190:      // it is a small character
;191:      if(credits[n].style & UI_SMALLFONT) 
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
EQI4 $125
line 192
;192:      {
line 194
;193:        // add small character height
;194:        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 197
;195:        
;196:      // it is a big character
;197:      }else if(credits[n].style & UI_BIGFONT) 
ADDRGP4 $126
JUMPV
LABELV $125
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
EQI4 $128
line 198
;198:      {
line 200
;199:        // add big character size
;200:        ysize += PROP_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 203
;201:        
;202:      // it is a huge character
;203:      }else if(credits[n].style & UI_GIANTFONT) 
ADDRGP4 $129
JUMPV
LABELV $128
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
EQI4 $131
line 204
;204:      {
line 206
;205:        // add giant character size.
;206:        ysize += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE); 
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 207
;207:      }
LABELV $131
LABELV $129
LABELV $126
line 208
;208:    }
LABELV $122
line 188
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $124
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 779
LEU4 $121
line 209
;209:  }
LABELV $119
line 214
;210:
;211:  // first, fill the background with the specified colour/shader
;212:  // we are drawing a shader
;213:#ifdef BACKGROUND_SHADER 
;214:    UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, BackgroundShader);
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
line 223
;215:  
;216:  // we are just filling a color
;217:#else 
;218:    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_background);
;219:#endif
;220:
;221:  // let's draw the stuff
;222:  // set initial y location
;223:  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
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
line 226
;224:  
;225:  // loop through the entire credits sequence
;226:  for(n = 0; n <= sizeof(credits) - 1; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 227
;227:  {
line 229
;228:    // this NULL string marks the end of the credits struct
;229:    if(credits[n].string == NULL) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $139
line 230
;230:    {
line 231
;231:      if(y < -16) // credits sequence is completely off screen
ADDRLP4 4
INDIRI4
CNSTI4 -16
GEI4 $137
line 232
;232:      {
line 233
;233:        trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $116
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
line 235
;234:                         va("s_musicvolume %f; quit\n", mvolume));
;235:        break; // end of credits
ADDRGP4 $137
JUMPV
line 237
;236:      }
;237:      break;
LABELV $139
line 240
;238:    }
;239:		
;240:    if( strlen(credits[n].string) == 1) // spacer string, no need to draw
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
NEI4 $143
line 241
;241:      continue;
ADDRGP4 $136
JUMPV
LABELV $143
line 243
;242:
;243:    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 3255828480
LEF4 $145
line 245
;244:      // the line is within the visible range of the screen
;245:      UI_DrawProportionalString(x, y, credits[n].string, 
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
LABELV $145
line 249
;246:                                credits[n].style, *credits[n].colour );
;247:		
;248:    // re-adjust y for next line
;249:    if(credits[n].style & UI_SMALLFONT)
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
EQI4 $149
line 250
;250:    {
line 251
;251:      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 252
;252:    }else if(credits[n].style & UI_BIGFONT)
ADDRGP4 $150
JUMPV
LABELV $149
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
EQI4 $152
line 253
;253:    {
line 254
;254:      y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 255
;255:    }else if(credits[n].style & UI_GIANTFONT)
ADDRGP4 $153
JUMPV
LABELV $152
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
EQI4 $155
line 256
;256:    {
line 257
;257:      y += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 258
;258:    }
LABELV $155
LABELV $153
LABELV $150
line 261
;259:
;260:    // if y is off the screen, break out of loop
;261:    if (y > 480)
ADDRLP4 4
INDIRI4
CNSTI4 480
LEI4 $158
line 262
;262:    break;
ADDRGP4 $137
JUMPV
LABELV $158
line 263
;263:  }
LABELV $136
line 226
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $138
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 779
LEU4 $135
LABELV $137
line 264
;264:}
LABELV $117
endproc ScrollingCredits_Draw 48 20
export UI_CreditMenu
proc UI_CreditMenu 8 12
line 271
;265:
;266:/*
;267:===============
;268:UI_CreditMenu
;269:===============
;270:*/
;271:void UI_CreditMenu( void ) {
line 272
;272:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 274
;273:
;274:	s_credits.menu.draw = ScrollingCredits_Draw;
ADDRGP4 s_credits+268
ADDRGP4 ScrollingCredits_Draw
ASGNP4
line 275
;275:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 276
;276:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 277
;277:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 279
;278:
;279:	starttime = uis.realtime; // record start time for credits to scroll properly
ADDRGP4 starttime
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 280
;280:	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
ADDRGP4 $165
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 mvolume
ADDRLP4 0
INDIRF4
ASGNF4
line 283
;281:	//if(mvolume < 0.5)
;282:	//	trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
;283:	trap_Cmd_ExecuteText( EXEC_APPEND, "music sound/music/credits\n" );
CNSTI4 2
ARGI4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 287
;284:
;285:	// load the background shader
;286:#ifdef BACKGROUND_SHADER
;287:	BackgroundShader = 
ADDRGP4 $167
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 BackgroundShader
ADDRLP4 4
INDIRI4
ASGNI4
line 290
;288:	  trap_R_RegisterShaderNoMip(BACKGROUND_SHADER);
;289:#endif
;290:}
LABELV $160
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
import UI_VoipOptionsMenu
import UI_VoipOptionsMenu_Cache
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
import UI_OfflineMenu
import UI_OfflineMenu_Cache
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
import BG_FindItemForAmmo
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $116
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
LABELV $112
byte 1 40
byte 1 99
byte 1 41
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 45
byte 1 50
byte 1 48
byte 1 49
byte 1 55
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
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
byte 1 0
align 1
LABELV $111
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
LABELV $110
byte 1 83
byte 1 101
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 99
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 79
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $108
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
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
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
LABELV $103
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
LABELV $102
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
LABELV $101
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
LABELV $100
byte 1 84
byte 1 111
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $99
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
LABELV $98
byte 1 83
byte 1 107
byte 1 121
byte 1 108
byte 1 97
byte 1 114
byte 1 44
byte 1 32
byte 1 80
byte 1 97
byte 1 98
byte 1 115
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 82
byte 1 105
byte 1 98
byte 1 98
byte 1 111
byte 1 110
byte 1 44
byte 1 32
byte 1 79
byte 1 108
byte 1 100
byte 1 32
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $97
byte 1 84
byte 1 101
byte 1 99
byte 1 104
byte 1 110
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 65
byte 1 100
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $96
byte 1 90
byte 1 111
byte 1 114
byte 1 98
byte 1 0
align 1
LABELV $95
byte 1 77
byte 1 97
byte 1 99
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $94
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $93
byte 1 76
byte 1 68
byte 1 32
byte 1 65
byte 1 115
byte 1 104
byte 1 32
byte 1 38
byte 1 32
byte 1 86
byte 1 105
byte 1 111
byte 1 108
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $92
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
LABELV $91
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
LABELV $90
byte 1 51
byte 1 68
byte 1 32
byte 1 65
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $89
byte 1 86
byte 1 105
byte 1 110
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 75
byte 1 0
align 1
LABELV $88
byte 1 83
byte 1 104
byte 1 97
byte 1 102
byte 1 101
byte 1 0
align 1
LABELV $87
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
LABELV $86
byte 1 68
byte 1 105
byte 1 86
byte 1 105
byte 1 78
byte 1 105
byte 1 84
byte 1 89
byte 1 44
byte 1 32
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
LABELV $85
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 58
byte 1 0
align 1
LABELV $84
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
LABELV $83
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
byte 1 84
byte 1 105
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 58
byte 1 0
align 1
LABELV $82
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
LABELV $81
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
LABELV $80
byte 1 80
byte 1 97
byte 1 117
byte 1 108
byte 1 32
byte 1 77
byte 1 97
byte 1 114
byte 1 104
byte 1 115
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 40
byte 1 97
byte 1 107
byte 1 97
byte 1 32
byte 1 75
byte 1 112
byte 1 97
byte 1 120
byte 1 44
byte 1 32
byte 1 80
byte 1 97
byte 1 117
byte 1 108
byte 1 111
byte 1 41
byte 1 0
align 1
LABELV $79
byte 1 72
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 32
byte 1 81
byte 1 51
byte 1 32
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 80
byte 1 97
byte 1 99
byte 1 107
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
byte 1 44
byte 1 32
byte 1 88
byte 1 111
byte 1 118
byte 1 97
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
byte 1 116
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
byte 1 110
byte 1 53
byte 1 110
byte 1 101
byte 1 116
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
