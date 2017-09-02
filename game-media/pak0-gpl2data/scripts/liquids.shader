textures/liquids/kc_fogcloud3
{
	qer_editorimage textures/liquids/kc_fogcloud3.tga
	surfaceparm fog
	surfaceparm nolightmap
	tessSize 48
	{
		map textures/liquids/kc_fogcloud3.tga
		tcMod scroll -0.05 0.05
	}
}

textures/liquids/lavafloor
{
	qer_editorimage textures/liquids/lavafloor.tga
	surfaceparm lava
	surfaceparm trans
	deformVertexes wave 128 sin 0 0.25 3 0.2 
	tessSize 64
	qer_trans 0.9
	q3map_surfacelight 50
	{
		map textures/liquids/lavafloor.tga
		tcMod scroll 0.21 0.11
		tcMod turb 0 0.25 3 0.2
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one
		rgbGen const ( 1 0.301961 0 )
	}
	{
		map textures/liquids/lavahell.tga
		blendfunc filter
		tcMod scroll 0.21 0.11
		tcMod turb 0 0.25 3 0.2
	}
}

textures/liquids/pool2
{
	qer_editorimage textures/liquids/pool2.tga
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 128 sin 3 2 0.1 0.5 
	tessSize 64
	qer_trans 0.5
	{
		map textures/liquids/pool2.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0.2 -0.2
	}
	{
		map textures/liquids/pool2.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0.2 0.2
	}
	{
		map textures/liquids/pool2.tga
		blendfunc gl_dst_color gl_one
		rgbGen Vertex
		tcMod scroll 0.2 0.2
		tcGen environment 
	}
}

textures/liquids/healpool
{
	qer_editorimage textures/liquids/pool2.tga
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 128 sin 3 2 0.1 0.5 
	tessSize 64
	qer_trans 0.5
	{
		map textures/liquids/pool2.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0.2 -0.2
	}
	{
		map textures/liquids/pool2.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0.2 0.2
	}
	{
		map textures/liquids/pool2.tga
		blendfunc gl_dst_color gl_one
		rgbGen Vertex
		tcMod scroll 0.2 0.2
		tcGen environment 
	}
}