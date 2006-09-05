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
line 561
;560:		// Shafe was ICON_SIZE instead of 32
;561:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32,
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
line 563
;562:					   cgs.media.armorModel, 0, origin, angles );
;563:	}
LABELV $305
line 581
;564:#ifdef MISSIONPACK
;565:	if( cgs.gametype == GT_HARVESTER ) {
;566:		origin[0] = 90;
;567:		origin[1] = 0;
;568:		origin[2] = -10;
;569:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;570:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;571:			handle = cgs.media.redCubeModel;
;572:		} else {
;573:			handle = cgs.media.blueCubeModel;
;574:		}
;575:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;576:	}
;577:#endif
;578:	//
;579:	// ammo
;580:	//
;581:	if ( cent->currentState.weapon ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
line 582
;582:		value = ps->ammo[cent->currentState.weapon];
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
line 583
;583:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $315
line 584
;584:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
ADDRGP4 cg+109684+148
INDIRI4
CNSTI4 3
NEI4 $317
ADDRGP4 cg+109684+44
INDIRI4
CNSTI4 100
LEI4 $317
line 585
;585:				&& cg.predictedPlayerState.weaponTime > 100 ) {
line 587
;586:				// draw as dark grey when reloading
;587:				color = 2;	// dark grey
ADDRLP4 52
CNSTI4 2
ASGNI4
line 588
;588:			} else {
ADDRGP4 $318
JUMPV
LABELV $317
line 589
;589:				if ( value >= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $323
line 590
;590:					color = 0;	// green
ADDRLP4 52
CNSTI4 0
ASGNI4
line 591
;591:				} else {
ADDRGP4 $324
JUMPV
LABELV $323
line 592
;592:					color = 1;	// red
ADDRLP4 52
CNSTI4 1
ASGNI4
line 593
;593:				}
LABELV $324
line 594
;594:			}
LABELV $318
line 595
;595:			trap_R_SetColor( colors[color] );
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
line 597
;596:			
;597:			CG_DrawField (0, 432, 3, value);
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
line 598
;598:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 601
;599:
;600:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;601:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
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
line 604
;602:				qhandle_t	icon;
;603:
;604:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 72
CNSTI4 136
ADDRGP4 cg+109684+144
INDIRI4
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 605
;605:				if ( icon ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $332
line 606
;606:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, icon );
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
line 607
;607:				}
LABELV $332
line 608
;608:			}
LABELV $325
line 609
;609:		}
LABELV $315
line 610
;610:	}
LABELV $313
line 615
;611:
;612:	//
;613:	// health
;614:	//
;615:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 616
;616:	if ( value > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $334
line 617
;617:		trap_R_SetColor( colors[3] );		// white
ADDRGP4 $273+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 618
;618:	} else if (value > 25) {
ADDRGP4 $335
JUMPV
LABELV $334
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $337
line 619
;619:		trap_R_SetColor( colors[0] );	// green
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 620
;620:	} else if (value > 0) {
ADDRGP4 $338
JUMPV
LABELV $337
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $339
line 621
;621:		color = (cg.time >> 8) & 1;	// flash
ADDRLP4 52
ADDRGP4 cg+109652
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 622
;622:		trap_R_SetColor( colors[color] );
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
line 623
;623:	} else {
ADDRGP4 $340
JUMPV
LABELV $339
line 624
;624:		trap_R_SetColor( colors[1] );	// red
ADDRGP4 $273+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 625
;625:	}
LABELV $340
LABELV $338
LABELV $335
line 628
;626:
;627:	// stretch the health up when taking damage
;628:	CG_DrawField ( 185, 432, 3, value);
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
line 629
;629:	CG_ColorForHealth( hcolor );
ADDRLP4 36
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 630
;630:	trap_R_SetColor( hcolor );
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 636
;631:
;632:
;633:	//
;634:	// armor
;635:	//
;636:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 637
;637:	if (value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $343
line 638
;638:		trap_R_SetColor( colors[0] );
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 639
;639:		CG_DrawField (370, 432, 3, value);
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
line 640
;640:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 642
;641:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;642:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
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
line 643
;643:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, 432, 32, 32, cgs.media.armorIcon );
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
line 644
;644:		}
LABELV $345
line 646
;645:
;646:	}
LABELV $343
line 670
;647:#ifdef MISSIONPACK
;648:	//
;649:	// cubes
;650:	//
;651:	if( cgs.gametype == GT_HARVESTER ) {
;652:		value = ps->generic1;
;653:		if( value > 99 ) {
;654:			value = 99;
;655:		}
;656:		trap_R_SetColor( colors[0] );
;657:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), 432, 2, value);
;658:		trap_R_SetColor( NULL );
;659:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;660:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;661:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;662:				handle = cgs.media.redCubeIcon;
;663:			} else {
;664:				handle = cgs.media.blueCubeIcon;
;665:			}
;666:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 432, ICON_SIZE, ICON_SIZE, handle );
;667:		}
;668:	}
;669:#endif
;670:}
LABELV $272
endproc CG_DrawStatusBar 80 32
proc CG_DrawAttacker 52 24
line 687
;671:#endif
;672:
;673:/*
;674:===========================================================================================
;675:
;676:  UPPER RIGHT CORNER
;677:
;678:===========================================================================================
;679:*/
;680:
;681:/*
;682:================
;683:CG_DrawAttacker
;684:
;685:================
;686:*/
;687:static float CG_DrawAttacker( float y ) {
line 695
;688:	int			t;
;689:	float		size;
;690:	vec3_t		angles;
;691:	const char	*info;
;692:	const char	*name;
;693:	int			clientNum;
;694:
;695:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+109684+184
INDIRI4
CNSTI4 0
GTI4 $352
line 696
;696:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $352
line 699
;697:	}
;698:
;699:	if ( !cg.attackerTime ) {
ADDRGP4 cg+126484
INDIRI4
CNSTI4 0
NEI4 $356
line 700
;700:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $356
line 703
;701:	}
;702:
;703:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+109684+248+24
INDIRI4
ASGNI4
line 704
;704:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
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
line 705
;705:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $362
line 708
;706:	}
;707:
;708:	t = cg.time - cg.attackerTime;
ADDRLP4 24
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126484
INDIRI4
SUBI4
ASGNI4
line 709
;709:	if ( t > ATTACKER_HEAD_TIME ) {
ADDRLP4 24
INDIRI4
CNSTI4 10000
LEI4 $369
line 710
;710:		cg.attackerTime = 0;
ADDRGP4 cg+126484
CNSTI4 0
ASGNI4
line 711
;711:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $351
JUMPV
LABELV $369
line 714
;712:	}
;713:
;714:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 716
;715:
;716:	angles[PITCH] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 717
;717:	angles[YAW] = 180;
ADDRLP4 8+4
CNSTF4 1127481344
ASGNF4
line 718
;718:	angles[ROLL] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 719
;719:	CG_DrawHead( 640 - size, y, size, size, clientNum, angles );
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
line 721
;720:
;721:	info = CG_ConfigString( CS_PLAYERS + clientNum );
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
line 722
;722:	name = Info_ValueForKey(  info, "n" );
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
line 723
;723:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 724
;724:	CG_DrawBigString( 640 - ( Q_PrintStrlen( name ) * BIGCHAR_WIDTH), y, name, 0.5 );
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
line 726
;725:
;726:	return y + BIGCHAR_HEIGHT + 2;
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
line 734
;727:}
;728:
;729:/*
;730:==================
;731:CG_DrawSnapshot
;732:==================
;733:*/
;734:static float CG_DrawSnapshot( float y ) {
line 738
;735:	char		*s;
;736:	int			w;
;737:
;738:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
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
line 740
;739:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;740:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 742
;741:
;742:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
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
line 744
;743:
;744:	return y + BIGCHAR_HEIGHT + 4;
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
line 753
;745:}
;746:
;747:/*
;748:==================
;749:CG_DrawFPS
;750:==================
;751:*/
;752:#define	FPS_FRAMES	4
;753:static float CG_DrawFPS( float y ) {
line 765
;754:	char		*s;
;755:	int			w;
;756:	static int	previousTimes[FPS_FRAMES];
;757:	static int	index;
;758:	int		i, total;
;759:	int		fps;
;760:	static	int	previous;
;761:	int		t, frameTime;
;762:
;763:	// don't use serverTime, because that will be drifting to
;764:	// correct for internet lag changes, timescales, timedemos, etc
;765:	t = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 766
;766:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $383
INDIRI4
SUBI4
ASGNI4
line 767
;767:	previous = t;
ADDRGP4 $383
ADDRLP4 8
INDIRI4
ASGNI4
line 769
;768:
;769:	previousTimes[index % FPS_FRAMES] = frameTime;
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
line 770
;770:	index++;
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
line 771
;771:	if ( index > FPS_FRAMES ) {
ADDRGP4 $382
INDIRI4
CNSTI4 4
LEI4 $384
line 773
;772:		// average multiple frames together to smooth changes out a bit
;773:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 774
;774:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $386
line 775
;775:			total += previousTimes[i];
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
line 776
;776:		}
LABELV $387
line 774
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
line 777
;777:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $390
line 778
;778:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 779
;779:		}
LABELV $390
line 780
;780:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 24
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 782
;781:
;782:		s = va( "%ifps", fps );
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
line 783
;783:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 786
;784:
;785:		//CG_DrawBigString( 50 - w, y + 2, s, 1.0F); // Shafe -  Drawfps 635
;786:		CG_DrawSmallString( 635 - w, y + 2, s, 1.0F);
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
line 787
;787:	}
LABELV $384
line 789
;788:
;789:	return y + BIGCHAR_HEIGHT + 4;
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
line 797
;790:}
;791:
;792:/*
;793:=================
;794:CG_DrawTimer
;795:=================
;796:*/
;797:static float CG_DrawTimer( float y ) {
line 803
;798:	char		*s;
;799:	int			w;
;800:	int			mins, seconds, tens;
;801:	int			msec;
;802:
;803:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+34796
INDIRI4
SUBI4
ASGNI4
line 805
;804:
;805:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 806
;806:	mins = seconds / 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 807
;807:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 8
INDIRI4
MULI4
SUBI4
ASGNI4
line 808
;808:	tens = seconds / 10;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 809
;809:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 811
;810:
;811:	s = va( "%i:%i%i", mins, tens, seconds );
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
line 812
;812:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 814
;813:
;814:	CG_DrawBigString( 635 - w, y + 2, s, 1.0F);
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
line 816
;815:
;816:	return y + BIGCHAR_HEIGHT + 4;
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
line 826
;817:}
;818:
;819:
;820:/*
;821:=================
;822:CG_DrawTeamOverlay
;823:=================
;824:*/
;825:
;826:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 838
;827:	int x, w, h, xx;
;828:	int i, j, len;
;829:	const char *p;
;830:	vec4_t		hcolor;
;831:	int pwidth, lwidth;
;832:	int plyrs;
;833:	char st[16];
;834:	clientInfo_t *ci;
;835:	gitem_t	*item;
;836:	int ret_y, count;
;837:
;838:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $398
line 839
;839:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $398
line 842
;840:	}
;841:
;842:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
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
line 843
;843:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $401
line 846
;844:	}
;845:
;846:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 849
;847:
;848:	// max player name width
;849:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 850
;850:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
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
line 851
;851:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $408
line 852
;852:		ci = cgs.clientinfo + sortedTeamPlayers[i];
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
line 853
;853:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
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
line 854
;854:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 855
;855:			len = CG_DrawStrlen(ci->name);
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
line 856
;856:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $416
line 857
;857:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $416
line 858
;858:		}
LABELV $413
line 859
;859:	}
LABELV $409
line 851
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
line 861
;860:
;861:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $418
line 862
;862:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $397
JUMPV
LABELV $418
line 864
;863:
;864:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $420
line 865
;865:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $420
line 868
;866:
;867:	// max location name width
;868:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 869
;869:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $422
line 870
;870:		p = CG_ConfigString(CS_LOCATIONS + i);
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
line 871
;871:		if (p && *p) {
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
line 872
;872:			len = CG_DrawStrlen(p);
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
line 873
;873:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $428
line 874
;874:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $428
line 875
;875:		}
LABELV $426
line 876
;876:	}
LABELV $423
line 869
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
line 878
;877:
;878:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $430
line 879
;879:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $430
line 881
;880:
;881:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
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
line 883
;882:
;883:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $432
line 884
;884:		x = 640 - w;
ADDRLP4 52
CNSTI4 640
ADDRLP4 80
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
line 886
;885:	else
;886:		x = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $433
line 888
;887:
;888:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 890
;889:
;890:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $434
line 891
;891:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 892
;892:	} else {
ADDRGP4 $435
JUMPV
LABELV $434
line 893
;893:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 894
;894:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 895
;895:	}
LABELV $435
line 897
;896:
;897:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $436
line 898
;898:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 899
;899:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 900
;900:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 901
;901:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 902
;902:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $437
JUMPV
LABELV $436
line 903
;903:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 904
;904:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 905
;905:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 906
;906:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 907
;907:	}
LABELV $437
line 908
;908:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 909
;909:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
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
line 910
;910:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 912
;911:
;912:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $447
line 913
;913:		ci = cgs.clientinfo + sortedTeamPlayers[i];
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
line 914
;914:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
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
line 916
;915:
;916:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
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
line 918
;917:
;918:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 920
;919:
;920:			CG_DrawStringExt( xx, y,
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
line 924
;921:				ci->name, hcolor, qfalse, qfalse,
;922:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;923:
;924:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $458
line 925
;925:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
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
line 926
;926:				if (!p || !*p)
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
line 927
;927:					p = "unknown";
ADDRLP4 20
ADDRGP4 $463
ASGNP4
LABELV $460
line 928
;928:				len = CG_DrawStrlen(p);
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
line 929
;929:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $464
line 930
;930:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $464
line 934
;931:
;932://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;933://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;934:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
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
line 935
;935:				CG_DrawStringExt( xx, y,
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
line 938
;936:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;937:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;938:			}
LABELV $458
line 940
;939:
;940:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
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
line 942
;941:
;942:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
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
line 944
;943:
;944:			xx = x + TINYCHAR_WIDTH * 3 + 
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
line 947
;945:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;946:
;947:			CG_DrawStringExt( xx, y,
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
line 952
;948:				st, hcolor, qfalse, qfalse,
;949:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;950:
;951:			// draw weapon icon
;952:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 954
;953:
;954:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
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
line 955
;955:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
line 957
;956:					cg_weapons[ci->curWeapon].weaponIcon );
;957:			} else {
ADDRGP4 $468
JUMPV
LABELV $467
line 958
;958:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
line 960
;959:					cgs.media.deferShader );
;960:			}
LABELV $468
line 963
;961:
;962:			// Draw powerup icons
;963:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $473
line 964
;964:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 965
;965:			} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 966
;966:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 967
;967:			}
LABELV $474
line 968
;968:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $475
line 969
;969:				if (ci->powerups & (1 << j)) {
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
line 971
;970:
;971:					item = BG_FindItemForPowerup( j );
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
line 973
;972:
;973:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
line 974
;974:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
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
line 976
;975:						trap_R_RegisterShader( item->icon ) );
;976:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $483
line 977
;977:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 978
;978:						} else {
ADDRGP4 $484
JUMPV
LABELV $483
line 979
;979:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 980
;980:						}
LABELV $484
line 981
;981:					}
LABELV $481
line 982
;982:				}
LABELV $479
line 983
;983:			}
LABELV $476
line 968
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
line 985
;984:
;985:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 986
;986:		}
LABELV $452
line 987
;987:	}
LABELV $448
line 912
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
line 990
;988:
;989:		
;990:	if (cgs.g_GameMode == 3) {
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 3
NEI4 $485
line 1003
;991:		/*
;992:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;993:
;994:			xx = x + TINYCHAR_WIDTH * 3 + 
;995:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;996:
;997:			CG_DrawStringExt( xx, y,
;998:				st, hcolor, qfalse, qfalse,
;999:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1000:
;1001:			y += TINYCHAR_HEIGHT;
;1002:			*/
;1003:	}
LABELV $485
line 1005
;1004:
;1005:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $397
endproc CG_DrawTeamOverlay 148 36
proc CG_DrawUpperRight 12 12
line 1016
;1006://#endif
;1007:}
;1008:
;1009:
;1010:/*
;1011:=====================
;1012:CG_DrawUpperRight
;1013:
;1014:=====================
;1015:*/
;1016:static void CG_DrawUpperRight( void ) {
line 1019
;1017:	float	y;
;1018:
;1019:	y = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1021
;1020:
;1021:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $489
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $489
line 1022
;1022:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
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
line 1023
;1023:	} 
LABELV $489
line 1024
;1024:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $493
line 1025
;1025:		y = CG_DrawSnapshot( y );
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
line 1026
;1026:	}
LABELV $493
line 1027
;1027:	if ( cg_drawFPS.integer ) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $496
line 1028
;1028:		y = CG_DrawFPS( y );
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
line 1029
;1029:	}
LABELV $496
line 1030
;1030:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $499
line 1031
;1031:		y = CG_DrawTimer( y );
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
line 1032
;1032:	}
LABELV $499
line 1033
;1033:	if ( cg_drawAttacker.integer ) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $502
line 1034
;1034:		y = CG_DrawAttacker( y );
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
line 1035
;1035:	}
LABELV $502
line 1037
;1036:
;1037:}
LABELV $488
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 76 20
line 1055
;1038:
;1039:/*
;1040:===========================================================================================
;1041:
;1042:  LOWER RIGHT CORNER
;1043:
;1044:===========================================================================================
;1045:*/
;1046:
;1047:/*
;1048:=================
;1049:CG_DrawScores
;1050:
;1051:Draw the small two score display
;1052:=================
;1053:*/
;1054:#ifndef MISSIONPACK
;1055:static float CG_DrawScores( float y ) {
line 1064
;1056:	const char	*s;
;1057:	int			s1, s2, score;
;1058:	int			x, w;
;1059:	int			v;
;1060:	vec4_t		color;
;1061:	float		y1;
;1062:	gitem_t		*item;
;1063:
;1064:	s1 = cgs.scores1;
ADDRLP4 28
ADDRGP4 cgs+34800
INDIRI4
ASGNI4
line 1065
;1065:	s2 = cgs.scores2;
ADDRLP4 32
ADDRGP4 cgs+34804
INDIRI4
ASGNI4
line 1067
;1066:
;1067:	y -=  BIGCHAR_HEIGHT + 8;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 1069
;1068:
;1069:	y1 = y;
ADDRLP4 36
ADDRFP4 0
INDIRF4
ASGNF4
line 1072
;1070:
;1071:	// draw from the right side to left
;1072:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $508
line 1073
;1073:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1074
;1074:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1075
;1075:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1076
;1076:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1077
;1077:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1078
;1078:		s = va( "%2i", s2 );
ADDRGP4 $514
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
line 1079
;1079:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1080
;1080:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1081
;1081:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1082
;1082:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $515
line 1083
;1083:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
line 1084
;1084:		}
LABELV $515
line 1085
;1085:		CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1087
;1086:
;1087:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $520
line 1089
;1088:			// Display flag status
;1089:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
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
line 1091
;1090:
;1091:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1092
;1092:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1093
;1093:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 0
LTI4 $525
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
GTI4 $525
line 1094
;1094:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
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
line 1095
;1095:				}
LABELV $525
line 1096
;1096:			}
LABELV $523
line 1097
;1097:		}
LABELV $520
line 1098
;1098:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1099
;1099:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1100
;1100:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1101
;1101:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1102
;1102:		s = va( "%2i", s1 );
ADDRGP4 $514
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
line 1103
;1103:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1104
;1104:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1105
;1105:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1106
;1106:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $535
line 1107
;1107:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
line 1108
;1108:		}
LABELV $535
line 1109
;1109:		CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1111
;1110:
;1111:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $540
line 1113
;1112:			// Display flag status
;1113:			item = BG_FindItemForPowerup( PW_REDFLAG );
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
line 1115
;1114:
;1115:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $543
line 1116
;1116:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 36
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1117
;1117:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 0
LTI4 $545
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
GTI4 $545
line 1118
;1118:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
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
line 1119
;1119:				}
LABELV $545
line 1120
;1120:			}
LABELV $543
line 1121
;1121:		}
LABELV $540
line 1138
;1122:
;1123:#ifdef MISSIONPACK
;1124:		if ( cgs.gametype == GT_1FCTF ) {
;1125:			// Display flag status
;1126:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1127:
;1128:			if (item) {
;1129:				y1 = y - BIGCHAR_HEIGHT - 8;
;1130:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
;1131:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
;1132:				}
;1133:			}
;1134:		}
;1135:#endif
;1136:		
;1137:		// Shafe - This draws the status thingy
;1138:		if ( cgs.gametype >= GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
LTI4 $552
line 1139
;1139:			v = cgs.capturelimit;
ADDRLP4 44
ADDRGP4 cgs+31472
INDIRI4
ASGNI4
line 1140
;1140:		} else {
ADDRGP4 $553
JUMPV
LABELV $552
line 1141
;1141:			v = cgs.fraglimit;
ADDRLP4 44
ADDRGP4 cgs+31468
INDIRI4
ASGNI4
line 1142
;1142:		}
LABELV $553
line 1143
;1143:		if ( v ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $509
line 1144
;1144:			s = va( "%2i", v );
ADDRGP4 $514
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
line 1145
;1145:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1146
;1146:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1147
;1147:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1148
;1148:		}
line 1150
;1149:
;1150:	} else {
ADDRGP4 $509
JUMPV
LABELV $508
line 1153
;1151:		qboolean	spectator;
;1152:
;1153:		x = 640;
ADDRLP4 16
CNSTI4 640
ASGNI4
line 1154
;1154:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 40
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1155
;1155:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $562
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $563
JUMPV
LABELV $562
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $563
ADDRLP4 52
ADDRLP4 56
INDIRI4
ASGNI4
line 1158
;1156:
;1157:		// always show your score in the second box if not in first place
;1158:		if ( s1 != score ) {
ADDRLP4 28
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $564
line 1159
;1159:			s2 = score;
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 1160
;1160:		}
LABELV $564
line 1161
;1161:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $566
line 1162
;1162:			s = va( "%2i", s2 );
ADDRGP4 $514
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
line 1163
;1163:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1164
;1164:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1165
;1165:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $568
ADDRLP4 68
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $568
ADDRLP4 68
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $568
line 1166
;1166:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1167
;1167:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1168
;1168:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1169
;1169:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1170
;1170:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1171
;1171:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
line 1172
;1172:			} else {
ADDRGP4 $569
JUMPV
LABELV $568
line 1173
;1173:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1174
;1174:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1175
;1175:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1176
;1176:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1177
;1177:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1178
;1178:			}	
LABELV $569
line 1179
;1179:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1180
;1180:		}
LABELV $566
line 1183
;1181:
;1182:		// first place
;1183:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 28
INDIRI4
CNSTI4 -9999
EQI4 $578
line 1184
;1184:			s = va( "%2i", s1 );
ADDRGP4 $514
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
line 1185
;1185:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1186
;1186:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1187
;1187:			if ( !spectator && score == s1 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $580
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $580
line 1188
;1188:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1189
;1189:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1190
;1190:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1191
;1191:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1192
;1192:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1193
;1193:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
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
line 1194
;1194:			} else {
ADDRGP4 $581
JUMPV
LABELV $580
line 1195
;1195:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1196
;1196:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1197
;1197:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1198
;1198:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1199
;1199:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
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
line 1200
;1200:			}	
LABELV $581
line 1201
;1201:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1202
;1202:		}
LABELV $578
line 1204
;1203:
;1204:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 0
EQI4 $590
line 1205
;1205:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $514
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
line 1206
;1206:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
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
line 1207
;1207:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1208
;1208:			CG_DrawBigString( x + 4, y, s, 1.0F);
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
line 1209
;1209:		}
LABELV $590
line 1211
;1210:
;1211:	}
LABELV $509
line 1213
;1212:
;1213:	return y1 - 8;
ADDRLP4 36
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $505
endproc CG_DrawScores 76 20
data
align 4
LABELV $595
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
line 1223
;1214:}
;1215:#endif // MISSIONPACK
;1216:
;1217:/*
;1218:================
;1219:CG_DrawPowerups
;1220:================
;1221:*/
;1222:#ifndef MISSIONPACK
;1223:static float CG_DrawPowerups( float y ) {
line 1240
;1224:	int		sorted[MAX_POWERUPS];
;1225:	int		sortedTime[MAX_POWERUPS];
;1226:	int		i, j, k;
;1227:	int		active;
;1228:	playerState_t	*ps;
;1229:	int		t;
;1230:	gitem_t	*item;
;1231:	int		x;
;1232:	int		color;
;1233:	float	size;
;1234:	float	f;
;1235:	static float colors[2][4] = { 
;1236:    { 0.2f, 1.0f, 0.2f, 1.0f } , 
;1237:    { 1.0f, 0.2f, 0.2f, 1.0f } 
;1238:  };
;1239:
;1240:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1242
;1241:
;1242:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $597
line 1243
;1243:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $594
JUMPV
LABELV $597
line 1247
;1244:	}
;1245:
;1246:	// sort the list by time remaining
;1247:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1248
;1248:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $599
line 1249
;1249:		if ( !ps->powerups[ i ] ) {
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
NEI4 $603
line 1250
;1250:			continue;
ADDRGP4 $600
JUMPV
LABELV $603
line 1252
;1251:		}
;1252:		t = ps->powerups[ i ] - cg.time;
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
line 1255
;1253:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1254:		// This is true of the CTF flags
;1255:		if ( t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $608
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $606
LABELV $608
line 1256
;1256:			continue;
ADDRGP4 $600
JUMPV
LABELV $606
line 1260
;1257:		}
;1258:
;1259:		// insert into the list
;1260:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $609
line 1261
;1261:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $613
line 1262
;1262:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $615
line 1263
;1263:					sorted[k+1] = sorted[k];
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
line 1264
;1264:					sortedTime[k+1] = sortedTime[k];
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
line 1265
;1265:				}
LABELV $616
line 1262
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $618
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $615
line 1266
;1266:				break;
ADDRGP4 $611
JUMPV
LABELV $613
line 1268
;1267:			}
;1268:		}
LABELV $610
line 1260
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $612
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $609
LABELV $611
line 1269
;1269:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1270
;1270:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1271
;1271:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1272
;1272:	}
LABELV $600
line 1248
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $599
line 1275
;1273:
;1274:	// draw the icons and timers
;1275:	x = 640 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
CNSTI4 528
ASGNI4
line 1276
;1276:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $624
JUMPV
LABELV $621
line 1277
;1277:		item = BG_FindItemForPowerup( sorted[i] );
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
line 1279
;1278:
;1279:    if (item) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $625
line 1281
;1280:
;1281:		  color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1283
;1282:
;1283:		  y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1285
;1284:
;1285:		  trap_R_SetColor( colors[color] );
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $595
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1286
;1286:		  CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
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
line 1288
;1287:
;1288:		  t = ps->powerups[ sorted[i] ];
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
line 1289
;1289:		  if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $627
line 1290
;1290:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1291
;1291:		  } else {
ADDRGP4 $628
JUMPV
LABELV $627
line 1294
;1292:			  vec4_t	modulate;
;1293:
;1294:			  f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
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
line 1295
;1295:			  f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1296
;1296:			  modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
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
line 1297
;1297:			  trap_R_SetColor( modulate );
ADDRLP4 184
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1298
;1298:		  }
LABELV $628
line 1300
;1299:
;1300:		  if ( cg.powerupActive == sorted[i] && 
ADDRGP4 cg+126476
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $634
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126480
INDIRI4
SUBI4
CNSTI4 200
GEI4 $634
line 1301
;1301:			  cg.time - cg.powerupTime < PULSE_TIME ) {
line 1302
;1302:			  f = 1.0 - ( ( (float)cg.time - cg.powerupTime ) / PULSE_TIME );
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
line 1303
;1303:			  size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
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
line 1304
;1304:		  } else {
ADDRGP4 $635
JUMPV
LABELV $634
line 1305
;1305:			  size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1306
;1306:		  }
LABELV $635
line 1308
;1307:
;1308:		  CG_DrawPic( 640 - size, y + ICON_SIZE / 2 - size / 2, 
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
line 1310
;1309:			  size, size, trap_R_RegisterShader( item->icon ) );
;1310:    }
LABELV $625
line 1311
;1311:	}
LABELV $622
line 1276
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $624
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $621
line 1312
;1312:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1314
;1313:
;1314:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $594
endproc CG_DrawPowerups 208 20
proc CG_DrawHudRight 0 20
line 1322
;1315:}
;1316:#endif // MISSIONPACK
;1317:/*
;1318:====================
;1319:CG_DrawHudRight
;1320:====================
;1321:*/
;1322:static float CG_DrawHudRight(float y){
line 1327
;1323:	
;1324:	//x = 640 - 48;  this x/y is the lagometer position
;1325:	//y = 480 - 48;
;1326:	
;1327:	CG_DrawPic( (640-159), (480-75), 159, 75, cgs.media.HudRight );
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
line 1328
;1328:}
CNSTF4 0
RETF4
LABELV $641
endproc CG_DrawHudRight 0 20
proc CG_DrawHudLeft 0 20
line 1335
;1329:
;1330:/*
;1331:====================
;1332:CG_DrawHudLeft
;1333:====================
;1334:*/
;1335:static float CG_DrawHudLeft(float y){
line 1336
;1336:	CG_DrawPic( 1, (480-75), 159, 75, cgs.media.HudLeft );
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
line 1337
;1337:}
CNSTF4 0
RETF4
LABELV $644
endproc CG_DrawHudLeft 0 20
proc CG_DrawLowerRight 12 12
line 1346
;1338:
;1339:/*
;1340:=====================
;1341:CG_DrawLowerRight
;1342:
;1343:=====================
;1344:*/
;1345:#ifndef MISSIONPACK
;1346:static void CG_DrawLowerRight( void ) {
line 1349
;1347:	float	y;
;1348:
;1349:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1355
;1350:
;1351:
;1352://	CG_DrawHudRight( y);
;1353:	
;1354:
;1355:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $648
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $648
line 1356
;1356:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
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
line 1357
;1357:	} 
LABELV $648
line 1359
;1358:
;1359:	y = CG_DrawScores( y );
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
line 1360
;1360:	y = CG_DrawPowerups( y );
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
line 1361
;1361:}
LABELV $647
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 16 20
line 1371
;1362:#endif // MISSIONPACK
;1363:
;1364:
;1365:/*
;1366:===================
;1367:CG_DrawPickupItem
;1368:===================
;1369:*/
;1370:#ifndef MISSIONPACK
;1371:static int CG_DrawPickupItem( int y ) {
line 1375
;1372:	int		value;
;1373:	float	*fadeColor;
;1374:
;1375:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $653
line 1376
;1376:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $652
JUMPV
LABELV $653
line 1379
;1377:	}
;1378:
;1379:	y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
line 1381
;1380:
;1381:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+126732
INDIRI4
ASGNI4
line 1382
;1382:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $657
line 1383
;1383:		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
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
line 1384
;1384:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $660
line 1385
;1385:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1386
;1386:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1387
;1387:			CG_DrawPic( 8, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
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
line 1388
;1388:			CG_DrawBigString( ICON_SIZE + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
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
line 1389
;1389:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1390
;1390:		}
LABELV $660
line 1391
;1391:	}
LABELV $657
line 1393
;1392:	
;1393:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $652
endproc CG_DrawPickupItem 16 20
proc CG_DrawLowerLeft 16 12
line 1404
;1394:}
;1395:#endif // MISSIONPACK
;1396:
;1397:/*
;1398:=====================
;1399:CG_DrawLowerLeft
;1400:
;1401:=====================
;1402:*/
;1403:#ifndef MISSIONPACK
;1404:static void CG_DrawLowerLeft( void ) {
line 1409
;1405:	float	y;
;1406:
;1407://	CG_DrawHudLeft( y);
;1408:
;1409:	y = 480 - ICON_SIZE;
ADDRLP4 0
CNSTF4 1138229248
ASGNF4
line 1411
;1410:
;1411:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $665
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $665
line 1412
;1412:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
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
line 1413
;1413:	} 
LABELV $665
line 1416
;1414:
;1415:
;1416:	y = CG_DrawPickupItem( y );
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
line 1417
;1417:}
LABELV $664
endproc CG_DrawLowerLeft 16 12
proc CG_DrawTeamInfo 56 36
line 1429
;1418:#endif // MISSIONPACK
;1419:
;1420:
;1421://===========================================================================================
;1422:
;1423:/*
;1424:=================
;1425:CG_DrawTeamInfo
;1426:=================
;1427:*/
;1428:#ifndef MISSIONPACK
;1429:static void CG_DrawTeamInfo( void ) {
line 1438
;1430:	int w, h;
;1431:	int i, len;
;1432:	vec4_t		hcolor;
;1433:	int		chatHeight;
;1434:
;1435:#define CHATLOC_Y 420 // bottom end
;1436:#define CHATLOC_X 0
;1437:
;1438:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $670
line 1439
;1439:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $671
JUMPV
LABELV $670
line 1441
;1440:	else
;1441:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $671
line 1442
;1442:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $674
line 1443
;1443:		return; // disabled
ADDRGP4 $669
JUMPV
LABELV $674
line 1445
;1444:
;1445:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+153784
INDIRI4
ADDRGP4 cgs+153780
INDIRI4
EQI4 $676
line 1446
;1446:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
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
LEI4 $680
line 1447
;1447:			cgs.teamLastChatPos++;
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
line 1448
;1448:		}
LABELV $680
line 1450
;1449:
;1450:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+153780
INDIRI4
ADDRGP4 cgs+153784
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1452
;1451:
;1452:		w = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1454
;1453:
;1454:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+153784
INDIRI4
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $689
line 1455
;1455:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
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
line 1456
;1456:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $696
line 1457
;1457:				w = len;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $696
line 1458
;1458:		}
LABELV $690
line 1454
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $692
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+153780
INDIRI4
LTI4 $689
line 1459
;1459:		w *= TINYCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1460
;1460:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1462
;1461:
;1462:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $698
line 1463
;1463:			hcolor[0] = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1464
;1464:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1465
;1465:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1466
;1466:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1467
;1467:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $699
JUMPV
LABELV $698
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $704
line 1468
;1468:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1469
;1469:			hcolor[1] = 0.0f;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 1470
;1470:			hcolor[2] = 1.0f;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 1471
;1471:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1472
;1472:		} else {
ADDRGP4 $705
JUMPV
LABELV $704
line 1473
;1473:			hcolor[0] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1474
;1474:			hcolor[1] = 1.0f;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 1475
;1475:			hcolor[2] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1476
;1476:			hcolor[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 1477
;1477:		}
LABELV $705
LABELV $699
line 1479
;1478:
;1479:		trap_R_SetColor( hcolor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1480
;1480:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, 640, h, cgs.media.teamStatusBar );
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
line 1481
;1481:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1483
;1482:
;1483:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
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
line 1484
;1484:		hcolor[3] = 1.0f;
ADDRLP4 12+12
CNSTF4 1065353216
ASGNF4
line 1486
;1485:
;1486:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+153780
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $721
JUMPV
LABELV $718
line 1487
;1487:			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH, 
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
line 1491
;1488:				CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
;1489:				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
;1490:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1491:		}
LABELV $719
line 1486
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $721
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+153784
INDIRI4
GEI4 $718
line 1492
;1492:	}
LABELV $676
line 1493
;1493:}
LABELV $669
endproc CG_DrawTeamInfo 56 36
proc CG_DrawHoldableItem 8 20
line 1502
;1494:#endif // MISSIONPACK
;1495:
;1496:/*
;1497:===================
;1498:CG_DrawHoldableItem
;1499:===================
;1500:*/
;1501:#ifndef MISSIONPACK
;1502:static void CG_DrawHoldableItem( void ) { 
line 1505
;1503:	int		value;
;1504:
;1505:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1506
;1506:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $728
line 1507
;1507:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1508
;1508:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
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
line 1509
;1509:	}
LABELV $728
line 1511
;1510:
;1511:}
LABELV $726
endproc CG_DrawHoldableItem 8 20
proc CG_DrawReward 68 36
line 1539
;1512:#endif // MISSIONPACK
;1513:
;1514:#ifdef MISSIONPACK
;1515:/*
;1516:===================
;1517:CG_DrawPersistantPowerup
;1518:===================
;1519:*/
;1520:#if 0 // sos001208 - DEAD
;1521:static void CG_DrawPersistantPowerup( void ) { 
;1522:	int		value;
;1523:
;1524:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1525:	if ( value ) {
;1526:		CG_RegisterItemVisuals( value );
;1527:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1528:	}
;1529:}
;1530:#endif
;1531:#endif // MISSIONPACK
;1532:
;1533:
;1534:/*
;1535:===================
;1536:CG_DrawReward
;1537:===================
;1538:*/
;1539:static void CG_DrawReward( void ) { 
line 1545
;1540:	float	*color;
;1541:	int		i, count;
;1542:	float	x, y;
;1543:	char	buf[32];
;1544:
;1545:	if ( !cg_drawRewards.integer ) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $732
line 1546
;1546:		return;
ADDRGP4 $731
JUMPV
LABELV $732
line 1549
;1547:	}
;1548:
;1549:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
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
line 1550
;1550:	if ( !color ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $736
line 1551
;1551:		if (cg.rewardStack > 0) {
ADDRGP4 cg+126492
INDIRI4
CNSTI4 0
LEI4 $731
line 1552
;1552:			for(i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $744
JUMPV
LABELV $741
line 1553
;1553:				cg.rewardSound[i] = cg.rewardSound[i+1];
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
line 1554
;1554:				cg.rewardShader[i] = cg.rewardShader[i+1];
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
line 1555
;1555:				cg.rewardCount[i] = cg.rewardCount[i+1];
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
line 1556
;1556:			}
LABELV $742
line 1552
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $744
ADDRLP4 0
INDIRI4
ADDRGP4 cg+126492
INDIRI4
LTI4 $741
line 1557
;1557:			cg.rewardTime = cg.time;
ADDRGP4 cg+126496
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1558
;1558:			cg.rewardStack--;
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
line 1559
;1559:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
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
line 1560
;1560:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+126580
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1561
;1561:		} else {
line 1562
;1562:			return;
LABELV $739
line 1564
;1563:		}
;1564:	}
LABELV $736
line 1566
;1565:
;1566:	trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1583
;1567:
;1568:	/*
;1569:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1570:
;1571:	if (count) {
;1572:		y = 4;
;1573:		x = 320 - count * ICON_SIZE;
;1574:		for ( i = 0 ; i < count ; i++ ) {
;1575:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1576:			x += (ICON_SIZE*2);
;1577:		}
;1578:	}
;1579:
;1580:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1581:	*/
;1582:
;1583:	if ( cg.rewardCount[0] >= 10 ) {
ADDRGP4 cg+126500
INDIRI4
CNSTI4 10
LTI4 $760
line 1584
;1584:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1585
;1585:		x = 320 - ICON_SIZE/2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1586
;1586:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
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
line 1587
;1587:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $764
ARGP4
ADDRGP4 cg+126500
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1588
;1588:		x = ( SCREEN_WIDTH - SMALLCHAR_WIDTH * CG_DrawStrlen( buf ) ) / 2;
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
line 1589
;1589:		CG_DrawStringExt( x, y+ICON_SIZE, buf, color, qfalse, qtrue,
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
line 1591
;1590:								SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
;1591:	}
ADDRGP4 $761
JUMPV
LABELV $760
line 1592
;1592:	else {
line 1594
;1593:
;1594:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+126500
INDIRI4
ASGNI4
line 1596
;1595:
;1596:		y = 56;
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1597
;1597:		x = 320 - count * ICON_SIZE/2;
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
line 1598
;1598:		for ( i = 0 ; i < count ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $770
JUMPV
LABELV $767
line 1599
;1599:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
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
line 1600
;1600:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1601
;1601:		}
LABELV $768
line 1598
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $770
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $767
line 1602
;1602:	}
LABELV $761
line 1603
;1603:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1604
;1604:}
LABELV $731
endproc CG_DrawReward 68 36
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1635
;1605:
;1606:
;1607:/*
;1608:===============================================================================
;1609:
;1610:LAGOMETER
;1611:
;1612:===============================================================================
;1613:*/
;1614:
;1615:#define	LAG_SAMPLES		128
;1616:
;1617:
;1618:typedef struct {
;1619:	int		frameSamples[LAG_SAMPLES];
;1620:	int		frameCount;
;1621:	int		snapshotFlags[LAG_SAMPLES];
;1622:	int		snapshotSamples[LAG_SAMPLES];
;1623:	int		snapshotCount;
;1624:} lagometer_t;
;1625:
;1626:lagometer_t		lagometer;
;1627:
;1628:/*
;1629:==============
;1630:CG_AddLagometerFrameInfo
;1631:
;1632:Adds the current interpolate / extrapolate bar for this frame
;1633:==============
;1634:*/
;1635:void CG_AddLagometerFrameInfo( void ) {
line 1638
;1636:	int			offset;
;1637:
;1638:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1639
;1639:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
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
line 1640
;1640:	lagometer.frameCount++;
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
line 1641
;1641:}
LABELV $773
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1653
;1642:
;1643:/*
;1644:==============
;1645:CG_AddLagometerSnapshotInfo
;1646:
;1647:Each time a snapshot is received, log its ping time and
;1648:the number of snapshots that were dropped before it.
;1649:
;1650:Pass NULL for a dropped packet.
;1651:==============
;1652:*/
;1653:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 1655
;1654:	// dropped packet
;1655:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $779
line 1656
;1656:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
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
line 1657
;1657:		lagometer.snapshotCount++;
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
line 1658
;1658:		return;
ADDRGP4 $778
JUMPV
LABELV $779
line 1662
;1659:	}
;1660:
;1661:	// add this snapshot's info
;1662:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
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
line 1663
;1663:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
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
line 1664
;1664:	lagometer.snapshotCount++;
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
line 1665
;1665:}
LABELV $778
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 64 20
line 1674
;1666:
;1667:/*
;1668:==============
;1669:CG_DrawDisconnect
;1670:
;1671:Should we draw something differnet for long lag vs no packets?
;1672:==============
;1673:*/
;1674:static void CG_DrawDisconnect( void ) {
line 1682
;1675:	float		x, y;
;1676:	int			cmdNum;
;1677:	usercmd_t	cmd;
;1678:	const char		*s;
;1679:	int			w;  // bk010215 - FIXME char message[1024];
;1680:
;1681:	// draw the phone jack if we are completely past our buffers
;1682:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
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
line 1683
;1683:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1684
;1684:	if ( cmd.serverTime <= cg.snap->ps.commandTime
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
LEI4 $794
ADDRLP4 48
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $790
LABELV $794
line 1685
;1685:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 1686
;1686:		return;
ADDRGP4 $789
JUMPV
LABELV $790
line 1690
;1687:	}
;1688:
;1689:	// also add text in center of screen
;1690:	s = "Connection Interrupted"; // bk 010215 - FIXME
ADDRLP4 24
ADDRGP4 $795
ASGNP4
line 1691
;1691:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 1692
;1692:	CG_DrawBigString( 320 - w/2, 100, s, 1.0F);
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
line 1695
;1693:
;1694:	// blink the icon
;1695:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+109652
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $796
line 1696
;1696:		return;
ADDRGP4 $789
JUMPV
LABELV $796
line 1699
;1697:	}
;1698:
;1699:	x = 640 - 48;
ADDRLP4 28
CNSTF4 1142161408
ASGNF4
line 1700
;1700:	y = 480 - 48;
ADDRLP4 32
CNSTF4 1138229248
ASGNF4
line 1702
;1701:
;1702:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $799
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
line 1703
;1703:}
LABELV $789
endproc CG_DrawDisconnect 64 20
proc CG_DrawLagometer 64 36
line 1714
;1704:
;1705:
;1706:#define	MAX_LAGOMETER_PING	900
;1707:#define	MAX_LAGOMETER_RANGE	300
;1708:
;1709:/*
;1710:==============
;1711:CG_DrawLagometer
;1712:==============
;1713:*/
;1714:static void CG_DrawLagometer( void ) {
line 1722
;1715:	int		a, x, y, i;
;1716:	float	v;
;1717:	float	ax, ay, aw, ah, mid, range;
;1718:	int		color;
;1719:	float	vscale;
;1720:
;1721://unlagged - misc
;1722:	if ( !cg_lagometer.integer /* || cgs.localServer */) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
NEI4 $801
line 1724
;1723://unlagged - misc
;1724:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1725
;1725:		return;
ADDRGP4 $800
JUMPV
LABELV $801
line 1735
;1726:	}
;1727:
;1728:	//
;1729:	// draw the graph
;1730:	//
;1731:#ifdef MISSIONPACK
;1732:	x = 640 - 48;
;1733:	y = 480 - 144;
;1734:#else
;1735:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 1736
;1736:	y = 48;//480 - 48; // Shafe - Changed
ADDRLP4 48
CNSTI4 48
ASGNI4
line 1739
;1737:#endif
;1738:
;1739:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1740
;1740:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
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
line 1742
;1741:
;1742:	ax = x;
ADDRLP4 24
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1743
;1743:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1744
;1744:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1745
;1745:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1746
;1746:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
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
line 1748
;1747:
;1748:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1749
;1749:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1750
;1750:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1752
;1751:
;1752:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 1755
;1753:
;1754:	// draw the frame interpoalte / extrapolate graph
;1755:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $809
JUMPV
LABELV $806
line 1756
;1756:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
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
line 1757
;1757:		v = lagometer.frameSamples[i];
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
line 1758
;1758:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1759
;1759:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $811
line 1760
;1760:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $813
line 1761
;1761:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1762
;1762:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1763
;1763:			}
LABELV $813
line 1764
;1764:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $816
line 1765
;1765:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1766
;1766:			}
LABELV $816
line 1767
;1767:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
line 1768
;1768:		} else if ( v < 0 ) {
ADDRGP4 $812
JUMPV
LABELV $811
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $820
line 1769
;1769:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $822
line 1770
;1770:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1771
;1771:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1772
;1772:			}
LABELV $822
line 1773
;1773:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1774
;1774:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $825
line 1775
;1775:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1776
;1776:			}
LABELV $825
line 1777
;1777:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
line 1778
;1778:		}
LABELV $820
LABELV $812
line 1779
;1779:	}
LABELV $807
line 1755
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $809
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $806
line 1782
;1780:
;1781:	// draw the snapshot latency / drop graph
;1782:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1783
;1783:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1785
;1784:
;1785:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $832
JUMPV
LABELV $829
line 1786
;1786:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
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
line 1787
;1787:		v = lagometer.snapshotSamples[i];
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
line 1788
;1788:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $835
line 1789
;1789:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
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
EQI4 $837
line 1790
;1790:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $838
line 1791
;1791:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1792
;1792:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1793
;1793:				}
line 1794
;1794:			} else {
ADDRGP4 $838
JUMPV
LABELV $837
line 1795
;1795:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $843
line 1796
;1796:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1797
;1797:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1798
;1798:				}
LABELV $843
line 1799
;1799:			}
LABELV $838
line 1800
;1800:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1801
;1801:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $846
line 1802
;1802:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1803
;1803:			}
LABELV $846
line 1804
;1804:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
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
line 1805
;1805:		} else if ( v < 0 ) {
ADDRGP4 $836
JUMPV
LABELV $835
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $850
line 1806
;1806:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $852
line 1807
;1807:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1808
;1808:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1809
;1809:			}
LABELV $852
line 1810
;1810:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
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
line 1811
;1811:		}
LABELV $850
LABELV $836
line 1812
;1812:	}
LABELV $830
line 1785
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $832
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $829
line 1814
;1813:
;1814:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1816
;1815:
;1816:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $861
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $857
LABELV $861
line 1817
;1817:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $862
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1818
;1818:	}
LABELV $857
line 1820
;1819:
;1820:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1821
;1821:}
LABELV $800
endproc CG_DrawLagometer 64 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1842
;1822:
;1823:
;1824:
;1825:/*
;1826:===============================================================================
;1827:
;1828:CENTER PRINTING
;1829:
;1830:===============================================================================
;1831:*/
;1832:
;1833:
;1834:/*
;1835:==============
;1836:CG_CenterPrint
;1837:
;1838:Called for important messages that should stay in the center of the screen
;1839:for a few moments
;1840:==============
;1841:*/
;1842:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 1845
;1843:	char	*s;
;1844:
;1845:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
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
line 1847
;1846:
;1847:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+125420
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1848
;1848:	cg.centerPrintY = y;
ADDRGP4 cg+125428
ADDRFP4 4
INDIRI4
ASGNI4
line 1849
;1849:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+125424
ADDRFP4 8
INDIRI4
ASGNI4
line 1852
;1850:
;1851:	// count the number of lines for centering
;1852:	cg.centerPrintLines = 1;
ADDRGP4 cg+126456
CNSTI4 1
ASGNI4
line 1853
;1853:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
ADDRGP4 $873
JUMPV
LABELV $872
line 1854
;1854:	while( *s ) {
line 1855
;1855:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $875
line 1856
;1856:			cg.centerPrintLines++;
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
LABELV $875
line 1857
;1857:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1858
;1858:	}
LABELV $873
line 1854
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $872
line 1859
;1859:}
LABELV $863
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1064 36
line 1867
;1860:
;1861:
;1862:/*
;1863:===================
;1864:CG_DrawCenterString
;1865:===================
;1866:*/
;1867:static void CG_DrawCenterString( void ) {
line 1876
;1868:	char	*start;
;1869:	int		l;
;1870:	int		x, y, w;
;1871:#ifdef MISSIONPACK // bk010221 - unused else
;1872:  int h;
;1873:#endif
;1874:	float	*color;
;1875:
;1876:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+125420
INDIRI4
CNSTI4 0
NEI4 $879
line 1877
;1877:		return;
ADDRGP4 $878
JUMPV
LABELV $879
line 1880
;1878:	}
;1879:
;1880:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
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
line 1881
;1881:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $884
line 1882
;1882:		return;
ADDRGP4 $878
JUMPV
LABELV $884
line 1885
;1883:	}
;1884:
;1885:	trap_R_SetColor( color );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1887
;1886:
;1887:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+125432
ASGNP4
line 1889
;1888:
;1889:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
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
ADDRGP4 $890
JUMPV
LABELV $889
line 1891
;1890:
;1891:	while ( 1 ) {
line 1894
;1892:		char linebuffer[1024];
;1893:
;1894:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $892
line 1895
;1895:			if ( !start[l] || start[l] == '\n' ) {
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
EQI4 $898
ADDRLP4 1052
INDIRI4
CNSTI4 10
NEI4 $896
LABELV $898
line 1896
;1896:				break;
ADDRGP4 $894
JUMPV
LABELV $896
line 1898
;1897:			}
;1898:			linebuffer[l] = start[l];
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
line 1899
;1899:		}
LABELV $893
line 1894
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $892
LABELV $894
line 1900
;1900:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 1909
;1901:
;1902:#ifdef MISSIONPACK
;1903:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1904:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1905:		x = (SCREEN_WIDTH - w) / 2;
;1906:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1907:		y += h + 6;
;1908:#else
;1909:		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );
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
line 1911
;1910:
;1911:		x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1913
;1912:
;1913:		CG_DrawStringExt( x, y, linebuffer, color, qfalse, qtrue,
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
line 1916
;1914:			cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
;1915:
;1916:		y += cg.centerPrintCharWidth * 1.5;
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
ADDRGP4 $904
JUMPV
LABELV $903
line 1918
;1917:#endif
;1918:		while ( *start && ( *start != '\n' ) ) {
line 1919
;1919:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1920
;1920:		}
LABELV $904
line 1918
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $906
ADDRLP4 1060
INDIRI4
CNSTI4 10
NEI4 $903
LABELV $906
line 1921
;1921:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $907
line 1922
;1922:			break;
ADDRGP4 $891
JUMPV
LABELV $907
line 1924
;1923:		}
;1924:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1925
;1925:	}
LABELV $890
line 1891
ADDRGP4 $889
JUMPV
LABELV $891
line 1927
;1926:
;1927:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1928
;1928:}
LABELV $878
endproc CG_DrawCenterString 1064 36
proc CG_DrawCrosshair 56 36
line 1946
;1929:
;1930:
;1931:
;1932:/*
;1933:================================================================================
;1934:
;1935:CROSSHAIR
;1936:
;1937:================================================================================
;1938:*/
;1939:
;1940:
;1941:/*
;1942:=================
;1943:CG_DrawCrosshair
;1944:=================
;1945:*/
;1946:static void CG_DrawCrosshair(void) {
line 1953
;1947:	float		w, h;
;1948:	qhandle_t	hShader;
;1949:	float		f;
;1950:	float		x, y;
;1951:	int			ca;
;1952:
;1953:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $910
line 1954
;1954:		return;
ADDRGP4 $909
JUMPV
LABELV $910
line 1957
;1955:	}
;1956:
;1957:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $913
line 1958
;1958:		return;
ADDRGP4 $909
JUMPV
LABELV $913
line 1961
;1959:	}
;1960:
;1961:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $916
line 1962
;1962:		return;
ADDRGP4 $909
JUMPV
LABELV $916
line 1966
;1963:	}
;1964:
;1965:	// set color based on health
;1966:	if ( cg_crosshairHealth.integer ) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $919
line 1969
;1967:		vec4_t		hcolor;
;1968:
;1969:		CG_ColorForHealth( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 1970
;1970:		trap_R_SetColor( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1971
;1971:	} else {
ADDRGP4 $920
JUMPV
LABELV $919
line 1972
;1972:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1973
;1973:	}
LABELV $920
line 1975
;1974:
;1975:	w = h = cg_crosshairSize.value;
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
line 1978
;1976:
;1977:	// pulse the size of the crosshair when picking up items
;1978:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126740
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1979
;1979:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $925
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $925
line 1980
;1980:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 1981
;1981:		w *= ( 1 + f );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1982
;1982:		h *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1983
;1983:	}
LABELV $925
line 1985
;1984:
;1985:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 1986
;1986:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 1987
;1987:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 1989
;1988:
;1989:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 1990
;1990:	if (ca < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $930
line 1991
;1991:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1992
;1992:	}
LABELV $930
line 1993
;1993:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
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
line 1995
;1994:
;1995:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w), 
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
line 1998
;1996:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h), 
;1997:		w, h, 0, 0, 1, 1, hShader );
;1998:}
LABELV $909
endproc CG_DrawCrosshair 56 36
proc CG_ScanForCrosshairEntity 96 28
line 2007
;1999:
;2000:
;2001:
;2002:/*
;2003:=================
;2004:CG_ScanForCrosshairEntity
;2005:=================
;2006:*/
;2007:static void CG_ScanForCrosshairEntity( void ) {
line 2012
;2008:	trace_t		trace;
;2009:	vec3_t		start, end;
;2010:	int			content;
;2011:
;2012:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 0
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2013
;2013:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
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
line 2015
;2014:
;2015:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
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
line 2024
;2016:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2017:	/*
;2018:	if ( trace.entityNum >= MAX_CLIENTS ) {
;2019:		return;
;2020:	}
;2021:	*/
;2022:
;2023:	// if the player is in fog, don't show it
;2024:	content = trap_CM_PointContents( trace.endpos, 0 );
ADDRLP4 12+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 92
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 92
INDIRI4
ASGNI4
line 2025
;2025:	if ( content & CONTENTS_FOG ) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $958
line 2026
;2026:		return;
ADDRGP4 $941
JUMPV
LABELV $958
line 2030
;2027:	}
;2028:
;2029:	// if the player is invisible, don't show it
;2030:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
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
EQI4 $960
line 2031
;2031:		return;
ADDRGP4 $941
JUMPV
LABELV $960
line 2035
;2032:	}
;2033:
;2034:	// update the fade timer
;2035:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+126468
ADDRLP4 12+52
INDIRI4
ASGNI4
line 2036
;2036:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+126472
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2037
;2037:}
LABELV $941
endproc CG_ScanForCrosshairEntity 96 28
proc CG_DrawCrosshairNames 36 16
line 2045
;2038:
;2039:
;2040:/*
;2041:=====================
;2042:CG_DrawCrosshairNames
;2043:=====================
;2044:*/
;2045:static void CG_DrawCrosshairNames( void ) {
line 2052
;2046:	float		*color;
;2047:	char		*name;
;2048:	char		*s;
;2049:	int			health;
;2050:	float		w;
;2051:
;2052:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $969
line 2053
;2053:		return;
ADDRGP4 $968
JUMPV
LABELV $969
line 2055
;2054:	}
;2055:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $972
line 2056
;2056:		return;
ADDRGP4 $968
JUMPV
LABELV $972
line 2058
;2057:	}
;2058:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $975
line 2059
;2059:		return;
ADDRGP4 $968
JUMPV
LABELV $975
line 2063
;2060:	}
;2061:
;2062:	// scan the known entities to see if the crosshair is sighted on one
;2063:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2066
;2064:
;2065:	// draw the name of the player being looked at
;2066:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
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
line 2067
;2067:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $979
line 2068
;2068:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2069
;2069:		return;
ADDRGP4 $968
JUMPV
LABELV $979
line 2072
;2070:	}
;2071:
;2072:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
CNSTI4 1732
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ASGNP4
line 2073
;2073:	health = cgs.clientinfo[ cg.crosshairClientNum ].health;
ADDRLP4 8
CNSTI4 1732
ADDRGP4 cg+126468
INDIRI4
MULI4
ADDRGP4 cgs+40972+108
ADDP4
INDIRI4
ASGNI4
line 2080
;2074:
;2075:#ifdef MISSIONPACK
;2076:	color[3] *= 0.5f;
;2077:	w = CG_Text_Width(name, 0.3f, 0);
;2078:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2079:#else
;2080:	w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
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
line 2081
;2081:	CG_DrawBigString( 320 - w / 2, 170, name, color[3] * 0.5f );
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
line 2082
;2082:	s = va( "%i", health);
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
line 2083
;2083:	if (health != 0) 
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $987
line 2084
;2084:	{
line 2085
;2085:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2086
;2086:		CG_DrawSmallString( 320 - w / 2, 190, s, color[3] * 0.5f );
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
line 2087
;2087:	}
LABELV $987
line 2090
;2088:
;2089:#endif
;2090:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2091
;2091:}
LABELV $968
endproc CG_DrawCrosshairNames 36 16
proc CG_DrawSpectator 0 16
line 2101
;2092:
;2093:
;2094://==============================================================================
;2095:
;2096:/*
;2097:=================
;2098:CG_DrawSpectator
;2099:=================
;2100:*/
;2101:static void CG_DrawSpectator(void) {
line 2102
;2102:	CG_DrawBigString(320 - 9 * 8, 440, "SPECTATOR", 1.0F);
CNSTI4 248
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $990
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2103
;2103:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $991
line 2104
;2104:		CG_DrawBigString(320 - 15 * 8, 460, "waiting to play", 1.0F);
CNSTI4 200
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $994
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2105
;2105:	}
ADDRGP4 $992
JUMPV
LABELV $991
line 2106
;2106:	else if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $995
line 2107
;2107:		CG_DrawBigString(320 - 39 * 8, 460, "press ESC and use the JOIN menu to play", 1.0F);
CNSTI4 8
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $998
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2108
;2108:	}
LABELV $995
LABELV $992
line 2109
;2109:}
LABELV $989
endproc CG_DrawSpectator 0 16
proc CG_DrawVote 12 20
line 2116
;2110:
;2111:/*
;2112:=================
;2113:CG_DrawVote
;2114:=================
;2115:*/
;2116:static void CG_DrawVote(void) {
line 2120
;2117:	char	*s;
;2118:	int		sec;
;2119:
;2120:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31676
INDIRI4
CNSTI4 0
NEI4 $1000
line 2121
;2121:		return;
ADDRGP4 $999
JUMPV
LABELV $1000
line 2125
;2122:	}
;2123:
;2124:	// play a talk beep whenever it is modified
;2125:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31688
INDIRI4
CNSTI4 0
EQI4 $1003
line 2126
;2126:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31688
CNSTI4 0
ASGNI4
line 2127
;2127:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+153876+784
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2128
;2128:	}
LABELV $1003
line 2130
;2129:
;2130:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
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
line 2131
;2131:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1011
line 2132
;2132:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2133
;2133:	}
LABELV $1011
line 2140
;2134:#ifdef MISSIONPACK
;2135:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2136:	CG_DrawSmallString( 0, 58, s, 1.0F );
;2137:	s = "or press ESC then click Vote";
;2138:	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
;2139:#else
;2140:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
ADDRGP4 $1013
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
line 2141
;2141:	CG_DrawSmallString( 0, 58, s, 1.0F );
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
line 2143
;2142:#endif
;2143:}
LABELV $999
endproc CG_DrawVote 12 20
proc CG_DrawTeamVote 24 20
line 2150
;2144:
;2145:/*
;2146:=================
;2147:CG_DrawTeamVote
;2148:=================
;2149:*/
;2150:static void CG_DrawTeamVote(void) {
line 2154
;2151:	char	*s;
;2152:	int		sec, cs_offset;
;2153:
;2154:	if ( cgs.clientinfo->team == TEAM_RED )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 1
NEI4 $1018
line 2155
;2155:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2156
;2156:	else if ( cgs.clientinfo->team == TEAM_BLUE )
ADDRGP4 cgs+40972+68
INDIRI4
CNSTI4 2
NEI4 $1017
line 2157
;2157:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2159
;2158:	else
;2159:		return;
LABELV $1023
LABELV $1019
line 2161
;2160:
;2161:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1026
line 2162
;2162:		return;
ADDRGP4 $1017
JUMPV
LABELV $1026
line 2166
;2163:	}
;2164:
;2165:	// play a talk beep whenever it is modified
;2166:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1029
line 2167
;2167:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
CNSTI4 0
ASGNI4
line 2168
;2168:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+153876+784
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2169
;2169:	}
LABELV $1029
line 2171
;2170:
;2171:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
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
line 2172
;2172:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1037
line 2173
;2173:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2174
;2174:	}
LABELV $1037
line 2175
;2175:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1039
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
line 2177
;2176:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2177:	CG_DrawSmallString( 0, 90, s, 1.0F );
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
line 2178
;2178:}
LABELV $1017
endproc CG_DrawTeamVote 24 20
proc CG_DrawScoreboard 4 0
line 2181
;2179:
;2180:
;2181:static qboolean CG_DrawScoreboard() {
line 2246
;2182:#ifdef MISSIONPACK
;2183:	static qboolean firstTime = qtrue;
;2184:	float fade, *fadeColor;
;2185:
;2186:	if (menuScoreboard) {
;2187:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2188:	}
;2189:	if (cg_paused.integer) {
;2190:		cg.deferredPlayerLoading = 0;
;2191:		firstTime = qtrue;
;2192:		return qfalse;
;2193:	}
;2194:
;2195:	// should never happen in Team Arena
;2196:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2197:		cg.deferredPlayerLoading = 0;
;2198:		firstTime = qtrue;
;2199:		return qfalse;
;2200:	}
;2201:
;2202:	// don't draw scoreboard during death while warmup up
;2203:	if ( cg.warmup && !cg.showScores ) {
;2204:		return qfalse;
;2205:	}
;2206:
;2207:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2208:		fade = 1.0;
;2209:		fadeColor = colorWhite;
;2210:	} else {
;2211:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;2212:		if ( !fadeColor ) {
;2213:			// next time scoreboard comes up, don't print killer
;2214:			cg.deferredPlayerLoading = 0;
;2215:			cg.killerName[0] = 0;
;2216:			firstTime = qtrue;
;2217:			return qfalse;
;2218:		}
;2219:		fade = *fadeColor;
;2220:	}																					  
;2221:
;2222:
;2223:	if (menuScoreboard == NULL) {
;2224:		if ( cgs.gametype >= GT_TEAM ) {
;2225:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2226:		} else {
;2227:			menuScoreboard = Menus_FindByName("score_menu");
;2228:		}
;2229:	}
;2230:
;2231:	if (menuScoreboard) {
;2232:		if (firstTime) {
;2233:			CG_SetScoreSelection(menuScoreboard);
;2234:			firstTime = qfalse;
;2235:		}
;2236:		Menu_Paint(menuScoreboard, qtrue);
;2237:	}
;2238:
;2239:	// load any models that have been deferred
;2240:	if ( ++cg.deferredPlayerLoading > 10 ) {
;2241:		CG_LoadDeferredPlayers();
;2242:	}
;2243:
;2244:	return qtrue;
;2245:#else
;2246:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1043
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2255
;2247:#endif
;2248:}
;2249:
;2250:/*
;2251:=================
;2252:CG_DrawIntermission
;2253:=================
;2254:*/
;2255:static void CG_DrawIntermission( void ) {
line 2263
;2256://	int key;
;2257:#ifdef MISSIONPACK
;2258:	//if (cg_singlePlayer.integer) {
;2259:	//	CG_DrawCenterString();
;2260:	//	return;
;2261:	//}
;2262:#else
;2263:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 2
NEI4 $1045
line 2264
;2264:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2265
;2265:		return;
ADDRGP4 $1044
JUMPV
LABELV $1045
line 2268
;2266:	}
;2267:#endif
;2268:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+116396
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 2269
;2269:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 0
INDIRI4
ASGNI4
line 2270
;2270:}
LABELV $1044
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 32 36
line 2277
;2271:
;2272:/*
;2273:=================
;2274:CG_DrawFollow
;2275:=================
;2276:*/
;2277:static qboolean CG_DrawFollow( void ) {
line 2282
;2278:	float		x;
;2279:	vec4_t		color;
;2280:	const char	*name;
;2281:
;2282:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1052
line 2283
;2283:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1051
JUMPV
LABELV $1052
line 2285
;2284:	}
;2285:	color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2286
;2286:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 2287
;2287:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2288
;2288:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 2291
;2289:
;2290:
;2291:	CG_DrawBigString( 320 - 9 * 8, 24, "following", 1.0F );
CNSTI4 248
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 $1058
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2293
;2292:
;2293:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
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
line 2295
;2294:
;2295:	x = 0.5 * ( 640 - GIANT_WIDTH * CG_DrawStrlen( name ) );
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
line 2297
;2296:
;2297:	CG_DrawStringExt( x, 40, name, color, qtrue, qtrue, GIANT_WIDTH, GIANT_HEIGHT, 0 );
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
line 2299
;2298:
;2299:	return qtrue;
CNSTI4 1
RETI4
LABELV $1051
endproc CG_DrawFollow 32 36
proc CG_DrawAmmoWarning 12 16
line 2309
;2300:}
;2301:
;2302:
;2303:
;2304:/*
;2305:=================
;2306:CG_DrawAmmoWarning
;2307:=================
;2308:*/
;2309:static void CG_DrawAmmoWarning( void ) {
line 2313
;2310:	const char	*s;
;2311:	int			w;
;2312:
;2313:	if ( cg_drawAmmoWarning.integer == 0 ) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1063
line 2314
;2314:		return;
ADDRGP4 $1062
JUMPV
LABELV $1063
line 2317
;2315:	}
;2316:
;2317:	if ( !cg.lowAmmoWarning ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 0
NEI4 $1066
line 2318
;2318:		return;
ADDRGP4 $1062
JUMPV
LABELV $1066
line 2321
;2319:	}
;2320:
;2321:	if ( cg.lowAmmoWarning == 2 ) {
ADDRGP4 cg+126460
INDIRI4
CNSTI4 2
NEI4 $1069
line 2322
;2322:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1072
ASGNP4
line 2323
;2323:	} else {
ADDRGP4 $1070
JUMPV
LABELV $1069
line 2324
;2324:		s = "LOW AMMO WARNING";
ADDRLP4 0
ADDRGP4 $1073
ASGNP4
line 2325
;2325:	}
LABELV $1070
line 2326
;2326:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2327
;2327:	CG_DrawSmallString(320 - w / 2, 64, s, 1.0F);
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
line 2328
;2328:}
LABELV $1062
endproc CG_DrawAmmoWarning 12 16
proc CG_DrawWarmup 56 36
line 2377
;2329:
;2330:
;2331:#ifdef MISSIONPACK
;2332:/*
;2333:=================
;2334:CG_DrawProxWarning
;2335:=================
;2336:*/
;2337:static void CG_DrawProxWarning( void ) {
;2338:	char s [32];
;2339:	int			w;
;2340:  static int proxTime;
;2341:  static int proxCounter;
;2342:  static int proxTick;
;2343:
;2344:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;2345:    proxTime = 0;
;2346:		return;
;2347:	}
;2348:
;2349:  if (proxTime == 0) {
;2350:    proxTime = cg.time + 5000;
;2351:    proxCounter = 5;
;2352:    proxTick = 0;
;2353:  }
;2354:
;2355:  if (cg.time > proxTime) {
;2356:    proxTick = proxCounter--;
;2357:    proxTime = cg.time + 1000;
;2358:  }
;2359:
;2360:  if (proxTick != 0) {
;2361:    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
;2362:  } else {
;2363:    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
;2364:  }
;2365:
;2366:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
;2367:	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
;2368:}
;2369:#endif
;2370:
;2371:
;2372:/*
;2373:=================
;2374:CG_DrawWarmup
;2375:=================
;2376:*/
;2377:static void CG_DrawWarmup( void ) {
line 2386
;2378:	int			w;
;2379:	int			sec;
;2380:	int			i;
;2381:	float scale;
;2382:	clientInfo_t	*ci1, *ci2;
;2383:	int			cw;
;2384:	const char	*s;
;2385:
;2386:	sec = cg.warmup;
ADDRLP4 4
ADDRGP4 cg+126724
INDIRI4
ASGNI4
line 2387
;2387:	if ( !sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1076
line 2388
;2388:		return;
ADDRGP4 $1074
JUMPV
LABELV $1076
line 2391
;2389:	}
;2390:
;2391:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1078
line 2392
;2392:		s = "Waiting for players";		
ADDRLP4 8
ADDRGP4 $1080
ASGNP4
line 2393
;2393:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
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
line 2394
;2394:		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
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
line 2395
;2395:		cg.warmupCount = 0;
ADDRGP4 cg+126728
CNSTI4 0
ASGNI4
line 2396
;2396:		return;
ADDRGP4 $1074
JUMPV
LABELV $1078
line 2399
;2397:	}
;2398:
;2399:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $1082
line 2401
;2400:		// find the two active players
;2401:		ci1 = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 2402
;2402:		ci2 = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 2403
;2403:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1088
JUMPV
LABELV $1085
line 2404
;2404:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
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
EQI4 $1090
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1090
line 2405
;2405:				if ( !ci1 ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1095
line 2406
;2406:					ci1 = &cgs.clientinfo[i];
ADDRLP4 20
CNSTI4 1732
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2407
;2407:				} else {
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2408
;2408:					ci2 = &cgs.clientinfo[i];
ADDRLP4 24
CNSTI4 1732
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2409
;2409:				}
LABELV $1096
line 2410
;2410:			}
LABELV $1090
line 2411
;2411:		}
LABELV $1086
line 2403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1088
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $1085
line 2413
;2412:
;2413:		if ( ci1 && ci2 ) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1083
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $1083
line 2414
;2414:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1101
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
line 2419
;2415:#ifdef MISSIONPACK
;2416:			w = CG_Text_Width(s, 0.6f, 0);
;2417:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2418:#else
;2419:			w = CG_DrawStrlen( s );
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
line 2420
;2420:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1102
line 2421
;2421:				cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2422
;2422:			} else {
ADDRGP4 $1103
JUMPV
LABELV $1102
line 2423
;2423:				cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2424
;2424:			}
LABELV $1103
line 2425
;2425:			CG_DrawStringExt( 320 - w * cw/2, 20,s, colorWhite, 
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
line 2429
;2426:					qfalse, qtrue, cw, (int)(cw * 1.5f), 0 );
;2427:			
;2428:#endif
;2429:		}
line 2430
;2430:	} else {
ADDRGP4 $1083
JUMPV
LABELV $1082
line 2431
;2431:		if ( cgs.g_GameMode == 1) {
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 1
NEI4 $1104
line 2432
;2432:			s = "Arsenal";
ADDRLP4 8
ADDRGP4 $1107
ASGNP4
line 2433
;2433:		} else if ( cgs.gametype == GT_FFA && cgs.g_GameMode == 0) {
ADDRGP4 $1105
JUMPV
LABELV $1104
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 cgs+31456
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1108
ADDRGP4 cgs+154988
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1108
line 2434
;2434:			s = "Free For All";
ADDRLP4 8
ADDRGP4 $1112
ASGNP4
line 2435
;2435:		} else if ( cgs.g_GameMode == 2) {
ADDRGP4 $1109
JUMPV
LABELV $1108
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 2
NEI4 $1113
line 2436
;2436:			s = "Survival";
ADDRLP4 8
ADDRGP4 $1116
ASGNP4
line 2437
;2437:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $1114
JUMPV
LABELV $1113
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
NEI4 $1117
line 2438
;2438:			if ( cgs.g_GameMode == 3) 
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 3
NEI4 $1120
line 2439
;2439:			{
line 2440
;2440:				s = "Trepidation";
ADDRLP4 8
ADDRGP4 $1123
ASGNP4
line 2441
;2441:			} else if ( cgs.g_GameMode == 2) 
ADDRGP4 $1118
JUMPV
LABELV $1120
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 2
NEI4 $1124
line 2442
;2442:			{
line 2443
;2443:				s = "Team Survival";
ADDRLP4 8
ADDRGP4 $1127
ASGNP4
line 2444
;2444:			} else {
ADDRGP4 $1118
JUMPV
LABELV $1124
line 2446
;2445:				
;2446:				s = "Team Deathmatch";
ADDRLP4 8
ADDRGP4 $1128
ASGNP4
line 2447
;2447:			}
line 2448
;2448:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $1118
JUMPV
LABELV $1117
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $1129
line 2449
;2449:			s = "Capture the Flag";
ADDRLP4 8
ADDRGP4 $1132
ASGNP4
line 2458
;2450:#ifdef MISSIONPACK
;2451:		} else if ( cgs.gametype == GT_1FCTF ) {
;2452:			s = "One Flag CTF";
;2453:		} else if ( cgs.gametype == GT_OBELISK ) {
;2454:			s = "Overload";
;2455:		} else if ( cgs.gametype == GT_HARVESTER ) {
;2456:			s = "Harvester";
;2457:#endif
;2458:		} else {
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2459
;2459:			s = "";
ADDRLP4 8
ADDRGP4 $1133
ASGNP4
line 2460
;2460:		}
LABELV $1130
LABELV $1118
LABELV $1114
LABELV $1109
LABELV $1105
line 2465
;2461:#ifdef MISSIONPACK
;2462:		w = CG_Text_Width(s, 0.6f, 0);
;2463:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2464:#else
;2465:		w = CG_DrawStrlen( s );
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
line 2466
;2466:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $1134
line 2467
;2467:			cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 2468
;2468:		} else {
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2469
;2469:			cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 2470
;2470:		}
LABELV $1135
line 2471
;2471:		CG_DrawStringExt( 320 - w * cw/2, 25,s, colorWhite, 
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
line 2474
;2472:				qfalse, qtrue, cw, (int)(cw * 1.1f), 0 );
;2473:#endif
;2474:	}
LABELV $1083
line 2476
;2475:
;2476:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2477
;2477:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1137
line 2478
;2478:		cg.warmup = 0;
ADDRGP4 cg+126724
CNSTI4 0
ASGNI4
line 2479
;2479:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2480
;2480:	}
LABELV $1137
line 2482
;2481:	
;2482:	if(cgs.g_GameMode == 1)
ADDRGP4 cgs+154988
INDIRI4
CNSTI4 1
NEI4 $1140
line 2483
;2483:	{
line 2484
;2484:		s = va( "You Have %i Seconds To Join This Round", sec + 1 );
ADDRGP4 $1143
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
line 2485
;2485:	} else
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2486
;2486:	{
line 2487
;2487:		s = va( "Starts in: %i", sec + 1 );
ADDRGP4 $1144
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
line 2488
;2488:	}
LABELV $1141
line 2491
;2489:	
;2490:
;2491:	if ( sec != cg.warmupCount ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+126728
INDIRI4
EQI4 $1145
line 2492
;2492:		cg.warmupCount = sec;
ADDRGP4 cg+126728
ADDRLP4 4
INDIRI4
ASGNI4
line 2493
;2493:		switch ( sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1151
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1154
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1157
ADDRGP4 $1150
JUMPV
LABELV $1151
line 2495
;2494:		case 0:
;2495:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1020
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2496
;2496:			break;
ADDRGP4 $1150
JUMPV
LABELV $1154
line 2498
;2497:		case 1:
;2498:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2499
;2499:			break;
ADDRGP4 $1150
JUMPV
LABELV $1157
line 2501
;2500:		case 2:
;2501:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+153876+1012
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2502
;2502:			break;
line 2504
;2503:		default:
;2504:			break;
LABELV $1150
line 2506
;2505:		}
;2506:	}
LABELV $1145
line 2507
;2507:	scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2508
;2508:	switch ( cg.warmupCount ) {
ADDRLP4 32
ADDRGP4 cg+126728
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1163
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $1164
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $1165
ADDRGP4 $1160
JUMPV
LABELV $1163
line 2510
;2509:	case 0:
;2510:		cw = 28;
ADDRLP4 12
CNSTI4 28
ASGNI4
line 2511
;2511:		scale = 0.54f;
ADDRLP4 28
CNSTF4 1057635697
ASGNF4
line 2512
;2512:		break;
ADDRGP4 $1161
JUMPV
LABELV $1164
line 2514
;2513:	case 1:
;2514:		cw = 24;
ADDRLP4 12
CNSTI4 24
ASGNI4
line 2515
;2515:		scale = 0.51f;
ADDRLP4 28
CNSTF4 1057132380
ASGNF4
line 2516
;2516:		break;
ADDRGP4 $1161
JUMPV
LABELV $1165
line 2518
;2517:	case 2:
;2518:		cw = 20;
ADDRLP4 12
CNSTI4 20
ASGNI4
line 2519
;2519:		scale = 0.48f;
ADDRLP4 28
CNSTF4 1056293519
ASGNF4
line 2520
;2520:		break;
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2522
;2521:	default:
;2522:		cw = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 2523
;2523:		scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 2524
;2524:		break;
LABELV $1161
line 2531
;2525:	}
;2526:
;2527:#ifdef MISSIONPACK
;2528:		w = CG_Text_Width(s, scale, 0);
;2529:		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2530:#else
;2531:	w = CG_DrawStrlen( s );
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
line 2532
;2532:	CG_DrawStringExt( 320 - w * cw/2, 70, s, colorWhite, 
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
line 2535
;2533:			qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
;2534:#endif
;2535:}
LABELV $1074
endproc CG_DrawWarmup 56 36
proc CG_Draw2D 8 0
line 2560
;2536:
;2537://==================================================================================
;2538:#ifdef MISSIONPACK
;2539:/* 
;2540:=================
;2541:CG_DrawTimedMenus
;2542:=================
;2543:*/
;2544:void CG_DrawTimedMenus() {
;2545:	if (cg.voiceTime) {
;2546:		int t = cg.time - cg.voiceTime;
;2547:		if ( t > 2500 ) {
;2548:			Menus_CloseByName("voiceMenu");
;2549:			trap_Cvar_Set("cl_conXOffset", "0");
;2550:			cg.voiceTime = 0;
;2551:		}
;2552:	}
;2553:}
;2554:#endif
;2555:/*
;2556:=================
;2557:CG_Draw2D
;2558:=================
;2559:*/
;2560:static void CG_Draw2D( void ) {
line 2567
;2561:#ifdef MISSIONPACK
;2562:	if (cgs.orderPending && cg.time > cgs.orderTime) {
;2563:		CG_CheckOrderPending();
;2564:	}
;2565:#endif
;2566:	// if we are taking a levelshot for the menu, don't draw anything
;2567:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1167
line 2568
;2568:		return;
ADDRGP4 $1166
JUMPV
LABELV $1167
line 2571
;2569:	}
;2570:
;2571:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1170
line 2572
;2572:		return;
ADDRGP4 $1166
JUMPV
LABELV $1170
line 2575
;2573:	}
;2574:
;2575:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1173
line 2576
;2576:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2577
;2577:		return;
ADDRGP4 $1166
JUMPV
LABELV $1173
line 2585
;2578:	}
;2579:
;2580:/*
;2581:	if (cg.cameraMode) {
;2582:		return;
;2583:	}
;2584:*/
;2585:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1176
line 2586
;2586:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2587
;2587:		CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2588
;2588:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2589
;2589:	} else {
ADDRGP4 $1177
JUMPV
LABELV $1176
line 2591
;2590:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2591:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+116388
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1179
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $1179
line 2599
;2592:
;2593:#ifdef MISSIONPACK
;2594:			if ( cg_drawStatus.integer ) {
;2595:				Menu_PaintAll();
;2596:				CG_DrawTimedMenus();
;2597:			}
;2598:#else
;2599:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2602
;2600:#endif
;2601:      
;2602:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2607
;2603:
;2604:#ifdef MISSIONPACK
;2605:			CG_DrawProxWarning();
;2606:#endif      
;2607:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2608
;2608:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2609
;2609:			CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2612
;2610:
;2611:#ifndef MISSIONPACK
;2612:			CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2616
;2613:#else
;2614:			//CG_DrawPersistantPowerup();
;2615:#endif
;2616:			CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2617
;2617:			CG_DrawScanner();  // Shafe - Trep - Radar
ADDRGP4 CG_DrawScanner
CALLV
pop
line 2618
;2618:		}
LABELV $1179
line 2620
;2619:    
;2620:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $1183
line 2622
;2621:#ifndef MISSIONPACK
;2622:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2624
;2623:#endif
;2624:		}
LABELV $1183
line 2625
;2625:	}
LABELV $1177
line 2627
;2626:
;2627:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2628
;2628:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2630
;2629:
;2630:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2637
;2631:
;2632:#ifdef MISSIONPACK
;2633:	if (!cg_paused.integer) {
;2634:		CG_DrawUpperRight();
;2635:	}
;2636:#else
;2637:	CG_DrawUpperRight();
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2641
;2638:#endif
;2639:
;2640:#ifndef MISSIONPACK
;2641:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2642
;2642:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2645
;2643:#endif
;2644:
;2645:	if ( !CG_DrawFollow() ) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1186
line 2646
;2646:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2647
;2647:	}
LABELV $1186
line 2650
;2648:
;2649:	// don't draw center string if scoreboard is up
;2650:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+116392
ADDRLP4 4
INDIRI4
ASGNI4
line 2651
;2651:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+116392
INDIRI4
CNSTI4 0
NEI4 $1189
line 2652
;2652:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2653
;2653:	}
LABELV $1189
line 2654
;2654:}
LABELV $1166
endproc CG_Draw2D 8 0
proc CG_DrawTourneyScoreboard 0 0
line 2657
;2655:
;2656:
;2657:static void CG_DrawTourneyScoreboard() {
line 2660
;2658:#ifdef MISSIONPACK
;2659:#else
;2660:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2662
;2661:#endif
;2662:}
LABELV $1192
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 24 4
line 2671
;2663:
;2664:/*
;2665:=====================
;2666:CG_DrawActive
;2667:
;2668:Perform all drawing needed to completely fill the screen
;2669:=====================
;2670:*/
;2671:void CG_DrawActive( stereoFrame_t stereoView ) {
line 2676
;2672:	float		separation;
;2673:	vec3_t		baseOrg;
;2674:
;2675:	// optionally draw the info screen instead
;2676:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1194
line 2677
;2677:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2678
;2678:		return;
ADDRGP4 $1193
JUMPV
LABELV $1194
line 2682
;2679:	}
;2680:
;2681:	// optionally draw the tournement scoreboard instead
;2682:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1197
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1197
line 2683
;2683:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 2684
;2684:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2685
;2685:		return;
ADDRGP4 $1193
JUMPV
LABELV $1197
line 2688
;2686:	}
;2687:
;2688:	switch ( stereoView ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1204
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1205
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $1207
ADDRGP4 $1201
JUMPV
LABELV $1204
line 2690
;2689:	case STEREO_CENTER:
;2690:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2691
;2691:		break;
ADDRGP4 $1202
JUMPV
LABELV $1205
line 2693
;2692:	case STEREO_LEFT:
;2693:		separation = -cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2694
;2694:		break;
ADDRGP4 $1202
JUMPV
LABELV $1207
line 2696
;2695:	case STEREO_RIGHT:
;2696:		separation = cg_stereoSeparation.value / 2;
ADDRLP4 0
ADDRGP4 cg_stereoSeparation+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2697
;2697:		break;
ADDRGP4 $1202
JUMPV
LABELV $1201
line 2699
;2698:	default:
;2699:		separation = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2700
;2700:		CG_Error( "CG_DrawActive: Undefined stereoView" );
ADDRGP4 $1209
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2701
;2701:	}
LABELV $1202
line 2705
;2702:
;2703:
;2704:	// clear around the rendered view if sized down
;2705:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2708
;2706:
;2707:	// offset vieworg appropriately if we're doing stereo separation
;2708:	VectorCopy( cg.refdef.vieworg, baseOrg );
ADDRLP4 4
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 2709
;2709:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1212
line 2710
;2710:		VectorMA( cg.refdef.vieworg, -separation, cg.refdef.viewaxis[1], cg.refdef.vieworg );
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
line 2711
;2711:	}
LABELV $1212
line 2714
;2712:
;2713:	// draw 3D view
;2714:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+111104
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2717
;2715:
;2716:	// restore original viewpoint if running stereo
;2717:	if ( separation != 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1242
line 2718
;2718:		VectorCopy( baseOrg, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 4
INDIRB
ASGNB 12
line 2719
;2719:	}
LABELV $1242
line 2722
;2720:
;2721:	// draw status bar and other floating elements
;2722: 	CG_Draw2D();
ADDRGP4 CG_Draw2D
CALLV
pop
line 2723
;2723:}
LABELV $1193
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
LABELV $1209
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
LABELV $1144
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
LABELV $1143
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
LABELV $1133
byte 1 0
align 1
LABELV $1132
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
LABELV $1128
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
LABELV $1127
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
LABELV $1123
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
LABELV $1116
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
LABELV $1112
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
LABELV $1107
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1101
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
LABELV $1080
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
LABELV $1073
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
LABELV $1072
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
LABELV $1058
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
LABELV $1039
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
LABELV $1013
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
LABELV $998
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
LABELV $994
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
LABELV $990
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
LABELV $862
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $799
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
LABELV $795
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
LABELV $764
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
