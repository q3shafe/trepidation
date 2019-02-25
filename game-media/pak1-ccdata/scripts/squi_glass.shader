////////////////////  GLASS  /////////////////////////////////

textures/glass/squiglass_blue
{
	qer_editorimage textures/glass/squiglass_blue.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
	cull none
	{
		map textures/glass/squiglass_blue.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/glass/squiglass_red
{
	qer_editorimage textures/glass/squiglass_red.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
	cull none
	{
		map textures/glass/squiglass_red.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/glass/squiglass_yellow
{
	qer_editorimage textures/glass/squiglass_yellow.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
	cull none
	{
		map textures/glass/squiglass_yellow.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/glass/squiglass_clear
{
	qer_editorimage textures/glass/squiglass_clear.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
    surfaceparm trans
	{
		map textures/glass/squiglass_clear.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/glass/squiglass_dark
{
	qer_editorimage textures/glass/squiglass_dark.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
    surfaceparm trans
	{
		map textures/glass/squiglass_dark.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/glass/squiglass_green
{
	qer_editorimage textures/glass/squiglass_green.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	{
		map textures/glass/green.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}

	{
		map textures/glass/squiglass_greenshine.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcGen environment
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}
}

//////////////////////  GLASS EDGE   /////////////////////

textures/glass/gedge_y
{
    qer_trans 0.6
    surfaceparm trans
	cull disable
    {
        map textures/glass/gedge_y.tga
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
        tcMod scale 3 3
    }
    {
        map textures/glass/gedge_y_shine.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale .05 .05
    }
}

textures/glass/gedge_r
{
    qer_trans 0.6
    surfaceparm trans
	cull disable
    {
        map textures/glass/gedge_r.tga
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        tcMod scale .8 .8
    }
    {
        map textures/glass/gedge_r_shine.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 1 6
    }
}

/////////////////////   CRYSTAL    ////////////////////////

textures/squiciene/sq_crystalwhite
{
    q3map_surfacelight 2000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalwhite.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/squiciene/sq_crystalblue
{
    q3map_surfacelight 2000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalblue.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/squiciene/sq_crystalred
{
    q3map_surfacelight 2000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalred.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/squiciene/sq_crystalgreen
{
    q3map_surfacelight 2000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalgreen.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/squiciene/sq_crystalyellow
{
    q3map_surfacelight 2000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalyellow.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/squiciene/sq_crystalpurp
{
    q3map_surfacelight 1000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/squiciene/sq_crystalpurp.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}