//.....waaaaateeeeerfaaaaaaallll...........
textures/cheapalert/waterfall
{
	qer_editorimage textures/liquids/pool3d_3e.tga
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 64 sin 0.25 0.25 0 0.5 
	qer_trans 0.5
	q3map_globaltexture
	{
		map textures/cheapalert/waterfall.tga
//		blendfunc add
//		rgbGen lightingDiffuse
		tcMod scroll 0 -1
	}
}

textures/cheapalert/water
{
	qer_editorimage textures/liquids/pool3d_3e.tga
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 185 sin 0.25 0.25 0 0.5 
	tessSize 3
	qer_trans 0.5
	q3map_globaltexture
	{
		map textures/cheapalert/water1.tga
		blendfunc blend
		tcMod scroll 0 0.1
		tcMod rotate 0.1
		alphaGen wave sin 0.6 0.06 0 0.2 
	}
	{
		map textures/cheapalert/waterfall.tga
		blendfunc gl_src_alpha gl_one
		tcMod scroll 0.1 0
		alphaGen wave sin 0.1 0.2 5 0.1 
	}
	{
		map textures/cheapalert/watershineorange.tga
		blendfunc add
		tcGen lightmap 
	}
	{
		map textures/cheapalert/watershade.tga
		blendfunc blend
		tcMod turb 0 0.03 0 0.1
		tcMod rotate 1
		tcGen lightmap 
		alphaFunc GE128
	}
	{
		map textures/cheapalert/ripple.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 5 12
		tcMod scroll 0.05 0.01
	}
	{
		map textures/cheapalert/ripple.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 3 8
		tcMod scroll 0.05 0.01
	}
	{
		map textures/cheapalert/ripple.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 2 5
		tcMod scroll 0 0.3
	}
	{
		map textures/cheapalert/ripple.tga
		blendfunc gl_dst_color gl_src_color
		tcMod scale 1.3 3.6
		tcMod scroll -0.01 -0.5
	}
}

textures/cheapalert/glowey
{
	deformVertexes autosprite
	{
		clampmap textures/cheapalert/glowey.tga
		blendfunc add
		rgbGen wave noise 0.3 0.1 0 35 
	}
	{
		clampmap textures/cheapalert/glowey.tga
		blendfunc add
		rgbGen wave noise 0.5 0.2 0 1 
		alphaGen portal 153
	}
	{
		clampmap textures/cheapalert/glowey.tga
		blendfunc add
		rgbGen wave noise 0.5 0.2 0 2 
		tcMod rotate 12
		alphaGen portal 93
	}
	{
		clampmap textures/cheapalert/glowey.tga
		blendfunc add
		rgbGen wave noise 0.5 0.2 0 5 
		tcMod rotate -14
		alphaGen portal 54
	}
	{
		clampmap textures/cheapalert/glowey.tga
		blendfunc add
		rgbGen wave noise 0.5 0.2 0 1 
		tcMod rotate 26
		alphaGen portal 27
	}
}

