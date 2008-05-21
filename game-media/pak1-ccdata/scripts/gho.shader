textures/artgallery/grav
{
	qer_editorimage textures/artgallery/grav.tga
	surfaceparm fog
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/artgallery/grav.tga
	}
	{
		map textures/artgallery/gho.tga
		blendfunc add
		tcMod stretch sin 5 10 5 2 
	}
}

