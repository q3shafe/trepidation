lavalol
{
	q3map_globaltexture
	surfaceparm fog
	surfaceparm trans
	surfaceparm lava
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm water
	surfaceparm lightfilter
	cull disable
	q3map_surfacelight 666
	deformVertexes wave 256 sin 0 7 0 0.4 
	tessSize 128
	fogparms ( 0.929412 0.447059 0.239216 ) 912
	{
		map textures/liquids/lavafloor.tga
		tcMod turb 0 0.1 0 0.1
		tcMod scroll 0.1 0.2
	}
	{
		map textures/liquids/lavafloor.tga
		blendfunc add
		tcMod turb 0 0.2 0 0.1
		tcMod scroll -0.05 -0.02
	}
	{
		map textures/liquids/lavafloor.tga
		blendfunc add
		tcMod turb 1 -0.3 0 0.07
		tcMod scroll 0.08 -0.08
	}
}

textures/liquids/lavahell
{
	q3map_globaltexture
	surfaceparm fog
	surfaceparm trans
	surfaceparm lava
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm water
	surfaceparm lightfilter
	cull disable
	q3map_surfacelight 666
	deformVertexes wave 256 sin 0 7 0 0.4 
	tessSize 128
	fogparms ( 0.929412 0.447059 0.239216 ) 912
	{
		map textures/liquids/lavafloor.tga
		tcMod turb 0 0.1 0 0.1
		tcMod scroll 0.1 0.2
	}
	{
		map textures/liquids/lavafloor.tga
		blendfunc add
		tcMod turb 0 0.2 0 0.1
		tcMod scroll -0.05 -0.02
	}
	{
		map textures/liquids/lavafloor.tga
		blendfunc add
		tcMod turb 1 -0.3 0 0.07
		tcMod scroll 0.08 -0.08
	}
}

