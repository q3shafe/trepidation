textures/artgallery/gla
{
	qer_editorimage textures/artgallery/gla.tga
	surfaceparm nonsolid
	surfaceparm slime
	cull disable
	{
		map textures/artgallery/gla.tga
	}
	{
		map textures/artgallery/ele.tga
		blendfunc add
		tcMod turb 0 1 0 1
	}
}

textures/artgallery/acid
{
	qer_editorimage textures/artgallery/acid.tga
	surfaceparm lava
	surfaceparm nonsolid
	cull disable
	qer_trans 0.25
	{
		map textures/artgallery/acid.tga
		tcMod turb 0 2 3 2
	}
}

