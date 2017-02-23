textures/ice/coldwater
{
	qer_editorimage textures/ice/coldwater.tga
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	cull disable
	qer_trans 0.5
	q3map_globaltexture
	{
		map textures/ice/coldwater.tga
		blendfunc filter
		tcMod scroll 0.01 0.01
	}
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		tcGen environment 
	}
	{
		map textures/ice/coldwater.tga
		blendfunc add
		tcMod scroll 0.04 0.01
	}
}

textures/liquids/vorwater
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm water
	cull disable
	{
		map textures/liquids/vorwater.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll -0.009 -0.005
	}
}

textures/liquids/refwater
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm water
	cull disable
	portal
	{
		map textures/liquids/vorwater.tga
		blendfunc filter
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll 0.05 0.05
	}
	{
		map textures/liquids/pool3d_3.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll -0.03 -0.06
	}
	{
		map textures/liquids/pool3d_3.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll 0.07 0.01
	}
}

textures/liquids/acid
{
	q3map_lightimage textures/liquids/slime7.tga
	surfaceparm nomarks
	surfaceparm slime
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 256 sin 0 9 0 0.4 
	tessSize 128
	q3map_surfacelight 900
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		tcGen environment 
	}
	{
		map textures/liquids/slime7c.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll -0.03 -0.06
	}
	{
		map textures/liquids/slime7.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll 0.07 0.01
	}
}



textures/liquids/oldacid
{
	q3map_lightimage textures/liquids/slime7.tga
	surfaceparm nomarks
	surfaceparm slime
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 12 sin 0 3 0 0.2 
	deformVertexes wave 24 sin 0 7 0 0.6 
	tessSize 16
	q3map_surfacelight 333
	{
		map textures/liquids/slime7.tga
		blendfunc filter
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll 0.05 0.05
	}
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		tcGen environment 
	}
	{
		map textures/liquids/slime7c.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll -0.03 -0.06
	}
	{
		map textures/liquids/slime7.tga
		blendfunc add
		rgbGen const ( 0.501961 0.501961 0.501961 )
		tcMod scroll 0.07 0.01
	}
}

