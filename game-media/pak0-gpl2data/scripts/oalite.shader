textures/base_light/xlight5
{
	qer_editorimage textures/base_light/xlight5.tga
	q3map_lightimage textures/base_light/xlight5.blend.tga
	surfaceparm metalsteps
	q3map_surfacelight 1000
	q3map_flare flareShader-glow
	{
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/base_light/xlight5.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/base_light/xlight5.blend.tga
		blendfunc add
	}
}

textures/base_light/ceil1_34
{
	qer_editorimage textures/base_light/ceil1_34.tga
	q3map_lightimage textures/base_light/ceil1_34.blend.tga
	surfaceparm metalsteps
	q3map_surfacelight 300
	q3map_flare flareShader-wide
	{
		map textures/base_light/ceil1_34.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc add
	}
}

