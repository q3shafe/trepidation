data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
code
proc CG_DrawField 64 20
file "../cg_draw.c"
line 192
;1:// Copyright (C) 1999-2000 Id Software, Inc.
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
ADDRGP4 cgs+153876+320
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
CNSTI4 1732
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
CNSTI4 536
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
CNSTI4 496
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
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
CNSTI4 536
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 540
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
CNSTI4 544
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
CNSTI4 480
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
ADDRGP4 cgs+153876+132
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
ADDRGP4 cgs+153876+36
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
ADDRGP4 cgs+153876+36
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
ADDRGP4 cgs+153876+40
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
ADDRGP4 cgs+153876+44
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
ADDRGP4 cgs+153876+128
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
proc CG_DrawStatusBar 80 32
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
ADDRLP4 4
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
ADDRLP4 20
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
line 536
;534:
;535:	// draw any 3D icons first, so the changes back to 2D are minimized
;536:	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $282
CNSTI4 136
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $282
line 537
;537:		origin[0] = 70;
ADDRLP4 24
CNSTF4 1116471296
ASGNF4
line 538
;538:		origin[1] = 0;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 539
;539:		origin[2] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 540
;540:		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8+4
CNSTF4 1101004800
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 541
;541:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32,
CNSTF4 1120403456
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 72
CNSTF4 1107296256
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 543
;542:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;543:	}
LABELV $282
line 545
;544:
;545:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
CNSTF4 1133412352
ARGF4
ADDRGP4 CG_DrawStatusBarHead
CALLV
pop
line 547
;546:
;547:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+109684+312+28
INDIRI4
CNSTI4 0
EQI4 $290
line 548
;548:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
CNSTF4 1134985216
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 549
;549:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $291
JUMPV
LABELV $290
ADDRGP4 cg+109684+312+32
INDIRI4
CNSTI4 0
EQI4 $295
line 550
;550:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
CNSTF4 1134985216
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 551
;551:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $296
JUMPV
LABELV $295
ADDRGP4 cg+109684+312+36
INDIRI4
CNSTI4 0
EQI4 $300
line 552
;552:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
CNSTF4 1134985216
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 553
;553:	}
LABELV $300
LABELV $296
LABELV $291
line 555
;554:
;555:	if ( ps->stats[ STAT_ARMOR ] ) {
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 556
;556:		origin[0] = 90;
ADDRLP4 24
CNSTF4 1119092736
ASGNF4
line 557
;557:		origin[1] = 0;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 558
;558:		origin[2] = -10;
ADDRLP4 24+8
CNSTF4 3240099840
ASGNF4
line 559
;559:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
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
line 562
;560:		
;561:		// Shafe was ICON_SIZE instead of 32
;562:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32,
CNSTF4 1139474432
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 68
CNSTF4 1107296256
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRGP4 cgs+153876+120
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 564
;563:					   cgs.media.armorModel, 0, origin, angles );
;564:	}
LABELV $305
line 582
;565:#ifdef MISSIONPACK
;566:	if( cgs.gametype == GT_HARVESTER ) {
;567:		origin[0] = 90;
;568:		origin[1] = 0;
;569:		origin[2] = -10;
;570:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;571:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;572:			handle = cgs.media.redCubeModel;
;573:		} else {
;574:			handle = cgs.media.blueCubeModel;
;575:		}
;576:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;577:	}
;578:#endif
;579:	//
;580:	// ammo
;581:	//
;582:	if ( cent->currentState.weapon ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
line 583
;583:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 584
;584:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $315
line 585
;585:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
ADDRGP4 cg+109684+148
INDIRI4
CNSTI4 3
NEI4 $317
ADDRGP4 cg+109684+44
INDIRI4
CNSTI4 100
LEI4 $317
line 586
;586:				&& cg.predictedPlayerState.weaponTime > 100 ) {
line 588
;587:				// draw as dark grey when reloading
;588:				color = 2;	// dark grey
ADDRLP4 52
CNSTI4 2
ASGNI4
line 589
;589:			} else {
ADDRGP4 $318
JUMPV
LABELV $317
line 590
;590:				if ( value >= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $323
line 591
;591:					color = 0;	// green
ADDRLP4 52
CNSTI4 0
ASGNI4
line 592
;592:				} else {
ADDRGP4 $324
JUMPV
LABELV $323
line 593
;593:					color = 1;	// red
ADDRLP4 52
CNSTI4 1
ASGNI4
line 594
;594:				}
LABELV $324
line 595
;595:			}
LABELV $318
line 596
;596:			trap_R_SetColor( colors[color] );
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
line 598
;597:			
;598:			CG_DrawField (0, 432, 3, value);
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
line 599
;599:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 602
;600:
;601:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;602:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $325
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $325
line 605
;603:				qhandle_t	icon;
;604:
;605:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 72
CNSTI4 136
ADDRGP4 cg+109684+144
INDIRI4
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 606
;606:				if ( icon ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $332
line 607
;607:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, icon );
CNSTF4 1120403456
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 76
CNSTF4 1107296256
ASGNF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 608
;608:				}
LABELV $332
line 609
;609:			}
LABELV $325
line 610
;610:		}
LABELV $315
line 611
;611:	}
LABELV $313
line 616
;612:
;613:	//
;614:	// health
;615:	//
;616:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 617
;617:	if ( value > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $334
line 618
;618:		trap_R_SetColor( colors[3] );		// white
ADDRGP4 $273+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 619
;619:	} else if (value > 25) {
ADDRGP4 $335
JUMPV
LABELV $334
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $337
line 620
;620:		trap_R_SetColor( colors[0] );	// green
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 621
;621:	} else if (value > 0) {
ADDRGP4 $338
JUMPV
LABELV $337
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $339
line 622
;622:		color = (cg.time >> 8) & 1;	// flash
ADDRLP4 52
ADDRGP4 cg+109652
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 623
;623:		trap_R_SetColor( colors[color] );
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
line 624
;624:	} else {
ADDRGP4 $340
JUMPV
LABELV $339
line 625
;625:		trap_R_SetColor( colors[1] );	// red
ADDRGP4 $273+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 626
;626:	}
LABELV $340
LABELV $338
LABELV $335
line 629
;627:
;628:	// stretch the health up when taking damage
;629:	CG_DrawField ( 185, 432, 3, value);
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
line 630
;630:	CG_ColorForHealth( hcolor );
ADDRLP4 36
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 631
;631:	trap_R_SetColor( hcolor );
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 637
;632:
;633:
;634:	//
;635:	// armor
;636:	//
;637:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 638
;638:	if (value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $343
line 639
;639:		trap_R_SetColor( colors[0] );
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 640
;640:		CG_DrawField (370, 432, 3, value);
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
line 641
;641:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 643
;642:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;643:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $345
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $345
line 644
;644:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, cgs.media.armorIcon );
CNSTF4 1139474432
ARGF4
CNSTF4 1138229248
ARGF4
ADDRLP4 72
CNSTF4 1107296256
ASGNF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 cgs+153876+124
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 645
;645:		}
LABELV $345
line 647
;646:
;647:	}
LABELV $343
line 671
;648:#ifdef MISSIONPACK
;649:	//
;650:	// cubes
;651:	//
;652:	if( cgs.gametype == GT_HARVESTER ) {
;653:		value = ps->generic1;
;654:		if( value > 99 ) {
;655:			value = 99;
;656:		}
;657:		trap_R_SetColor( colors[0] );
;658:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), 432, 2, value);
;659:		trap_R_SetColor( NULL );
;660:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;661:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;662:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;663:				handle = cgs.media.redCubeIcon;
;664:			} else {
;665:				handle = cgs.media.blueCubeIcon;
;666:			}
;667:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 432, ICON_SIZE, ICON_SIZE, handle );
;668:		}
;669:	}
;670:#endif
;671:}
LABELV $272
endproc CG_DrawStatusBar 80 32
proc CG_DrawAttacker 52 24
line 688
;672:#endif
;673:
;674:/*
;675:===========================================================================================
;676:
;677:  UPPER RIGHT CORNER
;678:
;679:===========================================================================================
;680:*/
;681:
;682:/*
;683:================
;684:CG_DrawAttacker
;685:
;686:================
;687:*/
;688:static float CG_DrawAttacker( float y ) {
line 696
;689:	int			t;
;690:	float		size;
;691:	vec3_t		angles;
;692:	const char	*info;
;693:	const char	*name;
;694:	int			clientNum;
;695:
;696:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+109684+184
INDIRI4
CNSTI4 0
GTI4 $352
line 697
;697:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $352
line 700
;698:	}
;699:
;700:	if ( !cg.attackerTime ) {
ADDRGP4 cg+126484
INDIRI4
CNSTI4 0
NEI4 $356
line 701
;701:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $356
line 704
;702:	}
;703:
;704:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+109684+248+24
INDIRI4
ASGNI4
line 705
;705:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $366
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $366
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $362
LABELV $366
line 706
;706:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $362
line 709
;707:	}
;708:
;709:	t = cg.time - cg.attackerTime;
ADDRLP4 24
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126484
INDIRI4
SUBI4
ASGNI4
line 710
;710:	if ( t > ATTACKER_HEAD_TIME ) {
ADDRLP4 24
INDIRI4
CNSTI4 10000
LEI4 $369
line 711
;711:		cg.attackerTime = 0;
ADDRGP4 cg+126484
CNSTI4 0
ASGNI4
line 712
;712:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $369
line 715
;713:	}
;714:
;715:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 717
;716:
;717:	angles[PITCH] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 718
;718:	angles[YAW] = 180;
ADDRLP4 8+4
CNSTF4 1127481344
ASGNF4
line 719
;719:	angles[ROLL] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 720
;720:	CG_DrawHead( 640 - size, y, size, size, clientNum, angles );
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
line 722
;721:
;722:	info = CG_ConfigString( CS_PLAYERS + clientNum );
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
line 723
;723:	name = Info_ValueForKey(  info, "n" );
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
line 724
;724:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 725
;725:	CG_DrawBigString( 640 - ( Q_PrintStrlen( name ) * BIGCHAR_WIDTH), y, name, 0.5 );
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
line 727
;726:
;727:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $351
endproc CG_DrawAttacker 52 24
proc CG_DrawSnapshot 16 16
line 735
;728:}
;729:
;730:/*
;731:==================
;732:CG_DrawSnapshot
;733:==================
;734:*/
;735:static float CG_DrawSnapshot( float y ) {
line 739
;736:	char		*s;
;737:	int			w;
;738:
;739:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $376
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
line 741
;740:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;741:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 743
;742:
;743:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
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
line 745
;744:
;745:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $375
endproc CG_DrawSnapshot 16 16
bss
align 4
LABELV $381
skip 16
align 4
LABELV $382
skip 4
align 4
LABELV $383
skip 4
code
proc CG_DrawFPS 44 16
line 754
;746:}
;747:
;748:/*
;749:==================
;750:CG_DrawFPS
;751:==================
;752:*/
;753:#define	FPS_FRAMES	4
;754:static float CG_DrawFPS( float y ) {
line 766
;755:	char		*s;
;756:	int			w;
;757:	static int	previousTimes[FPS_FRAMES];
;758:	static int	index;
;759:	int		i, total;
;760:	int		fps;
;761:	static	int	previous;
;762:	int		t, frameTime;
;763:
;764:	// don't use serverTime, because that will be drifting to
;765:	// correct for internet lag changes, timescales, timedemos, etc
;766:	t = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 767
;767:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $383
INDIRI4
SUBI4
ASGNI4
line 768
;768:	previous = t;
ADDRGP4 $383
ADDRLP4 8
INDIRI4
ASGNI4
line 770
;769:
;770:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $382
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $381
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 771
;771:	index++;
ADDRLP4 32
ADDRGP4 $382
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 772
;772:	if ( index > FPS_FRAMES ) {
ADDRGP4 $382
INDIRI4
CNSTI4 4
LEI4 $384
line 774
;773:		// average multiple frames together to smooth changes out a bit
;774:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 775
;775:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $386
line 776
;776:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $381
ADDP4
INDIRI4
ADDI4
ASGNI4
line 777
;777:		}
LABELV $387
line 775
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $386
line 778
;778:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $390
line 779
;779:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 780
;780:		}
LABELV $390
line 781
;781:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 24
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 783
;782:
;783:		s = va( "%ifps", fps );
ADDRGP4 $392
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
line 784
;784:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 787
;785:
;786:		//CG_DrawBigString( 50 - w, y + 2, s, 1.0F); // Shafe -  Drawfps 635
;787:		CG_DrawSmallString( 635 - w, y + 2, s, 1.0F);
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
line 788
;788:	}
LABELV $384
line 790
;789:
;790:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $380
endproc CG_DrawFPS 44 16
proc CG_DrawTimer 32 16
line 798
;791:}
;792:
;793:/*
;794:=================
;795:CG_DrawTimer
;796:=================
;797:*/
;798:static float CG_DrawTimer( float y ) {
line 804
;799:	char		*s;
;800:	int			w;
;801:	int			mins, seconds, tens;
;802:	int			msec;
;803:
;804:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+34796
INDIRI4
SUBI4
ASGNI4
line 806
;805:
;806:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 807
;807:	mins = seconds / 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 808
;808:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 8
INDIRI4
MULI4
SUBI4
ASGNI4
line 809
;809:	tens = seconds / 10;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 810
;810:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 812
;811:
;812:	s = va( "%i:%i%i", mins, tens, seconds );
ADDRGP4 $396
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
line 813
;813:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 815
;814:
;815:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
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
line 817
;816:
;817:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $393
endproc CG_DrawTimer 32 16
proc CG_DrawTeamOverlay 148 36
line 827
;818:}
;819:
;820:
;821:/*
;822:=================
;823:CG_DrawTeamOverlay
;824:=================
;825:*/
;826:
;827:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 839
;828:	int x, w, h, xx;
;829:	int i, j, len;
;830:	const char *p;
;831:	vec4_t		hcolor;
;832:	int pwidth, lwidth;
;833:	int plyrs;
;834:	char st[16];
;835:	clientInfo_t *ci;
;836:	gitem_t	*item;
;837:	int ret_y, count;
;838:
;839:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $398
line 840
;840:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $398
line 843
;841:	}
;842:
;843:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
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
EQI4 $401
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $401
line 844
;844:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $401
line 847
;845:	}
;846:
;847:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 850
;848:
;849:	// max player name width
;850:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 851
;851:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $406
ADDRLP4 96
CNSTI4 8
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $406
ADDRLP4 96
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $407
ADDRLP4 48
ADDRLP4 96
INDIRI4
ASGNI4
line 852
;852:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $408
line 853
;853:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1732
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
line 854
;854:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $413
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
NEI4 $413
line 855
;855:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 856
;856:			len = CG_DrawStrlen(ci->name);
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
line 857
;857:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $416
line 858
;858:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $416
line 859
;859:		}
LABELV $413
line 860
;860:	}
LABELV $409
line 852
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $411
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $408
line 862
;861:
;862:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $418
line 863
;863:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $418
line 865
;864:
;865:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $420
line 866
;866:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $420
line 869
;867:
;868:	// max location name width
;869:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 870
;870:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $422
line 871
;871:		p = CG_ConfigString(CS_LOCATIONS + i);
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
line 872
;872:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $426
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $426
line 873
;873:			len = CG_DrawStrlen(p);
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
line 874
;874:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $428
line 875
;875:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $428
line 876
;876:		}
LABELV $426
line 877
;877:	}
LABELV $423
line 870
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $422
line 879
;878:
;879:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $430
line 880
;880:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $430
line 882
;881:
;882:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
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
line 884
;883:
;884:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $432
line 885
;885:		x = 640 - w;
ADDRLP4 52
CNSTI4 640
ADDRLP4 80
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
line 887
;886:	else
;887:		x = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $433
line 889
;888:
;889:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 891
;890:
;891:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $434
line 892
;892:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 893
;893:	} else {
ADDRGP4 $435
JUMPV
LABELV $434
line 894
;894:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 895
;895:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 896
;896:	}
LABELV $435
line 898
;897:
;898:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $436
line 899
;899:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 900
;900:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 901
;901:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 902
;902:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 903
;903:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $437
JUMPV
LABELV $436
line 904
;904:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 905
;905:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 906
;906:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 907
;907:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 908
;908:	}
LABELV $437
line 909
;909:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 910
;910:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
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
ADDRGP4 cgs+153876+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 911
;911:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 913
;912:
;913:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $447
line 914
;914:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1732
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
line 915
;915:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $452
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
NEI4 $452
line 917
;916:
;917:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
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
line 919
;918:
;919:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 921
;920:
;921:			CG_DrawStringExt( xx, y,
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
line 925
;922:				ci->name, hcolor, qfalse, qfalse,
;923:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;924:
;925:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $458
line 926
;926:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
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
line 927
;927:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $460
LABELV $462
line 928
;928:					p = "unknown";
ADDRLP4 20
ADDRGP4 $463
ASGNP4
LABELV $460
line 929
;929:				len = CG_DrawStrlen(p);
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
line 930
;930:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $464
line 931
;931:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $464
line 935
;932:
;933://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;934://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;935:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
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
line 936
;936:				CG_DrawStringExt( xx, y,
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
line 939
;937:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;938:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;939:			}
LABELV $458
line 941
;940:
;941:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
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
line 943
;942:
;943:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $466
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
line 945
;944:
;945:			xx = x + TINYCHAR_WIDTH * 3 + 
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
line 948
;946:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;947:
;948:			CG_DrawStringExt( xx, y,
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
line 953
;949:				st, hcolor, qfalse, qfalse,
;950:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;951:
;952:			// draw weapon icon
;953:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 955
;954:
;955:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
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
EQI4 $467
line 956
;956:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
line 958
;957:					cg_weapons[ci->curWeapon].weaponIcon );
;958:			} else {
ADDRGP4 $468
JUMPV
LABELV $467
line 959
;959:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
ADDRGP4 cgs+153876+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 961
;960:					cgs.media.deferShader );
;961:			}
LABELV $468
line 964
;962:
;963:			// Draw powerup icons
;964:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $473
line 965
;965:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 966
;966:			} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 967
;967:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 968
;968:			}
LABELV $474
line 969
;969:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $475
line 970
;970:				if (ci->powerups & (1 << j)) {
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
EQI4 $479
line 972
;971:
;972:					item = BG_FindItemForPowerup( j );
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
line 974
;973:
;974:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
line 975
;975:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
line 977
;976:						trap_R_RegisterShader( item->icon ) );
;977:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $483
line 978
;978:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 979
;979:						} else {
ADDRGP4 $484
JUMPV
LABELV $483
line 980
;980:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 981
;981:						}
LABELV $484
line 982
;982:					}
LABELV $481
line 983
;983:				}
LABELV $479
line 984
;984:			}
LABELV $476
line 969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $475
line 986
;985:
;986:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 987
;987:		}
LABELV $452
line 988
;988:	}
LABELV $448
line 913
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $450
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $447
line 991
;989:
;990:		
;991:	if (cgs.g_GameMode == 3) {
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 3
NEI4 $485
line 1004
;992:		/*
;993:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;994:
;995:			xx = x + TINYCHAR_WIDTH * 3 + 
;996:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;997:
;998:			CG_DrawStringExt( xx, y,
;999:				st, hcolor, qfalse, qfalse,
;1000:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1001:
;1002:			y += TINYCHAR_HEIGHT;
;1003:			*/
;1004:	}
LABELV $485
line 1006
;1005:
;1006:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $397
endproc CG_DrawTeamOverlay 148 36
proc CG_DrawUpperRight 12 12
line 1017
;1007://#endif
;1008:}
;1009:
;1010:
;1011:/*
;1012:=====================
;1013:CG_DrawUpperRight
;1014:
;1015:=====================
;1016:*/
;1017:static void CG_DrawUpperRight( void ) {
line 1020
;1018:	float	y;
;1019:
;1020:	y = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1022
;1021:
;1022:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $489
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $489
line 1023
;1023:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
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
line 1024
;1024:	} 
LABELV $489
line 1025
;1025:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $493
line 1026
;1026:		y = CG_DrawSnapshot( y );
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
line 1027
;1027:	}
LABELV $493
line 1028
;1028:	if ( cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $496
line 1029
;1029:		y = CG_DrawFPS( y );
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
line 1030
;1030:	}
LABELV $496
line 1031
;1031:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $499
line 1032
;1032:		y = CG_DrawTimer( y );
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
line 1033
;1033:	}
LABELV $499
line 1034
;1034:	if ( cg_drawAttacker.integer ) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $502
line 1035
;1035:		y = CG_DrawAttacker( y );
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
line 1036
;1036:	}
LABELV $502
line 1038
;1037:
;1038:}
LABELV $488
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 204 20
line 1056
;1039:
;1040:/*
;1041:===========================================================================================
;1042:
;1043:  LOWER RIGHT CORNER
;1044:
;1045:===========================================================================================
;1046:*/
;1047:
;1048:/*
;1049:=================
;1050:CG_DrawScores
;1051:
;1052:Draw the small two score display
;1053:=================
;1054:*/
;1055:#ifndef MISSIONPACK
;1056:static float CG_DrawScores( float y ) {
line 1067
;1057:	const char	*s;
;1058:	int			s1, s2, score;
;1059:	int			x, w;
;1060:	int			v;
;1061:	vec4_t		color;
;1062:	float		y1;
;1063:	gitem_t		*item;
;1064:	char		bluemc[MAX_QPATH];
;1065:	char		redmc[MAX_QPATH];
;1066:
;1067:	s1 = cgs.scores1;
ADDRLP4 28
ADDRGP4 cgs+34800
INDIRI4
ASGNI4
line 1068
;1068:	s2 = cgs.scores2;
ADDRLP4 32
ADDRGP4 cgs+34804
INDIRI4
ASGNI4
line 1070
;1069:
;1070:	y -=  BIGCHAR_HEIGHT + 8;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 1072
;1071:
;1072:	y1 = y;
ADDRLP4 36
ADDRFP4 0
INDIRF4
ASGNF4
line 1075
;1073:	
;1074:	// draw from the right side to left
;1075:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $508
line 1076
;1076:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1077
;1077:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1078
;1078:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1079
;1079:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1080
;1080:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1081
;1081:		s = va( "%2i", s2 );
ADDRGP4 $514
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 180
INDIRP4
ASGNP4
line 1082
;1082:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 184
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1083
;1083:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1084
;1084:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1085
;1085:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $515
line 1086
;1086:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
ADDRGP4 cgs+153876+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1087
;1087:		}
LABELV $515
line 1088
;1088:		CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1090
;1089:
;1090:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $520
line 1092
;1091:			// Display flag status
;1092:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 188
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 188
INDIRP4
ASGNP4
line 1094
;1093:
;1094:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1095
;1095:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1096
;1096:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 0
LTI4 $525
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
GTI4 $525
line 1097
;1097:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
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
ADDRGP4 cgs+153876+60
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1098
;1098:				}
LABELV $525
line 1099
;1099:			}
LABELV $523
line 1100
;1100:		}
LABELV $520
line 1101
;1101:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1102
;1102:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1103
;1103:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1104
;1104:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1105
;1105:		s = va( "%2i", s1 );
ADDRGP4 $514
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 188
INDIRP4
ASGNP4
line 1106
;1106:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 192
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1107
;1107:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1108
;1108:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1109
;1109:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $535
line 1110
;1110:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
ADDRGP4 cgs+153876+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1111
;1111:		}
LABELV $535
line 1112
;1112:		CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1114
;1113:
;1114:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $540
line 1116
;1115:			// Display flag status
;1116:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 196
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 196
INDIRP4
ASGNP4
line 1118
;1117:
;1118:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $543
line 1119
;1119:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1120
;1120:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 0
LTI4 $545
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
GTI4 $545
line 1121
;1121:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
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
ADDRGP4 cgs+153876+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1122
;1122:				}
LABELV $545
line 1123
;1123:			}
LABELV $543
line 1124
;1124:		}
LABELV $540
line 1141
;1125:
;1126:#ifdef MISSIONPACK
;1127:		if ( cgs.gametype == GT_1FCTF ) {
;1128:			// Display flag status
;1129:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1130:
;1131:			if (item) {
;1132:				y1 = y - BIGCHAR_HEIGHT - 8;
;1133:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
;1134:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
;1135:				}
;1136:			}
;1137:		}
;1138:#endif
;1139:		
;1140:		// Shafe - This draws the status thingy
;1141:		if ( cgs.gametype >= GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
LTI4 $552
line 1142
;1142:			v = cgs.capturelimit;
ADDRLP4 44
ADDRGP4 cgs+31472
INDIRI4
ASGNI4
line 1143
;1143:		} else {
ADDRGP4 $553
JUMPV
LABELV $552
line 1144
;1144:			v = cgs.fraglimit;
ADDRLP4 44
ADDRGP4 cgs+31468
INDIRI4
ASGNI4
line 1145
;1145:		}
LABELV $553
line 1146
;1146:		if ( cgs.g_GameMode == 3)
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 3
NEI4 $557
line 1147
;1147:		{
line 1148
;1148:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) { v = cgs.g_BlueMC; }
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $560
ADDRLP4 44
ADDRGP4 cgs+155000
INDIRI4
ASGNI4
LABELV $560
line 1149
;1149:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) { v = cgs.g_RedMC; }
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $564
ADDRLP4 44
ADDRGP4 cgs+154996
INDIRI4
ASGNI4
LABELV $564
line 1153
;1150:			
;1151:
;1152:			
;1153:		}
LABELV $557
line 1155
;1154:		
;1155:		if ( v ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $509
line 1156
;1156:			s = va( "%2i", v );
ADDRGP4 $514
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 196
INDIRP4
ASGNP4
line 1157
;1157:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 200
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1158
;1158:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1159
;1159:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1160
;1160:		}
line 1162
;1161:
;1162:	} else {
ADDRGP4 $509
JUMPV
LABELV $508
line 1165
;1163:		qboolean	spectator;
;1164:
;1165:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1166
;1166:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 40
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1167
;1167:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $573
ADDRLP4 184
CNSTI4 1
ASGNI4
ADDRGP4 $574
JUMPV
LABELV $573
ADDRLP4 184
CNSTI4 0
ASGNI4
LABELV $574
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
line 1170
;1168:
;1169:		// always show your score in the second box if not in first place
;1170:		if ( s1 != score ) {
ADDRLP4 28
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $575
line 1171
;1171:			s2 = score;
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 1172
;1172:		}
LABELV $575
line 1173
;1173:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $577
line 1174
;1174:			s = va( "%2i", s2 );
ADDRGP4 $514
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 188
INDIRP4
ASGNP4
line 1175
;1175:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 192
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1176
;1176:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1177
;1177:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $579
ADDRLP4 196
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $579
ADDRLP4 196
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $579
line 1178
;1178:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1179
;1179:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1180
;1180:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1181
;1181:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1182
;1182:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1183
;1183:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
ADDRGP4 cgs+153876+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1184
;1184:			} else {
ADDRGP4 $580
JUMPV
LABELV $579
line 1185
;1185:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1186
;1186:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1187
;1187:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
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
;1190:			}	
LABELV $580
line 1191
;1191:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1192
;1192:		}
LABELV $577
line 1195
;1193:
;1194:		// first place
;1195:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 28
INDIRI4
CNSTI4 -9999
EQI4 $589
line 1196
;1196:			s = va( "%2i", s1 );
ADDRGP4 $514
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 188
INDIRP4
ASGNP4
line 1197
;1197:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 192
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1198
;1198:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1199
;1199:			if ( !spectator && score == s1 ) {
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $591
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $591
line 1200
;1200:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1201
;1201:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1202
;1202:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1203
;1203:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1204
;1204:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1205
;1205:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
ADDRGP4 cgs+153876+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1206
;1206:			} else {
ADDRGP4 $592
JUMPV
LABELV $591
line 1207
;1207:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1208
;1208:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1209
;1209:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
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
;1212:			}	
LABELV $592
line 1213
;1213:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1214
;1214:		}
LABELV $589
line 1216
;1215:
;1216:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 0
EQI4 $601
line 1217
;1217:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $514
ARGP4
ADDRGP4 cgs+31468
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 188
INDIRP4
ASGNP4
line 1218
;1218:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 192
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1219
;1219:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
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
LABELV $601
line 1223
;1222:
;1223:	}
LABELV $509
line 1225
;1224:
;1225:	return y1 - 8;
ADDRLP4 36
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $505
endproc CG_DrawScores 204 20
data
align 4
LABELV $606
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
line 1235
;1226:}
;1227:#endif // MISSIONPACK
;1228:
;1229:/*
;1230:================
;1231:CG_DrawPowerups
;1232:================
;1233:*/
;1234:#ifndef MISSIONPACK
;1235:static float CG_DrawPowerups( float y ) {
line 1252
;1236:	int		sorted[MAX_POWERUPS];
;1237:	int		sortedTime[MAX_POWERUPS];
;1238:	int		i, j, k;
;1239:	int		active;
;1240:	playerState_t	*ps;
;1241:	int		t;
;1242:	gitem_t	*item;
;1243:	int		x;
;1244:	int		color;
;1245:	float	size;
;1246:	float	f;
;1247:	static float colors[2][4] = { 
;1248:    { 0.2f, 1.0f, 0.2f, 1.0f } , 
;1249:    { 1.0f, 0.2f, 0.2f, 1.0f } 
;1250:  };
;1251:
;1252:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1254
;1253:
;1254:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $608
line 1255
;1255:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $605
JUMPV
LABELV $608
line 1259
;1256:	}
;1257:
;1258:	// sort the list by time remaining
;1259:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1260
;1260:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $610
line 1261
;1261:		if ( !ps->powerups[ i ] ) {
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
NEI4 $614
line 1262
;1262:			continue;
ADDRGP4 $611
JUMPV
LABELV $614
line 1264
;1263:		}
;1264:		t = ps->powerups[ i ] - cg.time;
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
line 1267
;1265:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1266:		// This is true of the CTF flags
;1267:		if ( t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $619
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $617
LABELV $619
line 1268
;1268:			continue;
ADDRGP4 $611
JUMPV
LABELV $617
line 1272
;1269:		}
;1270:
;1271:		// insert into the list
;1272:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $623
JUMPV
LABELV $620
line 1273
;1273:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $624
line 1274
;1274:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $629
JUMPV
LABELV $626
line 1275
;1275:					sorted[k+1] = sorted[k];
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
line 1276
;1276:					sortedTime[k+1] = sortedTime[k];
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
line 1277
;1277:				}
LABELV $627
line 1274
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $629
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $626
line 1278
;1278:				break;
ADDRGP4 $622
JUMPV
LABELV $624
line 1280
;1279:			}
;1280:		}
LABELV $621
line 1272
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $623
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $620
LABELV $622
line 1281
;1281:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1282
;1282:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1283
;1283:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1284
;1284:	}
LABELV $611
line 1260
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $610
line 1287
;1285:
;1286:	// draw the icons and timers
;1287:	x = 640 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
CNSTI4 528
ASGNI4
line 1288
;1288:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $635
JUMPV
LABELV $632
line 1289
;1289:		item = BG_FindItemForPowerup( sorted[i] );
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
line 1291
;1290:
;1291:    if (item) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $636
line 1293
;1292:
;1293:		  color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1295
;1294:
;1295:		  y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1297
;1296:
;1297:		  trap_R_SetColor( colors[color] );
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $606
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1298
;1298:		  CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
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
line 1300
;1299:
;1300:		  t = ps->powerups[ sorted[i] ];
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
line 1301
;1301:		  if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $638
line 1302
;1302:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1303
;1303:		  } else {
ADDRGP4 $639
JUMPV
LABELV $638
line 1306
;1304:			  vec4_t	modulate;
;1305:
;1306:			  f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
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
line 1307
;1307:			  f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1308
;1308:			  modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
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
line 1309
;1309:			  trap_R_SetColor( modulate );
ADDRLP4 184
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1310
;1310:		  }
LABELV $639
line 1312
;1311:
;1312:		  if ( cg.powerupActive == sorted[i] && 
ADDRGP4 cg+126476
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $645
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126480
INDIRI4
SUBI4
CNSTI4 200
GEI4 $645
line 1313
;1313:			  cg.time - cg.powerupTime < PULSE_TIME ) {
line 1314
;1314:			  f = 1.0 - ( ( (float)cg.time - cg.powerupTime ) / PULSE_TIME );
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
line 1315
;1315:			  size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
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
line 1316
;1316:		  } else {
ADDRGP4 $646
JUMPV
LABELV $645
line 1317
;1317:			  size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1318
;1318:		  }
LABELV $646
line 1320
;1319:
;1320:		  CG_DrawPic( 640 - size, y + ICON_SIZE / 2 - size / 2, 
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
line 1322
;1321:			  size, size, trap_R_RegisterShader( item->icon ) );
;1322:    }
LABELV $636
line 1323
;1323:	}
LABELV $633
line 1288
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $635
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $632
line 1324
;1324:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1326
;1325:
;1326:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $605
endproc CG_DrawPowerups 208 20
proc CG_DrawHudRight 0 20
line 1334
;1327:}
;1328:#endif // MISSIONPACK
;1329:/*
;1330:====================
;1331:CG_DrawHudRight
;1332:====================
;1333:*/
;1334:static float CG_DrawHudRight(float y){
line 1339
;1335:	
;1336:	//x = 640 - 48;  this x/y is the lagometer position
;1337:	//y = 480 - 48;
;1338:	
;1339:	CG_DrawPic( (640-159), (480-75), 159, 75, cgs.media.HudRight );
CNSTF4 1139834880
ARGF4
CNSTF4 1137344512
ARGF4
CNSTF4 1126105088
ARGF4
CNSTF4 1117126656
ARGF4
ADDRGP4 cgs+153876+548
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1340
;1340:}
CNSTF4 0
RETF4
LABELV $652
endproc CG_DrawHudRight 0 20
proc CG_DrawHudLeft 0 20
line 1347
;1341:
;1342:/*
;1343:====================
;1344:CG_DrawHudLeft
;1345:====================
;1346:*/
;1347:static float CG_DrawHudLeft(float y){
line 1348
;1348:	CG_DrawPic( 1, (480-75), 159, 75, cgs.media.HudLeft );
CNSTF4 1065353216
ARGF4
CNSTF4 1137344512
ARGF4
CNSTF4 1126105088
ARGF4
CNSTF4 1117126656
ARGF4
ADDRGP4 cgs+153876+544
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1349
;1349:}
CNSTF4 0
RETF4
LABELV $655
endproc CG_DrawHudLeft 0 20
proc CG_DrawLowerRight 12 12
line 1358
;1350:
;1351:/*
;1352:=====================
;1353:CG_DrawLowerRight
;1354:
;1355:=====================
;1356:*/
;1357:#ifndef MISSIONPACK
;1358:static void CG_DrawLowerRight( void ) {
line 1361
;1359:	float	y;
;1360:
;1361:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1367
;1362:
;1363:
;1364://	CG_DrawHudRight( y);
;1365:	
;1366:
;1367:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $659
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $659
line 1368
;1368:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
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
line 1369
;1369:	} 
LABELV $659
line 1371
;1370:
;1371:	y = CG_DrawScores( y );
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
line 1372
;1372:	y = CG_DrawPowerups( y );
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
line 1373
;1373:}
LABELV $658
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 16 20
line 1383
;1374:#endif // MISSIONPACK
;1375:
;1376:
;1377:/*
;1378:===================
;1379:CG_DrawPickupItem
;1380:===================
;1381:*/
;1382:#ifndef MISSIONPACK
;1383:static int CG_DrawPickupItem( int y ) {
line 1387
;1384:	int		value;
;1385:	float	*fadeColor;
;1386:
;1387:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $664
line 1388
;1388:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $663
JUMPV
LABELV $664
line 1391
;1389:	}
;1390:
;1391:	y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
line 1393
;1392:
;1393:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+126732
INDIRI4
ASGNI4
line 1394
;1394:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $668
line 1395
;1395:		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
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
line 1396
;1396:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $671
line 1397
;1397:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1398
;1398:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1399
;1399:			CG_DrawPic( 8, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
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
line 1400
;1400:			CG_DrawBigString( ICON_SIZE + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
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
line 1401
;1401:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1402
;1402:		}
LABELV $671
line 1403
;1403:	}
LABELV $668
line 1405
;1404:	
;1405:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $663
endproc CG_DrawPickupItem 16 20
proc CG_DrawLowerLeft 16 12
line 1416
;1406:}
;1407:#endif // MISSIONPACK
;1408:
;1409:/*
;1410:=====================
;1411:CG_DrawLowerLeft
;1412:
;1413:=====================
;1414:*/
;1415:#ifndef MISSIONPACK
;1416:static void CG_DrawLowerLeft( void ) {
line 1421
;1417:	float	y;
;1418:
;1419://	CG_DrawHudLeft( y);
;1420:
;1421:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1423
;1422:
;1423:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $676
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $676
line 1424
;1424:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
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
line 1425
;1425:	} 
LABELV $676
line 1428
;1426:
;1427:
;1428:	y = CG_DrawPickupItem( y );
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
line 1429
;1429:}
LABELV $675
endproc CG_DrawLowerLeft 16 12
proc CG_DrawTeamInfo 56 36
line 1441
;1430:#endif // MISSIONPACK
;1431:
;1432:
;1433://===========================================================================================
;1434:
;1435:/*
;1436:=================
;1437:CG_DrawTeamInfo
;1438:=================
;1439:*/
;1440:#ifndef MISSIONPACK
;1441:static void CG_DrawTeamInfo( void ) {
line 1450
;1442:	int w, h;
;1443:	int i, len;
;1444:	vec4_t		hcolor;
;1445:	int		chatHeight;
;1446:
;1447:#define CHATLOC_Y 420 // bottom end
;1448:#define CHATLOC_X 0
;1449:
;1450:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $681
line 1451
;1451:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $682
JUMPV
LABELV $681
line 1453
;1452:	else
;1453:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $682
line 1454
;1454:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $685
line 1455
;1455:		return; // disabled
ADDRGP4 $680
JUMPV
LABELV $685
line 1457
;1456:
;1457:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+153784
INDIRI4
ADDRGP4 cgs+153780
INDIRI4
EQI4 $687
line 1458
;1458:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+153784
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+153748
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $691
line 1459
;1459:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+153784
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1460
;1460:		}
LABELV $691
line 1462
;1461:
;1462:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+153780
INDIRI4
ADDRGP4 cgs+153784
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1464
;1463:
;1464:		w = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1466
;1465:
;1466:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+153784
INDIRI4
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $700
line 1467
;1467:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+151820
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
line 1468
;1468:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $707
line 1469
;1469:				w = len;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $707
line 1470
;1470:		}
LABELV $701
line 1466
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $703
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+153780
INDIRI4
LTI4 $700
line 1471
;1471:		w *= TINYCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1472
;1472:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1474
;1473:
;1474:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $709
line 1475
;1475:			hcolor[0] = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1476
;1476:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1477
;1477:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1478
;1478:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1479
;1479:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $710
JUMPV
LABELV $709
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $715
line 1480
;1480:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1481
;1481:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1482
;1482:			hcolor[2] = 1.0f;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 1483
;1483:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1484
;1484:		} else {
ADDRGP4 $716
JUMPV
LABELV $715
line 1485
;1485:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1486
;1486:			hcolor[1] = 1.0f;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 1487
;1487:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1488
;1488:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1489
;1489:		}
LABELV $716
LABELV $710
line 1491
;1490:
;1491:		trap_R_SetColor( hcolor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1492
;1492:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, 640, h, cgs.media.teamStatusBar );
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
ADDRGP4 cgs+153876+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1493
;1493:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1495
;1494:
;1495:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
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
line 1496
;1496:		hcolor[3] = 1.0f;
ADDRLP4 12+12
CNSTF4 1065353216
ASGNF4
line 1498
;1497:
;1498:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+153780
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $732
JUMPV
LABELV $729
line 1499
;1499:			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH, 
ADDRLP4 44
CNSTI4 8
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 420
ADDRGP4 cgs+153780
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
ADDRGP4 cgs+151820
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
line 1503
;1500:				CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
;1501:				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
;1502:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1503:		}
LABELV $730
line 1498
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $732
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+153784
INDIRI4
GEI4 $729
line 1504
;1504:	}
LABELV $687
line 1505
;1505:}
LABELV $680
endproc CG_DrawTeamInfo 56 36
proc CG_DrawHoldableItem 8 20
line 1514
;1506:#endif // MISSIONPACK
;1507:
;1508:/*
;1509:===================
;1510:CG_DrawHoldableItem
;1511:===================
;1512:*/
;1513:#ifndef MISSIONPACK
;1514:static void CG_DrawHoldableItem( void ) { 
line 1517
;1515:	int		value;
;1516:
;1517:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1518
;1518:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $739
line 1519
;1519:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1520
;1520:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
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
line 1521
;1521:	}
LABELV $739
line 1523
;1522:
;1523:}
LABELV $737
endproc CG_DrawHoldableItem 8 20
proc CG_DrawReward 68 36
line 1551
;1524:#endif // MISSIONPACK
;1525:
;1526:#ifdef MISSIONPACK
;1527:/*
;1528:===================
;1529:CG_DrawPersistantPowerup
;1530:===================
;1531:*/
;1532:#if 0 // sos001208 - DEAD
;1533:static void CG_DrawPersistantPowerup( void ) { 
;1534:	int		value;
;1535:
;1536:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1537:	if ( value ) {
;1538:		CG_RegisterItemVisuals( value );
;1539:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1540:	}
;1541:}
;1542:#endif
;1543:#endif // MISSIONPACK
;1544:
;1545:
;1546:/*
;1547:===================
;1548:CG_DrawReward
;1549:===================
;1550:*/
;1551:static void CG_DrawReward( void ) { 
line 1557
;1552:	float	*color;
;1553:	int		i, count;
;1554:	float	x, y;
;1555:	char	buf[32];
;1556:
;1557:	if ( !cg_drawRewards.integer ) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $743
line 1558
;1558:		return;
ADDRGP4 $742
JUMPV
LABELV $743
line 1561
;1559:	}
;1560:
;1561:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
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
line 1562
;1562:	if ( !color ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $747
line 1563
;1563:		if (cg.rewardStack > 0) {
ADDRGP4 cg+126492
INDIRI4
CNSTI4 0
LEI4 $742
line 1564
;1564:			for(i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $755
JUMPV
LABELV $752
line 1565
;1565:				cg.rewardSound[i] = cg.rewardSound[i+1];
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
line 1566
;1566:				cg.rewardShader[i] = cg.rewardShader[i+1];
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
line 1567
;1567:				cg.rewardCount[i] = cg.rewardCount[i+1];
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
line 1568
;1568:			}
LABELV $753
line 1564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $755
ADDRLP4 0
INDIRI4
ADDRGP4 cg+126492
INDIRI4
LTI4 $752
line 1569
;1569:			cg.rewardTime = cg.time;
ADDRGP4 cg+126496
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1570
;1570:			cg.rewardStack--;
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
line 1571
;1571:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
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
line 1572
;1572:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+126580
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1573
;1573:		} else {
line 1574
;1574:			return;
LABELV $750
line 1576
;1575:		}
;1576:	}
LABELV $747
line 1578
;1577:
;1578:	trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1595
;1579:
;1580:	/*
;1581:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1582:
;1583:	if (count) {
;1584:		y = 4;
;1585:		x = 320 - count * ICON_SIZE;
;1586:		for ( i = 0 ; i < count ; i++ ) {
;1587:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1588:			x += (ICON_SIZE*2);
;1589:		}
;1590:	}
;1591:
;1592:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1593:	*/
;1594:
;1595:	if ( cg.rewardCount[0] >= 10 ) {
ADDRGP4 cg+126500
INDIRI4
CNSTI4 10
LTI4 $771
line 1596
;1596:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1597
;1597:		x = 320 - ICON_SIZE/2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1598
;1598:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
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
line 1599
;1599:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $775
ARGP4
ADDRGP4 cg+126500
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1600
;1600:		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
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
line 1601
;1601:		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
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
line 1603
;1602:								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
;1603:	}
ADDRGP4 $772
JUMPV
LABELV $771
line 1604
;1604:	else {
line 1606
;1605:
;1606:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+126500
INDIRI4
ASGNI4
line 1608
;1607:
;1608:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1609
;1609:		x = 320 - count * ICON_SIZE/2;
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
line 1610
;1610:		for ( i = 0 ; i < count ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $781
JUMPV
LABELV $778
line 1611
;1611:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
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
line 1612
;1612:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1613
;1613:		}
LABELV $779
line 1610
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $781
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $778
line 1614
;1614:	}
LABELV $772
line 1615
;1615:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1616
;1616:}
LABELV $742
endproc CG_DrawReward 68 36
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1647
;1617:
;1618:
;1619:/*
;1620:===============================================================================
;1621:
;1622:LAGOMETER
;1623:
;1624:===============================================================================
;1625:*/
;1626:
;1627:#define	LAG_SAMPLES		128
;1628:
;1629:
;1630:typedef struct {
;1631:	int		frameSamples[LAG_SAMPLES];
;1632:	int		frameCount;
;1633:	int		snapshotFlags[LAG_SAMPLES];
;1634:	int		snapshotSamples[LAG_SAMPLES];
;1635:	int		snapshotCount;
;1636:} lagometer_t;
;1637:
;1638:lagometer_t		lagometer;
;1639:
;1640:/*
;1641:==============
;1642:CG_AddLagometerFrameInfo
;1643:
;1644:Adds the current interpolate / extrapolate bar for this frame
;1645:==============
;1646:*/
;1647:void CG_AddLagometerFrameInfo( void ) {
line 1650
;1648:	int			offset;
;1649:
;1650:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1651
;1651:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
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
line 1652
;1652:	lagometer.frameCount++;
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
line 1653
;1653:}
LABELV $784
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1665
;1654:
;1655:/*
;1656:==============
;1657:CG_AddLagometerSnapshotInfo
;1658:
;1659:Each time a snapshot is received, log its ping time and
;1660:the number of snapshots that were dropped before it.
;1661:
;1662:Pass NULL for a dropped packet.
;1663:==============
;1664:*/
;1665:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 1667
;1666:	// dropped packet
;1667:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $790
line 1668
;1668:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
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
line 1669
;1669:		lagometer.snapshotCount++;
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
line 1670
;1670:		return;
ADDRGP4 $789
JUMPV
LABELV $790
line 1674
;1671:	}
;1672:
;1673:	// add this snapshot's info
;1674:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
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
line 1675
;1675:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
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
line 1676
;1676:	lagometer.snapshotCount++;
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
;1677:}
LABELV $789
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 64 20
line 1686
;1678:
;1679:/*
;1680:==============
;1681:CG_DrawDisconnect
;1682:
;1683:Should we draw something differnet for long lag vs no packets?
;1684:==============
;1685:*/
;1686:static void CG_DrawDisconnect( void ) {
line 1694
;1687:	float		x, y;
;1688:	int			cmdNum;
;1689:	usercmd_t	cmd;
;1690:	const char		*s;
;1691:	int			w;  // bk010215 - FIXME char message[1024];
;1692:
;1693:	// draw the phone jack if we are completely past our buffers
;1694:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
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
line 1695
;1695:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1696
;1696:	if ( cmd.serverTime <= cg.snap->ps.commandTime
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
LEI4 $805
ADDRLP4 48
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $801
LABELV $805
line 1697
;1697:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 1698
;1698:		return;
ADDRGP4 $800
JUMPV
LABELV $801
line 1702
;1699:	}
;1700:
;1701:	// also add text in center of screen
;1702:	s = "Connection Interrupted"; // bk 010215 - FIXME
ADDRLP4 24
ADDRGP4 $806
ASGNP4
line 1703
;1703:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 1704
;1704:	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
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
line 1707
;1705:
;1706:	// blink the icon
;1707:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+109652
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $807
line 1708
;1708:		return;
ADDRGP4 $800
JUMPV
LABELV $807
line 1711
;1709:	}
;1710:
;1711:	x = 640 - 48;
ADDRLP4 28
CNSTF4 1142161408
ASGNF4
line 1712
;1712:	y = 480 - 48;
ADDRLP4 32
CNSTF4 1138229248
ASGNF4
line 1714
;1713:
;1714:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $810
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
line 1715
;1715:}
LABELV $800
endproc CG_DrawDisconnect 64 20
proc CG_DrawLagometer 64 36
line 1726
;1716:
;1717:
;1718:#define	MAX_LAGOMETER_PING	900
;1719:#define	MAX_LAGOMETER_RANGE	300
;1720:
;1721:/*
;1722:==============
;1723:CG_DrawLagometer
;1724:==============
;1725:*/
;1726:static void CG_DrawLagometer( void ) {
line 1734
;1727:	int		a, x, y, i;
;1728:	float	v;
;1729:	float	ax, ay, aw, ah, mid, range;
;1730:	int		color;
;1731:	float	vscale;
;1732:
;1733://unlagged - misc
;1734:	if ( !cg_lagometer.integer /* || cgs.localServer */) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
NEI4 $812
line 1736
;1735://unlagged - misc
;1736:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1737
;1737:		return;
ADDRGP4 $811
JUMPV
LABELV $812
line 1747
;1738:	}
;1739:
;1740:	//
;1741:	// draw the graph
;1742:	//
;1743:#ifdef MISSIONPACK
;1744:	x = 640 - 48;
;1745:	y = 480 - 144;
;1746:#else
;1747:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 1748
;1748:	y = 48;//480 - 48; // Shafe - Changed
ADDRLP4 48
CNSTI4 48
ASGNI4
line 1751
;1749:#endif
;1750:
;1751:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1752
;1752:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
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
ADDRGP4 cgs+153876+276
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1754
;1753:
;1754:	ax = x;
ADDRLP4 24
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1755
;1755:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1756
;1756:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1757
;1757:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1758
;1758:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
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
line 1760
;1759:
;1760:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1761
;1761:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1762
;1762:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1764
;1763:
;1764:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 1767
;1765:
;1766:	// draw the frame interpoalte / extrapolate graph
;1767:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $820
JUMPV
LABELV $817
line 1768
;1768:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
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
line 1769
;1769:		v = lagometer.frameSamples[i];
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
line 1770
;1770:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1771
;1771:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $822
line 1772
;1772:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $824
line 1773
;1773:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1774
;1774:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1775
;1775:			}
LABELV $824
line 1776
;1776:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $827
line 1777
;1777:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1778
;1778:			}
LABELV $827
line 1779
;1779:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+153876+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1780
;1780:		} else if ( v < 0 ) {
ADDRGP4 $823
JUMPV
LABELV $822
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $831
line 1781
;1781:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $833
line 1782
;1782:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1783
;1783:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1784
;1784:			}
LABELV $833
line 1785
;1785:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1786
;1786:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $836
line 1787
;1787:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1788
;1788:			}
LABELV $836
line 1789
;1789:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+153876+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1790
;1790:		}
LABELV $831
LABELV $823
line 1791
;1791:	}
LABELV $818
line 1767
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $820
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $817
line 1794
;1792:
;1793:	// draw the snapshot latency / drop graph
;1794:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1795
;1795:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1797
;1796:
;1797:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $843
JUMPV
LABELV $840
line 1798
;1798:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
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
line 1799
;1799:		v = lagometer.snapshotSamples[i];
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
line 1800
;1800:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $846
line 1801
;1801:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
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
EQI4 $848
line 1802
;1802:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $849
line 1803
;1803:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1804
;1804:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1805
;1805:				}
line 1806
;1806:			} else {
ADDRGP4 $849
JUMPV
LABELV $848
line 1807
;1807:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $854
line 1808
;1808:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1809
;1809:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1810
;1810:				}
LABELV $854
line 1811
;1811:			}
LABELV $849
line 1812
;1812:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1813
;1813:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $857
line 1814
;1814:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1815
;1815:			}
LABELV $857
line 1816
;1816:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+153876+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1817
;1817:		} else if ( v < 0 ) {
ADDRGP4 $847
JUMPV
LABELV $846
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $861
line 1818
;1818:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $863
line 1819
;1819:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1820
;1820:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1821
;1821:			}
LABELV $863
line 1822
;1822:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+153876+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1823
;1823:		}
LABELV $861
LABELV $847
line 1824
;1824:	}
LABELV $841
line 1797
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $843
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $840
line 1826
;1825:
;1826:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1828
;1827:
;1828:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $872
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $868
LABELV $872
line 1829
;1829:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $873
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1830
;1830:	}
LABELV $868
line 1832
;1831:
;1832:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1833
;1833:}
LABELV $811
endproc CG_DrawLagometer 64 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1854
;1834:
;1835:
;1836:
;1837:/*
;1838:===============================================================================
;1839:
;1840:CENTER PRINTING
;1841:
;1842:===============================================================================
;1843:*/
;1844:
;1845:
;1846:/*
;1847:==============
;1848:CG_CenterPrint
;1849:
;1850:Called for important messages that should stay in the center of the screen
;1851:for a few moments
;1852:==============
;1853:*/
;1854:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 1857
;1855:	char	*s;
;1856:
;1857:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
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
line 1859
;1858:
;1859:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+125420
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1860
;1860:	cg.centerPrintY = y;
ADDRGP4 cg+125428
ADDRFP4 4
INDIRI4
ASGNI4
line 1861
;1861:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+125424
ADDRFP4 8
INDIRI4
ASGNI4
line 1864
;1862:
;1863:	// count the number of lines for centering
;1864:	cg.centerPrintLines = 1;
ADDRGP4 cg+126456
CNSTI4 1
ASGNI4
line 1865
;1865:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
ADDRGP4 $884
JUMPV
LABELV $883
line 1866
;1866:	while( *s ) {
line 1867
;1867:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $886
line 1868
;1868:			cg.centerPrintLines++;
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
LABELV $886
line 1869
;1869:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1870
;1870:	}
LABELV $884
line 1866
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $883
line 1871
;1871:}
LABELV $874
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1064 36
line 1879
;1872:
;1873:
;1874:/*
;1875:===================
;1876:CG_DrawCenterString
;1877:===================
;1878:*/
;1879:static void CG_DrawCenterString( void ) {
line 1888
;1880:	char	*start;
;1881:	int		l;
;1882:	int		x, y, w;
;1883:#ifdef MISSIONPACK // bk010221 - unused else
;1884:  int h;
;1885:#endif
;1886:	float	*color;
;1887:
;1888:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+125420
INDIRI4
CNSTI4 0
NEI4 $890
line 1889
;1889:		return;
ADDRGP4 $889
JUMPV
LABELV $890
line 1892
;1890:	}
;1891:
;1892:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
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
line 1893
;1893:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $895
line 1894
;1894:		return;
ADDRGP4 $889
JUMPV
LABELV $895
line 1897
;1895:	}
;1896:
;1897:	trap_R_SetColor( color );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1899
;1898:
;1899:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
line 1901
;1900:
;1901:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
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
ADDRGP4 $901
JUMPV
LABELV $900
line 1903
;1902:
;1903:	while ( 1 ) {
line 1906
;1904:		char linebuffer[1024];
;1905:
;1906:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $903
line 1907
;1907:			if ( !start[l] || start[l] == '\n' ) {
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
EQI4 $909
ADDRLP4 1052
INDIRI4
CNSTI4 10
NEI4 $907
LABELV $909
line 1908
;1908:				break;
ADDRGP4 $905
JUMPV
LABELV $907
line 1910
;1909:			}
;1910:			linebuffer[l] = start[l];
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
line 1911
;1911:		}
LABELV $904
line 1906
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $903
LABELV $905
line 1912
;1912:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 1921
;1913:
;1914:#ifdef MISSIONPACK
;1915:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1916:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1917:		x = (SCREEN_WIDTH - w) / 2;
;1918:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1919:		y += h + 6;
;1920:#else
;1921:		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );
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
line 1923
;1922:
;1923:		x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1925
;1924:
;1925:		CG_DrawStringExt( x, y, linebuffer, color, qfalse, qtrue,
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
line 1928
;1926:			cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
;1927:
;1928:		y += cg.centerPrintCharWidth * 1.5;
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
ADDRGP4 $915
JUMPV
LABELV $914
line 1930
;1929:#endif
;1930:		while ( *start && ( *start != '\n' ) ) {
line 1931
;1931:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1932
;1932:		}
LABELV $915
line 1930
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $917
ADDRLP4 1060
INDIRI4
CNSTI4 10
NEI4 $914
LABELV $917
line 1933
;1933:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $918
line 1934
;1934:			break;
ADDRGP4 $902
JUMPV
LABELV $918
line 1936
;1935:		}
;1936:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1937
;1937:	}
LABELV $901
line 1903
ADDRGP4 $900
JUMPV
LABELV $902
line 1939
;1938:
;1939:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1940
;1940:}
LABELV $889
endproc CG_DrawCenterString 1064 36
proc CG_DrawCrosshair 56 36
line 1958
;1941:
;1942:
;1943:
;1944:/*
;1945:================================================================================
;1946:
;1947:CROSSHAIR
;1948:
;1949:================================================================================
;1950:*/
;1951:
;1952:
;1953:/*
;1954:=================
;1955:CG_DrawCrosshair
;1956:=================
;1957:*/
;1958:static void CG_DrawCrosshair(void) {
line 1965
;1959:	float		w, h;
;1960:	qhandle_t	hShader;
;1961:	float		f;
;1962:	float		x, y;
;1963:	int			ca;
;1964:
;1965:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $921
line 1966
;1966:		return;
ADDRGP4 $920
JUMPV
LABELV $921
line 1969
;1967:	}
;1968:
;1969:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $924
line 1970
;1970:		return;
ADDRGP4 $920
JUMPV
LABELV $924
line 1973
;1971:	}
;1972:
;1973:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $927
line 1974
;1974:		return;
ADDRGP4 $920
JUMPV
LABELV $927
line 1978
;1975:	}
;1976:
;1977:	// set color based on health
;1978:	if ( cg_crosshairHealth.integer ) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $930
line 1981
;1979:		vec4_t		hcolor;
;1980:
;1981:		CG_ColorForHealth( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 1982
;1982:		trap_R_SetColor( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1983
;1983:	} else {
ADDRGP4 $931
JUMPV
LABELV $930
line 1984
;1984:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1985
;1985:	}
LABELV $931
line 1987
;1986:
;1987:	w = h = cg_crosshairSize.value;
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
line 1990
;1988:
;1989:	// pulse the size of the crosshair when picking up items
;1990:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126740
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1991
;1991:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $936
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $936
line 1992
;1992:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 1993
;1993:		w *= ( 1 + f );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1994
;1994:		h *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1995
;1995:	}
LABELV $936
line 1997
;1996:
;1997:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 1998
;1998:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 1999
;1999:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 2001
;2000:
;2001:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2002
;2002:	if (ca < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $941
line 2003
;2003:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2004
;2004:	}
LABELV $941
line 2005
;2005:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+153876+236
ADDP4
INDIRI4
ASGNI4
line 2007
;2006:
;2007:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w), 
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
line 2010
;2008:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h), 
;2009:		w, h, 0, 0, 1, 1, hShader );
;2010:}
LABELV $920
endproc CG_DrawCrosshair 56 36
proc CG_ScanForCrosshairEntity 92 28
line 2019
;2011:
;2012:
;2013:
;2014:/*
;2015:=================
;2016:CG_ScanForCrosshairEntity
;2017:=================
;2018:*/
;2019:static void CG_ScanForCrosshairEntity( void ) {
line 2024
;2020:	trace_t		trace;
;2021:	vec3_t		start, end;
;2022:	int			content;
;2023:
;2024:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 0
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2025
;2025:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 84
CNSTF4 1207959552
ASGNF4
ADDRLP4 68
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRF4
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 84
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
line 2027
;2026:
;2027:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
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
line 2044
;2028:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2029:	/*
;2030:	if ( trace.entityNum >= MAX_CLIENTS ) {
;2031:		return;
;2032:	}
;2033:	*/
;2034:
;2035:	// if the player is in fog, don't show it
;2036:	/*
;2037:	content = trap_CM_PointContents( trace.endpos, 0 );
;2038:	if ( content & CONTENTS_FOG ) {
;2039:		return;
;2040:	}
;2041:	*/
;2042:
;2043:	// if the player is invisible, don't show it
;2044:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
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
EQI4 $968
line 2045
;2045:		return;
ADDRGP4 $952
JUMPV
LABELV $968
line 2049
;2046:	}
;2047:
;2048:	// Shafe - Trep Crosshairhealth Fix
;2049:	if ( cg_entities[ trace.entityNum ].currentState.eType != ET_PLAYER ) {
CNSTI4 740
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $972
line 2050
;2050:		return;
ADDRGP4 $952
JUMPV
LABELV $972
line 2056
;2051:	}
;2052:
;2053:
;2054:
;2055:	// update the fade timer
;2056:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+126468
ADDRLP4 12+52
INDIRI4
ASGNI4
line 2057
;2057:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+126472
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2058
;2058:}
LABELV $952
endproc CG_ScanForCrosshairEntity 92 28
proc CG_DrawCrosshairNames 36 16
line 2066
;2059:
;2060:
;2061:/*
;2062:=====================
;2063:CG_DrawCrosshairNames
;2064:=====================
;2065:*/
;2066:static void CG_DrawCrosshairNames( void ) {
line 2073
;2067:	float		*color;
;2068:	char		*name;
;2069:	char		*s;
;2070:	int			health;
;2071:	float		w;
;2072:
;2073:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $981
line 2074
;2074:		return;
ADDRGP4 $980
JUMPV
LABELV $981
line 2076
;2075:	}
;2076:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $984
line 2077
;2077:		return;
ADDRGP4 $980
JUMPV
LABELV $984
line 2079
;2078:	}
;2079:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $987
line 2080
;2080:		return;
ADDRGP4 $980
JUMPV
LABELV $987
line 2085
;2081:	}
;2082:
;2083:	// scan the known entities to see if the crosshair is sighted on one
;2084:
;2085:		CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2088
;2086:
;2087:	// draw the name of the player being looked at
;2088:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
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
line 2089
;2089:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $991
line 2090
;2090:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2091
;2091:		return;
ADDRGP4 $980
JUMPV
LABELV $991
line 2095
;2092:	}
;2093:
;2094:	
;2095:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
CNSTI4 1732
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ASGNP4
line 2096
;2096:	health = cgs.clientinfo[ cg.crosshairClientNum ].health;
ADDRLP4 8
CNSTI4 1732
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+108
ADDP4
INDIRI4
ASGNI4
line 2103
;2097:
;2098:#ifdef MISSIONPACK
;2099:	color[3] *= 0.5f;
;2100:	w = CG_Text_Width(name, 0.3f, 0);
;2101:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2102:#else
;2103:	w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
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
line 2104
;2104:	CG_DrawBigString( 320 - w / 2, 170, name, color[3] * 0.5f );
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
line 2105
;2105:	s = va( "%i", health);
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
line 2111
;2106:
;2107:
;2108:	// Shafe - Trep - Draw Players Health
;2109:
;2110:
;2111:	if (health != 0) 
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $999
line 2112
;2112:	{
line 2113
;2113:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2114
;2114:		CG_DrawSmallString( 320 - w / 2, 190, s, color[3] * 0.5f );
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
line 2115
;2115:	}
LABELV $999
line 2119
;2116:
;2117:
;2118:#endif
;2119:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2120
;2120:}
LABELV $980
endproc CG_DrawCrosshairNames 36 16
proc CG_DrawSpectator 0 16
line 2130
;2121:
;2122:
;2123://==============================================================================
;2124:
;2125:/*
;2126:=================
;2127:CG_DrawSpectator
;2128:=================
;2129:*/
;2130:static void CG_DrawSpectator(void) {
line 2131
;2131:	CG_DrawBigString(320 - 9 * 8, 440, "SPECTATOR", 1.0F);
CNSTI4 248
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $1002
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2132
;2132:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $1003
line 2133
;2133:		CG_DrawBigString(320 - 15 * 8, 460, "waiting to play", 1.0F);
CNSTI4 200
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $1006
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2134
;2134:	}
ADDRGP4 $1004
JUMPV
LABELV $1003
line 2135
;2135:	else if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $1007
line 2136
;2136:		CG_DrawBigString(320 - 39 * 8, 460, "press ESC and use the JOIN menu to play", 1.0F);
CNSTI4 8
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $1010
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2137
;2137:	}
LABELV $1007
LABELV $1004
line 2138
;2138:}
LABELV $1001
endproc CG_DrawSpectator 0 16
proc CG_DrawVote 12 20
line 2145
;2139:
;2140:/*
;2141:=================
;2142:CG_DrawVote
;2143:=================
;2144:*/
;2145:static void CG_DrawVote(void) {
line 2149
;2146:	char	*s;
;2147:	int		sec;
;2148:
;2149:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31676
INDIRI4
CNSTI4 0
NEI4 $1012
line 2150
;2150:		return;
ADDRGP4 $1011
JUMPV
LABELV $1012
line 2154
;2151:	}
;2152:
;2153:	// play a talk beep whenever it is modified
;2154:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31688
INDIRI4
CNSTI4 0
EQI4 $1015
line 2155
;2155:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31688
CNSTI4 0
ASGNI4
line 2156
;2156:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+153876+788
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2157
;2157:	}
LABELV $1015
line 2159
;2158:
;2159:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
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
line 2160
;2160:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1023
line 2161
;2161:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2162
;2162:	}
LABELV $1023
line 2169
;2163:#ifdef MISSIONPACK
;2164:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2165:	CG_DrawSmallString( 0, 58, s, 1.0F );
;2166:	s = "or press ESC then click Vote";
;2167:	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
;2168:#else
;2169:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
ADDRGP4 $1025
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
line 2170
;2170:	CG_DrawSmallString( 0, 58, s, 1.0F );
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
line 2172
;2171:#endif
;2172:}
LABELV $1011
endproc CG_DrawVote 12 20
proc CG_DrawTeamVote 24 20
line 2179
;2173:
;2174:/*
;2175:=================
;2176:CG_DrawTeamVote
;2177:=================
;2178:*/
;2179:static void CG_DrawTeamVote(void) {
line 2183
;2180:	char	*s;
;2181:	int		sec, cs_offset;
;2182:
;2183:	if ( cgs.clientinfo->team == TEAM_RED )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 1
NEI4 $1030
line 2184
;2184:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1031
JUMPV
LABELV $1030
line 2185
;2185:	else if ( cgs.clientinfo->team == TEAM_BLUE )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 2
NEI4 $1029
line 2186
;2186:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2188
;2187:	else
;2188:		return;
LABELV $1035
LABELV $1031
line 2190
;2189:
;2190:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1038
line 2191
;2191:		return;
ADDRGP4 $1029
JUMPV
LABELV $1038
line 2195
;2192:	}
;2193:
;2194:	// play a talk beep whenever it is modified
;2195:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1041
line 2196
;2196:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
CNSTI4 0
ASGNI4
line 2197
;2197:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+153876+788
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2198
;2198:	}
LABELV $1041
line 2200
;2199:
;2200:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
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
line 2201
;2201:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1049
line 2202
;2202:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2203
;2203:	}
LABELV $1049
line 2204
;2204:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1051
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
line 2206
;2205:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2206:	CG_DrawSmallString( 0, 90, s, 1.0F );
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
line 2207
;2207:}
LABELV $1029
endproc CG_DrawTeamVote 24 20
proc CG_DrawScoreboard 4 0
line 2210
;2208:
;2209:
;2210:static qboolean CG_DrawScoreboard() {
line 2275
;2211:#ifdef MISSIONPACK
;2212:	static qboolean firstTime = qtrue;
;2213:	float fade, *fadeColor;
;2214:
;2215:	if (menuScoreboard) {
;2216:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2217:	}
;2218:	if (cg_paused.integer) {
;2219:		cg.deferredPlayerLoading = 0;
;2220:		firstTime = qtrue;
;2221:		return qfalse;
;2222:	}
;2223:
;2224:	// should never happen in Team Arena
;2225:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2226:		cg.deferredPlayerLoading = 0;
;2227:		firstTime = qtrue;
;2228:		return qfalse;
;2229:	}
;2230:
;2231:	// don't draw scoreboard during death while warmup up
;2232:	if ( cg.warmup && !cg.showScores ) {
;2233:		return qfalse;
;2234:	}
;2235:
;2236:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2237:		fade = 1.0;
;2238:		fadeColor = colorWhite;
;2239:	} else {
;2240:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;2241:		if ( !fadeColor ) {
;2242:			// next time scoreboard comes up, don't print killer
;2243:			cg.deferredPlayerLoading = 0;
;2244:			cg.killerName[0] = 0;
;2245:			firstTime = qtrue;
;2246:			return qfalse;
;2247:		}
;2248:		fade = *fadeColor;
;2249:	}																					  
;2250:
;2251:
;2252:	if (menuScoreboard == NULL) {
;2253:		if ( cgs.gametype >= GT_TEAM ) {
;2254:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2255:		} else {
;2256:			menuScoreboard = Menus_FindByName("score_menu");
;2257:		}
;2258:	}
;2259:
;2260:	if (menuScoreboard) {
;2261:		if (firstTime) {
;2262:			CG_SetScoreSelection(menuScoreboard);
;2263:			firstTime = qfalse;
;2264:		}
;2265:		Menu_Paint(menuScoreboard, qtrue);
;2266:	}
;2267:
;2268:	// load any models that have been deferred
;2269:	if ( ++cg.deferredPlayerLoading > 10 ) {
;2270:		CG_LoadDeferredPlayers();
;2271:	}
;2272:
;2273:	return qtrue;
;2274:#else
;2275:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1055
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2284
;2276:#endif
;2277:}
;2278:
;2279:/*
;2280:=================
;2281:CG_DrawIntermission
;2282:=================
;2283:*/
;2284:static void CG_DrawIntermission( void ) {
line 2292
;2285://	int key;
;2286:#ifdef MISSIONPACK
;2287:	//if (cg_singlePlayer.integer) {
;2288:	//	CG_DrawCenterString();
;2289:	//	return;
;2290:	//}
;2291:#else
;2292:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 2
NEI4 $1057
line 2293
;2293:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2294
;2294:		return;
ADDRGP4 $1056
JUMPV
LABELV $1057
line 2297
;2295:	}
;2296:#endif
;2297:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+116396
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2298
;2298:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 0
INDIRI4
ASGNI4
line 2299
;2299:}
LABELV $1056
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 32 36
line 2306
;2300:
;2301:/*
;2302:=================
;2303:CG_DrawFollow
;2304:=================
;2305:*/
;2306:static qboolean CG_DrawFollow( void ) {
line 2311
;2307:	float		x;
;2308:	vec4_t		color;
;2309:	const char	*name;
;2310:
;2311:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1064
line 2312
;2312:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1063
JUMPV
LABELV $1064
line 2314
;2313:	}
;2314:	color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2315
;2315:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2316
;2316:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2317
;2317:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2320
;2318:
;2319:
;2320:	CG_DrawBigString( 320 - 9 * 8, 24, "following", 1.0F );
CNSTI4 248
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 $1070
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2322
;2321:
;2322:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 16
CNSTI4 1732
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ASGNP4
line 2324
;2323:
;2324:	x = 0.5 * ( 640 - GIANT_WIDTH * CG_DrawStrlen( name ) );
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
line 2326
;2325:
;2326:	CG_DrawStringExt( x, 40, name, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
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
line 2328
;2327:
;2328:	return qtrue;
CNSTI4 1
RETI4
LABELV $1063
endproc CG_DrawFollow 32 36
proc CG_DrawAmmoWarning 12 16
line 2338
;2329:}
;2330:
;2331:
;2332:
;2333:/*
;2334:=================
;2335:CG_DrawAmmoWarning
;2336:=================
;2337:*/
;2338:static void CG_DrawAmmoWarning( void ) {
line 2342
;2339:	const char	*s;
;2340:	int			w;
;2341:
;2342:	if ( cg_drawAmmoWarning.integer == 0 ) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1075
line 2343
;2343:		return;
ADDRGP4 $1074
JUMPV
LABELV $1075
line 2346
;2344:	}
;2345:
;2346:	if ( !cg.lowAmmoWarning ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 0
NEI4 $1078
line 2347
;2347:		return;
ADDRGP4 $1074
JUMPV
LABELV $1078
line 2350
;2348:	}
;2349:
;2350:	if ( cg.lowAmmoWarning == 2 ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 2
NEI4 $1081
line 2351
;2351:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1084
ASGNP4
line 2352
;2352:	} else {
ADDRGP4 $1082
JUMPV
LABELV $1081
line 2353
;2353:		s = "LOW AMMO WARNING";
ADDRLP4 0
ADDRGP4 $1085
ASGNP4
line 2354
;2354:	}
LABELV $1082
line 2355
;2355:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2356
;2356:	CG_DrawSmallString(320 - w / 2, 64, s, 1.0F);
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
line 2357
;2357:}
LABELV $1074
endproc CG_DrawAmmoWarning 12 16
proc CG_DrawWarmup 56 36
line 2406
;2358:
;2359:
;2360:#ifdef MISSIONPACK
;2361:/*
;2362:=================
;2363:CG_DrawProxWarning
;2364:=================
;2365:*/
;2366:static void CG_DrawProxWarning( void ) {
;2367:	char s [32];
;2368:	int			w;
;2369:  static int proxTime;
;2370:  static int proxCounter;
;2371:  static int proxTick;
;2372:
;2373:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;2374:    proxTime = 0;
;2375:		return;
;2376:	}
;2377:
;2378:  if (proxTime == 0) {
;2379:    proxTime = cg.time + 5000;
;2380:    proxCounter = 5;
;2381:    proxTick = 0;
;2382:  }
;2383:
;2384:  if (cg.time > proxTime) {
;2385:    proxTick = proxCounter--;
;2386:    proxTime = cg.time + 1000;
;2387:  }
;2388:
;2389:  if (proxTick != 0) {
;2390:    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
;2391:  } else {
;2392:    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
;2393:  }
;2394:
;2395:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;2396:	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
;2397:}
;2398:#endif
;2399:
;2400:
;2401:/*
;2402:=================
;2403:CG_DrawWarmup
;2404:=================
;2405:*/
;2406:static void CG_DrawWarmup( void ) {
line 2415
;2407:	int			w;
;2408:	int			sec;
;2409:	int			i;
;2410:	float scale;
;2411:	clientInfo_t	*ci1, *ci2;
;2412:	int			cw;
;2413:	const char	*s;
;2414:
;2415:	sec = cg.warmup;
ADDRLP4 4
ADDRGP4 cg+126724
INDIRI4
ASGNI4
line 2416
;2416:	if ( !sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1088
line 2417
;2417:		return;
ADDRGP4 $1086
JUMPV
LABELV $1088
line 2420
;2418:	}
;2419:
;2420:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1090
line 2421
;2421:		s = "Waiting for players";		
ADDRLP4 8
ADDRGP4 $1092
ASGNP4
line 2422
;2422:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2423
;2423:		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
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
line 2424
;2424:		cg.warmupCount = 0;
ADDRGP4 cg+126728
CNSTI4 0
ASGNI4
line 2425
;2425:		return;
ADDRGP4 $1086
JUMPV
LABELV $1090
line 2428
;2426:	}
;2427:
;2428:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $1094
line 2430
;2429:		// find the two active players
;2430:		ci1 = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 2431
;2431:		ci2 = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 2432
;2432:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1100
JUMPV
LABELV $1097
line 2433
;2433:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 32
CNSTI4 1732
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
EQI4 $1102
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1102
line 2434
;2434:				if ( !ci1 ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1107
line 2435
;2435:					ci1 = &cgs.clientinfo[i];
ADDRLP4 20
CNSTI4 1732
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2436
;2436:				} else {
ADDRGP4 $1108
JUMPV
LABELV $1107
line 2437
;2437:					ci2 = &cgs.clientinfo[i];
ADDRLP4 24
CNSTI4 1732
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2438
;2438:				}
LABELV $1108
line 2439
;2439:			}
LABELV $1102
line 2440
;2440:		}
LABELV $1098
line 2432
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1100
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $1097
line 2442
;2441:
;2442:		if ( ci1 && ci2 ) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1095
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1095
line 2443
;2443:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1113
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
line 2448
;2444:#ifdef MISSIONPACK
;2445:			w = CG_Text_Width(s, 0.6f, 0);
;2446:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2447:#else
;2448:			w = CG_DrawStrlen( s );
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
line 2449
;2449:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1114
line 2450
;2450:				cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2451
;2451:			} else {
ADDRGP4 $1115
JUMPV
LABELV $1114
line 2452
;2452:				cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2453
;2453:			}
LABELV $1115
line 2454
;2454:			CG_DrawStringExt( 320 - w * cw/2, 20,s, colorWhite, 
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
line 2458
;2455:					qfalse, qtrue, cw, (int)(cw * 1.5f), 0 );
;2456:			
;2457:#endif
;2458:		}
line 2459
;2459:	} else {
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2460
;2460:		if ( cgs.g_GameMode == 1) {
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 1
NEI4 $1116
line 2461
;2461:			s = "Arsenal";
ADDRLP4 8
ADDRGP4 $1119
ASGNP4
line 2462
;2462:		} else if ( cgs.gametype == GT_FFA && cgs.g_GameMode == 0) {
ADDRGP4 $1117
JUMPV
LABELV $1116
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1120
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1120
line 2463
;2463:			s = "Free For All";
ADDRLP4 8
ADDRGP4 $1124
ASGNP4
line 2464
;2464:		} else if ( cgs.g_GameMode == 2) {
ADDRGP4 $1121
JUMPV
LABELV $1120
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 2
NEI4 $1125
line 2465
;2465:			s = "Survival";
ADDRLP4 8
ADDRGP4 $1128
ASGNP4
line 2466
;2466:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $1126
JUMPV
LABELV $1125
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
NEI4 $1129
line 2467
;2467:			if ( cgs.g_GameMode == 3) 
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 3
NEI4 $1132
line 2468
;2468:			{
line 2469
;2469:				s = "Trepidation";
ADDRLP4 8
ADDRGP4 $1135
ASGNP4
line 2470
;2470:			} else if ( cgs.g_GameMode == 2) 
ADDRGP4 $1130
JUMPV
LABELV $1132
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 2
NEI4 $1136
line 2471
;2471:			{
line 2472
;2472:				s = "Team Survival";
ADDRLP4 8
ADDRGP4 $1139
ASGNP4
line 2473
;2473:			} else {
ADDRGP4 $1130
JUMPV
LABELV $1136
line 2475
;2474:				
;2475:				s = "Team Deathmatch";
ADDRLP4 8
ADDRGP4 $1140
ASGNP4
line 2476
;2476:			}
line 2477
;2477:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $1130
JUMPV
LABELV $1129
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $1141
line 2478
;2478:			s = "Capture the Flag";
ADDRLP4 8
ADDRGP4 $1144
ASGNP4
line 2487
;2479:#ifdef MISSIONPACK
;2480:		} else if ( cgs.gametype == GT_1FCTF ) {
;2481:			s = "One Flag CTF";
;2482:		} else if ( cgs.gametype == GT_OBELISK ) {
;2483:			s = "Overload";
;2484:		} else if ( cgs.gametype == GT_HARVESTER ) {
;2485:			s = "Harvester";
;2486:#endif
;2487:		} else {
ADDRGP4 $1142
JUMPV
LABELV $1141
line 2488
;2488:			s = "";
ADDRLP4 8
ADDRGP4 $1145
ASGNP4
line 2489
;2489:		}
LABELV $1142
LABELV $1130
LABELV $1126
LABELV $1121
LABELV $1117
line 2494
;2490:#ifdef MISSIONPACK
;2491:		w = CG_Text_Width(s, 0.6f, 0);
;2492:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2493:#else
;2494:		w = CG_DrawStrlen( s );
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
line 2495
;2495:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1146
line 2496
;2496:			cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2497
;2497:		} else {
ADDRGP4 $1147
JUMPV
LABELV $1146
line 2498
;2498:			cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2499
;2499:		}
LABELV $1147
line 2500
;2500:		CG_DrawStringExt( 320 - w * cw/2, 25,s, colorWhite, 
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
line 2503
;2501:				qfalse, qtrue, cw, (int)(cw * 1.1f), 0 );
;2502:#endif
;2503:	}
LABELV $1095
line 2505
;2504:
;2505:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2506
;2506:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1149
line 2507
;2507:		cg.warmup = 0;
ADDRGP4 cg+126724
CNSTI4 0
ASGNI4
line 2508
;2508:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2509
;2509:	}
LABELV $1149
line 2511
;2510:	
;2511:	if(cgs.g_GameMode == 1)
ADDRGP4 cgs+154992
INDIRI4
CNSTI4 1
NEI4 $1152
line 2512
;2512:	{
line 2513
;2513:		s = va( "You Have %i Seconds To Join This Round", sec + 1 );
ADDRGP4 $1155
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
line 2514
;2514:	} else
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2515
;2515:	{
line 2516
;2516:		s = va( "Starts in: %i", sec + 1 );
ADDRGP4 $1156
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
line 2517
;2517:	}
LABELV $1153
line 2520
;2518:	
;2519:
;2520:	if ( sec != cg.warmupCount ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+126728
INDIRI4
EQI4 $1157
line 2521
;2521:		cg.warmupCount = sec;
ADDRGP4 cg+126728
ADDRLP4 4
INDIRI4
ASGNI4
line 2522
;2522:		switch ( sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1163
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1166
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1169
ADDRGP4 $1162
JUMPV
LABELV $1163
line 2524
;2523:		case 0:
;2524:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1024
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2525
;2525:			break;
ADDRGP4 $1162
JUMPV
LABELV $1166
line 2527
;2526:		case 1:
;2527:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1020
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2528
;2528:			break;
ADDRGP4 $1162
JUMPV
LABELV $1169
line 2530
;2529:		case 2:
;2530:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2531
;2531:			break;
line 2533
;2532:		default:
;2533:			break;
LABELV $1162
line 2535
;2534:		}
;2535:	}
LABELV $1157
line 2536
;2536:	scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2537
;2537:	switch ( cg.warmupCount ) {
ADDRLP4 32
ADDRGP4 cg+126728
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1175
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $1176
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $1177
ADDRGP4 $1172
JUMPV
LABELV $1175
line 2539
;2538:	case 0:
;2539:		cw = 28;
ADDRLP4 12
CNSTI4 28
ASGNI4
line 2540
;2540:		scale = 0.54f;
ADDRLP4 28
CNSTF4 1057635697
ASGNF4
line 2541
;2541:		break;
ADDRGP4 $1173
JUMPV
LABELV $1176
line 2543
;2542:	case 1:
;2543:		cw = 24;
ADDRLP4 12
CNSTI4 24
ASGNI4
line 2544
;2544:		scale = 0.51f;
ADDRLP4 28
CNSTF4 1057132380
ASGNF4
line 2545
;2545:		break;
ADDRGP4 $1173
JUMPV
LABELV $1177
line 2547
;2546:	case 2:
;2547:		cw = 20;
ADDRLP4 12
CNSTI4 20
ASGNI4
line 2548
;2548:		scale = 0.48f;
ADDRLP4 28
CNSTF4 1056293519
ASGNF4
line 2549
;2549:		break;
ADDRGP4 $1173
JUMPV
LABELV $1172
line 2551
;2550:	default:
;2551:		cw = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 2552
;2552:		scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2553
;2553:		break;
LABELV $1173
line 2560
;2554:	}
;2555:
;2556:#ifdef MISSIONPACK
;2557:		w = CG_Text_Width(s, scale, 0);
;2558:		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2559:#else
;2560:	w = CG_DrawStrlen( s );
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
line 2561
;2561:	CG_DrawStringExt( 320 - w * cw/2, 70, s, colorWhite, 
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
line 2564
;2562:			qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
;2563:#endif
;2564:}
LABELV $1086
endproc CG_DrawWarmup 56 36
proc CG_Draw2D 8 0
line 2589
;2565:
;2566://==================================================================================
;2567:#ifdef MISSIONPACK
;2568:/* 
;2569:=================
;2570:CG_DrawTimedMenus
;2571:=================
;2572:*/
;2573:void CG_DrawTimedMenus() {
;2574:	if (cg.voiceTime) {
;2575:		int t = cg.time - cg.voiceTime;
;2576:		if ( t > 2500 ) {
;2577:			Menus_CloseByName("voiceMenu");
;2578:			trap_Cvar_Set("cl_conXOffset", "0");
;2579:			cg.voiceTime = 0;
;2580:		}
;2581:	}
;2582:}
;2583:#endif
;2584:/*
;2585:=================
;2586:CG_Draw2D
;2587:=================
;2588:*/
;2589:static void CG_Draw2D( void ) {
line 2596
;2590:#ifdef MISSIONPACK
;2591:	if (cgs.orderPending && cg.time > cgs.orderTime) {
;2592:		CG_CheckOrderPending();
;2593:	}
;2594:#endif
;2595:	// if we are taking a levelshot for the menu, don't draw anything
;2596:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1179
line 2597
;2597:		return;
ADDRGP4 $1178
JUMPV
LABELV $1179
line 2600
;2598:	}
;2599:
;2600:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1182
line 2601
;2601:		return;
ADDRGP4 $1178
JUMPV
LABELV $1182
line 2604
;2602:	}
;2603:
;2604:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1185
line 2605
;2605:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2606
;2606:		return;
ADDRGP4 $1178
JUMPV
LABELV $1185
line 2614
;2607:	}
;2608:
;2609:/*
;2610:	if (cg.cameraMode) {
;2611:		return;
;2612:	}
;2613:*/
;2614:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1188
line 2615
;2615:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2616
;2616:		CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2617
;2617:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2618
;2618:	} else {
ADDRGP4 $1189
JUMPV
LABELV $1188
line 2620
;2619:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2620:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+116388
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1191
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1191
line 2628
;2621:
;2622:#ifdef MISSIONPACK
;2623:			if ( cg_drawStatus.integer ) {
;2624:				Menu_PaintAll();
;2625:				CG_DrawTimedMenus();
;2626:			}
;2627:#else
;2628:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2631
;2629:#endif
;2630:      
;2631:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2636
;2632:
;2633:#ifdef MISSIONPACK
;2634:			CG_DrawProxWarning();
;2635:#endif      
;2636:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2637
;2637:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2638
;2638:			CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2641
;2639:
;2640:#ifndef MISSIONPACK
;2641:			CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2645
;2642:#else
;2643:			//CG_DrawPersistantPowerup();
;2644:#endif
;2645:			CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2646
;2646:			CG_DrawScanner();  // Shafe - Trep - Radar
ADDRGP4 CG_DrawScanner
CALLV
pop
line 2647
;2647:		}
LABELV $1191
line 2649
;2648:    
;2649:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $1195
line 2651
;2650:#ifndef MISSIONPACK
;2651:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2653
;2652:#endif
;2653:		}
LABELV $1195
line 2654
;2654:	}
LABELV $1189
line 2656
;2655:
;2656:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2657
;2657:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2659
;2658:
;2659:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2666
;2660:
;2661:#ifdef MISSIONPACK
;2662:	if (!cg_paused.integer) {
;2663:		CG_DrawUpperRight();
;2664:	}
;2665:#else
;2666:	CG_DrawUpperRight();
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2670
;2667:#endif
;2668:
;2669:#ifndef MISSIONPACK
;2670:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2671
;2671:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2674
;2672:#endif
;2673:
;2674:	if ( !CG_DrawFollow() ) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1198
line 2675
;2675:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2676
;2676:	}
LABELV $1198
line 2679
;2677:
;2678:	// don't draw center string if scoreboard is up
;2679:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 4
INDIRI4
ASGNI4
line 2680
;2680:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+116392
INDIRI4
CNSTI4 0
NEI4 $1201
line 2681
;2681:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2682
;2682:	}
LABELV $1201
line 2683
;2683:}
LABELV $1178
endproc CG_Draw2D 8 0
proc CG_DrawTourneyScoreboard 0 0
line 2686
;2684:
;2685:
;2686:static void CG_DrawTourneyScoreboard() {
line 2689
;2687:#ifdef MISSIONPACK
;2688:#else
;2689:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2691
;2690:#endif
;2691:}
LABELV $1204
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 24 4
line 2700
;2692:
;2693:/*
;2694:=====================
;2695:CG_DrawActive
;2696:
;2697:Perform all drawing needed to completely fill the screen
;2698:=====================
;2699:*/
;2700:void CG_DrawActive( stereoFrame_t stereoView ) {
line 2705
;2701:	float		separation;
;2702:	vec3_t		baseOrg;
;2703:
;2704:	// optionally draw the info screen instead
;2705:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1206
line 2706
;2706:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2707
;2707:		return;
ADDRGP4 $1205
JUMPV
LABELV $1206
line 2711
;2708:	}
;2709:
;2710:	// optionally draw the tournement scoreboard instead
;2711:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1209
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1209
line 2712
;2712:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 2713
;2713:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2714
;2714:		return;
ADDRGP4 $1205
JUMPV
LABELV $1209
line 2717
;2715:	}
;2716:
;2717:	switch ( stereoView ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1216
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1217
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $1219
ADDRGP4 $1213
JUMPV
LABELV $1216
line 2719
;2718:	case STEREO_CENTER:
;2719:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2720
;2720:		break;
ADDRGP4 $1214
JUMPV
LABELV $1217
line 2722
;2721:	case STEREO_LEFT:
;2722:		separation = -cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2723
;2723:		break;
ADDRGP4 $1214
JUMPV
LABELV $1219
line 2725
;2724:	case STEREO_RIGHT:
;2725:		separation = cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2726
;2726:		break;
ADDRGP4 $1214
JUMPV
LABELV $1213
line 2728
;2727:	default:
;2728:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2729
;2729:		CG_Error( "CG_DrawActive: Undefined stereoView" );
ADDRGP4 $1221
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2730
;2730:	}
LABELV $1214
line 2734
;2731:
;2732:
;2733:	// clear around the rendered view if sized down
;2734:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2737
;2735:
;2736:	// offset vieworg appropriately if we're doing stereo separation
;2737:	VectorCopy( cg.refdef.vieworg, baseOrg );
ADDRLP4 4
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2738
;2738:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1224
line 2739
;2739:		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
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
line 2740
;2740:	}
LABELV $1224
line 2743
;2741:
;2742:	// draw 3D view
;2743:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+111104
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2746
;2744:
;2745:	// restore original viewpoint if running stereo
;2746:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1254
line 2747
;2747:		VectorCopy( baseOrg, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 4
INDIRB
ASGNB 12
line 2748
;2748:	}
LABELV $1254
line 2751
;2749:
;2750:	// draw status bar and other floating elements
;2751: 	CG_Draw2D();
ADDRGP4 CG_Draw2D
CALLV
pop
line 2752
;2752:}
LABELV $1205
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
LABELV $1221
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
LABELV $1156
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
LABELV $1155
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
LABELV $1145
byte 1 0
align 1
LABELV $1144
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
LABELV $1140
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
LABELV $1139
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
LABELV $1135
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
LABELV $1128
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
LABELV $1124
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
LABELV $1119
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1113
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
LABELV $1092
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
LABELV $1085
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 32
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1084
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
LABELV $1070
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
LABELV $1051
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
LABELV $1025
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
LABELV $1010
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
LABELV $1006
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
LABELV $1002
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
LABELV $873
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $810
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
LABELV $806
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
LABELV $775
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $514
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $466
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $463
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $396
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $392
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $376
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
LABELV $374
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 37
byte 1 105
byte 1 0
