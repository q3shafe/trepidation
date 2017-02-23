models/weapons2/rocketl/phaser02
{
	{
		map models/weapons2/rocketl/phaser02-fx.tga
		rgbGen identity
		tcMod scroll 1 0
	}
	{
		map models/weapons2/rocketl/phaser02.tga
		rgbGen lightingDiffuse
		alphaFunc LT128
	}
}



smokePuff2
{
	cull none
	entityMergable		
	{
		map gfx/misc/smokepuff3x.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}


smokePuffRagePro2
{
	cull none
	entityMergable		
	{
		map gfx/misc/smokepuffrageprox.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

models/ammo/rocket/rockflar
{
	sort additive
	cull disable
	{
		map models/ammo/rocket/rockflar.tga
		blendfunc add
		rgbGen identity
	}
}

models/ammo/rocket/rockfls1
{
	sort additive
	cull disable
	{
		map models/ammo/rocket/rockfls1.tga
		blendfunc add
		rgbGen identity
	}
}