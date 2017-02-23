models/weapons2/railgun/blackchrome
{
	{
		map models/weapons2/railgun/blackchrome.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}

}

models/weapons2/railgun/blackhandle
{
	{
		map models/weapons2/railgun/blackhandle.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}

}

models/weapons2/railgun/muzzlside
{
//	deformVertexes autosprite2
	cull disable
	{
		map models/weapons2/railgun/muzzlside.tga
		blendfunc add
	}
}

models/weapons2/railgun/muzzlecenter
{
	deformVertexes autosprite
	{
		clampmap models/weapons2/railgun/f_plasma.tga
		blendfunc add
		tcMod rotate 1246
	}
	{
		clampmap models/weapons2/railgun/f_railgun.tga
		blendfunc add
		tcMod rotate -1246
	}
}

models/weapons2/railgun/flare
{
	deformVertexes autosprite
	{
		map models/weapons2/railgun/flare.tga
		blendfunc add
		rgbGen wave noise 0.5 0.5 0 1 
	}
}

railCore
{
	sort nearest
	cull none
	{
		map models/weapons2/railgun/railcore.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
		tcMod scroll -1 0
	}
}
