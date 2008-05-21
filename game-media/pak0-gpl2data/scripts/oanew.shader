redArmor
{
	{
		map models/powerups/armor/redarmor.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/powerups/armor/redarmor.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

yellowArmor
{
	{
		map models/powerups/armor/yellowarmor.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/powerups/armor/yellowarmor.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

textures/base_light/ceil1_4
{
	{
		map textures/base_light/ceil1_34.tga
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc add
		rgbGen wave noise 0.8 0.2 0 1 
	}
}

models/players/gargoyle/red
{
	{
		map models/players/gargoyle/red.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/detail/d_conc.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 4 4
		detail
	}
}

models/players/gargoyle/blue
{
	{
		map models/players/gargoyle/blue.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/detail/d_conc.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 4 4
		detail
	}
}

models/players/gargoyle/bared
{
	{
		map models/players/gargoyle/bared.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/detail/d_conc.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 6 6
		detail
	}
}

console
{
	{
		map textures/sfx/logo256.tga
	}
}

grassobj
{
	cull disable
	{
		map models/mapobjects/out/grass.tga
		rgbGen lightingDiffuse
		alphaFunc GE128
	}
}

ameatygib
{
	{
		map models/gibs/genericgibmeat.tga
		rgbGen lightingDiffuse
	}
	{
		map models/gibs/gibmeatspec.tga
		blendfunc gl_src_alpha gl_dst_alpha
		rgbGen lightingDiffuse
		alphaGen lightingSpecular
	}
}

oalogo
{
	{
		map textures/oa/water.tga
		tcMod scroll 0.01 0.01
	}
	{
		map textures/oa/water.tga
		blendfunc add
		tcMod scroll 0.04 0.01
	}
	{
		map textures/oa/water.tga
		blendfunc add
		tcMod scroll -0.01 -0.02
	}
	{
		map textures/oa/flamelet.tga
		tcMod scroll -0.2 0.4
	}
	{
		map textures/oa/flamelet.tga
		blendfunc add
		tcMod scroll 0.2 0.7
	}
	{
		map textures/oa/flamelet.tga
		blendfunc add
		tcMod scroll 0 0.6
	}
}

OLDmenubacknologo
{
	{
		map textures/oa/water.tga
		tcMod scroll 0.01 0.01
	}
	{
		map textures/oa/water.tga
		blendfunc add
		tcMod scroll 0.04 0.01
	}
	{
		map textures/oa/water.tga
		blendfunc filter
		tcMod scroll -0.01 -0.02
	}
}

menubacknologo
{
	{
		map textures/sfx/blakk.tga
	}
}

OLDmenuback
{
	{
		map textures/oa/bloodbg.tga
		tcMod scroll 0.01 0.01
		tcMod rotate 5
	}
	{
		map textures/oa/bloodbg.tga
		blendfunc add
		tcMod scroll 0.01 0.01
		tcMod rotate -6
	}
	{
		map textures/oa/bloodbg.tga
		blendfunc filter
		tcMod scroll -0.01 -0.02
		tcMod rotate 3
	}
}

menuback
{
	{
		map textures/sfx/blakk.tga
	}
}

bloodybg
{
	{
		map textures/oa/bloodbg.tga
		tcMod scroll 0.01 0.01
		tcMod rotate 5
	}
	{
		map textures/oa/bloodbg.tga
		blendfunc add
		tcMod scroll 0.01 0.01
		tcMod rotate -6
	}
	{
		map textures/oa/bloodbg.tga
		blendfunc filter
		tcMod scroll -0.01 -0.02
		tcMod rotate 3
	}
}

menubacknologo
{
	{
		animmap 2 textures/oa/causty_001.tga textures/oa/causty_003.tga textures/oa/causty_005.tga textures/oa/causty_007.tga textures/oa/causty_009.tga textures/oa/causty_011.tga textures/oa/causty_013.tga textures/oa/causty_015.tga 
		blendfunc blend
		alphaGen wave sin 1 -1 0 2 
	}
	{
		animmap 2 textures/oa/causty_002.tga textures/oa/causty_004.tga textures/oa/causty_006.tga textures/oa/causty_008.tga textures/oa/causty_010.tga textures/oa/causty_012.tga textures/oa/causty_014.tga textures/oa/causty_016.tga 
		blendfunc blend
		alphaGen wave sin 0 1 0 2 
	}
}

boomzor
{
	deformVertexes autosprite
	{
		clampmap textures/oa/fiar.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 1 
		tcMod rotate 77
		tcMod stretch sin 0.3 0.4 0 0.4 
	}
	{
		clampmap textures/oa/fiar2.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 1 
		tcMod rotate 33
		tcMod stretch sin 0.8 -0.4 0 0.1 
	}
	{
		clampmap textures/oa/fiar.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 1 
		tcMod rotate -17
	}
	{
		clampmap textures/oa/fiar2.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 1 
		tcMod rotate -77
	}
}

smokePuff
{
	cull disable
	{
		map gfx/misc/smokepuff3.tga
		blendfunc blend
		tcMod rotate -55
		alphaGen Vertex
	}
	{
		map gfx/misc/smokepuff3.tga
		blendfunc blend
		tcMod rotate 66
		alphaGen Vertex
	}
}

shotgunSmokePuff
{
	cull disable
	{
		clampmap gfx/misc/smokepuff3.tga
		blendfunc blend
		tcMod rotate -45
		alphaGen entity
	}
}

sprites/plasma1
{
	cull disable
	{
		clampmap sprites/plasmaa.tga
		blendfunc gl_src_alpha gl_one
		tcMod rotate -145
	}
	{
		clampmap sprites/plasmaa.tga
		blendfunc gl_src_alpha gl_one
		tcMod rotate 145
	}
}

textures/sfx/fanofdeath
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/sfx/fanofdeath.tga
		blendfunc blend
		tcMod rotate -888
	}
}

textures/sfx/forcefield
{
	q3map_lightimage textures/sfx/forcefieldd.tga
	surfaceparm nodlight
	surfaceparm nomarks
	surfaceparm trans
	q3map_surfacelight 222
	{
		map textures/sfx/forcefieldd.tga
		blendfunc add
		tcMod scroll 0.3 0.3
		tcGen vector ( 2 0 0 ) ( 0 2 0 ) 
	}
	{
		map textures/sfx/forcefieldd.tga
		blendfunc add
		tcMod scroll 0.32 0.35
	}
}

bfgshot
{
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/oafx/bfgfx.tga
		blendfunc add
		tcMod rotate -700
	}
	{
		clampmap textures/oafx/bfgfx2.tga
		blendfunc add
		tcMod rotate 54
	}
	{
		clampmap textures/oafx/bfgfx2.tga
		blendfunc add
		tcMod rotate -14
	}
}

bfgsho
{
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/oafx/bfgfx3.tga
		blendfunc add
		tcMod rotate 64
	}
}

