models/weapons2/gauntlet/LDAgauntlet
{
	{
		map models/weapons2/gauntlet/fx.jpg
		rgbGen lightingDiffuse
		tcMod scroll 0.006 0.009
		tcMod scale 3 3
		tcGen environment 
	}
	{
		map models/weapons2/gauntlet/ldagauntlet.tga
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

models/weapons2/gauntlet/LDAgauntlet_b
{
	{
		map models/weapons2/gauntlet/fx.jpg
		rgbGen lightingDiffuse
		tcMod scroll -0.006 -0.009
		tcMod scale 1 1
		tcGen environment 
	}
	{
		map models/weapons2/gauntlet/ldagauntlet_b.tga
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

models/weapons2/gauntlet/sparky1
{
	cull disable
	{
		animmap 13 models/weapons2/gauntlet/sparky1.jpg models/weapons2/gauntlet/sparky2.jpg models/weapons2/gauntlet/sparky3.jpg models/weapons2/gauntlet/sparky4.jpg models/weapons2/gauntlet/sparky5.jpg models/weapons2/gauntlet/sparky6.jpg models/weapons2/gauntlet/sparky7.jpg 
		blendfunc add
		rgbGen wave sin 0.3 1.1 0 17 
	}
}

models/weapons2/gauntlet/ldagauntlet_ifx
{
	cull disable
	{
		map models/weapons2/gauntlet/ldagauntlet_ifx.jpg
		blendfunc add
		rgbGen wave sin 0.1 0.6 0 9 
		tcMod rotate 512
		tcMod transform 0.9 0 0 0.9 1.05 1.05
	}
}

models/weapons2/gauntlet/ldagauntlet_afx1
{
	cull disable
	{
		map models/weapons2/gauntlet/ldagauntlet_afx1.jpg
		blendfunc add
		tcMod scroll 5 0
		tcMod turb 0.01 0.09 0 9
	}
	{
		map models/weapons2/gauntlet/ldagauntlet_afx2.jpg
		blendfunc add
		rgbGen wave sin 0.1 0.9 88 9 
		tcMod scroll -11 0
	}
	{
		map models/weapons2/gauntlet/ldagauntlet_afx3.jpg
		blendfunc add
		tcMod scroll 256 0
		tcMod scale 0.01 1
	}
}

