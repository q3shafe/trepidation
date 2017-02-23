data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
code
proc CG_DrawField 64 20
file "../cg_draw.c"
line 192
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#ifdef MISSIONPACK
;9:#include "../ui/ui_shared.h"
;10:
;11:// used for scoreboard
;12:extern displayContextDef_t cgDC;
;13:menuDef_t *menuScoreboard = NULL;
;14:#else
;15:int drawTeamOverlayModificationCount = -1;
;16:#endif
;17:
;18:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;19:int	numSortedTeamPlayers;
;20:
;21:char systemChat[256];
;22:char teamChat1[256];
;23:char teamChat2[256];
;24:
;25:#ifdef MISSIONPACK
;26:
;27:int CG_Text_Width(const char *text, float scale, int limit) {
;28:  int count,len;
;29:	float out;
;30:	glyphInfo_t *glyph;
;31:	float useScale;
;32:// FIXME: see ui_main.c, same problem
;33://	const unsigned char *s = text;
;34:	const char *s = text;
;35:	fontInfo_t *font = &cgDC.Assets.textFont;
;36:	if (scale <= cg_smallFont.value) {
;37:		font = &cgDC.Assets.smallFont;
;38:	} else if (scale > cg_bigFont.value) {
;39:		font = &cgDC.Assets.bigFont;
;40:	}
;41:	useScale = scale * font->glyphScale;
;42:  out = 0;
;43:  if (text) {
;44:    len = strlen(text);
;45:		if (limit > 0 && len > limit) {
;46:			len = limit;
;47:		}
;48:		count = 0;
;49:		while (s && *s && count < len) {
;50:			if ( Q_IsColorString(s) ) {
;51:				s += 2;
;52:				continue;
;53:			} else {
;54:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;55:				out += glyph->xSkip;
;56:				s++;
;57:				count++;
;58:			}
;59:    }
;60:  }
;61:  return out * useScale;
;62:}
;63:
;64:int CG_Text_Height(const char *text, float scale, int limit) {
;65:  int len, count;
;66:	float max;
;67:	glyphInfo_t *glyph;
;68:	float useScale;
;69:// TTimo: FIXME
;70://	const unsigned char *s = text;
;71:	const char *s = text;
;72:	fontInfo_t *font = &cgDC.Assets.textFont;
;73:	if (scale <= cg_smallFont.value) {
;74:		font = &cgDC.Assets.smallFont;
;75:	} else if (scale > cg_bigFont.value) {
;76:		font = &cgDC.Assets.bigFont;
;77:	}
;78:	useScale = scale * font->glyphScale;
;79:  max = 0;
;80:  if (text) {
;81:    len = strlen(text);
;82:		if (limit > 0 && len > limit) {
;83:			len = limit;
;84:		}
;85:		count = 0;
;86:		while (s && *s && count < len) {
;87:			if ( Q_IsColorString(s) ) {
;88:				s += 2;
;89:				continue;
;90:			} else {
;91:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;92:	      if (max < glyph->height) {
;93:		      max = glyph->height;
;94:			  }
;95:				s++;
;96:				count++;
;97:			}
;98:    }
;99:  }
;100:  return max * useScale;
;101:}
;102:
;103:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
;104:  float w, h;
;105:  w = width * scale;
;106:  h = height * scale;
;107:  CG_AdjustFrom640( &x, &y, &w, &h );
;108:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
;109:}
;110:
;111:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
;112:  int len, count;
;113:	vec4_t newColor;
;114:	glyphInfo_t *glyph;
;115:	float useScale;
;116:	fontInfo_t *font = &cgDC.Assets.textFont;
;117:	if (scale <= cg_smallFont.value) {
;118:		font = &cgDC.Assets.smallFont;
;119:	} else if (scale > cg_bigFont.value) {
;120:		font = &cgDC.Assets.bigFont;
;121:	}
;122:	useScale = scale * font->glyphScale;
;123:  if (text) {
;124:// TTimo: FIXME
;125://		const unsigned char *s = text;
;126:		const char *s = text;
;127:		trap_R_SetColor( color );
;128:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
;129:    len = strlen(text);
;130:		if (limit > 0 && len > limit) {
;131:			len = limit;
;132:		}
;133:		count = 0;
;134:		while (s && *s && count < len) {
;135:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;136:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;137:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;138:			if ( Q_IsColorString( s ) ) {
;139:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
;140:				newColor[3] = color[3];
;141:				trap_R_SetColor( newColor );
;142:				s += 2;
;143:				continue;
;144:			} else {
;145:				float yadj = useScale * glyph->top;
;146:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
;147:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
;148:					colorBlack[3] = newColor[3];
;149:					trap_R_SetColor( colorBlack );
;150:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
;151:														glyph->imageWidth,
;152:														glyph->imageHeight,
;153:														useScale, 
;154:														glyph->s,
;155:														glyph->t,
;156:														glyph->s2,
;157:														glyph->t2,
;158:														glyph->glyph);
;159:					colorBlack[3] = 1.0;
;160:					trap_R_SetColor( newColor );
;161:				}
;162:				CG_Text_PaintChar(x, y - yadj, 
;163:													glyph->imageWidth,
;164:													glyph->imageHeight,
;165:													useScale, 
;166:													glyph->s,
;167:													glyph->t,
;168:													glyph->s2,
;169:													glyph->t2,
;170:													glyph->glyph);
;171:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;172:				x += (glyph->xSkip * useScale) + adjust;
;173:				s++;
;174:				count++;
;175:			}
;176:    }
;177:	  trap_R_SetColor( NULL );
;178:  }
;179:}
;180:
;181:
;182:#endif
;183:
;184:/*
;185:==============
;186:CG_DrawField
;187:
;188:Draws large numbers for status bar and powerups
;189:==============
;190:*/
;191:#ifndef MISSIONPACK
;192:static void CG_DrawField (int x, int y, int width, int value) {
line 197
;193:	char	num[16], *ptr;
;194:	int		l;
;195:	int		frame;
;196:
;197:	if ( width < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $73
line 198
;198:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 202
;199:	}
;200:
;201:	// draw number string
;202:	if ( width > 5 ) {
ADDRFP4 8
INDIRI4
CNSTI4 5
LEI4 $75
line 203
;203:		width = 5;
ADDRFP4 8
CNSTI4 5
ASGNI4
line 204
;204:	}
LABELV $75
line 206
;205:
;206:	switch ( width ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $107
address $79
address $86
address $93
address $100
code
LABELV $79
line 208
;207:	case 1:
;208:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $81
ADDRLP4 32
CNSTI4 9
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
ADDRLP4 32
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $82
ADDRFP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 209
;209:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $84
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $85
ADDRFP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 210
;210:		break;
ADDRGP4 $78
JUMPV
LABELV $86
line 212
;211:	case 2:
;212:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $88
ADDRLP4 40
CNSTI4 99
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $89
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 213
;213:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $91
ADDRLP4 44
CNSTI4 -9
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $92
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 214
;214:		break;
ADDRGP4 $78
JUMPV
LABELV $93
line 216
;215:	case 3:
;216:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $95
ADDRLP4 48
CNSTI4 999
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $96
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 217
;217:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $98
ADDRLP4 52
CNSTI4 -99
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $99
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 218
;218:		break;
ADDRGP4 $78
JUMPV
LABELV $100
line 220
;219:	case 4:
;220:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $102
ADDRLP4 56
CNSTI4 9999
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $103
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 221
;221:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $105
ADDRLP4 60
CNSTI4 -999
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $106
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 222
;222:		break;
LABELV $77
LABELV $78
line 225
;223:	}
;224:
;225:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $109
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 226
;226:	l = strlen(num);
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 227
;227:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $110
line 228
;228:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $110
line 229
;229:	x += 2 + CHAR_WIDTH*(width - l);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 5
LSHI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 231
;230:
;231:	ptr = num;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $112
line 233
;232:	while (*ptr && l)
;233:	{
line 234
;234:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $115
line 235
;235:			frame = STAT_MINUS;
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 237
;236:		else
;237:			frame = *ptr -'0';
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $116
line 239
;238:
;239:		CG_DrawPic( x,y, CHAR_WIDTH/2, CHAR_HEIGHT/2, cgs.media.numberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+324
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 240
;240:		x += CHAR_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 241
;241:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 242
;242:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 243
;243:	}
LABELV $113
line 232
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $119
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $112
LABELV $119
line 244
;244:}
LABELV $72
endproc CG_DrawField 64 20
export CG_Draw3DModel
proc CG_Draw3DModel 512 16
line 253
;245:#endif // MISSIONPACK
;246:
;247:/*
;248:================
;249:CG_Draw3DModel
;250:
;251:================
;252:*/
;253:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 257
;254:	refdef_t		refdef;
;255:	refEntity_t		ent;
;256:
;257:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 508
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 508
INDIRI4
EQI4 $125
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 508
INDIRI4
NEI4 $121
LABELV $125
line 258
;258:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 261
;259:	}
;260:
;261:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 263
;262:
;263:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 265
;264:
;265:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 266
;266:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 267
;267:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 268
;268:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 269
;269:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 270
;270:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 272
;271:
;272:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 274
;273:
;274:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 276
;275:
;276:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 277
;277:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 279
;278:
;279:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 280
;280:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 281
;281:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 282
;282:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 284
;283:
;284:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 286
;285:
;286:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 287
;287:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 288
;288:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 289
;289:}
LABELV $120
endproc CG_Draw3DModel 512 16
export CG_DrawHead
proc CG_DrawHead 56 32
line 298
;290:
;291:/*
;292:================
;293:CG_DrawHead
;294:
;295:Used for both the status bar and the scoreboard
;296:================
;297:*/
;298:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
line 305
;299:	clipHandle_t	cm;
;300:	clientInfo_t	*ci;
;301:	float			len;
;302:	vec3_t			origin;
;303:	vec3_t			mins, maxs;
;304:
;305:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1740
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 307
;306:
;307:	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $142
line 308
;308:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 309
;309:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $145
line 310
;310:			return;
ADDRGP4 $140
JUMPV
LABELV $145
line 314
;311:		}
;312:
;313:		// offset the origin y and z to center the head
;314:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 316
;315:
;316:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
CNSTF4 3204448256
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 317
;317:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
CNSTF4 1056964608
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 321
;318:
;319:		// calculate distance so the head nearly fills the box
;320:		// assume heads are taller than wide
;321:		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 44
CNSTF4 1060320051
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 322
;322:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 325
;323:
;324:		// allow per-model tweaking
;325:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ADDF4
ASGNF4
line 327
;326:
;327:		CG_Draw3DModel( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 328
;328:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $143
JUMPV
LABELV $142
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $159
line 329
;329:		CG_DrawPic( x, y, w, h, ci->modelIcon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 330
;330:	}
LABELV $159
LABELV $143
line 333
;331:
;332:	// if they are deferred, draw a cross out
;333:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $162
line 334
;334:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 cgs+154388+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 335
;335:	}
LABELV $162
line 336
;336:}
LABELV $140
endproc CG_DrawHead 56 32
export CG_DrawFlagModel
proc CG_DrawFlagModel 72 32
line 345
;337:
;338:/*
;339:================
;340:CG_DrawFlagModel
;341:
;342:Used for both the status bar and the scoreboard
;343:================
;344:*/
;345:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 352
;346:	qhandle_t		cm;
;347:	float			len;
;348:	vec3_t			origin, angles;
;349:	vec3_t			mins, maxs;
;350:	qhandle_t		handle;
;351:
;352:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $167
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $167
line 354
;353:
;354:		VectorClear( angles );
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 356
;355:
;356:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+154388+36
INDIRI4
ASGNI4
line 359
;357:
;358:		// offset the origin y and z to center the flag
;359:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 361
;360:
;361:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
CNSTF4 3204448256
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 362
;362:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
CNSTF4 1056964608
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 366
;363:
;364:		// calculate distance so the flag nearly fills the box
;365:		// assume heads are taller than wide
;366:		len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 52
CNSTF4 1056964608
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 367
;367:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 369
;368:
;369:		angles[YAW] = 60 * sin( cg.time / 2000.0 );;
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1114636288
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 371
;370:
;371:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $184
line 372
;372:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+154388+36
INDIRI4
ASGNI4
line 373
;373:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $185
JUMPV
LABELV $184
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $188
line 374
;374:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+154388+40
INDIRI4
ASGNI4
line 375
;375:		} else if( team == TEAM_FREE ) {
ADDRGP4 $189
JUMPV
LABELV $188
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $166
line 376
;376:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+154388+44
INDIRI4
ASGNI4
line 377
;377:		} else {
line 378
;378:			return;
LABELV $193
LABELV $189
LABELV $185
line 380
;379:		}
;380:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 381
;381:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $168
JUMPV
LABELV $167
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $196
line 384
;382:		gitem_t *item;
;383:
;384:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $199
line 385
;385:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 386
;386:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $200
JUMPV
LABELV $199
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $201
line 387
;387:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 388
;388:		} else if( team == TEAM_FREE ) {
ADDRGP4 $202
JUMPV
LABELV $201
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $166
line 389
;389:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 390
;390:		} else {
line 391
;391:			return;
LABELV $204
LABELV $202
LABELV $200
line 393
;392:		}
;393:		if (item) {
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $205
line 394
;394:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 395
;395:		}
LABELV $205
line 396
;396:	}
LABELV $196
LABELV $168
line 397
;397:}
LABELV $166
endproc CG_DrawFlagModel 72 32
proc CG_DrawStatusBarHead 56 24
line 407
;398:
;399:/*
;400:================
;401:CG_DrawStatusBarHead
;402:
;403:================
;404:*/
;405:#ifndef MISSIONPACK
;406:
;407:static void CG_DrawStatusBarHead( float x ) {
line 412
;408:	vec3_t		angles;
;409:	float		size, stretch;
;410:	float		frac;
;411:
;412:	VectorClear( angles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 414
;413:
;414:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
ADDRGP4 cg+126756
INDIRF4
CNSTF4 0
EQF4 $211
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg+126756
INDIRF4
SUBF4
CNSTF4 1140457472
GEF4 $211
line 415
;415:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg+126756
INDIRF4
SUBF4
CNSTF4 1140457472
DIVF4
ASGNF4
line 416
;416:		size = ICON_SIZE * 1.25 * ( 1.5 - frac * 0.5 );
ADDRLP4 16
CNSTF4 1114636288
CNSTF4 1069547520
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 418
;417:
;418:		stretch = size - ICON_SIZE * 1.25;
ADDRLP4 20
ADDRLP4 16
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 420
;419:		// kick in the direction of damage
;420:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 28
CNSTF4 1056964608
ASGNF4
ADDRLP4 32
ADDRLP4 20
INDIRF4
ASGNF4
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRGP4 cg+126760
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
MULF4
ADDF4
SUBF4
ASGNF4
line 422
;421:
;422:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+126792
CNSTF4 1110704128
ADDRGP4 cg+126760
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 424
;423:
;424:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+126780
CNSTF4 1101004800
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 425
;425:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 48
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+126776
CNSTF4 1084227584
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 427
;426:
;427:		cg.headStartTime = cg.time;
ADDRGP4 cg+126796
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 428
;428:		cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+126784
ADDRGP4 cg+109652
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 429
;429:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 430
;430:		if ( cg.time >= cg.headEndTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126784
INDIRI4
LTI4 $227
line 432
;431:			// select a new head angle
;432:			cg.headStartYaw = cg.headEndYaw;
ADDRGP4 cg+126792
ADDRGP4 cg+126780
INDIRF4
ASGNF4
line 433
;433:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+126788
ADDRGP4 cg+126776
INDIRF4
ASGNF4
line 434
;434:			cg.headStartTime = cg.headEndTime;
ADDRGP4 cg+126796
ADDRGP4 cg+126784
INDIRI4
ASGNI4
line 435
;435:			cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+126784
ADDRGP4 cg+109652
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 437
;436:
;437:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 36
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+126780
CNSTF4 1101004800
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 438
;438:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+126776
CNSTF4 1084227584
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 439
;439:		}
LABELV $227
line 441
;440:
;441:		size = ICON_SIZE * 1.25;
ADDRLP4 16
CNSTF4 1114636288
ASGNF4
line 442
;442:	}
LABELV $212
line 445
;443:
;444:	// if the server was frozen for a while we may have a bad head start time
;445:	if ( cg.headStartTime > cg.time ) {
ADDRGP4 cg+126796
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $241
line 446
;446:		cg.headStartTime = cg.time;
ADDRGP4 cg+126796
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 447
;447:	}
LABELV $241
line 449
;448:
;449:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126796
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+126784
INDIRI4
ADDRGP4 cg+126796
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 450
;450:	frac = frac * frac * ( 3 - 2 * frac );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 451
;451:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
ADDRLP4 4+4
ADDRGP4 cg+126792
INDIRF4
ADDRGP4 cg+126780
INDIRF4
ADDRGP4 cg+126792
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 452
;452:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
ADDRLP4 4
ADDRGP4 cg+126788
INDIRF4
ADDRGP4 cg+126776
INDIRF4
ADDRGP4 cg+126788
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 454
;453:
;454:	CG_DrawHead( x, 480 - size, size, size, 
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1139802112
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 456
;455:				cg.snap->ps.clientNum, angles );
;456:}
LABELV $208
endproc CG_DrawStatusBarHead 56 24
proc CG_DrawStatusBarFlag 4 24
line 466
;457:#endif // MISSIONPACK
;458:
;459:/*
;460:================
;461:CG_DrawStatusBarFlag
;462:
;463:================
;464:*/
;465:#ifndef MISSIONPACK
;466:static void CG_DrawStatusBarFlag( float x, int team ) {
line 467
;467:	CG_DrawFlagModel( x, 480 - ICON_SIZE, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 0
CNSTF4 1111490560
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 468
;468:}
LABELV $259
endproc CG_DrawStatusBarFlag 4 24
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 478
;469:#endif // MISSIONPACK
;470:
;471:/*
;472:================
;473:CG_DrawTeamBackground
;474:
;475:================
;476:*/
;477:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;478:{
line 481
;479:	vec4_t		hcolor;
;480:
;481:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 482
;482:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $262
line 483
;483:		hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 484
;484:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 485
;485:		hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 486
;486:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $263
JUMPV
LABELV $262
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $260
line 487
;487:		hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 488
;488:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 489
;489:		hcolor[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 490
;490:	} else {
line 491
;491:		return;
LABELV $267
LABELV $263
line 493
;492:	}
;493:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 494
;494:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+154388+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 495
;495:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 496
;496:}
LABELV $260
endproc CG_DrawTeamBackground 16 20
data
align 4
LABELV $273
byte 4 1065353216
byte 4 1060152279
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawStatusBar 68 32
line 505
;497:
;498:/*
;499:================
;500:CG_DrawStatusBar
;501:
;502:================
;503:*/
;504:#ifndef MISSIONPACK
;505:static void CG_DrawStatusBar( void ) {
line 523
;506:	int			color;
;507:	centity_t	*cent;
;508:	playerState_t	*ps;
;509:	int			value;
;510:	vec4_t		hcolor;
;511:	vec3_t		angles;
;512:	vec3_t		origin;
;513:#ifdef MISSIONPACK
;514:	qhandle_t	handle;
;515:#endif
;516:	static float colors[4][4] = { 
;517://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;518:		{ 1.0f, 0.69f, 0.0f, 1.0f },    // normal
;519:		{ 1.0f, 0.2f, 0.2f, 1.0f },     // low health
;520:		{ 0.5f, 0.5f, 0.5f, 1.0f },     // weapon firing
;521:		{ 1.0f, 1.0f, 1.0f, 1.0f } };   // health > 100
;522:
;523:	if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $274
line 524
;524:		return;
ADDRGP4 $272
JUMPV
LABELV $274
line 528
;525:	}
;526:
;527:	// draw the team background
;528:	CG_DrawTeamBackground( 0, 420, 640, 60, 0.33f, cg.snap->ps.persistant[PERS_TEAM] );
CNSTI4 0
ARGI4
CNSTI4 420
ARGI4
CNSTI4 640
ARGI4
CNSTI4 60
ARGI4
CNSTF4 1051260355
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 530
;529:
;530:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 20
CNSTI4 740
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 531
;531:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 533
;532:
;533:	VectorClear( angles );
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 56
INDIRF4
ASGNF4
line 548
;534:
;535:	// draw any 3D icons first, so the changes back to 2D are minimized
;536:	/* - Shafe - We are using icons for now.
;537:	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
;538:		origin[0] = 70;
;539:		origin[1] = 0;
;540:		origin[2] = 0;
;541:		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
;542:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32,
;543:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;544:	}
;545:
;546:	*/
;547:
;548:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
CNSTF4 1133412352
ARGF4
ADDRGP4 CG_DrawStatusBarHead
CALLV
pop
line 550
;549:
;550:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+109684+312+28
INDIRI4
CNSTI4 0
EQI4 $282
line 551
;551:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
CNSTF4 1134985216
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 552
;552:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $283
JUMPV
LABELV $282
ADDRGP4 cg+109684+312+32
INDIRI4
CNSTI4 0
EQI4 $287
line 553
;553:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
CNSTF4 1134985216
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 554
;554:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $288
JUMPV
LABELV $287
ADDRGP4 cg+109684+312+36
INDIRI4
CNSTI4 0
EQI4 $292
line 555
;555:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
CNSTF4 1134985216
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 556
;556:	}
LABELV $292
LABELV $288
LABELV $283
line 558
;557:
;558:	if ( ps->stats[ STAT_ARMOR ] ) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $297
line 559
;559:		origin[0] = 90;
ADDRLP4 40
CNSTF4 1119092736
ASGNF4
line 560
;560:		origin[1] = 0;
ADDRLP4 40+4
CNSTF4 0
ASGNF4
line 561
;561:		origin[2] = -10;
ADDRLP4 40+8
CNSTF4 3240099840
ASGNF4
line 562
;562:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 8+4
CNSTI4 360
ADDRGP4 cg+109652
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 565
;563:		
;564:		// Shafe was ICON_SIZE instead of 32
;565:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32,
CNSTF4 1139474432
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 60
CNSTF4 1107296256
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+154388+120
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 567
;566:					   cgs.media.armorModel, 0, origin, angles );
;567:	}
LABELV $297
line 585
;568:#ifdef MISSIONPACK
;569:	if( cgs.gametype == GT_HARVESTER ) {
;570:		origin[0] = 90;
;571:		origin[1] = 0;
;572:		origin[2] = -10;
;573:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;574:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;575:			handle = cgs.media.redCubeModel;
;576:		} else {
;577:			handle = cgs.media.blueCubeModel;
;578:		}
;579:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;580:	}
;581:#endif
;582:	//
;583:	// ammo
;584:	//
;585:	if ( cent->currentState.weapon ) {
ADDRLP4 20
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 586
;586:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 587
;587:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $307
line 588
;588:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
ADDRGP4 cg+109684+148
INDIRI4
CNSTI4 3
NEI4 $309
ADDRGP4 cg+109684+44
INDIRI4
CNSTI4 100
LEI4 $309
line 589
;589:				&& cg.predictedPlayerState.weaponTime > 100 ) {
line 591
;590:				// draw as dark grey when reloading
;591:				color = 2;	// dark grey
ADDRLP4 52
CNSTI4 2
ASGNI4
line 592
;592:			} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 593
;593:				if ( value >= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $315
line 594
;594:					color = 0;	// green
ADDRLP4 52
CNSTI4 0
ASGNI4
line 595
;595:				} else {
ADDRGP4 $316
JUMPV
LABELV $315
line 596
;596:					color = 1;	// red
ADDRLP4 52
CNSTI4 1
ASGNI4
line 597
;597:				}
LABELV $316
line 598
;598:			}
LABELV $310
line 599
;599:			trap_R_SetColor( colors[color] );
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $273
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 601
;600:			
;601:			CG_DrawField (0, 432, 3, value);
CNSTI4 0
ARGI4
CNSTI4 432
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 602
;602:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 606
;603:
;604:
;605:			// Trep, use the icons for the ammo on the hud
;606:			CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon );
CNSTF4 1120403456
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 60
CNSTF4 1107296256
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
CNSTI4 136
ADDRGP4 cg+109684+144
INDIRI4
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 619
;607:
;608:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;609:			/*
;610:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) { // Shafe - We are using icons for now.
;611:				qhandle_t	icon;
;612:
;613:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
;614:				if ( icon ) {
;615:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, icon );
;616:				}
;617:			}
;618:			*/
;619:		}
LABELV $307
line 620
;620:	}
LABELV $305
line 625
;621:
;622:	//
;623:	// health
;624:	//
;625:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 626
;626:	if ( value > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $320
line 627
;627:		trap_R_SetColor( colors[3] );		// white
ADDRGP4 $273+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 628
;628:	} else if (value > 25) {
ADDRGP4 $321
JUMPV
LABELV $320
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $323
line 629
;629:		trap_R_SetColor( colors[0] );	// green
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 630
;630:	} else if (value > 0) {
ADDRGP4 $324
JUMPV
LABELV $323
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $325
line 631
;631:		color = (cg.time >> 8) & 1;	// flash
ADDRLP4 52
ADDRGP4 cg+109652
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 632
;632:		trap_R_SetColor( colors[color] );
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $273
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 633
;633:	} else {
ADDRGP4 $326
JUMPV
LABELV $325
line 634
;634:		trap_R_SetColor( colors[1] );	// red
ADDRGP4 $273+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 635
;635:	}
LABELV $326
LABELV $324
LABELV $321
line 638
;636:
;637:	// stretch the health up when taking damage
;638:	CG_DrawField ( 185, 432, 3, value);
CNSTI4 185
ARGI4
CNSTI4 432
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 639
;639:	CG_ColorForHealth( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 640
;640:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 646
;641:
;642:
;643:	//
;644:	// armor
;645:	//
;646:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 647
;647:	if (value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $329
line 648
;648:		trap_R_SetColor( colors[0] );
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 649
;649:		CG_DrawField (370, 432, 3, value);
CNSTI4 370
ARGI4
CNSTI4 432
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 650
;650:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 652
;651:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;652:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $331
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $331
line 653
;653:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, cgs.media.armorIcon );
CNSTF4 1139474432
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 64
CNSTF4 1107296256
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+154388+124
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 654
;654:		}
LABELV $331
line 656
;655:
;656:	}
LABELV $329
line 680
;657:#ifdef MISSIONPACK
;658:	//
;659:	// cubes
;660:	//
;661:	if( cgs.gametype == GT_HARVESTER ) {
;662:		value = ps->generic1;
;663:		if( value > 99 ) {
;664:			value = 99;
;665:		}
;666:		trap_R_SetColor( colors[0] );
;667:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), 432, 2, value);
;668:		trap_R_SetColor( NULL );
;669:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;670:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;671:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;672:				handle = cgs.media.redCubeIcon;
;673:			} else {
;674:				handle = cgs.media.blueCubeIcon;
;675:			}
;676:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 432, ICON_SIZE, ICON_SIZE, handle );
;677:		}
;678:	}
;679:#endif
;680:}
LABELV $272
endproc CG_DrawStatusBar 68 32
proc CG_DrawAttacker 52 24
line 697
;681:#endif
;682:
;683:/*
;684:===========================================================================================
;685:
;686:  UPPER RIGHT CORNER
;687:
;688:===========================================================================================
;689:*/
;690:
;691:/*
;692:================
;693:CG_DrawAttacker
;694:
;695:================
;696:*/
;697:static float CG_DrawAttacker( float y ) {
line 705
;698:	int			t;
;699:	float		size;
;700:	vec3_t		angles;
;701:	const char	*info;
;702:	const char	*name;
;703:	int			clientNum;
;704:
;705:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+109684+184
INDIRI4
CNSTI4 0
GTI4 $338
line 706
;706:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $337
JUMPV
LABELV $338
line 709
;707:	}
;708:
;709:	if ( !cg.attackerTime ) {
ADDRGP4 cg+126484
INDIRI4
CNSTI4 0
NEI4 $342
line 710
;710:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $337
JUMPV
LABELV $342
line 713
;711:	}
;712:
;713:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+109684+248+24
INDIRI4
ASGNI4
line 714
;714:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $352
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $352
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $348
LABELV $352
line 715
;715:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $337
JUMPV
LABELV $348
line 718
;716:	}
;717:
;718:	t = cg.time - cg.attackerTime;
ADDRLP4 24
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126484
INDIRI4
SUBI4
ASGNI4
line 719
;719:	if ( t > ATTACKER_HEAD_TIME ) {
ADDRLP4 24
INDIRI4
CNSTI4 10000
LEI4 $355
line 720
;720:		cg.attackerTime = 0;
ADDRGP4 cg+126484
CNSTI4 0
ASGNI4
line 721
;721:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $337
JUMPV
LABELV $355
line 724
;722:	}
;723:
;724:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 726
;725:
;726:	angles[PITCH] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 727
;727:	angles[YAW] = 180;
ADDRLP4 8+4
CNSTF4 1127481344
ASGNF4
line 728
;728:	angles[ROLL] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 729
;729:	CG_DrawHead( 640 - size, y, size, size, clientNum, angles );
CNSTF4 1142947840
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 731
;730:
;731:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 40
INDIRP4
ASGNP4
line 732
;732:	name = Info_ValueForKey(  info, "n" );
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
line 733
;733:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 734
;734:	CG_DrawBigString( 640 - ( Q_PrintStrlen( name ) * BIGCHAR_WIDTH), y, name, 0.5 );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Q_PrintStrlen
CALLI4
ASGNI4
CNSTI4 640
ADDRLP4 48
INDIRI4
CNSTI4 4
LSHI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1056964608
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 736
;735:
;736:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $337
endproc CG_DrawAttacker 52 24
proc CG_DrawSnapshot 16 16
line 744
;737:}
;738:
;739:/*
;740:==================
;741:CG_DrawSnapshot
;742:==================
;743:*/
;744:static float CG_DrawSnapshot( float y ) {
line 748
;745:	char		*s;
;746:	int			w;
;747:
;748:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $362
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31444
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 750
;749:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;750:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 752
;751:
;752:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 754
;753:
;754:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $361
endproc CG_DrawSnapshot 16 16
bss
align 4
LABELV $367
skip 16
align 4
LABELV $368
skip 4
align 4
LABELV $369
skip 4
code
proc CG_DrawFPS 44 16
line 763
;755:}
;756:
;757:/*
;758:==================
;759:CG_DrawFPS
;760:==================
;761:*/
;762:#define	FPS_FRAMES	4
;763:static float CG_DrawFPS( float y ) {
line 775
;764:	char		*s;
;765:	int			w;
;766:	static int	previousTimes[FPS_FRAMES];
;767:	static int	index;
;768:	int		i, total;
;769:	int		fps;
;770:	static	int	previous;
;771:	int		t, frameTime;
;772:
;773:	// don't use serverTime, because that will be drifting to
;774:	// correct for internet lag changes, timescales, timedemos, etc
;775:	t = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 776
;776:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $369
INDIRI4
SUBI4
ASGNI4
line 777
;777:	previous = t;
ADDRGP4 $369
ADDRLP4 8
INDIRI4
ASGNI4
line 779
;778:
;779:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $368
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $367
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 780
;780:	index++;
ADDRLP4 32
ADDRGP4 $368
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 781
;781:	if ( index > FPS_FRAMES ) {
ADDRGP4 $368
INDIRI4
CNSTI4 4
LEI4 $370
line 783
;782:		// average multiple frames together to smooth changes out a bit
;783:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 784
;784:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $372
line 785
;785:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $367
ADDP4
INDIRI4
ADDI4
ASGNI4
line 786
;786:		}
LABELV $373
line 784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $372
line 787
;787:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $376
line 788
;788:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 789
;789:		}
LABELV $376
line 790
;790:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 24
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 792
;791:
;792:		s = va( "%ifps", fps );
ADDRGP4 $378
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 793
;793:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 796
;794:
;795:		//CG_DrawBigString( 50 - w, y + 2, s, 1.0F); // Shafe -  Drawfps 635
;796:		CG_DrawSmallString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 20
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 797
;797:	}
LABELV $370
line 799
;798:
;799:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $366
endproc CG_DrawFPS 44 16
proc CG_DrawTimer 32 16
line 807
;800:}
;801:
;802:/*
;803:=================
;804:CG_DrawTimer
;805:=================
;806:*/
;807:static float CG_DrawTimer( float y ) {
line 813
;808:	char		*s;
;809:	int			w;
;810:	int			mins, seconds, tens;
;811:	int			msec;
;812:
;813:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+34796
INDIRI4
SUBI4
ASGNI4
line 815
;814:
;815:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 816
;816:	mins = seconds / 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 817
;817:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 8
INDIRI4
MULI4
SUBI4
ASGNI4
line 818
;818:	tens = seconds / 10;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 819
;819:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 821
;820:
;821:	s = va( "%i:%i%i", mins, tens, seconds );
ADDRGP4 $382
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 822
;822:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 824
;823:
;824:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
CNSTI4 635
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 826
;825:
;826:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $379
endproc CG_DrawTimer 32 16
proc CG_DrawTeamOverlay 148 36
line 836
;827:}
;828:
;829:
;830:/*
;831:=================
;832:CG_DrawTeamOverlay
;833:=================
;834:*/
;835:
;836:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 848
;837:	int x, w, h, xx;
;838:	int i, j, len;
;839:	const char *p;
;840:	vec4_t		hcolor;
;841:	int pwidth, lwidth;
;842:	int plyrs;
;843:	char st[16];
;844:	clientInfo_t *ci;
;845:	gitem_t	*item;
;846:	int ret_y, count;
;847:
;848:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $384
line 849
;849:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $383
JUMPV
LABELV $384
line 852
;850:	}
;851:
;852:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRLP4 92
CNSTI4 304
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $387
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $387
line 853
;853:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $383
JUMPV
LABELV $387
line 856
;854:	}
;855:
;856:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 859
;857:
;858:	// max player name width
;859:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 860
;860:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $392
ADDRLP4 96
CNSTI4 8
ASGNI4
ADDRGP4 $393
JUMPV
LABELV $392
ADDRLP4 96
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $393
ADDRLP4 48
ADDRLP4 96
INDIRI4
ASGNI4
line 861
;861:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $394
line 862
;862:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1740
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 863
;863:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $399
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $399
line 864
;864:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 865
;865:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 104
INDIRI4
ASGNI4
line 866
;866:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $402
line 867
;867:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $402
line 868
;868:		}
LABELV $399
line 869
;869:	}
LABELV $395
line 861
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $397
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $394
line 871
;870:
;871:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $404
line 872
;872:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $383
JUMPV
LABELV $404
line 874
;873:
;874:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $406
line 875
;875:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $406
line 878
;876:
;877:	// max location name width
;878:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 879
;879:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $408
line 880
;880:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 100
INDIRP4
ASGNP4
line 881
;881:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $412
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $412
line 882
;882:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 108
INDIRI4
ASGNI4
line 883
;883:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $414
line 884
;884:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $414
line 885
;885:		}
LABELV $412
line 886
;886:	}
LABELV $409
line 879
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $408
line 888
;887:
;888:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $416
line 889
;889:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $416
line 891
;890:
;891:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 3
LSHI4
CNSTI4 32
ADDI4
CNSTI4 56
ADDI4
ASGNI4
line 893
;892:
;893:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $418
line 894
;894:		x = 640 - w;
ADDRLP4 52
CNSTI4 640
ADDRLP4 80
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $418
line 896
;895:	else
;896:		x = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $419
line 898
;897:
;898:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 900
;899:
;900:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $420
line 901
;901:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 902
;902:	} else {
ADDRGP4 $421
JUMPV
LABELV $420
line 903
;903:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 904
;904:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 905
;905:	}
LABELV $421
line 907
;906:
;907:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $422
line 908
;908:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 909
;909:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 910
;910:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 911
;911:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 912
;912:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $423
JUMPV
LABELV $422
line 913
;913:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 914
;914:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 915
;915:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 916
;916:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 917
;917:	}
LABELV $423
line 918
;918:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 919
;919:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+154388+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 920
;920:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 922
;921:
;922:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 923
;923:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1740
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 924
;924:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $438
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $438
line 926
;925:
;926:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 104
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 104
INDIRF4
ASGNF4
line 928
;927:
;928:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 930
;929:
;930:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 112
CNSTI4 8
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 934
;931:				ci->name, hcolor, qfalse, qfalse,
;932:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;933:
;934:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $444
line 935
;935:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 116
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 116
INDIRP4
ASGNP4
line 936
;936:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $446
LABELV $448
line 937
;937:					p = "unknown";
ADDRLP4 20
ADDRGP4 $449
ASGNP4
LABELV $446
line 938
;938:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 124
INDIRI4
ASGNI4
line 939
;939:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $450
line 940
;940:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $450
line 944
;941:
;942://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;943://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;944:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 16
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 945
;945:				CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 948
;946:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;947:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;948:			}
LABELV $444
line 950
;949:
;950:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 952
;951:
;952:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $452
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 954
;953:
;954:			xx = x + TINYCHAR_WIDTH * 3 + 
ADDRLP4 124
CNSTI4 3
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 56
INDIRI4
ADDRLP4 124
INDIRI4
LSHI4
ADDI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
LSHI4
ADDI4
ASGNI4
line 957
;955:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;956:
;957:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 962
;958:				st, hcolor, qfalse, qfalse,
;959:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;960:
;961:			// draw weapon icon
;962:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 964
;963:
;964:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
CNSTI4 136
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $453
line 965
;965:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 136
CNSTF4 1090519040
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 967
;966:					cg_weapons[ci->curWeapon].weaponIcon );
;967:			} else {
ADDRGP4 $454
JUMPV
LABELV $453
line 968
;968:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 136
CNSTF4 1090519040
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRGP4 cgs+154388+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 970
;969:					cgs.media.deferShader );
;970:			}
LABELV $454
line 973
;971:
;972:			// Draw powerup icons
;973:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $459
line 974
;974:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 975
;975:			} else {
ADDRGP4 $460
JUMPV
LABELV $459
line 976
;976:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 977
;977:			}
LABELV $460
line 978
;978:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $461
line 979
;979:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $465
line 981
;980:
;981:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 136
INDIRP4
ASGNP4
line 983
;982:
;983:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
line 984
;984:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 144
CNSTF4 1090519040
ASGNF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 986
;985:						trap_R_RegisterShader( item->icon ) );
;986:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $469
line 987
;987:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 988
;988:						} else {
ADDRGP4 $470
JUMPV
LABELV $469
line 989
;989:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 990
;990:						}
LABELV $470
line 991
;991:					}
LABELV $467
line 992
;992:				}
LABELV $465
line 993
;993:			}
LABELV $462
line 978
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $461
line 995
;994:
;995:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 996
;996:		}
LABELV $438
line 997
;997:	}
LABELV $434
line 922
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $433
line 1000
;998:
;999:		
;1000:	if (cgs.g_GameMode == 3) {
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 3
NEI4 $471
line 1013
;1001:		/*
;1002:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;1003:
;1004:			xx = x + TINYCHAR_WIDTH * 3 + 
;1005:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1006:
;1007:			CG_DrawStringExt( xx, y,
;1008:				st, hcolor, qfalse, qfalse,
;1009:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1010:
;1011:			y += TINYCHAR_HEIGHT;
;1012:			*/
;1013:	}
LABELV $471
line 1015
;1014:
;1015:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $383
endproc CG_DrawTeamOverlay 148 36
proc CG_DrawUpperRight 12 12
line 1026
;1016://#endif
;1017:}
;1018:
;1019:
;1020:/*
;1021:=====================
;1022:CG_DrawUpperRight
;1023:
;1024:=====================
;1025:*/
;1026:static void CG_DrawUpperRight( void ) {
line 1029
;1027:	float	y;
;1028:
;1029:	y = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1031
;1030:
;1031:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $475
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $475
line 1032
;1032:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1033
;1033:	} 
LABELV $475
line 1034
;1034:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $479
line 1035
;1035:		y = CG_DrawSnapshot( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1036
;1036:	}
LABELV $479
line 1037
;1037:	if ( cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $482
line 1038
;1038:		y = CG_DrawFPS( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1039
;1039:	}
LABELV $482
line 1040
;1040:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $485
line 1041
;1041:		y = CG_DrawTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1042
;1042:	}
LABELV $485
line 1043
;1043:	if ( cg_drawAttacker.integer ) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $488
line 1044
;1044:		y = CG_DrawAttacker( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawAttacker
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1045
;1045:	}
LABELV $488
line 1047
;1046:
;1047:}
LABELV $474
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 76 20
line 1065
;1048:
;1049:/*
;1050:===========================================================================================
;1051:
;1052:  LOWER RIGHT CORNER
;1053:
;1054:===========================================================================================
;1055:*/
;1056:
;1057:/*
;1058:=================
;1059:CG_DrawScores
;1060:
;1061:Draw the small two score display
;1062:=================
;1063:*/
;1064:#ifndef MISSIONPACK
;1065:static float CG_DrawScores( float y ) {
line 1074
;1066:	const char	*s;
;1067:	int			s1, s2, score;
;1068:	int			x, w;
;1069:	int			v;
;1070:	vec4_t		color;
;1071:	float		y1;
;1072:	gitem_t		*item;
;1073:
;1074:	s1 = cgs.scores1;
ADDRLP4 28
ADDRGP4 cgs+34800
INDIRI4
ASGNI4
line 1075
;1075:	s2 = cgs.scores2;
ADDRLP4 32
ADDRGP4 cgs+34804
INDIRI4
ASGNI4
line 1077
;1076:
;1077:	y -=  BIGCHAR_HEIGHT + 8;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 1079
;1078:
;1079:	y1 = y;
ADDRLP4 36
ADDRFP4 0
INDIRF4
ASGNF4
line 1082
;1080:	
;1081:	// draw from the right side to left
;1082:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $494
line 1083
;1083:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1084
;1084:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1085
;1085:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1086
;1086:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1087
;1087:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1088
;1088:		s = va( "%2i", s2 );
ADDRGP4 $500
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 52
INDIRP4
ASGNP4
line 1089
;1089:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 56
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1090
;1090:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1091
;1091:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1092
;1092:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $501
line 1093
;1093:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+154388+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1094
;1094:		}
LABELV $501
line 1095
;1095:		CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1097
;1096:
;1097:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $506
line 1099
;1098:			// Display flag status
;1099:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 60
INDIRP4
ASGNP4
line 1101
;1100:
;1101:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $509
line 1102
;1102:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1103
;1103:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 0
LTI4 $511
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
GTI4 $511
line 1104
;1104:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+60
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1105
;1105:				}
LABELV $511
line 1106
;1106:			}
LABELV $509
line 1107
;1107:		}
LABELV $506
line 1108
;1108:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1109
;1109:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1110
;1110:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1111
;1111:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1112
;1112:		s = va( "%2i", s1 );
ADDRGP4 $500
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 60
INDIRP4
ASGNP4
line 1113
;1113:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1114
;1114:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1115
;1115:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1116
;1116:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $521
line 1117
;1117:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+154388+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1118
;1118:		}
LABELV $521
line 1119
;1119:		CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1121
;1120:
;1121:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $526
line 1123
;1122:			// Display flag status
;1123:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 68
INDIRP4
ASGNP4
line 1125
;1124:
;1125:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $529
line 1126
;1126:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1127
;1127:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 0
LTI4 $531
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
GTI4 $531
line 1128
;1128:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1129
;1129:				}
LABELV $531
line 1130
;1130:			}
LABELV $529
line 1131
;1131:		}
LABELV $526
line 1148
;1132:
;1133:#ifdef MISSIONPACK
;1134:		if ( cgs.gametype == GT_1FCTF ) {
;1135:			// Display flag status
;1136:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1137:
;1138:			if (item) {
;1139:				y1 = y - BIGCHAR_HEIGHT - 8;
;1140:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
;1141:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
;1142:				}
;1143:			}
;1144:		}
;1145:#endif
;1146:		
;1147:		// Shafe - This draws the status thingy
;1148:		if ( cgs.gametype >= GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
LTI4 $538
line 1149
;1149:			v = cgs.capturelimit;
ADDRLP4 44
ADDRGP4 cgs+31472
INDIRI4
ASGNI4
line 1150
;1150:		} else {
ADDRGP4 $539
JUMPV
LABELV $538
line 1151
;1151:			v = cgs.fraglimit;
ADDRLP4 44
ADDRGP4 cgs+31468
INDIRI4
ASGNI4
line 1152
;1152:		}
LABELV $539
line 1153
;1153:		if ( cgs.g_GameMode == 3)
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 3
NEI4 $543
line 1154
;1154:		{
line 1155
;1155:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) { v = cgs.g_BlueMC; }
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $546
ADDRLP4 44
ADDRGP4 cgs+155544
INDIRI4
ASGNI4
LABELV $546
line 1156
;1156:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) { v = cgs.g_RedMC; }
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $550
ADDRLP4 44
ADDRGP4 cgs+155540
INDIRI4
ASGNI4
LABELV $550
line 1160
;1157:			
;1158:
;1159:			
;1160:		}
LABELV $543
line 1162
;1161:		
;1162:		if ( v ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $495
line 1163
;1163:			s = va( "%2i", v );
ADDRGP4 $500
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 68
INDIRP4
ASGNP4
line 1164
;1164:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 72
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1165
;1165:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1166
;1166:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1167
;1167:		}
line 1169
;1168:
;1169:	} else {
ADDRGP4 $495
JUMPV
LABELV $494
line 1172
;1170:		qboolean	spectator;
;1171:
;1172:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1173
;1173:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 40
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1174
;1174:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $559
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $560
JUMPV
LABELV $559
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $560
ADDRLP4 52
ADDRLP4 56
INDIRI4
ASGNI4
line 1177
;1175:
;1176:		// always show your score in the second box if not in first place
;1177:		if ( s1 != score ) {
ADDRLP4 28
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $561
line 1178
;1178:			s2 = score;
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 1179
;1179:		}
LABELV $561
line 1180
;1180:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $563
line 1181
;1181:			s = va( "%2i", s2 );
ADDRGP4 $500
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 60
INDIRP4
ASGNP4
line 1182
;1182:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1183
;1183:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1184
;1184:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $565
ADDRLP4 68
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $565
ADDRLP4 68
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $565
line 1185
;1185:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1186
;1186:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1187
;1187:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1188
;1188:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1189
;1189:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1190
;1190:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+154388+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1191
;1191:			} else {
ADDRGP4 $566
JUMPV
LABELV $565
line 1192
;1192:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1193
;1193:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1194
;1194:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1195
;1195:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1196
;1196:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1197
;1197:			}	
LABELV $566
line 1198
;1198:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1199
;1199:		}
LABELV $563
line 1202
;1200:
;1201:		// first place
;1202:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 28
INDIRI4
CNSTI4 -9999
EQI4 $575
line 1203
;1203:			s = va( "%2i", s1 );
ADDRGP4 $500
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 60
INDIRP4
ASGNP4
line 1204
;1204:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1205
;1205:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1206
;1206:			if ( !spectator && score == s1 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $577
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $577
line 1207
;1207:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1208
;1208:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1209
;1209:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1210
;1210:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1211
;1211:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1212
;1212:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+154388+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1213
;1213:			} else {
ADDRGP4 $578
JUMPV
LABELV $577
line 1214
;1214:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1215
;1215:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1216
;1216:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1217
;1217:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1218
;1218:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1219
;1219:			}	
LABELV $578
line 1220
;1220:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1221
;1221:		}
LABELV $575
line 1223
;1222:
;1223:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 0
EQI4 $587
line 1224
;1224:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $500
ARGP4
ADDRGP4 cgs+31468
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 60
INDIRP4
ASGNP4
line 1225
;1225:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1226
;1226:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1227
;1227:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 16
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1228
;1228:		}
LABELV $587
line 1230
;1229:
;1230:	}
LABELV $495
line 1232
;1231:
;1232:	return y1 - 8;
ADDRLP4 36
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $491
endproc CG_DrawScores 76 20
data
align 4
LABELV $592
byte 4 1045220557
byte 4 1065353216
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
code
proc CG_DrawPowerups 208 20
line 1242
;1233:}
;1234:#endif // MISSIONPACK
;1235:
;1236:/*
;1237:================
;1238:CG_DrawPowerups
;1239:================
;1240:*/
;1241:#ifndef MISSIONPACK
;1242:static float CG_DrawPowerups( float y ) {
line 1259
;1243:	int		sorted[MAX_POWERUPS];
;1244:	int		sortedTime[MAX_POWERUPS];
;1245:	int		i, j, k;
;1246:	int		active;
;1247:	playerState_t	*ps;
;1248:	int		t;
;1249:	gitem_t	*item;
;1250:	int		x;
;1251:	int		color;
;1252:	float	size;
;1253:	float	f;
;1254:	static float colors[2][4] = { 
;1255:    { 0.2f, 1.0f, 0.2f, 1.0f } , 
;1256:    { 1.0f, 0.2f, 0.2f, 1.0f } 
;1257:  };
;1258:
;1259:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1261
;1260:
;1261:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $594
line 1262
;1262:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $591
JUMPV
LABELV $594
line 1266
;1263:	}
;1264:
;1265:	// sort the list by time remaining
;1266:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1267
;1267:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $596
line 1268
;1268:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $600
line 1269
;1269:			continue;
ADDRGP4 $597
JUMPV
LABELV $600
line 1271
;1270:		}
;1271:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
ASGNI4
line 1274
;1272:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1273:		// This is true of the CTF flags
;1274:		if ( t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $605
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $603
LABELV $605
line 1275
;1275:			continue;
ADDRGP4 $597
JUMPV
LABELV $603
line 1279
;1276:		}
;1277:
;1278:		// insert into the list
;1279:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $609
JUMPV
LABELV $606
line 1280
;1280:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $610
line 1281
;1281:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 1282
;1282:					sorted[k+1] = sorted[k];
ADDRLP4 176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 176
INDIRI4
ADDRLP4 68+4
ADDP4
ADDRLP4 176
INDIRI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 1283
;1283:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRLP4 4+4
ADDP4
ADDRLP4 180
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 1284
;1284:				}
LABELV $613
line 1281
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $615
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $612
line 1285
;1285:				break;
ADDRGP4 $608
JUMPV
LABELV $610
line 1287
;1286:			}
;1287:		}
LABELV $607
line 1279
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $609
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $606
LABELV $608
line 1288
;1288:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1289
;1289:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1290
;1290:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1291
;1291:	}
LABELV $597
line 1267
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $596
line 1294
;1292:
;1293:	// draw the icons and timers
;1294:	x = 640 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
CNSTI4 528
ASGNI4
line 1295
;1295:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $621
JUMPV
LABELV $618
line 1296
;1296:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 172
INDIRP4
ASGNP4
line 1298
;1297:
;1298:    if (item) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1300
;1299:
;1300:		  color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1302
;1301:
;1302:		  y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1304
;1303:
;1304:		  trap_R_SetColor( colors[color] );
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $592
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1305
;1305:		  CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
ADDRLP4 168
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ADDRLP4 176
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 1307
;1306:
;1307:		  t = ps->powerups[ sorted[i] ];
ADDRLP4 180
CNSTI4 2
ASGNI4
ADDRLP4 140
ADDRLP4 144
INDIRI4
ADDRLP4 180
INDIRI4
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1308
;1308:		  if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $624
line 1309
;1309:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1310
;1310:		  } else {
ADDRGP4 $625
JUMPV
LABELV $624
line 1313
;1311:			  vec4_t	modulate;
;1312:
;1313:			  f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 160
ADDRLP4 140
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1314
;1314:			  f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1315
;1315:			  modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 184+12
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 184+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 184+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 184
ADDRLP4 160
INDIRF4
ASGNF4
line 1316
;1316:			  trap_R_SetColor( modulate );
ADDRLP4 184
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1317
;1317:		  }
LABELV $625
line 1319
;1318:
;1319:		  if ( cg.powerupActive == sorted[i] && 
ADDRGP4 cg+126476
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $631
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126480
INDIRI4
SUBI4
CNSTI4 200
GEI4 $631
line 1320
;1320:			  cg.time - cg.powerupTime < PULSE_TIME ) {
line 1321
;1321:			  f = 1.0 - ( ( (float)cg.time - cg.powerupTime ) / PULSE_TIME );
ADDRLP4 160
CNSTF4 1065353216
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg+126480
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1322
;1322:			  size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
ADDRLP4 156
CNSTF4 1111490560
CNSTF4 1056964608
ADDRLP4 160
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1323
;1323:		  } else {
ADDRGP4 $632
JUMPV
LABELV $631
line 1324
;1324:			  size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1325
;1325:		  }
LABELV $632
line 1327
;1326:
;1327:		  CG_DrawPic( 640 - size, y + ICON_SIZE / 2 - size / 2, 
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
CNSTF4 1142947840
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
ADDF4
ADDRLP4 156
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1329
;1328:			  size, size, trap_R_RegisterShader( item->icon ) );
;1329:    }
LABELV $622
line 1330
;1330:	}
LABELV $619
line 1295
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $621
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $618
line 1331
;1331:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1333
;1332:
;1333:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $591
endproc CG_DrawPowerups 208 20
proc CG_DrawLowerRight 12 12
line 1365
;1334:}
;1335:#endif // MISSIONPACK
;1336:/*
;1337:====================
;1338:CG_DrawHudRight
;1339:====================
;1340:
;1341:static float CG_DrawHudRight(float y){
;1342:	
;1343:	//x = 640 - 48;  this x/y is the lagometer position
;1344:	//y = 480 - 48;
;1345:	
;1346:	CG_DrawPic( (640-159), (480-75), 159, 75, cgs.media.HudRight );
;1347:}
;1348:
;1349:
;1350:====================
;1351:CG_DrawHudLeft
;1352:====================
;1353:
;1354:static float CG_DrawHudLeft(float y){
;1355:	CG_DrawPic( 1, (480-75), 159, 75, cgs.media.HudLeft );
;1356:}
;1357:
;1358:/*
;1359:=====================
;1360:CG_DrawLowerRight
;1361:
;1362:=====================
;1363:*/
;1364:#ifndef MISSIONPACK
;1365:static void CG_DrawLowerRight( void ) {
line 1368
;1366:	float	y;
;1367:
;1368:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1374
;1369:
;1370:
;1371://	CG_DrawHudRight( y);
;1372:	
;1373:
;1374:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $639
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $639
line 1375
;1375:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1376
;1376:	} 
LABELV $639
line 1378
;1377:
;1378:	y = CG_DrawScores( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawScores
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1379
;1379:	y = CG_DrawPowerups( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawPowerups
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1380
;1380:}
LABELV $638
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 16 20
line 1390
;1381:#endif // MISSIONPACK
;1382:
;1383:
;1384:/*
;1385:===================
;1386:CG_DrawPickupItem
;1387:===================
;1388:*/
;1389:#ifndef MISSIONPACK
;1390:static int CG_DrawPickupItem( int y ) {
line 1394
;1391:	int		value;
;1392:	float	*fadeColor;
;1393:
;1394:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $644
line 1395
;1395:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $643
JUMPV
LABELV $644
line 1398
;1396:	}
;1397:
;1398:	y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
line 1400
;1399:
;1400:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+126732
INDIRI4
ASGNI4
line 1401
;1401:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $648
line 1402
;1402:		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
ADDRGP4 cg+126736
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 8
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1403
;1403:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $651
line 1404
;1404:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1405
;1405:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1406
;1406:			CG_DrawPic( 8, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
CNSTF4 1090519040
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1407
;1407:			CG_DrawBigString( ICON_SIZE + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 16
ADDI4
ARGI4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1408
;1408:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1409
;1409:		}
LABELV $651
line 1410
;1410:	}
LABELV $648
line 1412
;1411:	
;1412:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $643
endproc CG_DrawPickupItem 16 20
proc CG_DrawLowerLeft 16 12
line 1423
;1413:}
;1414:#endif // MISSIONPACK
;1415:
;1416:/*
;1417:=====================
;1418:CG_DrawLowerLeft
;1419:
;1420:=====================
;1421:*/
;1422:#ifndef MISSIONPACK
;1423:static void CG_DrawLowerLeft( void ) {
line 1428
;1424:	float	y;
;1425:
;1426://	CG_DrawHudLeft( y);
;1427:
;1428:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1430
;1429:
;1430:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $656
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $656
line 1431
;1431:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1432
;1432:	} 
LABELV $656
line 1435
;1433:
;1434:
;1435:	y = CG_DrawPickupItem( y );
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
ADDRGP4 CG_DrawPickupItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
line 1436
;1436:}
LABELV $655
endproc CG_DrawLowerLeft 16 12
proc CG_DrawTeamInfo 56 36
line 1448
;1437:#endif // MISSIONPACK
;1438:
;1439:
;1440://===========================================================================================
;1441:
;1442:/*
;1443:=================
;1444:CG_DrawTeamInfo
;1445:=================
;1446:*/
;1447:#ifndef MISSIONPACK
;1448:static void CG_DrawTeamInfo( void ) {
line 1457
;1449:	int w, h;
;1450:	int i, len;
;1451:	vec4_t		hcolor;
;1452:	int		chatHeight;
;1453:
;1454:#define CHATLOC_Y 420 // bottom end
;1455:#define CHATLOC_X 0
;1456:
;1457:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $661
line 1458
;1458:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $662
JUMPV
LABELV $661
line 1460
;1459:	else
;1460:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $662
line 1461
;1461:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $665
line 1462
;1462:		return; // disabled
ADDRGP4 $660
JUMPV
LABELV $665
line 1464
;1463:
;1464:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+154296
INDIRI4
ADDRGP4 cgs+154292
INDIRI4
EQI4 $667
line 1465
;1465:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+154296
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154260
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $671
line 1466
;1466:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+154296
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1467
;1467:		}
LABELV $671
line 1469
;1468:
;1469:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+154292
INDIRI4
ADDRGP4 cgs+154296
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1471
;1470:
;1471:		w = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1473
;1472:
;1473:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+154296
INDIRI4
ASGNI4
ADDRGP4 $683
JUMPV
LABELV $680
line 1474
;1474:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+152332
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1475
;1475:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $687
line 1476
;1476:				w = len;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $687
line 1477
;1477:		}
LABELV $681
line 1473
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $683
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+154292
INDIRI4
LTI4 $680
line 1478
;1478:		w *= TINYCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1479
;1479:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1481
;1480:
;1481:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $689
line 1482
;1482:			hcolor[0] = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1483
;1483:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1484
;1484:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1485
;1485:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1486
;1486:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $690
JUMPV
LABELV $689
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $695
line 1487
;1487:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1488
;1488:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1489
;1489:			hcolor[2] = 1.0f;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 1490
;1490:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1491
;1491:		} else {
ADDRGP4 $696
JUMPV
LABELV $695
line 1492
;1492:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1493
;1493:			hcolor[1] = 1.0f;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 1494
;1494:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1495
;1495:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1496
;1496:		}
LABELV $696
LABELV $690
line 1498
;1497:
;1498:		trap_R_SetColor( hcolor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1499
;1499:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, 640, h, cgs.media.teamStatusBar );
CNSTF4 0
ARGF4
ADDRLP4 36
ADDRLP4 32
INDIRI4
ASGNI4
CNSTI4 420
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1142947840
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+154388+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1500
;1500:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1502
;1501:
;1502:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 12+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 1503
;1503:		hcolor[3] = 1.0f;
ADDRLP4 12+12
CNSTF4 1065353216
ASGNF4
line 1505
;1504:
;1505:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+154292
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $712
JUMPV
LABELV $709
line 1506
;1506:			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH, 
ADDRLP4 44
CNSTI4 8
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 420
ADDRGP4 cgs+154292
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 3
LSHI4
SUBI4
ARGI4
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+152332
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1510
;1507:				CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
;1508:				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
;1509:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1510:		}
LABELV $710
line 1505
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $712
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+154296
INDIRI4
GEI4 $709
line 1511
;1511:	}
LABELV $667
line 1512
;1512:}
LABELV $660
endproc CG_DrawTeamInfo 56 36
proc CG_DrawHoldableItem 8 20
line 1521
;1513:#endif // MISSIONPACK
;1514:
;1515:/*
;1516:===================
;1517:CG_DrawHoldableItem
;1518:===================
;1519:*/
;1520:#ifndef MISSIONPACK
;1521:static void CG_DrawHoldableItem( void ) { 
line 1524
;1522:	int		value;
;1523:
;1524:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1525
;1525:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $719
line 1526
;1526:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1527
;1527:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
CNSTF4 1142161408
ARGF4
CNSTF4 1129840640
ARGF4
ADDRLP4 4
CNSTF4 1111490560
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1528
;1528:	}
LABELV $719
line 1530
;1529:
;1530:}
LABELV $717
endproc CG_DrawHoldableItem 8 20
proc CG_DrawReward 68 36
line 1558
;1531:#endif // MISSIONPACK
;1532:
;1533:#ifdef MISSIONPACK
;1534:/*
;1535:===================
;1536:CG_DrawPersistantPowerup
;1537:===================
;1538:*/
;1539:#if 0 // sos001208 - DEAD
;1540:static void CG_DrawPersistantPowerup( void ) { 
;1541:	int		value;
;1542:
;1543:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1544:	if ( value ) {
;1545:		CG_RegisterItemVisuals( value );
;1546:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1547:	}
;1548:}
;1549:#endif
;1550:#endif // MISSIONPACK
;1551:
;1552:
;1553:/*
;1554:===================
;1555:CG_DrawReward
;1556:===================
;1557:*/
;1558:static void CG_DrawReward( void ) { 
line 1564
;1559:	float	*color;
;1560:	int		i, count;
;1561:	float	x, y;
;1562:	char	buf[32];
;1563:
;1564:	if ( !cg_drawRewards.integer ) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $723
line 1565
;1565:		return;
ADDRGP4 $722
JUMPV
LABELV $723
line 1568
;1566:	}
;1567:
;1568:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+126496
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 52
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1569
;1569:	if ( !color ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $727
line 1570
;1570:		if (cg.rewardStack > 0) {
ADDRGP4 cg+126492
INDIRI4
CNSTI4 0
LEI4 $722
line 1571
;1571:			for(i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $732
line 1572
;1572:				cg.rewardSound[i] = cg.rewardSound[i+1];
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 cg+126580
ADDP4
ADDRLP4 56
INDIRI4
ADDRGP4 cg+126580+4
ADDP4
INDIRI4
ASGNI4
line 1573
;1573:				cg.rewardShader[i] = cg.rewardShader[i+1];
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 cg+126540
ADDP4
ADDRLP4 60
INDIRI4
ADDRGP4 cg+126540+4
ADDP4
INDIRI4
ASGNI4
line 1574
;1574:				cg.rewardCount[i] = cg.rewardCount[i+1];
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 cg+126500
ADDP4
ADDRLP4 64
INDIRI4
ADDRGP4 cg+126500+4
ADDP4
INDIRI4
ASGNI4
line 1575
;1575:			}
LABELV $733
line 1571
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $735
ADDRLP4 0
INDIRI4
ADDRGP4 cg+126492
INDIRI4
LTI4 $732
line 1576
;1576:			cg.rewardTime = cg.time;
ADDRGP4 cg+126496
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1577
;1577:			cg.rewardStack--;
ADDRLP4 56
ADDRGP4 cg+126492
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1578
;1578:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+126496
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 60
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1579
;1579:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+126580
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1580
;1580:		} else {
line 1581
;1581:			return;
LABELV $730
line 1583
;1582:		}
;1583:	}
LABELV $727
line 1585
;1584:
;1585:	trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1602
;1586:
;1587:	/*
;1588:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1589:
;1590:	if (count) {
;1591:		y = 4;
;1592:		x = 320 - count * ICON_SIZE;
;1593:		for ( i = 0 ; i < count ; i++ ) {
;1594:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1595:			x += (ICON_SIZE*2);
;1596:		}
;1597:	}
;1598:
;1599:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1600:	*/
;1601:
;1602:	if ( cg.rewardCount[0] >= 10 ) {
ADDRGP4 cg+126500
INDIRI4
CNSTI4 10
LTI4 $751
line 1603
;1603:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1604
;1604:		x = 320 - ICON_SIZE/2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1605
;1605:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1110441984
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cg+126540
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1606
;1606:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $755
ARGP4
ADDRGP4 cg+126500
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1607
;1607:		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
ADDRLP4 20
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
CNSTI4 640
ADDRLP4 60
INDIRI4
CNSTI4 3
LSHI4
SUBI4
CNSTI4 2
DIVI4
CVIF4 4
ASGNF4
line 1608
;1608:		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRF4
CNSTF4 1111490560
ADDF4
CVFI4 4
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1610
;1609:								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
;1610:	}
ADDRGP4 $752
JUMPV
LABELV $751
line 1611
;1611:	else {
line 1613
;1612:
;1613:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+126500
INDIRI4
ASGNI4
line 1615
;1614:
;1615:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1616
;1616:		x = 320 - count * ICON_SIZE/2;
ADDRLP4 4
CNSTI4 320
CNSTI4 48
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 1617
;1617:		for ( i = 0 ; i < count ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $758
line 1618
;1618:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1110441984
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cg+126540
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1619
;1619:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1620
;1620:		}
LABELV $759
line 1617
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $761
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $758
line 1621
;1621:	}
LABELV $752
line 1622
;1622:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1623
;1623:}
LABELV $722
endproc CG_DrawReward 68 36
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1654
;1624:
;1625:
;1626:/*
;1627:===============================================================================
;1628:
;1629:LAGOMETER
;1630:
;1631:===============================================================================
;1632:*/
;1633:
;1634:#define	LAG_SAMPLES		128
;1635:
;1636:
;1637:typedef struct {
;1638:	int		frameSamples[LAG_SAMPLES];
;1639:	int		frameCount;
;1640:	int		snapshotFlags[LAG_SAMPLES];
;1641:	int		snapshotSamples[LAG_SAMPLES];
;1642:	int		snapshotCount;
;1643:} lagometer_t;
;1644:
;1645:lagometer_t		lagometer;
;1646:
;1647:/*
;1648:==============
;1649:CG_AddLagometerFrameInfo
;1650:
;1651:Adds the current interpolate / extrapolate bar for this frame
;1652:==============
;1653:*/
;1654:void CG_AddLagometerFrameInfo( void ) {
line 1657
;1655:	int			offset;
;1656:
;1657:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1658
;1658:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1659
;1659:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1660
;1660:}
LABELV $764
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1672
;1661:
;1662:/*
;1663:==============
;1664:CG_AddLagometerSnapshotInfo
;1665:
;1666:Each time a snapshot is received, log its ping time and
;1667:the number of snapshots that were dropped before it.
;1668:
;1669:Pass NULL for a dropped packet.
;1670:==============
;1671:*/
;1672:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 1674
;1673:	// dropped packet
;1674:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $770
line 1675
;1675:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 1676
;1676:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1677
;1677:		return;
ADDRGP4 $769
JUMPV
LABELV $770
line 1681
;1678:	}
;1679:
;1680:	// add this snapshot's info
;1681:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1682
;1682:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1683
;1683:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1684
;1684:}
LABELV $769
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 64 20
line 1693
;1685:
;1686:/*
;1687:==============
;1688:CG_DrawDisconnect
;1689:
;1690:Should we draw something differnet for long lag vs no packets?
;1691:==============
;1692:*/
;1693:static void CG_DrawDisconnect( void ) {
line 1701
;1694:	float		x, y;
;1695:	int			cmdNum;
;1696:	usercmd_t	cmd;
;1697:	const char		*s;
;1698:	int			w;  // bk010215 - FIXME char message[1024];
;1699:
;1700:	// draw the phone jack if we are completely past our buffers
;1701:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 44
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 44
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1702
;1702:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1703
;1703:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $785
ADDRLP4 48
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $781
LABELV $785
line 1704
;1704:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 1705
;1705:		return;
ADDRGP4 $780
JUMPV
LABELV $781
line 1709
;1706:	}
;1707:
;1708:	// also add text in center of screen
;1709:	s = "Connection Interrupted"; // bk 010215 - FIXME
ADDRLP4 24
ADDRGP4 $786
ASGNP4
line 1710
;1710:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1711
;1711:	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
CNSTI4 320
ADDRLP4 40
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1714
;1712:
;1713:	// blink the icon
;1714:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+109652
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $787
line 1715
;1715:		return;
ADDRGP4 $780
JUMPV
LABELV $787
line 1718
;1716:	}
;1717:
;1718:	x = 640 - 48;
ADDRLP4 28
CNSTF4 1142161408
ASGNF4
line 1719
;1719:	y = 480 - 48;
ADDRLP4 32
CNSTF4 1138229248
ASGNF4
line 1721
;1720:
;1721:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $790
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 1111490560
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1722
;1722:}
LABELV $780
endproc CG_DrawDisconnect 64 20
proc CG_DrawLagometer 64 36
line 1733
;1723:
;1724:
;1725:#define	MAX_LAGOMETER_PING	900
;1726:#define	MAX_LAGOMETER_RANGE	300
;1727:
;1728:/*
;1729:==============
;1730:CG_DrawLagometer
;1731:==============
;1732:*/
;1733:static void CG_DrawLagometer( void ) {
line 1741
;1734:	int		a, x, y, i;
;1735:	float	v;
;1736:	float	ax, ay, aw, ah, mid, range;
;1737:	int		color;
;1738:	float	vscale;
;1739:
;1740://unlagged - misc
;1741:	if ( !cg_lagometer.integer /* || cgs.localServer */) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
NEI4 $792
line 1743
;1742://unlagged - misc
;1743:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1744
;1744:		return;
ADDRGP4 $791
JUMPV
LABELV $792
line 1754
;1745:	}
;1746:
;1747:	//
;1748:	// draw the graph
;1749:	//
;1750:#ifdef MISSIONPACK
;1751:	x = 640 - 48;
;1752:	y = 480 - 144;
;1753:#else
;1754:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 1755
;1755:	y = 48;//480 - 48; // Shafe - Changed
ADDRLP4 48
CNSTI4 48
ASGNI4
line 1758
;1756:#endif
;1757:
;1758:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1759
;1759:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
CNSTF4 1111490560
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRGP4 cgs+154388+276
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1761
;1760:
;1761:	ax = x;
ADDRLP4 24
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1762
;1762:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1763
;1763:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1764
;1764:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1765
;1765:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 1767
;1766:
;1767:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1768
;1768:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1769
;1769:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1771
;1770:
;1771:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 1774
;1772:
;1773:	// draw the frame interpoalte / extrapolate graph
;1774:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $800
JUMPV
LABELV $797
line 1775
;1775:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1776
;1776:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1777
;1777:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1778
;1778:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $802
line 1779
;1779:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $804
line 1780
;1780:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1781
;1781:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1782
;1782:			}
LABELV $804
line 1783
;1783:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $807
line 1784
;1784:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1785
;1785:			}
LABELV $807
line 1786
;1786:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+154388+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1787
;1787:		} else if ( v < 0 ) {
ADDRGP4 $803
JUMPV
LABELV $802
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $811
line 1788
;1788:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $813
line 1789
;1789:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1790
;1790:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1791
;1791:			}
LABELV $813
line 1792
;1792:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1793
;1793:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $816
line 1794
;1794:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1795
;1795:			}
LABELV $816
line 1796
;1796:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+154388+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1797
;1797:		}
LABELV $811
LABELV $803
line 1798
;1798:	}
LABELV $798
line 1774
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $800
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $797
line 1801
;1799:
;1800:	// draw the snapshot latency / drop graph
;1801:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1802
;1802:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1804
;1803:
;1804:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $823
JUMPV
LABELV $820
line 1805
;1805:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1806
;1806:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1807
;1807:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $826
line 1808
;1808:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $828
line 1809
;1809:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $829
line 1810
;1810:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1811
;1811:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1812
;1812:				}
line 1813
;1813:			} else {
ADDRGP4 $829
JUMPV
LABELV $828
line 1814
;1814:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $834
line 1815
;1815:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1816
;1816:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1817
;1817:				}
LABELV $834
line 1818
;1818:			}
LABELV $829
line 1819
;1819:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1820
;1820:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $837
line 1821
;1821:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1822
;1822:			}
LABELV $837
line 1823
;1823:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+154388+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1824
;1824:		} else if ( v < 0 ) {
ADDRGP4 $827
JUMPV
LABELV $826
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $841
line 1825
;1825:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $843
line 1826
;1826:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1827
;1827:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1828
;1828:			}
LABELV $843
line 1829
;1829:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+154388+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1830
;1830:		}
LABELV $841
LABELV $827
line 1831
;1831:	}
LABELV $821
line 1804
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $823
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $820
line 1833
;1832:
;1833:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1835
;1834:
;1835:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $852
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $848
LABELV $852
line 1836
;1836:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $853
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1837
;1837:	}
LABELV $848
line 1839
;1838:
;1839:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1840
;1840:}
LABELV $791
endproc CG_DrawLagometer 64 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1861
;1841:
;1842:
;1843:
;1844:/*
;1845:===============================================================================
;1846:
;1847:CENTER PRINTING
;1848:
;1849:===============================================================================
;1850:*/
;1851:
;1852:
;1853:/*
;1854:==============
;1855:CG_CenterPrint
;1856:
;1857:Called for important messages that should stay in the center of the screen
;1858:for a few moments
;1859:==============
;1860:*/
;1861:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 1864
;1862:	char	*s;
;1863:
;1864:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+125432
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1866
;1865:
;1866:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+125420
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1867
;1867:	cg.centerPrintY = y;
ADDRGP4 cg+125428
ADDRFP4 4
INDIRI4
ASGNI4
line 1868
;1868:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+125424
ADDRFP4 8
INDIRI4
ASGNI4
line 1871
;1869:
;1870:	// count the number of lines for centering
;1871:	cg.centerPrintLines = 1;
ADDRGP4 cg+126456
CNSTI4 1
ASGNI4
line 1872
;1872:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
ADDRGP4 $864
JUMPV
LABELV $863
line 1873
;1873:	while( *s ) {
line 1874
;1874:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $866
line 1875
;1875:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+126456
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $866
line 1876
;1876:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1877
;1877:	}
LABELV $864
line 1873
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $863
line 1878
;1878:}
LABELV $854
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1064 36
line 1886
;1879:
;1880:
;1881:/*
;1882:===================
;1883:CG_DrawCenterString
;1884:===================
;1885:*/
;1886:static void CG_DrawCenterString( void ) {
line 1895
;1887:	char	*start;
;1888:	int		l;
;1889:	int		x, y, w;
;1890:#ifdef MISSIONPACK // bk010221 - unused else
;1891:  int h;
;1892:#endif
;1893:	float	*color;
;1894:
;1895:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+125420
INDIRI4
CNSTI4 0
NEI4 $870
line 1896
;1896:		return;
ADDRGP4 $869
JUMPV
LABELV $870
line 1899
;1897:	}
;1898:
;1899:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
ADDRGP4 cg+125420
INDIRI4
ARGI4
CNSTF4 1148846080
ADDRGP4 cg_centertime+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 24
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 1900
;1900:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $875
line 1901
;1901:		return;
ADDRGP4 $869
JUMPV
LABELV $875
line 1904
;1902:	}
;1903:
;1904:	trap_R_SetColor( color );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1906
;1905:
;1906:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
line 1908
;1907:
;1908:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+125428
INDIRI4
ADDRGP4 cg+126456
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $881
JUMPV
LABELV $880
line 1910
;1909:
;1910:	while ( 1 ) {
line 1913
;1911:		char linebuffer[1024];
;1912:
;1913:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $883
line 1914
;1914:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1052
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $889
ADDRLP4 1052
INDIRI4
CNSTI4 10
NEI4 $887
LABELV $889
line 1915
;1915:				break;
ADDRGP4 $885
JUMPV
LABELV $887
line 1917
;1916:			}
;1917:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1918
;1918:		}
LABELV $884
line 1913
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $883
LABELV $885
line 1919
;1919:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 1928
;1920:
;1921:#ifdef MISSIONPACK
;1922:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1923:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1924:		x = (SCREEN_WIDTH - w) / 2;
;1925:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1926:		y += h + 6;
;1927:#else
;1928:		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );
ADDRLP4 28
ARGP4
ADDRLP4 1052
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+125424
INDIRI4
ADDRLP4 1052
INDIRI4
MULI4
ASGNI4
line 1930
;1929:
;1930:		x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1932
;1931:
;1932:		CG_DrawStringExt( x, y, linebuffer, color, qfalse, qtrue,
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cg+125424
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRGP4 cg+125424
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1935
;1933:			cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
;1934:
;1935:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRGP4 cg+125424
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $895
JUMPV
LABELV $894
line 1937
;1936:#endif
;1937:		while ( *start && ( *start != '\n' ) ) {
line 1938
;1938:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1939
;1939:		}
LABELV $895
line 1937
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $897
ADDRLP4 1060
INDIRI4
CNSTI4 10
NEI4 $894
LABELV $897
line 1940
;1940:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $898
line 1941
;1941:			break;
ADDRGP4 $882
JUMPV
LABELV $898
line 1943
;1942:		}
;1943:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1944
;1944:	}
LABELV $881
line 1910
ADDRGP4 $880
JUMPV
LABELV $882
line 1946
;1945:
;1946:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1947
;1947:}
LABELV $869
endproc CG_DrawCenterString 1064 36
proc CG_DrawCrosshair 56 36
line 1965
;1948:
;1949:
;1950:
;1951:/*
;1952:================================================================================
;1953:
;1954:CROSSHAIR
;1955:
;1956:================================================================================
;1957:*/
;1958:
;1959:
;1960:/*
;1961:=================
;1962:CG_DrawCrosshair
;1963:=================
;1964:*/
;1965:static void CG_DrawCrosshair(void) {
line 1972
;1966:	float		w, h;
;1967:	qhandle_t	hShader;
;1968:	float		f;
;1969:	float		x, y;
;1970:	int			ca;
;1971:
;1972:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $901
line 1973
;1973:		return;
ADDRGP4 $900
JUMPV
LABELV $901
line 1976
;1974:	}
;1975:
;1976:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $904
line 1977
;1977:		return;
ADDRGP4 $900
JUMPV
LABELV $904
line 1980
;1978:	}
;1979:
;1980:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $907
line 1981
;1981:		return;
ADDRGP4 $900
JUMPV
LABELV $907
line 1985
;1982:	}
;1983:
;1984:	// set color based on health
;1985:	if ( cg_crosshairHealth.integer ) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $910
line 1988
;1986:		vec4_t		hcolor;
;1987:
;1988:		CG_ColorForHealth( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 1989
;1989:		trap_R_SetColor( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1990
;1990:	} else {
ADDRGP4 $911
JUMPV
LABELV $910
line 1991
;1991:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1992
;1992:	}
LABELV $911
line 1994
;1993:
;1994:	w = h = cg_crosshairSize.value;
ADDRLP4 28
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1997
;1995:
;1996:	// pulse the size of the crosshair when picking up items
;1997:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126740
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1998
;1998:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $916
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $916
line 1999
;1999:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 2000
;2000:		w *= ( 1 + f );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2001
;2001:		h *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2002
;2002:	}
LABELV $916
line 2004
;2003:
;2004:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 2005
;2005:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 2006
;2006:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2008
;2007:
;2008:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2009
;2009:	if (ca < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $921
line 2010
;2010:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2011
;2011:	}
LABELV $921
line 2012
;2012:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+236
ADDP4
INDIRI4
ASGNI4
line 2014
;2013:
;2014:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w), 
ADDRLP4 36
CNSTF4 1056964608
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRGP4 cg+111104
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg+111104+8
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 44
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cg+111104+4
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg+111104+12
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2017
;2015:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h), 
;2016:		w, h, 0, 0, 1, 1, hShader );
;2017:}
LABELV $900
endproc CG_DrawCrosshair 56 36
proc CG_ScanForCrosshairEntity 88 28
line 2026
;2018:
;2019:
;2020:
;2021:/*
;2022:=================
;2023:CG_ScanForCrosshairEntity
;2024:=================
;2025:*/
;2026:static void CG_ScanForCrosshairEntity( void ) {
line 2030
;2027:	trace_t		trace;
;2028:	vec3_t		start, end;
;2029:
;2030:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 0
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2031
;2031:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 80
CNSTF4 1207959552
ASGNF4
ADDRLP4 68
ADDRLP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 cg+111104+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 cg+111104+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2033
;2032:
;2033:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2050
;2034:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2035:	/*
;2036:	if ( trace.entityNum >= MAX_CLIENTS ) {
;2037:		return;
;2038:	}
;2039:	*/
;2040:
;2041:	// if the player is in fog, don't show it
;2042:	/*
;2043:	content = trap_CM_PointContents( trace.endpos, 0 );
;2044:	if ( content & CONTENTS_FOG ) {
;2045:		return;
;2046:	}
;2047:	*/
;2048:
;2049:	// if the player is invisible, don't show it
;2050:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
CNSTI4 740
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 cg_entities+188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $948
line 2051
;2051:		return;
ADDRGP4 $932
JUMPV
LABELV $948
line 2055
;2052:	}
;2053:
;2054:	// Shafe - Trep Crosshairhealth Fix
;2055:	if ( cg_entities[ trace.entityNum ].currentState.eType != ET_PLAYER ) {
CNSTI4 740
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $952
line 2056
;2056:		return;
ADDRGP4 $932
JUMPV
LABELV $952
line 2062
;2057:	}
;2058:
;2059:
;2060:
;2061:	// update the fade timer
;2062:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+126468
ADDRLP4 12+52
INDIRI4
ASGNI4
line 2063
;2063:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+126472
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2064
;2064:}
LABELV $932
endproc CG_ScanForCrosshairEntity 88 28
proc CG_DrawCrosshairNames 36 16
line 2072
;2065:
;2066:
;2067:/*
;2068:=====================
;2069:CG_DrawCrosshairNames
;2070:=====================
;2071:*/
;2072:static void CG_DrawCrosshairNames( void ) {
line 2079
;2073:	float		*color;
;2074:	char		*name;
;2075:	char		*s;
;2076:	int			health;
;2077:	float		w;
;2078:
;2079:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $961
line 2080
;2080:		return;
ADDRGP4 $960
JUMPV
LABELV $961
line 2082
;2081:	}
;2082:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $964
line 2083
;2083:		return;
ADDRGP4 $960
JUMPV
LABELV $964
line 2085
;2084:	}
;2085:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $967
line 2086
;2086:		return;
ADDRGP4 $960
JUMPV
LABELV $967
line 2091
;2087:	}
;2088:
;2089:	// scan the known entities to see if the crosshair is sighted on one
;2090:
;2091:		CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2094
;2092:
;2093:	// draw the name of the player being looked at
;2094:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
ADDRGP4 cg+126472
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 20
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 2095
;2095:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $971
line 2096
;2096:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2097
;2097:		return;
ADDRGP4 $960
JUMPV
LABELV $971
line 2101
;2098:	}
;2099:
;2100:	
;2101:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
CNSTI4 1740
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ASGNP4
line 2102
;2102:	health = cgs.clientinfo[ cg.crosshairClientNum ].health;
ADDRLP4 8
CNSTI4 1740
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+108
ADDP4
INDIRI4
ASGNI4
line 2109
;2103:
;2104:#ifdef MISSIONPACK
;2105:	color[3] *= 0.5f;
;2106:	w = CG_Text_Width(name, 0.3f, 0);
;2107:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2108:#else
;2109:	w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ASGNF4
line 2110
;2110:	CG_DrawBigString( 320 - w / 2, 170, name, color[3] * 0.5f );
CNSTF4 1134559232
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ARGI4
CNSTI4 170
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2111
;2111:	s = va( "%i", health);
ADDRGP4 $109
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 2117
;2112:
;2113:
;2114:	// Shafe - Trep - Draw Players Health
;2115:
;2116:
;2117:	if (health != 0) 
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $979
line 2118
;2118:	{
line 2119
;2119:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ASGNF4
line 2120
;2120:		CG_DrawSmallString( 320 - w / 2, 190, s, color[3] * 0.5f );
CNSTF4 1134559232
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ARGI4
CNSTI4 190
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2121
;2121:	}
LABELV $979
line 2125
;2122:
;2123:
;2124:#endif
;2125:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2126
;2126:}
LABELV $960
endproc CG_DrawCrosshairNames 36 16
proc CG_DrawSpectator 0 16
line 2136
;2127:
;2128:
;2129://==============================================================================
;2130:
;2131:/*
;2132:=================
;2133:CG_DrawSpectator
;2134:=================
;2135:*/
;2136:static void CG_DrawSpectator(void) {
line 2137
;2137:	CG_DrawBigString(320 - 9 * 8, 440, "SPECTATOR", 1.0F);
CNSTI4 248
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $982
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2138
;2138:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $983
line 2139
;2139:		CG_DrawBigString(320 - 15 * 8, 460, "waiting to play", 1.0F);
CNSTI4 200
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $986
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2140
;2140:	}
ADDRGP4 $984
JUMPV
LABELV $983
line 2141
;2141:	else if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $987
line 2142
;2142:		CG_DrawBigString(320 - 39 * 8, 460, "press ESC and use the JOIN menu to play", 1.0F);
CNSTI4 8
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $990
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2143
;2143:	}
LABELV $987
LABELV $984
line 2144
;2144:}
LABELV $981
endproc CG_DrawSpectator 0 16
proc CG_DrawVote 12 20
line 2151
;2145:
;2146:/*
;2147:=================
;2148:CG_DrawVote
;2149:=================
;2150:*/
;2151:static void CG_DrawVote(void) {
line 2155
;2152:	char	*s;
;2153:	int		sec;
;2154:
;2155:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31676
INDIRI4
CNSTI4 0
NEI4 $992
line 2156
;2156:		return;
ADDRGP4 $991
JUMPV
LABELV $992
line 2160
;2157:	}
;2158:
;2159:	// play a talk beep whenever it is modified
;2160:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31688
INDIRI4
CNSTI4 0
EQI4 $995
line 2161
;2161:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31688
CNSTI4 0
ASGNI4
line 2162
;2162:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+154388+812
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2163
;2163:	}
LABELV $995
line 2165
;2164:
;2165:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 0
CNSTI4 30000
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+31676
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2166
;2166:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1003
line 2167
;2167:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2168
;2168:	}
LABELV $1003
line 2175
;2169:#ifdef MISSIONPACK
;2170:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2171:	CG_DrawSmallString( 0, 58, s, 1.0F );
;2172:	s = "or press ESC then click Vote";
;2173:	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
;2174:#else
;2175:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
ADDRGP4 $1005
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+31692
ARGP4
ADDRGP4 cgs+31680
INDIRI4
ARGI4
ADDRGP4 cgs+31684
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 2176
;2176:	CG_DrawSmallString( 0, 58, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 58
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2178
;2177:#endif
;2178:}
LABELV $991
endproc CG_DrawVote 12 20
proc CG_DrawTeamVote 24 20
line 2185
;2179:
;2180:/*
;2181:=================
;2182:CG_DrawTeamVote
;2183:=================
;2184:*/
;2185:static void CG_DrawTeamVote(void) {
line 2189
;2186:	char	*s;
;2187:	int		sec, cs_offset;
;2188:
;2189:	if ( cgs.clientinfo->team == TEAM_RED )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 1
NEI4 $1010
line 2190
;2190:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1011
JUMPV
LABELV $1010
line 2191
;2191:	else if ( cgs.clientinfo->team == TEAM_BLUE )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 2
NEI4 $1009
line 2192
;2192:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2194
;2193:	else
;2194:		return;
LABELV $1015
LABELV $1011
line 2196
;2195:
;2196:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1018
line 2197
;2197:		return;
ADDRGP4 $1009
JUMPV
LABELV $1018
line 2201
;2198:	}
;2199:
;2200:	// play a talk beep whenever it is modified
;2201:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1021
line 2202
;2202:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
CNSTI4 0
ASGNI4
line 2203
;2203:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+154388+812
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2204
;2204:	}
LABELV $1021
line 2206
;2205:
;2206:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32716
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2207
;2207:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1029
line 2208
;2208:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2209
;2209:	}
LABELV $1029
line 2210
;2210:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1031
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+32748
ADDP4
ARGP4
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+32724
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+32732
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 2212
;2211:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2212:	CG_DrawSmallString( 0, 90, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 90
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2213
;2213:}
LABELV $1009
endproc CG_DrawTeamVote 24 20
proc CG_DrawScoreboard 4 0
line 2216
;2214:
;2215:
;2216:static qboolean CG_DrawScoreboard() {
line 2281
;2217:#ifdef MISSIONPACK
;2218:	static qboolean firstTime = qtrue;
;2219:	float fade, *fadeColor;
;2220:
;2221:	if (menuScoreboard) {
;2222:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2223:	}
;2224:	if (cg_paused.integer) {
;2225:		cg.deferredPlayerLoading = 0;
;2226:		firstTime = qtrue;
;2227:		return qfalse;
;2228:	}
;2229:
;2230:	// should never happen in Team Arena
;2231:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2232:		cg.deferredPlayerLoading = 0;
;2233:		firstTime = qtrue;
;2234:		return qfalse;
;2235:	}
;2236:
;2237:	// don't draw scoreboard during death while warmup up
;2238:	if ( cg.warmup && !cg.showScores ) {
;2239:		return qfalse;
;2240:	}
;2241:
;2242:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2243:		fade = 1.0;
;2244:		fadeColor = colorWhite;
;2245:	} else {
;2246:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;2247:		if ( !fadeColor ) {
;2248:			// next time scoreboard comes up, don't print killer
;2249:			cg.deferredPlayerLoading = 0;
;2250:			cg.killerName[0] = 0;
;2251:			firstTime = qtrue;
;2252:			return qfalse;
;2253:		}
;2254:		fade = *fadeColor;
;2255:	}																					  
;2256:
;2257:
;2258:	if (menuScoreboard == NULL) {
;2259:		if ( cgs.gametype >= GT_TEAM ) {
;2260:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2261:		} else {
;2262:			menuScoreboard = Menus_FindByName("score_menu");
;2263:		}
;2264:	}
;2265:
;2266:	if (menuScoreboard) {
;2267:		if (firstTime) {
;2268:			CG_SetScoreSelection(menuScoreboard);
;2269:			firstTime = qfalse;
;2270:		}
;2271:		Menu_Paint(menuScoreboard, qtrue);
;2272:	}
;2273:
;2274:	// load any models that have been deferred
;2275:	if ( ++cg.deferredPlayerLoading > 10 ) {
;2276:		CG_LoadDeferredPlayers();
;2277:	}
;2278:
;2279:	return qtrue;
;2280:#else
;2281:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1035
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2290
;2282:#endif
;2283:}
;2284:
;2285:/*
;2286:=================
;2287:CG_DrawIntermission
;2288:=================
;2289:*/
;2290:static void CG_DrawIntermission( void ) {
line 2298
;2291://	int key;
;2292:#ifdef MISSIONPACK
;2293:	//if (cg_singlePlayer.integer) {
;2294:	//	CG_DrawCenterString();
;2295:	//	return;
;2296:	//}
;2297:#else
;2298:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 2
NEI4 $1037
line 2299
;2299:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2300
;2300:		return;
ADDRGP4 $1036
JUMPV
LABELV $1037
line 2303
;2301:	}
;2302:#endif
;2303:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+116396
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2304
;2304:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 0
INDIRI4
ASGNI4
line 2305
;2305:}
LABELV $1036
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 32 36
line 2312
;2306:
;2307:/*
;2308:=================
;2309:CG_DrawFollow
;2310:=================
;2311:*/
;2312:static qboolean CG_DrawFollow( void ) {
line 2317
;2313:	float		x;
;2314:	vec4_t		color;
;2315:	const char	*name;
;2316:
;2317:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1044
line 2318
;2318:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1043
JUMPV
LABELV $1044
line 2320
;2319:	}
;2320:	color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2321
;2321:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2322
;2322:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2323
;2323:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2326
;2324:
;2325:
;2326:	CG_DrawBigString( 320 - 9 * 8, 24, "following", 1.0F );
CNSTI4 248
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 $1050
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2328
;2327:
;2328:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 16
CNSTI4 1740
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ASGNP4
line 2330
;2329:
;2330:	x = 0.5 * ( 640 - GIANT_WIDTH * CG_DrawStrlen( name ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
CNSTF4 1056964608
CNSTI4 640
ADDRLP4 24
INDIRI4
CNSTI4 5
LSHI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 2332
;2331:
;2332:	CG_DrawStringExt( x, 40, name, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
ADDRLP4 20
INDIRF4
CVFI4 4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTI4 48
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2334
;2333:
;2334:	return qtrue;
CNSTI4 1
RETI4
LABELV $1043
endproc CG_DrawFollow 32 36
proc CG_DrawAmmoWarning 12 16
line 2344
;2335:}
;2336:
;2337:
;2338:
;2339:/*
;2340:=================
;2341:CG_DrawAmmoWarning
;2342:=================
;2343:*/
;2344:static void CG_DrawAmmoWarning( void ) {
line 2348
;2345:	const char	*s;
;2346:	int			w;
;2347:
;2348:	if ( cg_drawAmmoWarning.integer == 0 ) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1055
line 2349
;2349:		return;
ADDRGP4 $1054
JUMPV
LABELV $1055
line 2352
;2350:	}
;2351:
;2352:	if ( !cg.lowAmmoWarning ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 0
NEI4 $1058
line 2353
;2353:		return;
ADDRGP4 $1054
JUMPV
LABELV $1058
line 2356
;2354:	}
;2355:
;2356:	if ( cg.lowAmmoWarning == 2 ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 2
NEI4 $1061
line 2357
;2357:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1064
ASGNP4
line 2358
;2358:	} else {
ADDRGP4 $1062
JUMPV
LABELV $1061
line 2359
;2359:		s = "YOU NEED AMMO!";
ADDRLP4 0
ADDRGP4 $1065
ASGNP4
line 2360
;2360:	}
LABELV $1062
line 2361
;2361:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2362
;2362:	CG_DrawSmallString(320 - w / 2, 64, s, 1.0F);
CNSTI4 320
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2363
;2363:}
LABELV $1054
endproc CG_DrawAmmoWarning 12 16
proc CG_DrawWarmup 56 36
line 2412
;2364:
;2365:
;2366:#ifdef MISSIONPACK
;2367:/*
;2368:=================
;2369:CG_DrawProxWarning
;2370:=================
;2371:*/
;2372:static void CG_DrawProxWarning( void ) {
;2373:	char s [32];
;2374:	int			w;
;2375:  static int proxTime;
;2376:  static int proxCounter;
;2377:  static int proxTick;
;2378:
;2379:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;2380:    proxTime = 0;
;2381:		return;
;2382:	}
;2383:
;2384:  if (proxTime == 0) {
;2385:    proxTime = cg.time + 5000;
;2386:    proxCounter = 5;
;2387:    proxTick = 0;
;2388:  }
;2389:
;2390:  if (cg.time > proxTime) {
;2391:    proxTick = proxCounter--;
;2392:    proxTime = cg.time + 1000;
;2393:  }
;2394:
;2395:  if (proxTick != 0) {
;2396:    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
;2397:  } else {
;2398:    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
;2399:  }
;2400:
;2401:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;2402:	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
;2403:}
;2404:#endif
;2405:
;2406:
;2407:/*
;2408:=================
;2409:CG_DrawWarmup
;2410:=================
;2411:*/
;2412:static void CG_DrawWarmup( void ) {
line 2421
;2413:	int			w;
;2414:	int			sec;
;2415:	int			i;
;2416:	float scale;
;2417:	clientInfo_t	*ci1, *ci2;
;2418:	int			cw;
;2419:	const char	*s;
;2420:
;2421:	sec = cg.warmup;
ADDRLP4 4
ADDRGP4 cg+126724
INDIRI4
ASGNI4
line 2422
;2422:	if ( !sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1068
line 2423
;2423:		return;
ADDRGP4 $1066
JUMPV
LABELV $1068
line 2426
;2424:	}
;2425:
;2426:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1070
line 2427
;2427:		s = "Waiting for players";		
ADDRLP4 8
ADDRGP4 $1072
ASGNP4
line 2428
;2428:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2429
;2429:		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
CNSTI4 320
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2430
;2430:		cg.warmupCount = 0;
ADDRGP4 cg+126728
CNSTI4 0
ASGNI4
line 2431
;2431:		return;
ADDRGP4 $1066
JUMPV
LABELV $1070
line 2434
;2432:	}
;2433:
;2434:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $1074
line 2436
;2435:		// find the two active players
;2436:		ci1 = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 2437
;2437:		ci2 = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 2438
;2438:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1077
line 2439
;2439:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 32
CNSTI4 1740
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1082
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1082
line 2440
;2440:				if ( !ci1 ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1087
line 2441
;2441:					ci1 = &cgs.clientinfo[i];
ADDRLP4 20
CNSTI4 1740
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2442
;2442:				} else {
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2443
;2443:					ci2 = &cgs.clientinfo[i];
ADDRLP4 24
CNSTI4 1740
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2444
;2444:				}
LABELV $1088
line 2445
;2445:			}
LABELV $1082
line 2446
;2446:		}
LABELV $1078
line 2438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1080
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $1077
line 2448
;2447:
;2448:		if ( ci1 && ci2 ) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1075
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1075
line 2449
;2449:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1093
ARGP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 2454
;2450:#ifdef MISSIONPACK
;2451:			w = CG_Text_Width(s, 0.6f, 0);
;2452:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2453:#else
;2454:			w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ASGNI4
line 2455
;2455:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1094
line 2456
;2456:				cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2457
;2457:			} else {
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2458
;2458:				cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2459
;2459:			}
LABELV $1095
line 2460
;2460:			CG_DrawStringExt( 320 - w * cw/2, 20,s, colorWhite, 
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2464
;2461:					qfalse, qtrue, cw, (int)(cw * 1.5f), 0 );
;2462:			
;2463:#endif
;2464:		}
line 2465
;2465:	} else {
ADDRGP4 $1075
JUMPV
LABELV $1074
line 2466
;2466:		if ( cgs.g_GameMode == 1) {
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 1
NEI4 $1096
line 2467
;2467:			s = "Arsenal";
ADDRLP4 8
ADDRGP4 $1099
ASGNP4
line 2468
;2468:		} else if ( cgs.gametype == GT_FFA && cgs.g_GameMode == 0) {
ADDRGP4 $1097
JUMPV
LABELV $1096
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1100
ADDRGP4 cgs+155536
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1100
line 2469
;2469:			s = "Free For All";
ADDRLP4 8
ADDRGP4 $1104
ASGNP4
line 2470
;2470:		} else if ( cgs.g_GameMode == 2) {
ADDRGP4 $1101
JUMPV
LABELV $1100
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 2
NEI4 $1105
line 2471
;2471:			s = "Survival";
ADDRLP4 8
ADDRGP4 $1108
ASGNP4
line 2472
;2472:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $1106
JUMPV
LABELV $1105
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
NEI4 $1109
line 2473
;2473:			if ( cgs.g_GameMode == 3) 
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 3
NEI4 $1112
line 2474
;2474:			{
line 2475
;2475:				s = "Trepidation";
ADDRLP4 8
ADDRGP4 $1115
ASGNP4
line 2476
;2476:			} else if ( cgs.g_GameMode == 2) 
ADDRGP4 $1110
JUMPV
LABELV $1112
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 2
NEI4 $1116
line 2477
;2477:			{
line 2478
;2478:				s = "Team Survival";
ADDRLP4 8
ADDRGP4 $1119
ASGNP4
line 2479
;2479:			} else {
ADDRGP4 $1110
JUMPV
LABELV $1116
line 2481
;2480:				
;2481:				s = "Team Deathmatch";
ADDRLP4 8
ADDRGP4 $1120
ASGNP4
line 2482
;2482:			}
line 2483
;2483:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $1110
JUMPV
LABELV $1109
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $1121
line 2484
;2484:			s = "Capture the Flag";
ADDRLP4 8
ADDRGP4 $1124
ASGNP4
line 2493
;2485:#ifdef MISSIONPACK
;2486:		} else if ( cgs.gametype == GT_1FCTF ) {
;2487:			s = "One Flag CTF";
;2488:		} else if ( cgs.gametype == GT_OBELISK ) {
;2489:			s = "Overload";
;2490:		} else if ( cgs.gametype == GT_HARVESTER ) {
;2491:			s = "Harvester";
;2492:#endif
;2493:		} else {
ADDRGP4 $1122
JUMPV
LABELV $1121
line 2494
;2494:			s = "";
ADDRLP4 8
ADDRGP4 $1125
ASGNP4
line 2495
;2495:		}
LABELV $1122
LABELV $1110
LABELV $1106
LABELV $1101
LABELV $1097
line 2500
;2496:#ifdef MISSIONPACK
;2497:		w = CG_Text_Width(s, 0.6f, 0);
;2498:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2499:#else
;2500:		w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
line 2501
;2501:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1126
line 2502
;2502:			cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2503
;2503:		} else {
ADDRGP4 $1127
JUMPV
LABELV $1126
line 2504
;2504:			cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2505
;2505:		}
LABELV $1127
line 2506
;2506:		CG_DrawStringExt( 320 - w * cw/2, 25,s, colorWhite, 
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1066192077
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2509
;2507:				qfalse, qtrue, cw, (int)(cw * 1.1f), 0 );
;2508:#endif
;2509:	}
LABELV $1075
line 2511
;2510:
;2511:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2512
;2512:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1129
line 2513
;2513:		cg.warmup = 0;
ADDRGP4 cg+126724
CNSTI4 0
ASGNI4
line 2514
;2514:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2515
;2515:	}
LABELV $1129
line 2517
;2516:	
;2517:	if(cgs.g_GameMode == 1)
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 1
NEI4 $1132
line 2518
;2518:	{
line 2519
;2519:		if (cgs.g_CurrentRound > 0)
ADDRGP4 cgs+155548
INDIRI4
CNSTI4 0
LEI4 $1135
line 2520
;2520:		{
line 2522
;2521:			int rn;
;2522:			rn = cgs.g_CurrentRound+1;
ADDRLP4 32
ADDRGP4 cgs+155548
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2523
;2523:			s = va( "ROUND $i : You Have %i Seconds To Join This Round", rn, sec + 1 );
ADDRGP4 $1139
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
ASGNP4
line 2524
;2524:		} else {
ADDRGP4 $1133
JUMPV
LABELV $1135
line 2525
;2525:			s = va( "You Have %i Seconds To Join This Round", sec + 1 );
ADDRGP4 $1140
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 2526
;2526:		}
line 2528
;2527:
;2528:	} else
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2529
;2529:	{
line 2530
;2530:		s = va( "Starts in: %i", sec + 1 );
ADDRGP4 $1141
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 2531
;2531:	}
LABELV $1133
line 2534
;2532:	
;2533:
;2534:	if ( sec != cg.warmupCount ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+126728
INDIRI4
EQI4 $1142
line 2535
;2535:		cg.warmupCount = sec;
ADDRGP4 cg+126728
ADDRLP4 4
INDIRI4
ASGNI4
line 2536
;2536:		switch ( sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1148
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1151
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1154
ADDRGP4 $1147
JUMPV
LABELV $1148
line 2538
;2537:		case 0:
;2538:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+1048
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2539
;2539:			break;
ADDRGP4 $1147
JUMPV
LABELV $1151
line 2541
;2540:		case 1:
;2541:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+1044
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2542
;2542:			break;
ADDRGP4 $1147
JUMPV
LABELV $1154
line 2544
;2543:		case 2:
;2544:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+1040
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2545
;2545:			break;
line 2547
;2546:		default:
;2547:			break;
LABELV $1147
line 2549
;2548:		}
;2549:	}
LABELV $1142
line 2550
;2550:	scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2551
;2551:	switch ( cg.warmupCount ) {
ADDRLP4 32
ADDRGP4 cg+126728
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1160
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $1161
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $1162
ADDRGP4 $1157
JUMPV
LABELV $1160
line 2553
;2552:	case 0:
;2553:		cw = 28;
ADDRLP4 12
CNSTI4 28
ASGNI4
line 2554
;2554:		scale = 0.54f;
ADDRLP4 28
CNSTF4 1057635697
ASGNF4
line 2555
;2555:		break;
ADDRGP4 $1158
JUMPV
LABELV $1161
line 2557
;2556:	case 1:
;2557:		cw = 24;
ADDRLP4 12
CNSTI4 24
ASGNI4
line 2558
;2558:		scale = 0.51f;
ADDRLP4 28
CNSTF4 1057132380
ASGNF4
line 2559
;2559:		break;
ADDRGP4 $1158
JUMPV
LABELV $1162
line 2561
;2560:	case 2:
;2561:		cw = 20;
ADDRLP4 12
CNSTI4 20
ASGNI4
line 2562
;2562:		scale = 0.48f;
ADDRLP4 28
CNSTF4 1056293519
ASGNF4
line 2563
;2563:		break;
ADDRGP4 $1158
JUMPV
LABELV $1157
line 2565
;2564:	default:
;2565:		cw = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 2566
;2566:		scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2567
;2567:		break;
LABELV $1158
line 2574
;2568:	}
;2569:
;2570:#ifdef MISSIONPACK
;2571:		w = CG_Text_Width(s, scale, 0);
;2572:		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2573:#else
;2574:	w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
line 2575
;2575:	CG_DrawStringExt( 320 - w * cw/2, 70, s, colorWhite, 
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 70
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2578
;2576:			qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
;2577:#endif
;2578:}
LABELV $1066
endproc CG_DrawWarmup 56 36
proc CG_DrawZoomOvrly 4 20
line 2600
;2579:
;2580://==================================================================================
;2581:#ifdef MISSIONPACK
;2582:/* 
;2583:=================
;2584:CG_DrawTimedMenus
;2585:=================
;2586:*/
;2587:void CG_DrawTimedMenus() {
;2588:	if (cg.voiceTime) {
;2589:		int t = cg.time - cg.voiceTime;
;2590:		if ( t > 2500 ) {
;2591:			Menus_CloseByName("voiceMenu");
;2592:			trap_Cvar_Set("cl_conXOffset", "0");
;2593:			cg.voiceTime = 0;
;2594:		}
;2595:	}
;2596:}
;2597:#endif
;2598:
;2599: 
;2600:static void CG_DrawZoomOvrly( void ) {
line 2602
;2601:
;2602:	CG_DrawPic( 0, 0, 640, 480, cgs.media.ZoomOverlay );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+154388+572
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2603
;2603:}
LABELV $1163
endproc CG_DrawZoomOvrly 4 20
proc CG_Draw2D 12 0
line 2611
;2604:
;2605:
;2606:/*
;2607:=================
;2608:CG_Draw2D
;2609:=================
;2610:*/
;2611:static void CG_Draw2D( void ) {
line 2618
;2612:#ifdef MISSIONPACK
;2613:	if (cgs.orderPending && cg.time > cgs.orderTime) {
;2614:		CG_CheckOrderPending();
;2615:	}
;2616:#endif
;2617:	// if we are taking a levelshot for the menu, don't draw anything
;2618:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1167
line 2619
;2619:		return;
ADDRGP4 $1166
JUMPV
LABELV $1167
line 2622
;2620:	}
;2621:
;2622:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1170
line 2623
;2623:		return;
ADDRGP4 $1166
JUMPV
LABELV $1170
line 2626
;2624:	}
;2625:
;2626:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1173
line 2627
;2627:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2628
;2628:		return;
ADDRGP4 $1166
JUMPV
LABELV $1173
line 2638
;2629:	}
;2630:
;2631:/*
;2632:	if (cg.cameraMode) {
;2633:		return;
;2634:	}
;2635:*/
;2636:
;2637:	// Draw the Zoom Overlay
;2638:	if ( cg.zooming || cg.zoomed)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+111496
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1180
ADDRGP4 cg+111484
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1176
LABELV $1180
line 2639
;2639:	{
line 2640
;2640:		CG_DrawZoomOvrly();
ADDRGP4 CG_DrawZoomOvrly
CALLV
pop
line 2641
;2641:	}
LABELV $1176
line 2643
;2642:	
;2643:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1181
line 2644
;2644:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2645
;2645:		CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2646
;2646:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2647
;2647:	} else {
ADDRGP4 $1182
JUMPV
LABELV $1181
line 2649
;2648:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2649:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 cg+116388
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1184
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1184
line 2657
;2650:
;2651:#ifdef MISSIONPACK
;2652:			if ( cg_drawStatus.integer ) {
;2653:				Menu_PaintAll();
;2654:				CG_DrawTimedMenus();
;2655:			}
;2656:#else
;2657:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2660
;2658:#endif
;2659:      
;2660:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2665
;2661:
;2662:#ifdef MISSIONPACK
;2663:			CG_DrawProxWarning();
;2664:#endif      
;2665:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2666
;2666:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2667
;2667:			CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2670
;2668:
;2669:#ifndef MISSIONPACK
;2670:			CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2674
;2671:#else
;2672:			//CG_DrawPersistantPowerup();
;2673:#endif
;2674:			CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2676
;2675:
;2676:			if (cgs.g_GameMode != 1 || cgs.g_GameMode != 2) // Don't Use Scanner in Arsenal And Survival - Shafe
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 1
NEI4 $1192
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 2
EQI4 $1188
LABELV $1192
line 2677
;2677:			{
line 2678
;2678:				CG_DrawScanner();  // Shafe - Trep - Radar
ADDRGP4 CG_DrawScanner
CALLV
pop
line 2679
;2679:			}
LABELV $1188
line 2680
;2680:		}
LABELV $1184
line 2682
;2681:    
;2682:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $1193
line 2684
;2683:#ifndef MISSIONPACK
;2684:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2686
;2685:#endif
;2686:		}
LABELV $1193
line 2687
;2687:	}
LABELV $1182
line 2689
;2688:
;2689:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2690
;2690:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2692
;2691:
;2692:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2699
;2693:
;2694:#ifdef MISSIONPACK
;2695:	if (!cg_paused.integer) {
;2696:		CG_DrawUpperRight();
;2697:	}
;2698:#else
;2699:	CG_DrawUpperRight();
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2703
;2700:#endif
;2701:
;2702:#ifndef MISSIONPACK
;2703:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2704
;2704:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2707
;2705:#endif
;2706:
;2707:	if ( !CG_DrawFollow() ) {
ADDRLP4 4
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1196
line 2708
;2708:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2709
;2709:	}
LABELV $1196
line 2712
;2710:
;2711:	// don't draw center string if scoreboard is up
;2712:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 8
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 8
INDIRI4
ASGNI4
line 2713
;2713:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+116392
INDIRI4
CNSTI4 0
NEI4 $1199
line 2714
;2714:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2715
;2715:	}
LABELV $1199
line 2716
;2716:}
LABELV $1166
endproc CG_Draw2D 12 0
proc CG_DrawTourneyScoreboard 0 0
line 2719
;2717:
;2718:
;2719:static void CG_DrawTourneyScoreboard() {
line 2722
;2720:#ifdef MISSIONPACK
;2721:#else
;2722:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2724
;2723:#endif
;2724:}
LABELV $1202
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 24 4
line 2733
;2725:
;2726:/*
;2727:=====================
;2728:CG_DrawActive
;2729:
;2730:Perform all drawing needed to completely fill the screen
;2731:=====================
;2732:*/
;2733:void CG_DrawActive( stereoFrame_t stereoView ) {
line 2738
;2734:	float		separation;
;2735:	vec3_t		baseOrg;
;2736:
;2737:	// optionally draw the info screen instead
;2738:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1204
line 2739
;2739:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2740
;2740:		return;
ADDRGP4 $1203
JUMPV
LABELV $1204
line 2744
;2741:	}
;2742:
;2743:	// optionally draw the tournement scoreboard instead
;2744:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1207
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1207
line 2745
;2745:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 2746
;2746:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2747
;2747:		return;
ADDRGP4 $1203
JUMPV
LABELV $1207
line 2750
;2748:	}
;2749:
;2750:	switch ( stereoView ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1214
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1215
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $1217
ADDRGP4 $1211
JUMPV
LABELV $1214
line 2752
;2751:	case STEREO_CENTER:
;2752:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2753
;2753:		break;
ADDRGP4 $1212
JUMPV
LABELV $1215
line 2755
;2754:	case STEREO_LEFT:
;2755:		separation = -cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2756
;2756:		break;
ADDRGP4 $1212
JUMPV
LABELV $1217
line 2758
;2757:	case STEREO_RIGHT:
;2758:		separation = cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2759
;2759:		break;
ADDRGP4 $1212
JUMPV
LABELV $1211
line 2761
;2760:	default:
;2761:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2762
;2762:		CG_Error( "CG_DrawActive: Undefined stereoView" );
ADDRGP4 $1219
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2763
;2763:	}
LABELV $1212
line 2767
;2764:
;2765:
;2766:	// clear around the rendered view if sized down
;2767:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2770
;2768:
;2769:	// offset vieworg appropriately if we're doing stereo separation
;2770:	VectorCopy( cg.refdef.vieworg, baseOrg );
ADDRLP4 4
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2771
;2771:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1222
line 2772
;2772:		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRGP4 cg+111104+24
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+111104+24+4
ADDRGP4 cg+111104+24+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+111104+24+8
ADDRGP4 cg+111104+24+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2773
;2773:	}
LABELV $1222
line 2776
;2774:
;2775:	// draw 3D view
;2776:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+111104
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2779
;2777:
;2778:	// restore original viewpoint if running stereo
;2779:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1252
line 2780
;2780:		VectorCopy( baseOrg, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 4
INDIRB
ASGNB 12
line 2781
;2781:	}
LABELV $1252
line 2784
;2782:
;2783:	// draw status bar and other floating elements
;2784: 	CG_Draw2D();
ADDRGP4 CG_Draw2D
CALLV
pop
line 2785
;2785:}
LABELV $1203
endproc CG_DrawActive 24 4
bss
export lagometer
align 4
LABELV lagometer
skip 1544
import CG_DrawScanner
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_PlayerSprites
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_BreakGlass
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_ShotgunTrail
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ResetZoom
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
import cg_CurrentRound
import cg_RedMC
import cg_BlueMC
import cg_GameMode
import cg_plOut
import cg_latentCmds
import cg_latentSnaps
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_drawBBox
import cg_debugDelag
import cg_delag
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $1219
byte 1 67
byte 1 71
byte 1 95
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 86
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $1141
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1140
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 72
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1139
byte 1 82
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 32
byte 1 36
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 72
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1125
byte 1 0
align 1
LABELV $1124
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
LABELV $1120
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
LABELV $1119
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
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1115
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
LABELV $1108
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1104
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
LABELV $1099
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1093
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1072
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1065
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 78
byte 1 69
byte 1 69
byte 1 68
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 33
byte 1 0
align 1
LABELV $1064
byte 1 79
byte 1 85
byte 1 84
byte 1 32
byte 1 79
byte 1 70
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $1050
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1031
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1005
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $990
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $986
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $982
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $853
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $790
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $786
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $755
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $500
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $452
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $449
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $382
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $378
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $362
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $360
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 37
byte 1 105
byte 1 0
