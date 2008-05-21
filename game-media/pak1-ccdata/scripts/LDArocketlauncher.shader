models/weapons2/rocketl/hazardglass
{
	surfaceparm	trans

	{
		map models/weapons2/rocketl/hazardglassfx.jpg
		tcgen environment
		tcmod scale .25 .25
		blendfunc gl_one gl_one
	}

	{
		map models/weapons2/rocketl/hazardglass.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen lightingDiffuse
	}	
	{
		map models/weapons2/rocketl/hazardglassfx.jpg
		blendfunc add
		rgbGen lightingDiffuse
		tcmod scale .8 .8
		tcGen environment 
	}
}

models/weapons2/rocketl/frontlight1
{
	{
		animmap 2 models/weapons2/rocketl/frontlight1.jpg models/weapons2/rocketl/frontlight2.jpg
		rgbGen identity
		tcMod turb -2 0.02 99 9
	}
}

models/weapons2/rocketl/ldarl
{
	{
		map models/weapons2/rocketl/hazardglassfx.jpg
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/weapons2/rocketl/ldarl.tga
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