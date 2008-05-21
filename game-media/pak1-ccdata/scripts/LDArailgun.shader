models/weapons2/railgun/LDArailgun
{
	{
		map models/weapons2/railgun/LDArg_fx.jpg
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.03
		tcGen environment 
	}
	{
		map models/weapons2/railgun/LDArailgun.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen lightingDiffuse
		tcGen lightmap 
	}
}

models/weapons2/railgun/LDAf_railgun2
{
	sort additive
	cull disable
	{
		map models/weapons2/railgun/LDAf_railgun2.jpg
		blendfunc add
		rgbGen entity
	}
}

models/weapons2/railgun/LDArailgun2
{
	sort additive
	cull disable
	{
		map models/weapons2/railgun/LDArailgun2.glow.jpg
		blendfunc add
		rgbGen entity
		tcMod scroll -2 0
	}
	{
		map models/weapons2/railgun/ldarailgun4.jpg
		blendfunc add
		rgbGen entity
		tcMod scroll 3 -1
		tcMod turb 3 0.1 0 3
	}
}

models/weapons2/railgun/LDArailgun3
{
	{
		map models/weapons2/railgun/LDArailgun3.jpg
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/railgun/LDArailgun3.glow.jpg
		blendfunc add
		rgbGen entity
	}
}

models/weapons2/railgun/LDArailgun4
{
	{
		map models/weapons2/railgun/LDArailgun4.jpg
		rgbGen Vertex
		tcMod scroll 3 1
		tcMod turb 0 0.2 0 2
	}
	{
		map models/weapons2/railgun/ldarailgun2.glow.jpg
		blendfunc add
		rgbGen Vertex
		tcMod scroll -2 0
	}
}

railDisc
{
	sort nearest
	cull none
        deformVertexes wave 100 sin 0 2 0 2.4
	{
		clampmap gfx/misc/raildisc_mono2.tga 
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                 tcMod rotate -230
	}
}