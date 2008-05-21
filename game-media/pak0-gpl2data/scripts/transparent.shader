textures/transparent/glass1
{
	qer_editorimage textures/transparent/glass1.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/transparent/glass1.tga
		blendfunc gl_dst_color gl_one
	}
}

textures/transparent/darkfog
{
	qer_editorimage textures/transparent/darkfog.tga
	surfaceparm fog
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull back
	{
		map textures/transparent/darkfog.tga
		tcMod scroll -0.111 0.111
	}
	{
		map textures/transparent/darkfog.tga
		blendfunc filter
		tcMod scroll 0.1 -0.1111
	}
	{
		map textures/transparent/darkfog.tga
		blendfunc filter
		tcMod scroll 0.11 -0.51
	}
}

