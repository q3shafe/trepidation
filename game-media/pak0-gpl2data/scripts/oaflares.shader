dflareShader
{
	{
		clampmap textures/flares/flarey.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate -3
	}
	{
		clampmap textures/flares/flarey.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate 7
	}
}

flareShader
{
	{
		map textures/flares/flarey.tga
		blendfunc add
		rgbGen Vertex

	}

}

sun
{
	{
		clampmap textures/flares/flarey.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate -3
	}
	{
		clampmap textures/flares/flarey.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate 7
	}
}

flareShader-glow
{
	{
		clampmap textures/flares/largeglow.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate -3
	}
	{
		clampmap textures/flares/largeglow.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate 7
	}
}

flareShader-wide
{
	{
		clampmap textures/flares/wide.tga
		blendfunc add
		rgbGen Vertex
	}
}

