models/weapons2/lightning/ldalg_zappies
{
	surfaceparm trans
	cull disable
	{
		map models/weapons2/lightning/ldalg_zappies.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 13 0
		tcMod scale 0.01 1
	}
	{
		map models/weapons2/lightning/ldalg_zappies.tga
		blendfunc gl_one_minus_dst_color gl_one
		rgbGen lightingDiffuse
		tcMod scroll -2 0
		tcMod turb 1 0.03 0 4
	}
	{
		map models/weapons2/lightning/ldalg_zappies.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0
		tcMod turb 1 0.08 0 9
	}
}

models/weapons2/lightning/ldalg_zappies2
{
	surfaceparm trans
	cull disable
	{
		map models/weapons2/lightning/ldalg_zappies2.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 13 1
		tcMod scale 0.01 1
	}
	{
		map models/weapons2/lightning/ldalg_zappies2.tga
		blendfunc gl_one_minus_dst_color gl_one
		rgbGen lightingDiffuse
		tcMod scroll -2 1
		tcMod turb 1 0.03 0 4
	}
	{
		map models/weapons2/lightning/ldalg_zappies2.tga
		blendfunc add
		rgbGen const ( 0 0 0.443137 )
		tcMod scroll -88 22
		tcMod turb 1 0.08 0 9
		tcMod stretch sin 22 0.1 0 3 
		tcMod rotate -220
	}
}

models/weapons2/lightning/LDAlightning
{
	{
		map models/weapons2/lightning/LDAlg_fx.jpg
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.03
		tcGen environment 
	}
	{
		map models/weapons2/lightning/LDAlightning.tga
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

