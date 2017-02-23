textures/skies/hellsky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_lightsubdivide 256
	q3map_surfacelight 400
	q3map_globaltexture
	q3map_sun 1 1 0.5 150 30 60
	skyParms full 700 -
	{
		map textures/skies/dimclouds.tga
		tcMod scroll -0.013 0.04
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc add
		tcMod scroll 0.02 0.07
	}
}

textures/skies/hellsky2
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_lightsubdivide 256
	q3map_surfacelight 400
	q3map_globaltexture
	q3map_sun 1 1 0.5 150 30 60
	skyParms full 700 -
	{
		map textures/skies/dimclouds.tga
		tcMod scroll -0.013 0.04
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc add
		tcMod scroll 0.02 0.07
	}
}

textures/skies/hellsky2bright
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_lightsubdivide 256
	q3map_surfacelight 400
	q3map_globaltexture
	q3map_sun 1 1 0.5 150 30 60
	skyParms full 700 -
	{
		map textures/skies/inteldimclouds.tga
		tcMod scroll -0.013 0.04
	}
	{
		map textures/skies/topclouds.tga
		blendfunc add
		tcMod scroll 0.02 0.07
	}
}

textures/skies/nitesky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_lightsubdivide 256
	q3map_surfacelight 20
	q3map_globaltexture
	q3map_sun 0.333333 0.45098 0.576471 155 360 90
	skyParms full 1280 -
	{
		map textures/skies/stars.tga
	}
	{
		map textures/skies/nitesky.tga
		blendfunc add
		tcMod scroll 0.02 0.07
	}
}

black
{
	cull disable
	{
		map gfx/colors/black.tga
		rgbGen const ( 0 0 0 )
	}
}

textures/sky_void
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	{
		map gfx/colors/black.tga
		rgbGen const ( 0 0 0 )
	}
}

textures/black
{
	cull disable
	{
		map gfx/colors/black.tga
		rgbGen const ( 0 0 0 )
	}
}

textures/skies/toxicskytim_dm8
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_lightsubdivide 256
	q3map_surfacelight 400
	q3map_globaltexture
	q3map_sun 1 1 0.5 150 30 60
	skyParms full 700 -
	{
		map textures/skies/dimclouds.tga
		tcMod scroll -0.013 0.04
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc add
		tcMod scroll 0.02 0.07
	}
}

