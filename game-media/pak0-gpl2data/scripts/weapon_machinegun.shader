models/weapons2/machinegun/muzzlside
{
	cull disable
	{
		map models/weapons2/machinegun/muzzlside.tga
		blendfunc add
	}
}

bulletCase
{
	cull disable
	{
		map models/weapons2/shells/mgunshell.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

shellCase
{
	cull disable
	{
		map models/weapons2/shells/sgunshell.tga
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/shells/mgunshell.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/weapons2/shells/sgunshell.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/machinegun/muzzlecenter
{
	deformVertexes autosprite
	{
		map models/weapons2/machinegun/f_machinegun.tga
		blendfunc add
		tcMod rotate 1246
	}
	{
		map models/weapons2/machinegun/f_machinegun.tga
		blendfunc add
		tcMod rotate -1246
	}
}

models/weapons2/machinegun/flare
{
	deformVertexes autosprite
	{
		map models/weapons2/machinegun/flare.tga
		blendfunc add
	}
}

models/weapons2/machinegun/skin
{
	{
		map models/weapons2/machinegun/blueechrome.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/weapons2/machinegun/tommy
{
	{
		map models/weapons2/machinegun/tomtex.tga
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/machinegun/woodspec.tga
		blendfunc gl_dst_color gl_src_color
		tcGen environment 
	}
	{
		map models/weapons2/machinegun/tomtex.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

