textures/fogs/fogyou
{
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm fog
		surfaceparm nolightmap
	cull disable
	fogparms ( 0.458824 0.862745 0.411765 ) 666
}

textures/fogs/fogoff
{
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm fog
		surfaceparm nolightmap
	cull disable
	fogparms ( 0.458824 0.862745 0.411765 ) 666
	{
		map textures/liquids/kc_fogcloud3.tga
		blendfunc filter
		tcMod scroll 0.3 0.2
	}
	{
		map textures/liquids/kc_fogcloud3.tga
		blendfunc filter
		tcMod scroll -0.23 -0.3
	}
}

