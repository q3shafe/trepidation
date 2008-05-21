textures/fair/light1
{
	qer_editorimage textures/fair/light1.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	{
		map textures/fair/light1.tga
	}
	{
		map textures/fair/light1.tga
		blendfunc filter
		tcMod rotate 5
	}
	{
		map textures/fair/light1.tga
		blendfunc filter
		tcMod rotate -5
	}
}

textures/fair/sky1
{
	qer_editorimage textures/fair/sky1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 50
	q3map_sun 4 3 3 65 290 75
	skyParms - 512 -
	{
		map textures/fair/sky1.tga
		tcMod scroll 0.05 0
		tcMod scale 2 2
		depthWrite
	}
	{
		map textures/fair/sky1.tga
		blendfunc add
		tcMod scroll -0.05 0.05
		depthWrite
	}
}

