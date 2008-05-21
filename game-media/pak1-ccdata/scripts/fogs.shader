textures/artgallery/abs
{
	qer_editorimage textures/artgallery/abs.tga
	surfaceparm fog
	surfaceparm nonsolid
	cull disable
	{
		map textures/artgallery/abs.tga
	}
	{
		map textures/artgallery/ist.tga
		blendfunc add
		tcMod turb 3 1 0 1
	}
}

