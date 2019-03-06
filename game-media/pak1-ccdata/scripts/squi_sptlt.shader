/////////////  SPOTLIGHTS   ///////////////////////

textures/squiciene/b_sptl
{
    qer_editorimage textures/squiciene/blues.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/b_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/g_sptl
{
    qer_editorimage textures/squiciene/greens.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/g_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/y_sptl
{
    qer_editorimage textures/squiciene/yellows.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/y_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/w_sptl
{
    qer_editorimage textures/squiciene/whites.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/w_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/pnk_sptl
{
    qer_editorimage textures/squiciene/pinks.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/pnk_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/purp_sptl
{
    qer_editorimage textures/squiciene/purples.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/purp_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

textures/squiciene/r_sptl
{
    qer_editorimage textures/squiciene/reds.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/squiciene/r_sptl.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.05 0
    }
    {
        map textures/squiciene/dust.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scroll -0.03 0
    }
}

///////////////    LIGHTS    ////////////////////

textures/squiciene/ceil1_34
{
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/squiciene/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/squiciene/red_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/red_light.jpg
    }
}

textures/squiciene/blue_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/blue_light.jpg
    }
}

textures/squiciene/green_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/green_light.jpg
    }
}

textures/squiciene/yellow_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/yellow_light.jpg
    }
}

textures/squiciene/pink_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/pink_light.jpg
    }
}

textures/squiciene/purp_light
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/squiciene/purp_light.jpg
    }
}

textures/el_junction/b_worklight_fixd
{
    q3map_surfacelight 50
    light 0.5
    surfaceparm nolightmap
    {
        map textures/el_junction/b_worklight_fixd.jpg
    }
}

textures/el_junction/r_worklight_fixd
{
    q3map_surfacelight 50
    surfaceparm nolightmap
    {
        map textures/el_junction/r_worklight_fixd.jpg
    }
}

