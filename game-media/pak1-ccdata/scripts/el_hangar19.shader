////////////////Trepidation map Hangar19 shaders scripts by Eric Gigon Lessard

////////////////lights:

textures/el_hangar19/f_mainlight
{
	qer_editorimage textures/el_hangar19/f_mainlight_a.tga
	surfaceparm nomarks
        q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_hangar19/f_mainlight_a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_hangar19/f_mainlight_b.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 1
	}	
}

textures/el_hangar19/f_mainlight02
{
	qer_editorimage textures/el_hangar19/f_mainlight_a.tga
	surfaceparm nomarks
        q3map_surfacelight 650
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_hangar19/f_mainlight_a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_hangar19/f_mainlight_b.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 1
	}	
}

textures/el_hangar19/f_altlight01
{
	qer_editorimage textures/el_hangar19/f_altlight01.tga
	surfaceparm nomarks
        q3map_surfacelight 1250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_hangar19/f_altlight01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_hangar19/f_altlight01.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 1
	}	
}

////////////////all building:

textures/el_hangar19/f_glass01
{
	qer_editorimage textures/el_hangar19/f_glass01.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/el_hangar19/f_glass01.tga
		blendfunc gl_dst_color gl_one
	}
}

textures/el_hangar19/al_floor01
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_hangar19/al_floor01.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ZERO
        depthWrite
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

////////////////Décalques:

textures/el_hangar19/d_big19
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_hangar19/d_big19.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}