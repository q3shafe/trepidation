code
proc UI_PlayerInfo_SetWeapon 84 8
file "../ui_players.c"
line 34
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// ui_players.c
;4:
;5:#include "ui_local.h"
;6:
;7:
;8:#define UI_TIMER_GESTURE		2300
;9:#define UI_TIMER_JUMP			1000
;10:#define UI_TIMER_LAND			130
;11:#define UI_TIMER_WEAPON_SWITCH	300
;12:#define UI_TIMER_ATTACK			500
;13:#define	UI_TIMER_MUZZLE_FLASH	20
;14:#define	UI_TIMER_WEAPON_DELAY	250
;15:
;16:#define JUMP_HEIGHT				56
;17:
;18:#define SWINGSPEED				0.3f
;19:
;20:#define SPIN_SPEED				0.9f
;21:#define COAST_TIME				1000
;22:
;23:
;24:static int			dp_realtime;
;25:static float		jumpHeight;
;26:sfxHandle_t weaponChangeSound;
;27:
;28:
;29:/*
;30:===============
;31:UI_PlayerInfo_SetWeapon
;32:===============
;33:*/
;34:static void UI_PlayerInfo_SetWeapon( playerInfo_t *pi, weapon_t weaponNum ) {
line 38
;35:	gitem_t *	item;
;36:	char		path[MAX_QPATH];
;37:
;38:	pi->currentWeapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $90
line 40
;39:tryagain:
;40:	pi->realWeapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1272
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 41
;41:	pi->weaponModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 42
;42:	pi->barrelModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 43
;43:	pi->flashModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 45
;44:
;45:	if ( weaponNum == WP_NONE ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $91
line 46
;46:		return;
ADDRGP4 $89
JUMPV
LABELV $91
line 49
;47:	}
;48:
;49:	for ( item = bg_itemlist + 1; item->classname ; item++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $96
JUMPV
LABELV $93
line 50
;50:		if ( item->giType != IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
EQI4 $98
line 51
;51:			continue;
ADDRGP4 $94
JUMPV
LABELV $98
line 53
;52:		}
;53:		if ( item->giTag == weaponNum ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $100
line 54
;54:			break;
ADDRGP4 $95
JUMPV
LABELV $100
line 56
;55:		}
;56:	}
LABELV $94
line 49
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $96
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
LABELV $95
line 58
;57:
;58:	if ( item->classname ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $102
line 59
;59:		pi->weaponModel = trap_R_RegisterModel( item->world_model[0] );
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 60
;60:	}
LABELV $102
line 62
;61:
;62:	if( pi->weaponModel == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
CNSTI4 0
NEI4 $104
line 63
;63:		if( weaponNum == WP_MACHINEGUN ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $106
line 64
;64:			weaponNum = WP_NONE;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 65
;65:			goto tryagain;
ADDRGP4 $90
JUMPV
LABELV $106
line 67
;66:		}
;67:		weaponNum = WP_MACHINEGUN;
ADDRFP4 4
CNSTI4 2
ASGNI4
line 68
;68:		goto tryagain;
ADDRGP4 $90
JUMPV
LABELV $104
line 71
;69:	}
;70:
;71:	if ( weaponNum == WP_MACHINEGUN || weaponNum == WP_GAUNTLET || weaponNum == WP_BFG ) {
ADDRLP4 68
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $111
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $111
ADDRLP4 68
INDIRI4
CNSTI4 9
NEI4 $108
LABELV $111
line 72
;72:		strcpy( path, item->world_model[0] );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 73
;73:		COM_StripExtension( path, path );
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 74
;74:		strcat( path, "_barrel.md3" );
ADDRLP4 4
ARGP4
ADDRGP4 $112
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 75
;75:		pi->barrelModel = trap_R_RegisterModel( path );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 76
;76:	}
LABELV $108
line 78
;77:
;78:	strcpy( path, item->world_model[0] );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 79
;79:	COM_StripExtension( path, path );
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 80
;80:	strcat( path, "_flash.md3" );
ADDRLP4 4
ARGP4
ADDRGP4 $113
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 81
;81:	pi->flashModel = trap_R_RegisterModel( path );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 83
;82:
;83:	switch( weaponNum ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $114
ADDRLP4 76
INDIRI4
CNSTI4 10
GTI4 $114
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $127-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $127
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
code
LABELV $117
line 85
;84:	case WP_GAUNTLET:
;85:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 86
;86:		break;
ADDRGP4 $115
JUMPV
LABELV $118
line 89
;87:
;88:	case WP_MACHINEGUN:
;89:		MAKERGB( pi->flashDlightColor, 1, 1, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 0
ASGNF4
line 90
;90:		break;
ADDRGP4 $115
JUMPV
LABELV $119
line 93
;91:
;92:	case WP_SHOTGUN:
;93:		MAKERGB( pi->flashDlightColor, 1, 1, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 0
ASGNF4
line 94
;94:		break;
ADDRGP4 $115
JUMPV
LABELV $120
line 97
;95:
;96:	case WP_GRENADE_LAUNCHER:
;97:		MAKERGB( pi->flashDlightColor, 1, 0.7f, 0.5f );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1056964608
ASGNF4
line 98
;98:		break;
ADDRGP4 $115
JUMPV
LABELV $121
line 101
;99:
;100:	case WP_ROCKET_LAUNCHER:
;101:		MAKERGB( pi->flashDlightColor, 1, 0.75f, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1061158912
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 0
ASGNF4
line 102
;102:		break;
ADDRGP4 $115
JUMPV
LABELV $122
line 105
;103:
;104:	case WP_LIGHTNING:
;105:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 106
;106:		break;
ADDRGP4 $115
JUMPV
LABELV $123
line 109
;107:
;108:	case WP_RAILGUN:
;109:		MAKERGB( pi->flashDlightColor, 1, 0.5f, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1056964608
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 0
ASGNF4
line 110
;110:		break;
ADDRGP4 $115
JUMPV
LABELV $124
line 113
;111:
;112:	case WP_PLASMAGUN:
;113:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 114
;114:		break;
ADDRGP4 $115
JUMPV
LABELV $125
line 117
;115:
;116:	case WP_BFG:
;117:		MAKERGB( pi->flashDlightColor, 1, 0.7f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 118
;118:		break;
ADDRGP4 $115
JUMPV
LABELV $126
line 121
;119:
;120:	case WP_GRAPPLING_HOOK:
;121:		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 122
;122:		break;
ADDRGP4 $115
JUMPV
LABELV $114
line 125
;123:
;124:	default:
;125:		MAKERGB( pi->flashDlightColor, 1, 1, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1176
ADDP4
CNSTF4 1065353216
ASGNF4
line 126
;126:		break;
LABELV $115
line 128
;127:	}
;128:}
LABELV $89
endproc UI_PlayerInfo_SetWeapon 84 8
proc UI_ForceLegsAnim 8 0
line 136
;129:
;130:
;131:/*
;132:===============
;133:UI_ForceLegsAnim
;134:===============
;135:*/
;136:static void UI_ForceLegsAnim( playerInfo_t *pi, int anim ) {
line 137
;137:	pi->legsAnim = ( ( pi->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 139
;138:
;139:	if ( anim == LEGS_JUMP ) {
ADDRFP4 4
INDIRI4
CNSTI4 18
NEI4 $130
line 140
;140:		pi->legsAnimationTimer = UI_TIMER_JUMP;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1000
ASGNI4
line 141
;141:	}
LABELV $130
line 142
;142:}
LABELV $129
endproc UI_ForceLegsAnim 8 0
proc UI_SetLegsAnim 0 8
line 150
;143:
;144:
;145:/*
;146:===============
;147:UI_SetLegsAnim
;148:===============
;149:*/
;150:static void UI_SetLegsAnim( playerInfo_t *pi, int anim ) {
line 151
;151:	if ( pi->pendingLegsAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $133
line 152
;152:		anim = pi->pendingLegsAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
ASGNI4
line 153
;153:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 154
;154:	}
LABELV $133
line 155
;155:	UI_ForceLegsAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 156
;156:}
LABELV $132
endproc UI_SetLegsAnim 0 8
proc UI_ForceTorsoAnim 12 0
line 164
;157:
;158:
;159:/*
;160:===============
;161:UI_ForceTorsoAnim
;162:===============
;163:*/
;164:static void UI_ForceTorsoAnim( playerInfo_t *pi, int anim ) {
line 165
;165:	pi->torsoAnim = ( ( pi->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 4
INDIRI4
BORI4
ASGNI4
line 167
;166:
;167:	if ( anim == TORSO_GESTURE ) {
ADDRFP4 4
INDIRI4
CNSTI4 6
NEI4 $136
line 168
;168:		pi->torsoAnimationTimer = UI_TIMER_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 2300
ASGNI4
line 169
;169:	}
LABELV $136
line 171
;170:
;171:	if ( anim == TORSO_ATTACK || anim == TORSO_ATTACK2 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 7
EQI4 $140
ADDRLP4 8
INDIRI4
CNSTI4 8
NEI4 $138
LABELV $140
line 172
;172:		pi->torsoAnimationTimer = UI_TIMER_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 500
ASGNI4
line 173
;173:	}
LABELV $138
line 174
;174:}
LABELV $135
endproc UI_ForceTorsoAnim 12 0
proc UI_SetTorsoAnim 0 8
line 182
;175:
;176:
;177:/*
;178:===============
;179:UI_SetTorsoAnim
;180:===============
;181:*/
;182:static void UI_SetTorsoAnim( playerInfo_t *pi, int anim ) {
line 183
;183:	if ( pi->pendingTorsoAnim ) {
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 184
;184:		anim = pi->pendingTorsoAnim;
ADDRFP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
ASGNI4
line 185
;185:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 186
;186:	}
LABELV $142
line 188
;187:
;188:	UI_ForceTorsoAnim( pi, anim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 189
;189:}
LABELV $141
endproc UI_SetTorsoAnim 0 8
proc UI_TorsoSequencing 16 8
line 197
;190:
;191:
;192:/*
;193:===============
;194:UI_TorsoSequencing
;195:===============
;196:*/
;197:static void UI_TorsoSequencing( playerInfo_t *pi ) {
line 200
;198:	int		currentAnim;
;199:
;200:	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 202
;201:
;202:	if ( pi->weapon != pi->currentWeapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
EQI4 $145
line 203
;203:		if ( currentAnim != TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $147
line 204
;204:			pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 300
ASGNI4
line 205
;205:			UI_ForceTorsoAnim( pi, TORSO_DROP );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 206
;206:		}
LABELV $147
line 207
;207:	}
LABELV $145
line 209
;208:
;209:	if ( pi->torsoAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
INDIRI4
CNSTI4 0
LEI4 $149
line 210
;210:		return;
ADDRGP4 $144
JUMPV
LABELV $149
line 213
;211:	}
;212:
;213:	if( currentAnim == TORSO_GESTURE ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $151
line 214
;214:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 215
;215:		return;
ADDRGP4 $144
JUMPV
LABELV $151
line 218
;216:	}
;217:
;218:	if( currentAnim == TORSO_ATTACK || currentAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $155
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $153
LABELV $155
line 219
;219:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 220
;220:		return;
ADDRGP4 $144
JUMPV
LABELV $153
line 223
;221:	}
;222:
;223:	if ( currentAnim == TORSO_DROP ) {
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $156
line 224
;224:		UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 225
;225:		pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 300
ASGNI4
line 226
;226:		UI_ForceTorsoAnim( pi, TORSO_RAISE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 227
;227:		return;
ADDRGP4 $144
JUMPV
LABELV $156
line 230
;228:	}
;229:
;230:	if ( currentAnim == TORSO_RAISE ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $158
line 231
;231:		UI_SetTorsoAnim( pi, TORSO_STAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 UI_SetTorsoAnim
CALLV
pop
line 232
;232:		return;
LABELV $158
line 234
;233:	}
;234:}
LABELV $144
endproc UI_TorsoSequencing 16 8
proc UI_LegsSequencing 8 8
line 242
;235:
;236:
;237:/*
;238:===============
;239:UI_LegsSequencing
;240:===============
;241:*/
;242:static void UI_LegsSequencing( playerInfo_t *pi ) {
line 245
;243:	int		currentAnim;
;244:
;245:	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 247
;246:
;247:	if ( pi->legsAnimationTimer > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
LEI4 $161
line 248
;248:		if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $160
line 249
;249:			jumpHeight = JUMP_HEIGHT * sin( M_PI * ( UI_TIMER_JUMP - pi->legsAnimationTimer ) / UI_TIMER_JUMP );
CNSTF4 1078530011
CNSTI4 1000
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 jumpHeight
CNSTF4 1113587712
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 250
;250:		}
line 251
;251:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 254
;252:	}
;253:
;254:	if ( currentAnim == LEGS_JUMP ) {
ADDRLP4 0
INDIRI4
CNSTI4 18
NEI4 $165
line 255
;255:		UI_ForceLegsAnim( pi, LEGS_LAND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 256
;256:		pi->legsAnimationTimer = UI_TIMER_LAND;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 130
ASGNI4
line 257
;257:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 258
;258:		return;
ADDRGP4 $160
JUMPV
LABELV $165
line 261
;259:	}
;260:
;261:	if ( currentAnim == LEGS_LAND ) {
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $167
line 262
;262:		UI_SetLegsAnim( pi, LEGS_IDLE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 UI_SetLegsAnim
CALLV
pop
line 263
;263:		return;
LABELV $167
line 265
;264:	}
;265:}
LABELV $160
endproc UI_LegsSequencing 8 8
proc UI_PositionEntityOnTag 84 24
line 274
;266:
;267:
;268:/*
;269:======================
;270:UI_PositionEntityOnTag
;271:======================
;272:*/
;273:static void UI_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;274:							clipHandle_t parentModel, char *tagName ) {
line 279
;275:	int				i;
;276:	orientation_t	lerped;
;277:	
;278:	// lerp the tag
;279:	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 283
;280:		1.0 - parent->backlerp, tagName );
;281:
;282:	// FIXME: allow origin offsets along tag?
;283:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 284
;284:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $170
line 285
;285:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 286
;286:	}
LABELV $171
line 284
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $170
line 289
;287:
;288:	// cast away const because of compiler problems
;289:	MatrixMultiply( lerped.axis, ((refEntity_t*)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 290
;290:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 291
;291:}
LABELV $169
endproc UI_PositionEntityOnTag 84 24
proc UI_PositionRotatedEntityOnTag 120 24
line 300
;292:
;293:
;294:/*
;295:======================
;296:UI_PositionRotatedEntityOnTag
;297:======================
;298:*/
;299:static void UI_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;300:							clipHandle_t parentModel, char *tagName ) {
line 306
;301:	int				i;
;302:	orientation_t	lerped;
;303:	vec3_t			tempAxis[3];
;304:
;305:	// lerp the tag
;306:	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_CM_LerpTag
CALLI4
pop
line 310
;307:		1.0 - parent->backlerp, tagName );
;308:
;309:	// FIXME: allow origin offsets along tag?
;310:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 311
;311:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $176
line 312
;312:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 313
;313:	}
LABELV $177
line 311
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $176
line 316
;314:
;315:	// cast away const because of compiler problems
;316:	MatrixMultiply( entity->axis, ((refEntity_t *)parent)->axis, tempAxis );
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 317
;317:	MatrixMultiply( lerped.axis, tempAxis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 318
;318:}
LABELV $175
endproc UI_PositionRotatedEntityOnTag 120 24
proc UI_SetLerpFrameAnimation 12 8
line 326
;319:
;320:
;321:/*
;322:===============
;323:UI_SetLerpFrameAnimation
;324:===============
;325:*/
;326:static void UI_SetLerpFrameAnimation( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 329
;327:	animation_t	*anim;
;328:
;329:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 330
;330:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 332
;331:
;332:	if ( newAnimation < 0 || newAnimation >= MAX_ANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $184
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $182
LABELV $184
line 333
;333:		trap_Error( va("Bad animation number: %i", newAnimation) );
ADDRGP4 $185
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 334
;334:	}
LABELV $182
line 336
;335:
;336:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
ASGNP4
line 338
;337:
;338:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 339
;339:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 340
;340:}
LABELV $181
endproc UI_SetLerpFrameAnimation 12 8
proc UI_RunLerpFrame 32 12
line 348
;341:
;342:
;343:/*
;344:===============
;345:UI_RunLerpFrame
;346:===============
;347:*/
;348:static void UI_RunLerpFrame( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 353
;349:	int			f;
;350:	animation_t	*anim;
;351:
;352:	// see if the animation sequence is switching
;353:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $189
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $187
LABELV $189
line 354
;354:		UI_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_SetLerpFrameAnimation
CALLV
pop
line 355
;355:	}
LABELV $187
line 359
;356:
;357:	// if we have passed the current frame, move it to
;358:	// oldFrame and calculate a new frame
;359:	if ( dp_realtime >= lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $190
line 360
;360:		lf->oldFrame = lf->frame;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 361
;361:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 364
;362:
;363:		// get the next frame based on the animation
;364:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 365
;365:		if ( dp_realtime < lf->animationTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $192
line 366
;366:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 367
;367:		} else {
ADDRGP4 $193
JUMPV
LABELV $192
line 368
;368:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 369
;369:		}
LABELV $193
line 370
;370:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 371
;371:		if ( f >= anim->numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $194
line 372
;372:			f -= anim->numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 373
;373:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $196
line 374
;374:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 375
;375:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 376
;376:			} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 377
;377:				f = anim->numFrames - 1;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 380
;378:				// the animation is stuck at the end, so it
;379:				// can immediately transition to another sequence
;380:				lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 381
;381:			}
LABELV $197
line 382
;382:		}
LABELV $194
line 383
;383:		lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 384
;384:		if ( dp_realtime > lf->frameTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $198
line 385
;385:			lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 386
;386:		}
LABELV $198
line 387
;387:	}
LABELV $190
line 389
;388:
;389:	if ( lf->frameTime > dp_realtime + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 200
ADDI4
LEI4 $200
line 390
;390:		lf->frameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 391
;391:	}
LABELV $200
line 393
;392:
;393:	if ( lf->oldFrameTime > dp_realtime ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 dp_realtime
INDIRI4
LEI4 $202
line 394
;394:		lf->oldFrameTime = dp_realtime;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 395
;395:	}
LABELV $202
line 397
;396:	// calculate current lerp value
;397:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $204
line 398
;398:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 399
;399:	} else {
ADDRGP4 $205
JUMPV
LABELV $204
line 400
;400:		lf->backlerp = 1.0 - (float)( dp_realtime - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 401
;401:	}
LABELV $205
line 402
;402:}
LABELV $186
endproc UI_RunLerpFrame 32 12
proc UI_PlayerAnimation 16 12
line 411
;403:
;404:
;405:/*
;406:===============
;407:UI_PlayerAnimation
;408:===============
;409:*/
;410:static void UI_PlayerAnimation( playerInfo_t *pi, int *legsOld, int *legs, float *legsBackLerp,
;411:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 414
;412:
;413:	// legs animation
;414:	pi->legsAnimationTimer -= uiInfo.uiDC.frameTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
SUBI4
ASGNI4
line 415
;415:	if ( pi->legsAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
GEI4 $208
line 416
;416:		pi->legsAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 417
;417:	}
LABELV $208
line 419
;418:
;419:	UI_LegsSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_LegsSequencing
CALLV
pop
line 421
;420:
;421:	if ( pi->legs.yawing && ( pi->legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $210
line 422
;422:		UI_RunLerpFrame( pi, &pi->legs, LEGS_TURN );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 423
;423:	} else {
ADDRGP4 $211
JUMPV
LABELV $210
line 424
;424:		UI_RunLerpFrame( pi, &pi->legs, pi->legsAnim );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 425
;425:	}
LABELV $211
line 426
;426:	*legsOld = pi->legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 427
;427:	*legs = pi->legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 428
;428:	*legsBackLerp = pi->legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 431
;429:
;430:	// torso animation
;431:	pi->torsoAnimationTimer -= uiInfo.uiDC.frameTime;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 uiInfo+212
INDIRI4
SUBI4
ASGNI4
line 432
;432:	if ( pi->torsoAnimationTimer < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
INDIRI4
CNSTI4 0
GEI4 $213
line 433
;433:		pi->torsoAnimationTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1240
ADDP4
CNSTI4 0
ASGNI4
line 434
;434:	}
LABELV $213
line 436
;435:
;436:	UI_TorsoSequencing( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_TorsoSequencing
CALLV
pop
line 438
;437:
;438:	UI_RunLerpFrame( pi, &pi->torso, pi->torsoAnim );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_RunLerpFrame
CALLV
pop
line 439
;439:	*torsoOld = pi->torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 440
;440:	*torso = pi->torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ASGNI4
line 441
;441:	*torsoBackLerp = pi->torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 442
;442:}
LABELV $206
endproc UI_PlayerAnimation 16 12
proc UI_SwingAngles 28 8
line 451
;443:
;444:
;445:/*
;446:==================
;447:UI_SwingAngles
;448:==================
;449:*/
;450:static void UI_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;451:					float speed, float *angle, qboolean *swinging ) {
line 456
;452:	float	swing;
;453:	float	move;
;454:	float	scale;
;455:
;456:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $216
line 458
;457:		// see if a swing should be started
;458:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 459
;459:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $220
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $218
LABELV $220
line 460
;460:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 461
;461:		}
LABELV $218
line 462
;462:	}
LABELV $216
line 464
;463:
;464:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $221
line 465
;465:		return;
ADDRGP4 $215
JUMPV
LABELV $221
line 470
;466:	}
;467:	
;468:	// modify the speed depending on the delta
;469:	// so it doesn't seem so linear
;470:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 471
;471:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 472
;472:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $223
line 473
;473:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 474
;474:	} else if ( scale < swingTolerance ) {
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $225
line 475
;475:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 476
;476:	} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 477
;477:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 478
;478:	}
LABELV $226
LABELV $224
line 481
;479:
;480:	// swing towards the destination angle
;481:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $227
line 482
;482:		move = uiInfo.uiDC.frameTime * scale * speed;
ADDRLP4 8
ADDRGP4 uiInfo+212
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 483
;483:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $230
line 484
;484:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 485
;485:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 486
;486:		}
LABELV $230
line 487
;487:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 488
;488:	} else if ( swing < 0 ) {
ADDRGP4 $228
JUMPV
LABELV $227
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $232
line 489
;489:		move = uiInfo.uiDC.frameTime * scale * -speed;
ADDRLP4 8
ADDRGP4 uiInfo+212
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 490
;490:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $235
line 491
;491:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 492
;492:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 493
;493:		}
LABELV $235
line 494
;494:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 495
;495:	}
LABELV $232
LABELV $228
line 498
;496:
;497:	// clamp to no more than tolerance
;498:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 499
;499:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $237
line 500
;500:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 501
;501:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $239
line 502
;502:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 503
;503:	}
LABELV $239
LABELV $238
line 504
;504:}
LABELV $215
endproc UI_SwingAngles 28 8
proc UI_MovedirAdjustment 72 16
line 512
;505:
;506:
;507:/*
;508:======================
;509:UI_MovedirAdjustment
;510:======================
;511:*/
;512:static float UI_MovedirAdjustment( playerInfo_t *pi ) {
line 516
;513:	vec3_t		relativeAngles;
;514:	vec3_t		moveVector;
;515:
;516:	VectorSubtract( pi->viewAngles, pi->moveAngles, relativeAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
CNSTI4 1184
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1196
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRP4
CNSTI4 1188
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1200
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 28
INDIRP4
CNSTI4 1192
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1204
ADDP4
INDIRF4
SUBF4
ASGNF4
line 517
;517:	AngleVectors( relativeAngles, moveVector, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 518
;518:	if ( Q_fabs( moveVector[0] ) < 0.01 ) {
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1008981770
GEF4 $244
line 519
;519:		moveVector[0] = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 520
;520:	}
LABELV $244
line 521
;521:	if ( Q_fabs( moveVector[1] ) < 0.01 ) {
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1008981770
GEF4 $246
line 522
;522:		moveVector[1] = 0.0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 523
;523:	}
LABELV $246
line 525
;524:
;525:	if ( moveVector[1] == 0 && moveVector[0] > 0 ) {
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRF4
NEF4 $250
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $250
line 526
;526:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $241
JUMPV
LABELV $250
line 528
;527:	}
;528:	if ( moveVector[1] < 0 && moveVector[0] > 0 ) {
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $253
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
LEF4 $253
line 529
;529:		return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $241
JUMPV
LABELV $253
line 531
;530:	}
;531:	if ( moveVector[1] < 0 && moveVector[0] == 0 ) {
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRF4
GEF4 $256
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $256
line 532
;532:		return 45;
CNSTF4 1110704128
RETF4
ADDRGP4 $241
JUMPV
LABELV $256
line 534
;533:	}
;534:	if ( moveVector[1] < 0 && moveVector[0] < 0 ) {
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $259
ADDRLP4 0
INDIRF4
ADDRLP4 56
INDIRF4
GEF4 $259
line 535
;535:		return -22;
CNSTF4 3249537024
RETF4
ADDRGP4 $241
JUMPV
LABELV $259
line 537
;536:	}
;537:	if ( moveVector[1] == 0 && moveVector[0] < 0 ) {
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $262
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $262
line 538
;538:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $241
JUMPV
LABELV $262
line 540
;539:	}
;540:	if ( moveVector[1] > 0 && moveVector[0] < 0 ) {
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
LEF4 $265
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRF4
GEF4 $265
line 541
;541:		return 22;
CNSTF4 1102053376
RETF4
ADDRGP4 $241
JUMPV
LABELV $265
line 543
;542:	}
;543:	if ( moveVector[1] > 0 && moveVector[0] == 0 ) {
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68
INDIRF4
LEF4 $268
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
NEF4 $268
line 544
;544:		return  -45;
CNSTF4 3258187776
RETF4
ADDRGP4 $241
JUMPV
LABELV $268
line 547
;545:	}
;546:
;547:	return -22;
CNSTF4 3249537024
RETF4
LABELV $241
endproc UI_MovedirAdjustment 72 16
proc UI_PlayerAngles 80 24
line 556
;548:}
;549:
;550:
;551:/*
;552:===============
;553:UI_PlayerAngles
;554:===============
;555:*/
;556:static void UI_PlayerAngles( playerInfo_t *pi, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 561
;557:	vec3_t		legsAngles, torsoAngles, headAngles;
;558:	float		dest;
;559:	float		adjust;
;560:
;561:	VectorCopy( pi->viewAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRB
ASGNB 12
line 562
;562:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 44
INDIRF4
ASGNF4
line 563
;563:	VectorClear( legsAngles );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 24+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
ASGNF4
line 564
;564:	VectorClear( torsoAngles );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 569
;565:
;566:	// --------- yaw -------------
;567:
;568:	// allow yaw to drift a bit
;569:	if ( ( pi->legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 -129
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 22
NEI4 $280
ADDRLP4 56
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 11
EQI4 $278
LABELV $280
line 570
;570:		|| ( pi->torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 572
;571:		// if not standing still, always point all in the same direction
;572:		pi->torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 573
;573:		pi->torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 574
;574:		pi->legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 1
ASGNI4
line 575
;575:	}
LABELV $278
line 578
;576:
;577:	// adjust legs for movement dir
;578:	adjust = UI_MovedirAdjustment( pi );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_MovedirAdjustment
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 579
;579:	legsAngles[YAW] = headAngles[YAW] + adjust;
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 580
;580:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * adjust;
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 584
;581:
;582:
;583:	// torso
;584:	UI_SwingAngles( torsoAngles[YAW], 25, 90, SWINGSPEED, &pi->torso.yawAngle, &pi->torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 585
;585:	UI_SwingAngles( legsAngles[YAW], 40, 90, SWINGSPEED, &pi->legs.yawAngle, &pi->legs.yawing );
ADDRLP4 24+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 587
;586:
;587:	torsoAngles[YAW] = pi->torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 588
;588:	legsAngles[YAW] = pi->legs.yawAngle;
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 593
;589:
;590:	// --------- pitch -------------
;591:
;592:	// only show a fraction of the pitch angle in the torso
;593:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $289
line 594
;594:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 595
;595:	} else {
ADDRGP4 $290
JUMPV
LABELV $289
line 596
;596:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 40
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 597
;597:	}
LABELV $290
line 598
;598:	UI_SwingAngles( dest, 15, 30, 0.1f, &pi->torso.pitchAngle, &pi->torso.pitching );
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 96
ADDP4
ARGP4
ADDRGP4 UI_SwingAngles
CALLV
pop
line 599
;599:	torsoAngles[PITCH] = pi->torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 602
;600:
;601:	// pull the angles back out of the hierarchial chain
;602:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 603
;603:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 604
;604:	AnglesToAxis( legsAngles, legs );
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 605
;605:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 606
;606:	AnglesToAxis( headAngles, head );
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 607
;607:}
LABELV $271
endproc UI_PlayerAngles 80 24
proc UI_PlayerFloatSprite 140 12
line 615
;608:
;609:
;610:/*
;611:===============
;612:UI_PlayerFloatSprite
;613:===============
;614:*/
;615:static void UI_PlayerFloatSprite( playerInfo_t *pi, vec3_t origin, qhandle_t shader ) {
line 618
;616:	refEntity_t		ent;
;617:
;618:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 619
;619:	VectorCopy( origin, ent.origin );
ADDRLP4 0+68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 620
;620:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 621
;621:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 622
;622:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 8
INDIRI4
ASGNI4
line 623
;623:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 624
;624:	ent.renderfx = 0;
ADDRLP4 0+4
CNSTI4 0
ASGNI4
line 625
;625:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 626
;626:}
LABELV $291
endproc UI_PlayerFloatSprite 140 12
export UI_MachinegunSpinAngle
proc UI_MachinegunSpinAngle 28 4
line 634
;627:
;628:
;629:/*
;630:======================
;631:UI_MachinegunSpinAngle
;632:======================
;633:*/
;634:float	UI_MachinegunSpinAngle( playerInfo_t *pi ) {
line 640
;635:	int		delta;
;636:	float	angle;
;637:	float	speed;
;638:	int		torsoAnim;
;639:
;640:	delta = dp_realtime - pi->barrelTime;
ADDRLP4 4
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1268
ADDP4
INDIRI4
SUBI4
ASGNI4
line 641
;641:	if ( pi->barrelSpinning ) {
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $299
line 642
;642:		angle = pi->barrelAngle + delta * SPIN_SPEED;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 643
;643:	} else {
ADDRGP4 $300
JUMPV
LABELV $299
line 644
;644:		if ( delta > COAST_TIME ) {
ADDRLP4 4
INDIRI4
CNSTI4 1000
LEI4 $301
line 645
;645:			delta = COAST_TIME;
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 646
;646:		}
LABELV $301
line 648
;647:
;648:		speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
ADDRLP4 12
CNSTF4 1056964608
CNSTI4 1000
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTF4 1063675494
ADDF4
MULF4
ASGNF4
line 649
;649:		angle = pi->barrelAngle + delta * speed;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 650
;650:	}
LABELV $300
line 652
;651:
;652:	torsoAnim = pi->torsoAnim  & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 653
;653:	if( torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $303
line 654
;654:		torsoAnim = TORSO_ATTACK;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 655
;655:	}
LABELV $303
line 656
;656:	if ( pi->barrelSpinning == !(torsoAnim == TORSO_ATTACK) ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $308
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $308
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $309
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $305
line 657
;657:		pi->barrelTime = dp_realtime;
ADDRFP4 0
INDIRP4
CNSTI4 1268
ADDP4
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 658
;658:		pi->barrelAngle = AngleMod( angle );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 659
;659:		pi->barrelSpinning = !!(torsoAnim == TORSO_ATTACK);
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $311
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $312
JUMPV
LABELV $311
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $312
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 660
;660:	}
LABELV $305
line 662
;661:
;662:	return angle;
ADDRLP4 8
INDIRF4
RETF4
LABELV $298
endproc UI_MachinegunSpinAngle 28 4
lit
align 4
LABELV $314
byte 4 3246391296
byte 4 3246391296
byte 4 3250585600
align 4
LABELV $315
byte 4 1098907648
byte 4 1098907648
byte 4 1107296256
export UI_DrawPlayer
code
proc UI_DrawPlayer 1308 28
line 671
;663:}
;664:
;665:
;666:/*
;667:===============
;668:UI_DrawPlayer
;669:===============
;670:*/
;671:void UI_DrawPlayer( float x, float y, float w, float h, playerInfo_t *pi, int time ) {
line 681
;672:	refdef_t		refdef;
;673:	refEntity_t		legs;
;674:	refEntity_t		torso;
;675:	refEntity_t		head;
;676:	refEntity_t		gun;
;677:	refEntity_t		barrel;
;678:	refEntity_t		flash;
;679:	vec3_t			origin;
;680:	int				renderfx;
;681:	vec3_t			mins = {-16, -16, -24};
ADDRLP4 1084
ADDRGP4 $314
INDIRB
ASGNB 12
line 682
;682:	vec3_t			maxs = {16, 16, 32};
ADDRLP4 1096
ADDRGP4 $315
INDIRB
ASGNB 12
line 686
;683:	float			len;
;684:	float			xx;
;685:
;686:	if ( !pi->legsModel || !pi->torsoModel || !pi->headModel || !pi->animations[0].numFrames ) {
ADDRLP4 1256
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $320
ADDRLP4 1256
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $320
ADDRLP4 1256
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $320
ADDRLP4 1256
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
NEI4 $316
LABELV $320
line 687
;687:		return;
ADDRGP4 $313
JUMPV
LABELV $316
line 691
;688:	}
;689:
;690:	// this allows the ui to cache the player model on the main menu
;691:	if (w == 0 || h == 0) {
ADDRLP4 1264
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRF4
ADDRLP4 1264
INDIRF4
EQF4 $323
ADDRFP4 12
INDIRF4
ADDRLP4 1264
INDIRF4
NEF4 $321
LABELV $323
line 692
;692:		return;
ADDRGP4 $313
JUMPV
LABELV $321
line 695
;693:	}
;694:
;695:	dp_realtime = time;
ADDRGP4 dp_realtime
ADDRFP4 20
INDIRI4
ASGNI4
line 697
;696:
;697:	if ( pi->pendingWeapon != -1 && dp_realtime > pi->weaponTimer ) {
ADDRLP4 1268
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $324
ADDRGP4 dp_realtime
INDIRI4
ADDRLP4 1268
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
LEI4 $324
line 698
;698:		pi->weapon = pi->pendingWeapon;
ADDRLP4 1272
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 1272
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 699
;699:		pi->lastWeapon = pi->pendingWeapon;
ADDRLP4 1276
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CNSTI4 1224
ADDP4
ADDRLP4 1276
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 700
;700:		pi->pendingWeapon = -1;
ADDRFP4 16
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 701
;701:		pi->weaponTimer = 0;
ADDRFP4 16
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 702
;702:		if( pi->currentWeapon != pi->weapon ) {
ADDRLP4 1280
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ADDRLP4 1280
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
EQI4 $326
line 703
;703:			trap_S_StartLocalSound( weaponChangeSound, CHAN_LOCAL );
ADDRGP4 weaponChangeSound
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 704
;704:		}
LABELV $326
line 705
;705:	}
LABELV $324
line 707
;706:
;707:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 709
;708:
;709:	y -= jumpHeight;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRGP4 jumpHeight
INDIRF4
SUBF4
ASGNF4
line 711
;710:
;711:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 712
;712:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 380
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 713
;713:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 520
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 714
;714:	memset( &head, 0, sizeof(head) );
ADDRLP4 660
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 716
;715:
;716:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 718
;717:
;718:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 720
;719:
;720:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 721
;721:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 722
;722:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 723
;723:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 725
;724:
;725:	refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
ADDRLP4 0+16
CNSTF4 1119092736
ADDRLP4 0+8
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 726
;726:	xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 1272
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 1252
ADDRLP4 0+8
INDIRI4
CVIF4 4
ADDRLP4 1272
INDIRF4
DIVF4
ASGNF4
line 727
;727:	refdef.fov_y = atan2( refdef.height, xx );
ADDRLP4 0+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1252
INDIRF4
ARGF4
ADDRLP4 1276
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0+20
ADDRLP4 1276
INDIRF4
ASGNF4
line 728
;728:	refdef.fov_y *= ( 360 / (float)M_PI );
ADDRLP4 0+20
CNSTF4 1122316001
ADDRLP4 0+20
INDIRF4
MULF4
ASGNF4
line 731
;729:
;730:	// calculate distance so the player nearly fills the box
;731:	len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 1248
CNSTF4 1060320051
ADDRLP4 1096+8
INDIRF4
ADDRLP4 1084+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 732
;732:	origin[0] = len / tan( DEG2RAD(refdef.fov_x) * 0.5 );
CNSTF4 1056964608
CNSTF4 1078530011
ADDRLP4 0+16
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 1280
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 1248
INDIRF4
ADDRLP4 1280
INDIRF4
DIVF4
ASGNF4
line 733
;733:	origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 368+4
CNSTF4 1056964608
ADDRLP4 1084+4
INDIRF4
ADDRLP4 1096+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 734
;734:	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 368+8
CNSTF4 3204448256
ADDRLP4 1084+8
INDIRF4
ADDRLP4 1096+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 736
;735:
;736:	refdef.time = dp_realtime;
ADDRLP4 0+72
ADDRGP4 dp_realtime
INDIRI4
ASGNI4
line 738
;737:
;738:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 741
;739:
;740:	// get the rotation information
;741:	UI_PlayerAngles( pi, legs.axis, torso.axis, head.axis );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+28
ARGP4
ADDRLP4 520+28
ARGP4
ADDRLP4 660+28
ARGP4
ADDRGP4 UI_PlayerAngles
CALLV
pop
line 744
;742:	
;743:	// get the animation state (after rotation, to allow feet shuffle)
;744:	UI_PlayerAnimation( pi, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 380+96
ARGP4
ADDRLP4 380+80
ARGP4
ADDRLP4 380+100
ARGP4
ADDRLP4 520+96
ARGP4
ADDRLP4 520+80
ARGP4
ADDRLP4 520+100
ARGP4
ADDRGP4 UI_PlayerAnimation
CALLV
pop
line 747
;745:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;746:
;747:	renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 800
CNSTI4 192
ASGNI4
line 752
;748:
;749:	//
;750:	// add the legs
;751:	//
;752:	legs.hModel = pi->legsModel;
ADDRLP4 380+8
ADDRFP4 16
INDIRP4
INDIRI4
ASGNI4
line 753
;753:	legs.customSkin = pi->legsSkin;
ADDRLP4 380+108
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 755
;754:
;755:	VectorCopy( origin, legs.origin );
ADDRLP4 380+68
ADDRLP4 368
INDIRB
ASGNB 12
line 757
;756:
;757:	VectorCopy( origin, legs.lightingOrigin );
ADDRLP4 380+12
ADDRLP4 368
INDIRB
ASGNB 12
line 758
;758:	legs.renderfx = renderfx;
ADDRLP4 380+4
ADDRLP4 800
INDIRI4
ASGNI4
line 759
;759:	VectorCopy (legs.origin, legs.oldorigin);
ADDRLP4 380+84
ADDRLP4 380+68
INDIRB
ASGNB 12
line 761
;760:
;761:	trap_R_AddRefEntityToScene( &legs );
ADDRLP4 380
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 763
;762:
;763:	if (!legs.hModel) {
ADDRLP4 380+8
INDIRI4
CNSTI4 0
NEI4 $366
line 764
;764:		return;
ADDRGP4 $313
JUMPV
LABELV $366
line 770
;765:	}
;766:
;767:	//
;768:	// add the torso
;769:	//
;770:	torso.hModel = pi->torsoModel;
ADDRLP4 520+8
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 771
;771:	if (!torso.hModel) {
ADDRLP4 520+8
INDIRI4
CNSTI4 0
NEI4 $370
line 772
;772:		return;
ADDRGP4 $313
JUMPV
LABELV $370
line 775
;773:	}
;774:
;775:	torso.customSkin = pi->torsoSkin;
ADDRLP4 520+108
ADDRFP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
line 777
;776:
;777:	VectorCopy( origin, torso.lightingOrigin );
ADDRLP4 520+12
ADDRLP4 368
INDIRB
ASGNB 12
line 779
;778:
;779:	UI_PositionRotatedEntityOnTag( &torso, &legs, pi->legsModel, "tag_torso");
ADDRLP4 520
ARGP4
ADDRLP4 380
ARGP4
ADDRFP4 16
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $375
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 781
;780:
;781:	torso.renderfx = renderfx;
ADDRLP4 520+4
ADDRLP4 800
INDIRI4
ASGNI4
line 783
;782:
;783:	trap_R_AddRefEntityToScene( &torso );
ADDRLP4 520
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 788
;784:
;785:	//
;786:	// add the head
;787:	//
;788:	head.hModel = pi->headModel;
ADDRLP4 660+8
ADDRFP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 789
;789:	if (!head.hModel) {
ADDRLP4 660+8
INDIRI4
CNSTI4 0
NEI4 $378
line 790
;790:		return;
ADDRGP4 $313
JUMPV
LABELV $378
line 792
;791:	}
;792:	head.customSkin = pi->headSkin;
ADDRLP4 660+108
ADDRFP4 16
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 794
;793:
;794:	VectorCopy( origin, head.lightingOrigin );
ADDRLP4 660+12
ADDRLP4 368
INDIRB
ASGNB 12
line 796
;795:
;796:	UI_PositionRotatedEntityOnTag( &head, &torso, pi->torsoModel, "tag_head");
ADDRLP4 660
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $383
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 798
;797:
;798:	head.renderfx = renderfx;
ADDRLP4 660+4
ADDRLP4 800
INDIRI4
ASGNI4
line 800
;799:
;800:	trap_R_AddRefEntityToScene( &head );
ADDRLP4 660
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 805
;801:
;802:	//
;803:	// add the gun
;804:	//
;805:	if ( pi->currentWeapon != WP_NONE ) {
ADDRFP4 16
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $385
line 806
;806:		memset( &gun, 0, sizeof(gun) );
ADDRLP4 804
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 807
;807:		gun.hModel = pi->weaponModel;
ADDRLP4 804+8
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 808
;808:		VectorCopy( origin, gun.lightingOrigin );
ADDRLP4 804+12
ADDRLP4 368
INDIRB
ASGNB 12
line 809
;809:		UI_PositionEntityOnTag( &gun, &torso, pi->torsoModel, "tag_weapon");
ADDRLP4 804
ARGP4
ADDRLP4 520
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRGP4 $389
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 810
;810:		gun.renderfx = renderfx;
ADDRLP4 804+4
ADDRLP4 800
INDIRI4
ASGNI4
line 811
;811:		trap_R_AddRefEntityToScene( &gun );
ADDRLP4 804
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 812
;812:	}
LABELV $385
line 817
;813:
;814:	//
;815:	// add the spinning barrel
;816:	//
;817:	if ( pi->realWeapon == WP_MACHINEGUN || pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
ADDRLP4 1284
ADDRFP4 16
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 2
EQI4 $394
ADDRLP4 1284
INDIRI4
CNSTI4 1
EQI4 $394
ADDRLP4 1284
INDIRI4
CNSTI4 9
NEI4 $391
LABELV $394
line 820
;818:		vec3_t	angles;
;819:
;820:		memset( &barrel, 0, sizeof(barrel) );
ADDRLP4 944
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 821
;821:		VectorCopy( origin, barrel.lightingOrigin );
ADDRLP4 944+12
ADDRLP4 368
INDIRB
ASGNB 12
line 822
;822:		barrel.renderfx = renderfx;
ADDRLP4 944+4
ADDRLP4 800
INDIRI4
ASGNI4
line 824
;823:
;824:		barrel.hModel = pi->barrelModel;
ADDRLP4 944+8
ADDRFP4 16
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 825
;825:		angles[YAW] = 0;
ADDRLP4 1288+4
CNSTF4 0
ASGNF4
line 826
;826:		angles[PITCH] = 0;
ADDRLP4 1288
CNSTF4 0
ASGNF4
line 827
;827:		angles[ROLL] = UI_MachinegunSpinAngle( pi );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 UI_MachinegunSpinAngle
CALLF4
ASGNF4
ADDRLP4 1288+8
ADDRLP4 1300
INDIRF4
ASGNF4
line 828
;828:		if( pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
ADDRLP4 1304
ADDRFP4 16
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 1
EQI4 $402
ADDRLP4 1304
INDIRI4
CNSTI4 9
NEI4 $400
LABELV $402
line 829
;829:			angles[PITCH] = angles[ROLL];
ADDRLP4 1288
ADDRLP4 1288+8
INDIRF4
ASGNF4
line 830
;830:			angles[ROLL] = 0;
ADDRLP4 1288+8
CNSTF4 0
ASGNF4
line 831
;831:		}
LABELV $400
line 832
;832:		AnglesToAxis( angles, barrel.axis );
ADDRLP4 1288
ARGP4
ADDRLP4 944+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 834
;833:
;834:		UI_PositionRotatedEntityOnTag( &barrel, &gun, pi->weaponModel, "tag_barrel");
ADDRLP4 944
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ARGI4
ADDRGP4 $406
ARGP4
ADDRGP4 UI_PositionRotatedEntityOnTag
CALLV
pop
line 836
;835:
;836:		trap_R_AddRefEntityToScene( &barrel );
ADDRLP4 944
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 837
;837:	}
LABELV $391
line 842
;838:
;839:	//
;840:	// add muzzle flash
;841:	//
;842:	if ( dp_realtime <= pi->muzzleFlashTime ) {
ADDRGP4 dp_realtime
INDIRI4
ADDRFP4 16
INDIRP4
CNSTI4 1180
ADDP4
INDIRI4
GTI4 $407
line 843
;843:		if ( pi->flashModel ) {
ADDRFP4 16
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $409
line 844
;844:			memset( &flash, 0, sizeof(flash) );
ADDRLP4 1108
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 845
;845:			flash.hModel = pi->flashModel;
ADDRLP4 1108+8
ADDRFP4 16
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 846
;846:			VectorCopy( origin, flash.lightingOrigin );
ADDRLP4 1108+12
ADDRLP4 368
INDIRB
ASGNB 12
line 847
;847:			UI_PositionEntityOnTag( &flash, &gun, pi->weaponModel, "tag_flash");
ADDRLP4 1108
ARGP4
ADDRLP4 804
ARGP4
ADDRFP4 16
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ARGI4
ADDRGP4 $413
ARGP4
ADDRGP4 UI_PositionEntityOnTag
CALLV
pop
line 848
;848:			flash.renderfx = renderfx;
ADDRLP4 1108+4
ADDRLP4 800
INDIRI4
ASGNI4
line 849
;849:			trap_R_AddRefEntityToScene( &flash );
ADDRLP4 1108
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 850
;850:		}
LABELV $409
line 853
;851:
;852:		// make a dlight for the flash
;853:		if ( pi->flashDlightColor[0] || pi->flashDlightColor[1] || pi->flashDlightColor[2] ) {
ADDRLP4 1288
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1292
CNSTF4 0
ASGNF4
ADDRLP4 1288
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
ADDRLP4 1292
INDIRF4
NEF4 $418
ADDRLP4 1288
INDIRP4
CNSTI4 1172
ADDP4
INDIRF4
ADDRLP4 1292
INDIRF4
NEF4 $418
ADDRLP4 1288
INDIRP4
CNSTI4 1176
ADDP4
INDIRF4
ADDRLP4 1292
INDIRF4
EQF4 $415
LABELV $418
line 854
;854:			trap_R_AddLightToScene( flash.origin, 200 + (rand()&31), pi->flashDlightColor[0],
ADDRLP4 1296
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1108+68
ARGP4
ADDRLP4 1296
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 1300
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 1172
ADDP4
INDIRF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 1176
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 856
;855:				pi->flashDlightColor[1], pi->flashDlightColor[2] );
;856:		}
LABELV $415
line 857
;857:	}
LABELV $407
line 862
;858:
;859:	//
;860:	// add the chat icon
;861:	//
;862:	if ( pi->chat ) {
ADDRFP4 16
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
line 863
;863:		UI_PlayerFloatSprite( pi, origin, trap_R_RegisterShaderNoMip( "sprites/balloon3" ) );
ADDRGP4 $422
ARGP4
ADDRLP4 1288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 368
ARGP4
ADDRLP4 1288
INDIRI4
ARGI4
ADDRGP4 UI_PlayerFloatSprite
CALLV
pop
line 864
;864:	}
LABELV $420
line 869
;865:
;866:	//
;867:	// add an accent light
;868:	//
;869:	origin[0] -= 100;	// + = behind, - = in front
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 870
;870:	origin[1] += 100;	// + = left, - = right
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 871
;871:	origin[2] += 100;	// + = above, - = below
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 872
;872:	trap_R_AddLightToScene( origin, 500, 1.0, 1.0, 1.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
ADDRLP4 1288
CNSTF4 1065353216
ASGNF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRLP4 1288
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 874
;873:
;874:	origin[0] -= 100;
ADDRLP4 368
ADDRLP4 368
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 875
;875:	origin[1] -= 100;
ADDRLP4 368+4
ADDRLP4 368+4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 876
;876:	origin[2] -= 100;
ADDRLP4 368+8
ADDRLP4 368+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 877
;877:	trap_R_AddLightToScene( origin, 500, 1.0, 0.0, 0.0 );
ADDRLP4 368
ARGP4
CNSTF4 1140457472
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1292
CNSTF4 0
ASGNF4
ADDRLP4 1292
INDIRF4
ARGF4
ADDRLP4 1292
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 879
;878:
;879:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 880
;880:}
LABELV $313
endproc UI_DrawPlayer 1308 28
proc UI_FileExists 8 12
line 887
;881:
;882:/*
;883:==========================
;884:UI_FileExists
;885:==========================
;886:*/
;887:static qboolean	UI_FileExists(const char *filename) {
line 890
;888:	int len;
;889:
;890:	len = trap_FS_FOpenFile( filename, 0, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 891
;891:	if (len>0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $428
line 892
;892:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $427
JUMPV
LABELV $428
line 894
;893:	}
;894:	return qfalse;
CNSTI4 0
RETI4
LABELV $427
endproc UI_FileExists 8 12
proc UI_FindClientHeadFile 40 40
line 902
;895:}
;896:
;897:/*
;898:==========================
;899:UI_FindClientHeadFile
;900:==========================
;901:*/
;902:static qboolean	UI_FindClientHeadFile( char *filename, int length, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 906
;903:	char *team, *headsFolder;
;904:	int i;
;905:
;906:	team = "default";
ADDRLP4 8
ADDRGP4 $431
ASGNP4
line 908
;907:
;908:	if ( headModelName[0] == '*' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $432
line 909
;909:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $434
ASGNP4
line 910
;910:		headModelName++;
ADDRFP4 12
ADDRFP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 911
;911:	}
ADDRGP4 $437
JUMPV
LABELV $432
line 912
;912:	else {
line 913
;913:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $435
ASGNP4
line 914
;914:	}
ADDRGP4 $437
JUMPV
LABELV $436
line 915
;915:	while(1) {
line 916
;916:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $439
line 917
;917:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $443
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $443
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $443
line 918
;918:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $445
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 919
;919:			}
ADDRGP4 $444
JUMPV
LABELV $443
line 920
;920:			else {
line 921
;921:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $446
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 922
;922:			}
LABELV $444
line 923
;923:			if ( UI_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_FileExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $447
line 924
;924:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $430
JUMPV
LABELV $447
line 926
;925:			}
;926:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $449
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $449
line 927
;927:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $451
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 928
;928:			}
ADDRGP4 $450
JUMPV
LABELV $449
line 929
;929:			else {
line 930
;930:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $452
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 931
;931:			}
LABELV $450
line 932
;932:			if ( UI_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 UI_FileExists
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $453
line 933
;933:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $430
JUMPV
LABELV $453
line 935
;934:			}
;935:			if ( !teamName || !*teamName ) {
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $455
LABELV $457
line 936
;936:				break;
ADDRGP4 $441
JUMPV
LABELV $455
line 938
;937:			}
;938:		}
LABELV $440
line 916
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $439
LABELV $441
line 940
;939:		// if tried the heads folder first
;940:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $458
line 941
;941:			break;
ADDRGP4 $438
JUMPV
LABELV $458
line 943
;942:		}
;943:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $434
ASGNP4
line 944
;944:	}
LABELV $437
line 915
ADDRGP4 $436
JUMPV
LABELV $438
line 946
;945:
;946:	return qfalse;
CNSTI4 0
RETI4
LABELV $430
endproc UI_FindClientHeadFile 40 40
proc UI_RegisterClientSkin 156 28
line 954
;947:}
;948:
;949:/*
;950:==========================
;951:UI_RegisterClientSkin
;952:==========================
;953:*/
;954:static qboolean	UI_RegisterClientSkin( playerInfo_t *pi, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName , const char *teamName) {
line 957
;955:	char		filename[MAX_QPATH*2];
;956:
;957:	if (teamName && *teamName) {
ADDRLP4 128
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $461
line 958
;958:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/%s/lower_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $463
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 959
;959:	} else {
ADDRGP4 $462
JUMPV
LABELV $461
line 960
;960:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $464
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 961
;961:	}
LABELV $462
line 962
;962:	pi->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 963
;963:	if (!pi->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $465
line 964
;964:		if (teamName && *teamName) {
ADDRLP4 136
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
ADDRLP4 136
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $467
line 965
;965:			Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%s/lower_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $469
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 966
;966:		} else {
ADDRGP4 $468
JUMPV
LABELV $467
line 967
;967:			Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $470
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 968
;968:		}
LABELV $468
line 969
;969:		pi->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 970
;970:	}
LABELV $465
line 972
;971:
;972:	if (teamName && *teamName) {
ADDRLP4 136
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $471
ADDRLP4 136
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $471
line 973
;973:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/%s/upper_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $473
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 974
;974:	} else {
ADDRGP4 $472
JUMPV
LABELV $471
line 975
;975:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $474
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 976
;976:	}
LABELV $472
line 977
;977:	pi->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 978
;978:	if (!pi->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $475
line 979
;979:		if (teamName && *teamName) {
ADDRLP4 144
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
ADDRLP4 144
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $477
line 980
;980:			Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%s/upper_%s.skin", modelName, teamName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $479
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 981
;981:		} else {
ADDRGP4 $478
JUMPV
LABELV $477
line 982
;982:			Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $480
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 983
;983:		}
LABELV $478
line 984
;984:		pi->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 985
;985:	}
LABELV $475
line 987
;986:
;987:	if ( UI_FindClientHeadFile( filename, sizeof(filename), teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 $484
ARGP4
ADDRLP4 144
ADDRGP4 UI_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $481
line 988
;988:		pi->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 989
;989:	}
LABELV $481
line 991
;990:
;991:	if ( !pi->legsSkin || !pi->torsoSkin || !pi->headSkin ) {
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $488
ADDRLP4 148
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $488
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
NEI4 $485
LABELV $488
line 992
;992:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $460
JUMPV
LABELV $485
line 995
;993:	}
;994:
;995:	return qtrue;
CNSTI4 1
RETI4
LABELV $460
endproc UI_RegisterClientSkin 156 28
proc UI_ParseAnimationFile 20068 12
line 1004
;996:}
;997:
;998:
;999:/*
;1000:======================
;1001:UI_ParseAnimationFile
;1002:======================
;1003:*/
;1004:static qboolean UI_ParseAnimationFile( const char *filename, animation_t *animations ) {
line 1014
;1005:	char		*text_p, *prev;
;1006:	int			len;
;1007:	int			i;
;1008:	char		*token;
;1009:	float		fps;
;1010:	int			skip;
;1011:	char		text[20000];
;1012:	fileHandle_t	f;
;1013:
;1014:	memset( animations, 0, sizeof( animation_t ) * MAX_ANIMATIONS );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 868
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1017
;1015:
;1016:	// load the file
;1017:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20028
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20032
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 20032
INDIRI4
ASGNI4
line 1018
;1018:	if ( len <= 0 ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
GTI4 $490
line 1019
;1019:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $489
JUMPV
LABELV $490
line 1021
;1020:	}
;1021:	if ( len >= ( sizeof( text ) - 1 ) ) {
ADDRLP4 24
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $492
line 1022
;1022:		Com_Printf( "File %s too long\n", filename );
ADDRGP4 $494
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1023
;1023:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $489
JUMPV
LABELV $492
line 1025
;1024:	}
;1025:	trap_FS_Read( text, len, f );
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1026
;1026:	text[len] = 0;
ADDRLP4 24
INDIRI4
ADDRLP4 28
ADDP4
CNSTI1 0
ASGNI1
line 1027
;1027:	trap_FS_FCloseFile( f );
ADDRLP4 20028
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1029
;1028:
;1029:	COM_Compress(text);
ADDRLP4 28
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 1032
;1030:
;1031:	// parse the text
;1032:	text_p = text;
ADDRLP4 8
ADDRLP4 28
ASGNP4
line 1033
;1033:	skip = 0;	// quite the compiler warning
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $495
line 1036
;1034:
;1035:	// read optional parameters
;1036:	while ( 1 ) {
line 1037
;1037:		prev = text_p;	// so we can unget
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
line 1038
;1038:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 1039
;1039:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $498
line 1040
;1040:			break;
ADDRGP4 $497
JUMPV
LABELV $498
line 1042
;1041:		}
;1042:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $502
ARGP4
ADDRLP4 20040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20040
INDIRI4
CNSTI4 0
NEI4 $500
line 1043
;1043:			token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 1044
;1044:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $496
line 1045
;1045:				break;
ADDRGP4 $497
JUMPV
line 1047
;1046:			}
;1047:			continue;
LABELV $500
line 1048
;1048:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $507
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $505
line 1049
;1049:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $508
line 1050
;1050:				token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 1051
;1051:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $512
line 1052
;1052:					break;
ADDRGP4 $496
JUMPV
LABELV $512
line 1054
;1053:				}
;1054:			}
LABELV $509
line 1049
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $508
line 1055
;1055:			continue;
ADDRGP4 $496
JUMPV
LABELV $505
line 1056
;1056:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $514
line 1057
;1057:			token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 1058
;1058:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $496
line 1059
;1059:				break;
ADDRGP4 $497
JUMPV
line 1061
;1060:			}
;1061:			continue;
LABELV $514
line 1065
;1062:		}
;1063:
;1064:		// if it is a number, start parsing animations
;1065:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20052
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 48
LTI4 $519
ADDRLP4 20052
INDIRI4
CNSTI4 57
GTI4 $519
line 1066
;1066:			text_p = prev;	// unget the token
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1067
;1067:			break;
ADDRGP4 $497
JUMPV
LABELV $519
line 1070
;1068:		}
;1069:
;1070:		Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $521
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1071
;1071:	}
LABELV $496
line 1036
ADDRGP4 $495
JUMPV
LABELV $497
line 1074
;1072:
;1073:	// read information for each frame
;1074:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $522
line 1076
;1075:
;1076:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 1077
;1077:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $526
line 1078
;1078:			break;
ADDRGP4 $524
JUMPV
LABELV $526
line 1080
;1079:		}
;1080:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20040
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 20040
INDIRI4
ASGNI4
line 1082
;1081:		// leg only frames are adjusted to not count the upper body only frames
;1082:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $528
line 1083
;1083:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 20044
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20044
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 20044
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1084
;1084:		}
LABELV $528
line 1085
;1085:		if ( i >= LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $530
line 1086
;1086:			animations[i].firstFrame -= skip;
ADDRLP4 20044
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20044
INDIRP4
ADDRLP4 20044
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1087
;1087:		}
LABELV $530
line 1089
;1088:
;1089:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 1090
;1090:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $532
line 1091
;1091:			break;
ADDRGP4 $524
JUMPV
LABELV $532
line 1093
;1092:		}
;1093:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20048
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20048
INDIRI4
ASGNI4
line 1095
;1094:
;1095:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 1096
;1096:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $534
line 1097
;1097:			break;
ADDRGP4 $524
JUMPV
LABELV $534
line 1099
;1098:		}
;1099:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 1101
;1100:
;1101:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 1102
;1102:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
line 1103
;1103:			break;
ADDRGP4 $524
JUMPV
LABELV $536
line 1105
;1104:		}
;1105:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20064
INDIRF4
ASGNF4
line 1106
;1106:		if ( fps == 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $538
line 1107
;1107:			fps = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1108
;1108:		}
LABELV $538
line 1109
;1109:		animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1110
;1110:		animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 12
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1111
;1111:	}
LABELV $523
line 1074
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $522
LABELV $524
line 1113
;1112:
;1113:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $540
line 1114
;1114:		Com_Printf( "Error parsing animation file: %s", filename );
ADDRGP4 $542
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1115
;1115:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $489
JUMPV
LABELV $540
line 1118
;1116:	}
;1117:
;1118:	return qtrue;
CNSTI4 1
RETI4
LABELV $489
endproc UI_ParseAnimationFile 20068 12
export UI_RegisterClientModelname
proc UI_RegisterClientModelname 356 24
line 1126
;1119:}
;1120:
;1121:/*
;1122:==========================
;1123:UI_RegisterClientModelname
;1124:==========================
;1125:*/
;1126:qboolean UI_RegisterClientModelname( playerInfo_t *pi, const char *modelSkinName, const char *headModelSkinName, const char *teamName ) {
line 1134
;1127:	char		modelName[MAX_QPATH];
;1128:	char		skinName[MAX_QPATH];
;1129:	char		headModelName[MAX_QPATH];
;1130:	char		headSkinName[MAX_QPATH];
;1131:	char		filename[MAX_QPATH];
;1132:	char		*slash;
;1133:
;1134:	pi->torsoModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 0
ASGNI4
line 1135
;1135:	pi->headModel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTI4 0
ASGNI4
line 1137
;1136:
;1137:	if ( !modelSkinName[0] ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $544
line 1138
;1138:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $544
line 1141
;1139:	}
;1140:
;1141:	Q_strncpyz( modelName, modelSkinName, sizeof( modelName ) );
ADDRLP4 128
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1143
;1142:
;1143:	slash = strchr( modelName, '/' );
ADDRLP4 128
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 324
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 324
INDIRP4
ASGNP4
line 1144
;1144:	if ( !slash ) {
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $546
line 1146
;1145:		// modelName did not include a skin name
;1146:		Q_strncpyz( skinName, "default", sizeof( skinName ) );
ADDRLP4 196
ARGP4
ADDRGP4 $431
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1147
;1147:	} else {
ADDRGP4 $547
JUMPV
LABELV $546
line 1148
;1148:		Q_strncpyz( skinName, slash + 1, sizeof( skinName ) );
ADDRLP4 196
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1149
;1149:		*slash = '\0';
ADDRLP4 192
INDIRP4
CNSTI1 0
ASGNI1
line 1150
;1150:	}
LABELV $547
line 1152
;1151:
;1152:	Q_strncpyz( headModelName, headModelSkinName, sizeof( headModelName ) );
ADDRLP4 64
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1153
;1153:	slash = strchr( headModelName, '/' );
ADDRLP4 64
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 328
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 328
INDIRP4
ASGNP4
line 1154
;1154:	if ( !slash ) {
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $548
line 1156
;1155:		// modelName did not include a skin name
;1156:		Q_strncpyz( headSkinName, "default", sizeof( skinName ) );
ADDRLP4 260
ARGP4
ADDRGP4 $431
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1157
;1157:	} else {
ADDRGP4 $549
JUMPV
LABELV $548
line 1158
;1158:		Q_strncpyz( headSkinName, slash + 1, sizeof( skinName ) );
ADDRLP4 260
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1159
;1159:		*slash = '\0';
ADDRLP4 192
INDIRP4
CNSTI1 0
ASGNI1
line 1160
;1160:	}
LABELV $549
line 1164
;1161:
;1162:	// load cmodels before models so filecache works
;1163:
;1164:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $550
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1165
;1165:	pi->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 332
INDIRI4
ASGNI4
line 1166
;1166:	if ( !pi->legsModel ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $551
line 1167
;1167:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $553
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1168
;1168:		pi->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1169
;1169:		if ( !pi->legsModel ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $554
line 1170
;1170:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $556
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1171
;1171:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $554
line 1173
;1172:		}
;1173:	}
LABELV $551
line 1175
;1174:
;1175:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $557
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1176
;1176:	pi->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1177
;1177:	if ( !pi->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
NEI4 $558
line 1178
;1178:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $560
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1179
;1179:		pi->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1180
;1180:		if ( !pi->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
NEI4 $561
line 1181
;1181:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $556
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1182
;1182:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $561
line 1184
;1183:		}
;1184:	}
LABELV $558
line 1186
;1185:
;1186:	if (headModelName && headModelName[0] == '*' ) {
ADDRLP4 64
CVPU4 4
CNSTU4 0
EQU4 $563
ADDRLP4 64
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $563
line 1187
;1187:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $565
ARGP4
ADDRLP4 64+1
ARGP4
ADDRLP4 64+1
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1188
;1188:	}
ADDRGP4 $564
JUMPV
LABELV $563
line 1189
;1189:	else {
line 1190
;1190:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $568
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1191
;1191:	}
LABELV $564
line 1192
;1192:	pi->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1193
;1193:	if ( !pi->headModel && headModelName[0] != '*') {
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $569
ADDRLP4 64
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $569
line 1194
;1194:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $565
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1195
;1195:		pi->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 1196
;1196:	}
LABELV $569
line 1198
;1197:
;1198:	if (!pi->headModel) {
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $571
line 1199
;1199:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $556
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1200
;1200:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $571
line 1204
;1201:	}
;1202:
;1203:	// if any skins failed to load, fall back to default
;1204:	if ( !UI_RegisterClientSkin( pi, modelName, skinName, headModelName, headSkinName, teamName) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 260
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $573
line 1205
;1205:		if ( !UI_RegisterClientSkin( pi, modelName, "default", headModelName, "default", teamName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 348
ADDRGP4 $431
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 UI_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
NEI4 $575
line 1206
;1206:			Com_Printf( "Failed to load skin file: %s : %s\n", modelName, skinName );
ADDRGP4 $577
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 196
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1207
;1207:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $575
line 1209
;1208:		}
;1209:	}
LABELV $573
line 1212
;1210:
;1211:	// load the animations
;1212:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $578
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1213
;1213:	if ( !UI_ParseAnimationFile( filename, pi->animations ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 348
ADDRGP4 UI_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $579
line 1214
;1214:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $581
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1215
;1215:		if ( !UI_ParseAnimationFile( filename, pi->animations ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 UI_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
NEI4 $582
line 1216
;1216:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $584
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1217
;1217:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $582
line 1219
;1218:		}
;1219:	}
LABELV $579
line 1221
;1220:
;1221:	return qtrue;
CNSTI4 1
RETI4
LABELV $543
endproc UI_RegisterClientModelname 356 24
export UI_PlayerInfo_SetModel
proc UI_PlayerInfo_SetModel 12 16
line 1230
;1222:}
;1223:
;1224:
;1225:/*
;1226:===============
;1227:UI_PlayerInfo_SetModel
;1228:===============
;1229:*/
;1230:void UI_PlayerInfo_SetModel( playerInfo_t *pi, const char *model, const char *headmodel, char *teamName ) {
line 1231
;1231:	memset( pi, 0, sizeof(*pi) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1232
;1232:	UI_RegisterClientModelname( pi, model, headmodel, teamName );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1233
;1233:	pi->weapon = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
CNSTI4 2
ASGNI4
line 1234
;1234:	pi->currentWeapon = pi->weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ASGNI4
line 1235
;1235:	pi->lastWeapon = pi->weapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1224
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ASGNI4
line 1236
;1236:	pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1237
;1237:	pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1238
;1238:	pi->chat = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 1239
;1239:	pi->newModel = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 1240
;1240:	UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1241
;1241:}
LABELV $585
endproc UI_PlayerInfo_SetModel 12 16
export UI_PlayerInfo_SetInfo
proc UI_PlayerInfo_SetInfo 36 8
line 1249
;1242:
;1243:
;1244:/*
;1245:===============
;1246:UI_PlayerInfo_SetInfo
;1247:===============
;1248:*/
;1249:void UI_PlayerInfo_SetInfo( playerInfo_t *pi, int legsAnim, int torsoAnim, vec3_t viewAngles, vec3_t moveAngles, weapon_t weaponNumber, qboolean chat ) {
line 1253
;1250:	int			currentAnim;
;1251:	weapon_t	weaponNum;
;1252:
;1253:	pi->chat = chat;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 1256
;1254:
;1255:	// view angles
;1256:	VectorCopy( viewAngles, pi->viewAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1259
;1257:
;1258:	// move angles
;1259:	VectorCopy( moveAngles, pi->moveAngles );
ADDRFP4 0
INDIRP4
CNSTI4 1196
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 1261
;1260:
;1261:	if ( pi->newModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $587
line 1262
;1262:		pi->newModel = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 0
ASGNI4
line 1264
;1263:
;1264:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1265
;1265:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1266
;1266:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1267
;1267:		pi->legs.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1268
;1268:		pi->legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 1270
;1269:
;1270:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1271
;1271:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1272
;1272:		pi->torso.yawAngle = viewAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1273
;1273:		pi->torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1275
;1274:
;1275:		if ( weaponNumber != -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
EQI4 $586
line 1276
;1276:			pi->weapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1277
;1277:			pi->currentWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1278
;1278:			pi->lastWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1279
;1279:			pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1280
;1280:			pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1281
;1281:			UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1282
;1282:		}
line 1284
;1283:
;1284:		return;
ADDRGP4 $586
JUMPV
LABELV $587
line 1288
;1285:	}
;1286:
;1287:	// weapon
;1288:	if ( weaponNumber == -1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 -1
NEI4 $591
line 1289
;1289:		pi->pendingWeapon = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -1
ASGNI4
line 1290
;1290:		pi->weaponTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1291
;1291:	}
ADDRGP4 $592
JUMPV
LABELV $591
line 1292
;1292:	else if ( weaponNumber != WP_NONE ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $593
line 1293
;1293:		pi->pendingWeapon = weaponNumber;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 1294
;1294:		pi->weaponTimer = dp_realtime + UI_TIMER_WEAPON_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1295
;1295:	}
LABELV $593
LABELV $592
line 1296
;1296:	weaponNum = pi->lastWeapon;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRI4
ASGNI4
line 1297
;1297:	pi->weapon = weaponNum;
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1299
;1298:
;1299:	if ( torsoAnim == BOTH_DEATH1 || legsAnim == BOTH_DEATH1 ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $597
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $595
LABELV $597
line 1300
;1300:		torsoAnim = legsAnim = BOTH_DEATH1;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1301
;1301:		pi->weapon = pi->currentWeapon = WP_NONE;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1208
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1302
;1302:		UI_PlayerInfo_SetWeapon( pi, pi->weapon );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_PlayerInfo_SetWeapon
CALLV
pop
line 1304
;1303:
;1304:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1305
;1305:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1306
;1306:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1308
;1307:
;1308:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1309
;1309:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1311
;1310:
;1311:		return;
ADDRGP4 $586
JUMPV
LABELV $595
line 1315
;1312:	}
;1313:
;1314:	// leg animation
;1315:	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1316
;1316:	if ( legsAnim != LEGS_JUMP && ( currentAnim == LEGS_JUMP || currentAnim == LEGS_LAND ) ) {
ADDRLP4 12
CNSTI4 18
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $598
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $600
ADDRLP4 0
INDIRI4
CNSTI4 19
NEI4 $598
LABELV $600
line 1317
;1317:		pi->pendingLegsAnim = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1318
;1318:	}
ADDRGP4 $599
JUMPV
LABELV $598
line 1319
;1319:	else if ( legsAnim != currentAnim ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $601
line 1320
;1320:		jumpHeight = 0;
ADDRGP4 jumpHeight
CNSTF4 0
ASGNF4
line 1321
;1321:		pi->pendingLegsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 1322
;1322:		UI_ForceLegsAnim( pi, legsAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceLegsAnim
CALLV
pop
line 1323
;1323:	}
LABELV $601
LABELV $599
line 1326
;1324:
;1325:	// torso animation
;1326:	if ( torsoAnim == TORSO_STAND || torsoAnim == TORSO_STAND2 ) {
ADDRLP4 20
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 11
EQI4 $605
ADDRLP4 20
INDIRI4
CNSTI4 12
NEI4 $603
LABELV $605
line 1327
;1327:		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $608
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $606
LABELV $608
line 1328
;1328:			torsoAnim = TORSO_STAND2;
ADDRFP4 8
CNSTI4 12
ASGNI4
line 1329
;1329:		}
ADDRGP4 $607
JUMPV
LABELV $606
line 1330
;1330:		else {
line 1331
;1331:			torsoAnim = TORSO_STAND;
ADDRFP4 8
CNSTI4 11
ASGNI4
line 1332
;1332:		}
LABELV $607
line 1333
;1333:	}
LABELV $603
line 1335
;1334:
;1335:	if ( torsoAnim == TORSO_ATTACK || torsoAnim == TORSO_ATTACK2 ) {
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 7
EQI4 $611
ADDRLP4 24
INDIRI4
CNSTI4 8
NEI4 $609
LABELV $611
line 1336
;1336:		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $614
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $612
LABELV $614
line 1337
;1337:			torsoAnim = TORSO_ATTACK2;
ADDRFP4 8
CNSTI4 8
ASGNI4
line 1338
;1338:		}
ADDRGP4 $613
JUMPV
LABELV $612
line 1339
;1339:		else {
line 1340
;1340:			torsoAnim = TORSO_ATTACK;
ADDRFP4 8
CNSTI4 7
ASGNI4
line 1341
;1341:		}
LABELV $613
line 1342
;1342:		pi->muzzleFlashTime = dp_realtime + UI_TIMER_MUZZLE_FLASH;
ADDRFP4 0
INDIRP4
CNSTI4 1180
ADDP4
ADDRGP4 dp_realtime
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1344
;1343:		//FIXME play firing sound here
;1344:	}
LABELV $609
line 1346
;1345:
;1346:	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1348
;1347:
;1348:	if ( weaponNum != pi->currentWeapon || currentAnim == TORSO_RAISE || currentAnim == TORSO_DROP ) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
NEI4 $618
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $618
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $615
LABELV $618
line 1349
;1349:		pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1350
;1350:	}
ADDRGP4 $616
JUMPV
LABELV $615
line 1351
;1351:	else if ( ( currentAnim == TORSO_GESTURE || currentAnim == TORSO_ATTACK ) && ( torsoAnim != currentAnim ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $621
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $619
LABELV $621
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $619
line 1352
;1352:		pi->pendingTorsoAnim = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1353
;1353:	}
ADDRGP4 $620
JUMPV
LABELV $619
line 1354
;1354:	else if ( torsoAnim != currentAnim ) {
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $622
line 1355
;1355:		pi->pendingTorsoAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1356
;1356:		UI_ForceTorsoAnim( pi, torsoAnim );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ForceTorsoAnim
CALLV
pop
line 1357
;1357:	}
LABELV $622
LABELV $620
LABELV $616
line 1358
;1358:}
LABELV $586
endproc UI_PlayerInfo_SetInfo 36 8
bss
align 4
LABELV jumpHeight
skip 4
align 4
LABELV dp_realtime
skip 4
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
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
import UI_GetBotNameByNumber
import UI_LoadBots
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
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
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
import trap_R_ModelBounds
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
import UI_LoadBestScores
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
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
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
import uiInfo
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
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_ShowPostGame
import UI_AdjustTimeByGame
import _UI_SetActiveMenu
import UI_LoadMenus
import UI_Load
import UI_Report
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
export weaponChangeSound
align 4
LABELV weaponChangeSound
skip 4
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
import ui_serverStatusTimeOut
import ui_bigFont
import ui_smallFont
import ui_scoreTime
import ui_scoreShutoutBonus
import ui_scoreSkillBonus
import ui_scoreTimeBonus
import ui_scoreBase
import ui_scoreTeam
import ui_scorePerfect
import ui_scoreScore
import ui_scoreGauntlets
import ui_scoreAssists
import ui_scoreDefends
import ui_scoreExcellents
import ui_scoreImpressives
import ui_scoreAccuracy
import ui_singlePlayerActive
import ui_lastServerRefresh_3
import ui_lastServerRefresh_2
import ui_lastServerRefresh_1
import ui_lastServerRefresh_0
import ui_selectedPlayerName
import ui_selectedPlayer
import ui_currentOpponent
import ui_mapIndex
import ui_currentNetMap
import ui_currentMap
import ui_currentTier
import ui_menuFiles
import ui_opponentName
import ui_dedicated
import ui_serverFilterType
import ui_netSource
import ui_joinGameType
import ui_actualNetGameType
import ui_netGameType
import ui_gameType
import ui_fragLimit
import ui_captureLimit
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
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
LABELV $584
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $581
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $578
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
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $577
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $568
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $565
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $560
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $557
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $556
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $553
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $550
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $542
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $521
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $516
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $507
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $502
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $494
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $484
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $483
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $480
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $479
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $474
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $473
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
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $470
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $469
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $464
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
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
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $452
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $451
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $446
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $445
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $435
byte 1 0
align 1
LABELV $434
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $431
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $422
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $413
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $406
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $389
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $383
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $375
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $185
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $113
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $112
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
