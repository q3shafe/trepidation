code
proc StringToFilter 160 8
file "../g_svcmds.c"
line 59
;1:// 2016 Trepidation Licensed under the GPL2
;2://
;3:
;4:// this file holds commands that can be executed by the server console, but not remote clients
;5:
;6:#include "g_local.h"
;7:
;8:
;9:/*
;10:==============================================================================
;11:
;12:PACKET FILTERING
;13: 
;14:
;15:You can add or remove addresses from the filter list with:
;16:
;17:addip <ip>
;18:removeip <ip>
;19:
;20:The ip address is specified in dot format, and you can use '*' to match any value
;21:so you can specify an entire class C network with "addip 192.246.40.*"
;22:
;23:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;24:
;25:listip
;26:Prints the current list of filters.
;27:
;28:g_filterban <0 or 1>
;29:
;30:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;31:
;32:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;33:
;34:TTimo NOTE: for persistence, bans are stored in g_banIPs cvar MAX_CVAR_VALUE_STRING
;35:The size of the cvar string buffer is limiting the banning to around 20 masks
;36:this could be improved by putting some g_banIPs2 g_banIps3 etc. maybe
;37:still, you should rely on PB for banning instead
;38:
;39:==============================================================================
;40:*/
;41:
;42:typedef struct ipFilter_s
;43:{
;44:	unsigned	mask;
;45:	unsigned	compare;
;46:} ipFilter_t;
;47:
;48:#define	MAX_IPFILTERS	1024
;49:
;50:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;51:static int			numIPFilters;
;52:
;53:/*
;54:=================
;55:StringToFilter
;56:=================
;57:*/
;58:static qboolean StringToFilter (char *s, ipFilter_t *f)
;59:{
line 65
;60:	char	num[128];
;61:	int		i, j;
;62:	byte	b[4];
;63:	byte	m[4];
;64:	
;65:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $56
line 66
;66:	{
line 67
;67:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 68
;68:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 69
;69:	}
LABELV $57
line 65
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $56
line 71
;70:	
;71:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $60
line 72
;72:	{
line 73
;73:		if (*s < '0' || *s > '9')
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $66
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $64
LABELV $66
line 74
;74:		{
line 75
;75:			if (*s == '*') // 'match any'
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $67
line 76
;76:			{
line 78
;77:				// b[i] and m[i] to 0
;78:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 79
;79:				if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $69
line 80
;80:					break;
ADDRGP4 $62
JUMPV
LABELV $69
line 81
;81:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 82
;82:				continue;
ADDRGP4 $61
JUMPV
LABELV $67
line 84
;83:			}
;84:			G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $71
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 85
;85:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $64
line 88
;86:		}
;87:		
;88:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $72
line 90
;89:		while (*s >= '0' && *s <= '9')
;90:		{
line 91
;91:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 92
;92:		}
LABELV $73
line 89
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $75
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $72
LABELV $75
line 93
;93:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 94
;94:		b[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 95
;95:		m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
line 97
;96:
;97:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $76
line 98
;98:			break;
ADDRGP4 $62
JUMPV
LABELV $76
line 99
;99:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 100
;100:	}
LABELV $61
line 71
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $60
LABELV $62
line 102
;101:	
;102:	f->mask = *(unsigned *)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 103
;103:	f->compare = *(unsigned *)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 105
;104:	
;105:	return qtrue;
CNSTI4 1
RETI4
LABELV $55
endproc StringToFilter 160 8
proc UpdateIPBans 344 12
line 114
;106:}
;107:
;108:/*
;109:=================
;110:UpdateIPBans
;111:=================
;112:*/
;113:static void UpdateIPBans (void)
;114:{
line 121
;115:	byte	b[4];
;116:	byte	m[4];
;117:	int		i,j;
;118:	char	iplist_final[MAX_CVAR_VALUE_STRING];
;119:	char	ip[64];
;120:
;121:	*iplist_final = 0;
ADDRLP4 80
CNSTI1 0
ASGNI1
line 122
;122:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $79
line 123
;123:	{
line 124
;124:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $83
line 125
;125:			continue;
ADDRGP4 $80
JUMPV
LABELV $83
line 127
;126:
;127:		*(unsigned *)b = ipFilters[i].compare;
ADDRLP4 72
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 128
;128:		*(unsigned *)m = ipFilters[i].mask;
ADDRLP4 68
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ASGNU4
line 129
;129:		*ip = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 130
;130:		for (j = 0 ; j < 4 ; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $87
line 131
;131:		{
line 132
;132:			if (m[j]!=255)
ADDRLP4 0
INDIRI4
ADDRLP4 68
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
EQI4 $91
line 133
;133:				Q_strcat(ip, sizeof(ip), "*");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $92
JUMPV
LABELV $91
line 135
;134:			else
;135:				Q_strcat(ip, sizeof(ip), va("%i", b[j]));
ADDRGP4 $94
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 72
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $92
line 136
;136:			Q_strcat(ip, sizeof(ip), (j<3) ? "." : " ");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $98
ADDRLP4 340
ADDRGP4 $95
ASGNP4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 340
ADDRGP4 $96
ASGNP4
LABELV $99
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 137
;137:		}		
LABELV $88
line 130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $87
line 138
;138:		if (strlen(iplist_final)+strlen(ip) < MAX_CVAR_VALUE_STRING)
ADDRLP4 80
ARGP4
ADDRLP4 336
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 340
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
ADDRLP4 340
INDIRI4
ADDI4
CNSTI4 256
GEI4 $100
line 139
;139:		{
line 140
;140:			Q_strcat( iplist_final, sizeof(iplist_final), ip);
ADDRLP4 80
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 141
;141:		}
ADDRGP4 $101
JUMPV
LABELV $100
line 143
;142:		else
;143:		{
line 144
;144:			Com_Printf("g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n");
ADDRGP4 $102
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 145
;145:			break;
ADDRGP4 $81
JUMPV
LABELV $101
line 147
;146:		}
;147:	}
LABELV $80
line 122
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $82
ADDRLP4 76
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $79
LABELV $81
line 149
;148:
;149:	trap_Cvar_Set( "g_banIPs", iplist_final );
ADDRGP4 $103
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 150
;150:}
LABELV $78
endproc UpdateIPBans 344 12
export G_FilterPacket
proc G_FilterPacket 28 0
line 158
;151:
;152:/*
;153:=================
;154:G_FilterPacket
;155:=================
;156:*/
;157:qboolean G_FilterPacket (char *from)
;158:{
line 164
;159:	int		i;
;160:	unsigned	in;
;161:	byte m[4];
;162:	char *p;
;163:
;164:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 165
;165:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $106
JUMPV
LABELV $105
line 166
;166:	while (*p && i < 4) {
line 167
;167:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $109
JUMPV
LABELV $108
line 168
;168:		while (*p >= '0' && *p <= '9') {
line 169
;169:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 170
;170:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 171
;171:		}
LABELV $109
line 168
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $111
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $108
LABELV $111
line 172
;172:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $114
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $112
LABELV $114
line 173
;173:			break;
ADDRGP4 $107
JUMPV
LABELV $112
line 174
;174:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 175
;175:	}
LABELV $106
line 166
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $115
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $105
LABELV $115
LABELV $107
line 177
;176:	
;177:	in = *(unsigned *)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 179
;178:
;179:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $116
line 180
;180:		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $120
line 181
;181:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $126
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $104
JUMPV
LABELV $120
LABELV $117
line 179
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $119
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $116
line 183
;182:
;183:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $129
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $129
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $130
ADDRLP4 24
INDIRI4
RETI4
LABELV $104
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 192
;184:}
;185:
;186:/*
;187:=================
;188:AddIP
;189:=================
;190:*/
;191:static void AddIP( char *str )
;192:{
line 195
;193:	int		i;
;194:
;195:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $132
line 196
;196:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $136
line 197
;197:			break;		// free spot
ADDRGP4 $134
JUMPV
LABELV $136
LABELV $133
line 195
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $135
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $132
LABELV $134
line 198
;198:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $139
line 199
;199:	{
line 200
;200:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $141
line 201
;201:		{
line 202
;202:			G_Printf ("IP filter list is full\n");
ADDRGP4 $143
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 203
;203:			return;
ADDRGP4 $131
JUMPV
LABELV $141
line 205
;204:		}
;205:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 206
;206:	}
LABELV $139
line 208
;207:	
;208:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $144
line 209
;209:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $144
line 211
;210:
;211:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 212
;212:}
LABELV $131
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 276 12
line 220
;213:
;214:/*
;215:=================
;216:G_ProcessIPBans
;217:=================
;218:*/
;219:void G_ProcessIPBans(void) 
;220:{
line 224
;221:	char *s, *t;
;222:	char		str[MAX_CVAR_VALUE_STRING];
;223:
;224:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 226
;225:
;226:	for (t = s = g_banIPs.string; *t; /* */ ) {
ADDRLP4 264
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 264
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $149
line 227
;227:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 268
INDIRP4
ASGNP4
line 228
;228:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 229
;229:			break;
ADDRGP4 $151
JUMPV
LABELV $156
line 231
;230:		while (*s == ' ')
;231:			*s++ = 0;
ADDRLP4 272
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI1 0
ASGNI1
LABELV $157
line 230
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $156
line 232
;232:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $159
line 233
;233:			AddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $159
line 234
;234:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 235
;235:	}
LABELV $150
line 226
LABELV $152
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $149
LABELV $151
line 236
;236:}
LABELV $147
endproc G_ProcessIPBans 276 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 245
;237:
;238:
;239:/*
;240:=================
;241:Svcmd_AddIP_f
;242:=================
;243:*/
;244:void Svcmd_AddIP_f (void)
;245:{
line 248
;246:	char		str[MAX_TOKEN_CHARS];
;247:
;248:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $162
line 249
;249:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $164
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 250
;250:		return;
ADDRGP4 $161
JUMPV
LABELV $162
line 253
;251:	}
;252:
;253:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 255
;254:
;255:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 257
;256:
;257:}
LABELV $161
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 265
;258:
;259:/*
;260:=================
;261:Svcmd_RemoveIP_f
;262:=================
;263:*/
;264:void Svcmd_RemoveIP_f (void)
;265:{
line 270
;266:	ipFilter_t	f;
;267:	int			i;
;268:	char		str[MAX_TOKEN_CHARS];
;269:
;270:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $166
line 271
;271:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $168
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 272
;272:		return;
ADDRGP4 $165
JUMPV
LABELV $166
line 275
;273:	}
;274:
;275:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 277
;276:
;277:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $169
line 278
;278:		return;
ADDRGP4 $165
JUMPV
LABELV $169
line 280
;279:
;280:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $171
line 281
;281:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $175
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $175
line 282
;282:			ipFilters[i].compare == f.compare) {
line 283
;283:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 284
;284:			G_Printf ("Removed.\n");
ADDRGP4 $180
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 286
;285:
;286:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 287
;287:			return;
ADDRGP4 $165
JUMPV
LABELV $175
line 289
;288:		}
;289:	}
LABELV $172
line 280
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $174
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $171
line 291
;290:
;291:	G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $181
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 292
;292:}
LABELV $165
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_BalanceTeams
proc Svcmd_BalanceTeams 24 8
line 302
;293:
;294:
;295:/*
;296:===================
;297:svcmd_BalanceTeams
;298:
;299:BalanceTeams
;300:===================
;301:*/
;302:void Svcmd_BalanceTeams ( void ) {
line 305
;303:
;304:	// Blue Team Is Bigger Than Red 
;305:	if ( TeamCount( -1, TEAM_BLUE ) > TeamCount( -1, TEAM_RED ) )  {
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 TeamCount
CALLI4
ASGNI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $183
line 307
;306:		// Is The Difference More Than 2 Players?
;307:		if ( (TeamCount(-1, TEAM_BLUE) - TeamCount( -1,TEAM_RED)) > 1) {
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
ADDRGP4 TeamCount
CALLI4
ASGNI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1
LEI4 $184
line 308
;308:			BalanceTeams(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 BalanceTeams
CALLI4
pop
line 309
;309:		}
line 311
;310:
;311:	} 
ADDRGP4 $184
JUMPV
LABELV $183
line 313
;312:	else
;313:	{
line 316
;314:
;315:		// Red Team Is Bigger Than Blue
;316:		if ( TeamCount( -1, TEAM_RED ) > TeamCount( -1, TEAM_BLUE ) )  {
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 TeamCount
CALLI4
ASGNI4
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 12
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $187
line 318
;317:			// Is The Difference More Than 2 Players?
;318:			if ( (TeamCount(-1, TEAM_RED) - TeamCount( -1,TEAM_BLUE)) > 1) {
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 1
LEI4 $189
line 320
;319:				
;320:				BalanceTeams(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 BalanceTeams
CALLI4
pop
line 321
;321:			}
LABELV $189
line 322
;322:		}
LABELV $187
line 323
;323:	} // End Else
LABELV $184
line 325
;324:
;325:}
LABELV $182
endproc Svcmd_BalanceTeams 24 8
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 332
;326:
;327:/*
;328:===================
;329:Svcmd_EntityList_f
;330:===================
;331:*/
;332:void	Svcmd_EntityList_f (void) {
line 336
;333:	int			e;
;334:	gentity_t		*check;
;335:
;336:	check = g_entities+1;
ADDRLP4 0
ADDRGP4 g_entities+924
ASGNP4
line 337
;337:	for (e = 1; e < level.num_entities ; e++, check++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $193
line 338
;338:		if ( !check->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 339
;339:			continue;
ADDRGP4 $194
JUMPV
LABELV $198
line 341
;340:		}
;341:		G_Printf("%3i:", e);
ADDRGP4 $200
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 342
;342:		switch ( check->s.eType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $229
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $229
address $204
address $206
address $208
address $210
address $212
address $214
address $216
address $218
address $220
address $222
address $224
address $226
code
LABELV $204
line 344
;343:		case ET_GENERAL:
;344:			G_Printf("ET_GENERAL          ");
ADDRGP4 $205
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 345
;345:			break;
ADDRGP4 $202
JUMPV
LABELV $206
line 347
;346:		case ET_PLAYER:
;347:			G_Printf("ET_PLAYER           ");
ADDRGP4 $207
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 348
;348:			break;
ADDRGP4 $202
JUMPV
LABELV $208
line 350
;349:		case ET_ITEM:
;350:			G_Printf("ET_ITEM             ");
ADDRGP4 $209
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 351
;351:			break;
ADDRGP4 $202
JUMPV
LABELV $210
line 353
;352:		case ET_MISSILE:
;353:			G_Printf("ET_MISSILE          ");
ADDRGP4 $211
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 354
;354:			break;
ADDRGP4 $202
JUMPV
LABELV $212
line 356
;355:		case ET_MOVER:
;356:			G_Printf("ET_MOVER            ");
ADDRGP4 $213
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 357
;357:			break;
ADDRGP4 $202
JUMPV
LABELV $214
line 359
;358:		case ET_BEAM:
;359:			G_Printf("ET_BEAM             ");
ADDRGP4 $215
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 360
;360:			break;
ADDRGP4 $202
JUMPV
LABELV $216
line 362
;361:		case ET_PORTAL:
;362:			G_Printf("ET_PORTAL           ");
ADDRGP4 $217
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 363
;363:			break;
ADDRGP4 $202
JUMPV
LABELV $218
line 365
;364:		case ET_SPEAKER:
;365:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $219
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 366
;366:			break;
ADDRGP4 $202
JUMPV
LABELV $220
line 368
;367:		case ET_PUSH_TRIGGER:
;368:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $221
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 369
;369:			break;
ADDRGP4 $202
JUMPV
LABELV $222
line 371
;370:		case ET_TELEPORT_TRIGGER:
;371:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $223
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 372
;372:			break;
ADDRGP4 $202
JUMPV
LABELV $224
line 374
;373:		case ET_INVISIBLE:
;374:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $225
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 375
;375:			break;
ADDRGP4 $202
JUMPV
LABELV $226
line 377
;376:		case ET_GRAPPLE:
;377:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $227
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 378
;378:			break;
ADDRGP4 $202
JUMPV
LABELV $201
line 380
;379:		default:
;380:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $228
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 381
;381:			break;
LABELV $202
line 384
;382:		}
;383:
;384:		if ( check->classname ) {
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 385
;385:			G_Printf("%s", check->classname);
ADDRGP4 $232
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 386
;386:		}
LABELV $230
line 387
;387:		G_Printf("\n");
ADDRGP4 $233
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 388
;388:	}
LABELV $194
line 337
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
LABELV $196
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $193
line 389
;389:}
LABELV $191
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 391
;390:
;391:gclient_t	*ClientForString( const char *s ) {
line 397
;392:	gclient_t	*cl;
;393:	int			i;
;394:	int			idnum;
;395:
;396:	// numeric values are just slot numbers
;397:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $235
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $235
line 398
;398:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 399
;399:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $240
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $237
LABELV $240
line 400
;400:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 401
;401:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $234
JUMPV
LABELV $237
line 404
;402:		}
;403:
;404:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 405
;405:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $242
line 406
;406:			G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $244
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 407
;407:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $234
JUMPV
LABELV $242
line 409
;408:		}
;409:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $234
JUMPV
LABELV $235
line 413
;410:	}
;411:
;412:	// check for a name match
;413:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $248
JUMPV
LABELV $245
line 414
;414:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 415
;415:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
line 416
;416:			continue;
ADDRGP4 $246
JUMPV
LABELV $250
line 418
;417:		}
;418:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $252
line 419
;419:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $234
JUMPV
LABELV $252
line 421
;420:		}
;421:	}
LABELV $246
line 413
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $248
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $245
line 423
;422:
;423:	G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $254
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 425
;424:
;425:	return NULL;
CNSTP4 0
RETP4
LABELV $234
endproc ClientForString 24 8
export Svcmd_Punish_f
proc Svcmd_Punish_f 1032 12
line 437
;426:}
;427:
;428:
;429:
;430:/*
;431:===================
;432:Svcmd_Punish_f
;433:
;434:forceteam <player> <team>
;435:===================
;436:*/
;437:void	Svcmd_Punish_f( void ) {
line 442
;438:	gclient_t	*cl;
;439:	char		str[MAX_TOKEN_CHARS];
;440:
;441:	// find the player
;442:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 443
;443:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 444
;444:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 445
;445:		return;
ADDRGP4 $255
JUMPV
LABELV $256
line 449
;446:	}
;447:
;448:	// set the team
;449:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 451
;450:
;451:	if (g_entities[cl - level.clients].immobilized == qtrue)
CNSTI4 924
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
MULI4
ADDRGP4 g_entities+920
ADDP4
INDIRI4
CNSTI4 1
NEI4 $258
line 452
;452:	{
line 453
;453:		g_entities[cl - level.clients].immobilized = qfalse;
CNSTI4 924
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
MULI4
ADDRGP4 g_entities+920
ADDP4
CNSTI4 0
ASGNI4
line 454
;454:	} 
ADDRGP4 $259
JUMPV
LABELV $258
line 456
;455:	else
;456:	{
line 457
;457:		g_entities[cl - level.clients].immobilized = qtrue;
CNSTI4 924
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
MULI4
ADDRGP4 g_entities+920
ADDP4
CNSTI4 1
ASGNI4
line 458
;458:	}
LABELV $259
line 460
;459:
;460:}
LABELV $255
endproc Svcmd_Punish_f 1032 12
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 469
;461:
;462:/*
;463:===================
;464:Svcmd_ForceTeam_f
;465:
;466:forceteam <player> <team>
;467:===================
;468:*/
;469:void	Svcmd_ForceTeam_f( void ) {
line 474
;470:	gclient_t	*cl;
;471:	char		str[MAX_TOKEN_CHARS];
;472:
;473:	// find the player
;474:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 475
;475:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 476
;476:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 477
;477:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 481
;478:	}
;479:
;480:	// set the team
;481:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 482
;482:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 924
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 483
;483:}
LABELV $263
endproc Svcmd_ForceTeam_f 1032 12
export count_file_lines
proc count_file_lines 32240 12
line 487
;484:
;485:
;486:
;487:int count_file_lines() {
line 492
;488:	fileHandle_t	f;
;489:	int				len;
;490:	//maplist_t		maplist;	
;491:	char			mapname[200];
;492:	int				count=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 503
;493:	char			buffer[32000];
;494:	char			*p, *token;
;495:	int				x;
;496:	int				y;
;497:
;498:	/*
;499:	if (strlen(g_mappool.string) == 0)
;500:		return;
;501:	*/
;502:
;503:	len = trap_FS_FOpenFile(g_mapfile.string, &f, FS_READ);
ADDRGP4 g_mapfile+16
ARGP4
ADDRLP4 32012
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32228
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 32016
ADDRLP4 32228
INDIRI4
ASGNI4
line 504
;504:	if ( !f ) {
ADDRLP4 32012
INDIRI4
CNSTI4 0
NEI4 $268
line 505
;505:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $268
line 508
;506:	}
;507:
;508:	if (len > sizeof(buffer)) {
ADDRLP4 32016
INDIRI4
CVIU4 4
CNSTU4 32000
LEU4 $270
line 509
;509:		trap_FS_FCloseFile(f);
ADDRLP4 32012
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 510
;510:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $270
line 513
;511:	}
;512:
;513:	if (len == 0) {
ADDRLP4 32016
INDIRI4
CNSTI4 0
NEI4 $272
line 514
;514:		trap_FS_FCloseFile(f);
ADDRLP4 32012
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 515
;515:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $272
line 518
;516:	}
;517:
;518:	memset(buffer, 0, sizeof(buffer));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32000
ARGI4
ADDRGP4 memset
CALLP4
pop
line 519
;519:	trap_FS_Read(buffer, sizeof(buffer), f);
ADDRLP4 12
ARGP4
CNSTI4 32000
ARGI4
ADDRLP4 32012
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 520
;520:	trap_FS_FCloseFile(f);
ADDRLP4 32012
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 522
;521:
;522:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 523
;523:	p = buffer;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $275
JUMPV
LABELV $274
line 524
;524:	while ( 1 ) {
line 525
;525:		token = COM_Parse(&p);
ADDRLP4 8
ARGP4
ADDRLP4 32232
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32232
INDIRP4
ASGNP4
line 526
;526:		if (! as_checkToken(token) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32236
ADDRGP4 as_checkToken
CALLI4
ASGNI4
ADDRLP4 32236
INDIRI4
CNSTI4 0
NEI4 $277
line 527
;527:			break; // end of list	
ADDRGP4 $276
JUMPV
LABELV $277
line 528
;528:			count++;				
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 529
;529:	}	
LABELV $275
line 524
ADDRGP4 $274
JUMPV
LABELV $276
line 531
;530:
;531:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $266
endproc count_file_lines 32240 12
export as_checkToken
proc as_checkToken 4 0
line 534
;532:}
;533:
;534:qboolean as_checkToken( char *token ) {
line 535
;535:	if ( !token || token[0] == 0 )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $282
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $280
LABELV $282
line 536
;536:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $279
JUMPV
LABELV $280
line 537
;537:	return qtrue;
CNSTI4 1
RETI4
LABELV $279
endproc as_checkToken 4 0
proc GetRandomMap 32260 12
line 540
;538:}
;539:
;540:static char *GetRandomMap() {
line 545
;541:	fileHandle_t	f;
;542:	int				len;
;543:	//maplist_t		maplist;	
;544:	char			mapname[200];
;545:	int				count=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 552
;546:	char			buffer[32000];
;547:	char			*p, *token;
;548:	int				x;
;549:	int				y;
;550:
;551:
;552:	trap_SendConsoleCommand( EXEC_APPEND, va("seta g_lastmap2 %i\n", g_lastmap.integer) );		
ADDRGP4 $284
ARGP4
ADDRGP4 g_lastmap+12
INDIRI4
ARGI4
ADDRLP4 32228
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 32228
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 559
;553:
;554:	/*
;555:	if (strlen(g_mappool.string) == 0)
;556:		return;
;557:	*/
;558:
;559:	len = trap_FS_FOpenFile(g_mapfile.string, &f, FS_READ);
ADDRGP4 g_mapfile+16
ARGP4
ADDRLP4 32016
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32232
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 32020
ADDRLP4 32232
INDIRI4
ASGNI4
line 560
;560:	if ( !f ) {
ADDRLP4 32016
INDIRI4
CNSTI4 0
NEI4 $287
line 561
;561:		return token;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $287
line 564
;562:	}
;563:
;564:	if (len > sizeof(buffer)) {
ADDRLP4 32020
INDIRI4
CVIU4 4
CNSTU4 32000
LEU4 $289
line 565
;565:		trap_FS_FCloseFile(f);
ADDRLP4 32016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 566
;566:		return token;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $289
line 569
;567:	}
;568:
;569:	if (len == 0) {
ADDRLP4 32020
INDIRI4
CNSTI4 0
NEI4 $291
line 570
;570:		trap_FS_FCloseFile(f);
ADDRLP4 32016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 571
;571:		return token;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $291
line 574
;572:	}
;573:
;574:	memset(buffer, 0, sizeof(buffer));
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32000
ARGI4
ADDRGP4 memset
CALLP4
pop
line 575
;575:	trap_FS_Read(buffer, sizeof(buffer), f);
ADDRLP4 16
ARGP4
CNSTI4 32000
ARGI4
ADDRLP4 32016
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 576
;576:	trap_FS_FCloseFile(f);
ADDRLP4 32016
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 577
;577:	x = count_file_lines();
ADDRLP4 32236
ADDRGP4 count_file_lines
CALLI4
ASGNI4
ADDRLP4 32024
ADDRLP4 32236
INDIRI4
ASGNI4
line 578
;578:	p = buffer;
ADDRLP4 12
ADDRLP4 16
ASGNP4
line 579
;579:	y = irandom(0,(x-1));
CNSTI4 0
ARGI4
ADDRLP4 32024
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 32240
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32240
INDIRI4
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
line 583
;580:	
;581:	
;582:
;583:	while ( 1 ) {
line 584
;584:		token = COM_Parse(&p);
ADDRLP4 12
ARGP4
ADDRLP4 32244
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32244
INDIRP4
ASGNP4
line 585
;585:		if (! as_checkToken(token) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32248
ADDRGP4 as_checkToken
CALLI4
ASGNI4
ADDRLP4 32248
INDIRI4
CNSTI4 0
NEI4 $296
line 586
;586:			break; // end of list	
ADDRGP4 $295
JUMPV
LABELV $296
line 587
;587:		if (count==y) 
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $298
line 588
;588:		{
line 591
;589:			
;590:
;591:			if(g_lastmap.integer != y) 
ADDRGP4 g_lastmap+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $300
line 592
;592:			{
line 594
;593:				//g_lastmap.string = token;
;594:				G_Printf( "Here is a random map %s\n", token);
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 595
;595:				trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", token ) );
ADDRGP4 $304
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32252
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 32252
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 596
;596:				trap_SendConsoleCommand( EXEC_APPEND, va("seta g_lastmap %i\n", y) );
ADDRGP4 $305
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 32256
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 597
;597:				return token;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $300
line 598
;598:			} else { 				
line 600
;599:				//if((y+1) > x) {  y=1; } 
;600:				y++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 601
;601:			}
line 604
;602:
;603:
;604:		}
LABELV $298
line 605
;605:		count++;				
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 606
;606:	}	
LABELV $294
line 583
ADDRGP4 $293
JUMPV
LABELV $295
line 610
;607:	
;608:	//G_Printf( "Here is a random map %i - %s\n", y, mapname[y]);
;609:	// we came up with nothing.. lets do this again
;610:	GetRandomMap();
ADDRGP4 GetRandomMap
CALLP4
pop
line 612
;611:
;612:}
CNSTP4 0
RETP4
LABELV $283
endproc GetRandomMap 32260 12
export ConsoleCommand
proc ConsoleCommand 1084 12
line 623
;613:
;614:
;615:char	*ConcatArgs( int start );
;616:
;617:/*
;618:=================
;619:ConsoleCommand
;620:
;621:=================
;622:*/
;623:qboolean	ConsoleCommand( void ) {
line 626
;624:	char	cmd[MAX_TOKEN_CHARS];
;625:
;626:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 628
;627:
;628:	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $309
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $307
line 629
;629:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 630
;630:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $307
line 633
;631:	}
;632:
;633:	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $310
line 634
;634:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 635
;635:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $310
line 638
;636:	}
;637:
;638:	if (Q_stricmp (cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $313
line 639
;639:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 640
;640:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $313
line 643
;641:	}
;642:
;643:	if (Q_stricmp (cmd, "addbot") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $316
line 644
;644:		Svcmd_AddBot_f();
ADDRGP4 Svcmd_AddBot_f
CALLV
pop
line 645
;645:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $316
line 648
;646:	}
;647:
;648:	if (Q_stricmp (cmd, "botlist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $319
line 649
;649:		Svcmd_BotList_f();
ADDRGP4 Svcmd_BotList_f
CALLV
pop
line 650
;650:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $319
line 653
;651:	}
;652:
;653:	if (Q_stricmp (cmd, "abort_podium") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $322
line 654
;654:		Svcmd_AbortPodium_f();
ADDRGP4 Svcmd_AbortPodium_f
CALLV
pop
line 655
;655:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $322
line 658
;656:	}
;657:
;658:	if (Q_stricmp (cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $325
line 659
;659:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 660
;660:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $325
line 663
;661:	}
;662:
;663:	if (Q_stricmp (cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $328
line 664
;664:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 665
;665:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $328
line 668
;666:	}
;667:
;668:	if (Q_stricmp (cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $331
line 669
;669:		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
CNSTI4 0
ARGI4
ADDRGP4 $334
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 670
;670:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $331
line 673
;671:	}
;672:
;673:	if (Q_stricmp (cmd, "punish") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $335
line 674
;674:		Svcmd_Punish_f();
ADDRGP4 Svcmd_Punish_f
CALLV
pop
line 675
;675:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $335
line 686
;676:	}
;677:	
;678:	/*
;679:	if (Q_stricmp (cmd, "where") == 0) {
;680:		
;681:		return qtrue;
;682:	}
;683:	*/ 
;684:	
;685:
;686:	if (Q_stricmp (cmd, "randmap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $338
line 687
;687:		G_Printf( "Final: Here is a random map %s\n", GetRandomMap());
ADDRLP4 1068
ADDRGP4 GetRandomMap
CALLP4
ASGNP4
ADDRGP4 $341
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 689
;688:		
;689:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $338
line 694
;690:	}
;691:	
;692:
;693:
;694:	if (Q_stricmp (cmd, "balanceteams") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $342
line 696
;695:		//FixME Later - Do it twice in case it's way off
;696:		Svcmd_BalanceTeams();
ADDRGP4 Svcmd_BalanceTeams
CALLV
pop
line 697
;697:		Svcmd_BalanceTeams();
ADDRGP4 Svcmd_BalanceTeams
CALLV
pop
line 698
;698:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $342
line 704
;699:	}
;700:
;701:
;702:
;703:
;704:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $345
line 705
;705:		if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $348
line 706
;706:			trap_SendServerCommand( -1, va("print \"server: %s\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1076
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $351
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 707
;707:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $348
line 710
;708:		}
;709:		// everything else will also be printed as a say command
;710:		trap_SendServerCommand( -1, va("print \"server: %s\"", ConcatArgs(0) ) );
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $351
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 711
;711:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $306
JUMPV
LABELV $345
line 714
;712:	}
;713:
;714:	return qfalse;
CNSTI4 0
RETI4
LABELV $306
endproc ConsoleCommand 1084 12
import ConcatArgs
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $351
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $350
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $344
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
LABELV $341
byte 1 70
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $337
byte 1 112
byte 1 117
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $334
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $333
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $330
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $327
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $324
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $321
byte 1 98
byte 1 111
byte 1 116
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $318
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $315
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $312
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $309
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $305
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $304
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $303
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 50
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $254
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
byte 1 0
align 1
LABELV $244
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
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $241
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
byte 1 0
align 1
LABELV $233
byte 1 10
byte 1 0
align 1
LABELV $232
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $228
byte 1 37
byte 1 51
byte 1 105
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
byte 1 0
align 1
LABELV $227
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
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
byte 1 0
align 1
LABELV $225
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $223
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $221
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $219
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $217
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
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
byte 1 0
align 1
LABELV $215
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
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
byte 1 0
align 1
LABELV $213
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $211
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
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
byte 1 0
align 1
LABELV $209
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
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
byte 1 0
align 1
LABELV $207
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $205
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
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
byte 1 0
align 1
LABELV $200
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $181
byte 1 68
byte 1 105
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $143
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 95
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 32
byte 1 0
align 1
LABELV $95
byte 1 46
byte 1 0
align 1
LABELV $94
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $93
byte 1 42
byte 1 0
align 1
LABELV $71
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
