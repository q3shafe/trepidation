models/weapons2/rocketl/blackchrome
{
	{
		map models/weapons2/rocketl/blackchrome.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}

}

models/weapons2/rocketl/blackhandle
{
	{
		map models/weapons2/rocketl/blackhandle.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}

}

models/weapons2/rocketl/muzzlside
{
//	deformVertexes autosprite2
	cull disable
	{
		map models/weapons2/rocketl/muzzlside.tga
		blendfunc add
	}
}

models/weapons2/rocketl/muzzlecenter
{
	deformVertexes autosprite
	{
		clampmap models/weapons2/rocketl/f_rocketl.tga
		blendfunc add
		tcMod rotate 1246
	}
	{
		clampmap models/weapons2/rocketl/f_rocketl.tga
		blendfunc add
		tcMod rotate -1246
	}
}

models/weapons2/rocketl/flare
{
	deformVertexes autosprite
	{
		map models/weapons2/rocketl/flare.tga
		blendfunc add
//		rgbGen wave noise 0.5 0.5 0 1 
	}
}
