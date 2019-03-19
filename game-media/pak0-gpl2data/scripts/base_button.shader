
textures/base_button/shootme2
{
	qer_editorimage textures/base_button/metal3_3_shootme.tga
	q3map_lightimage textures/base_button/shootme_glow.tga
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal3_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_button/shootme_glow.tga
		rgbGen wave sin 0.5 1.0 0 .3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_button/rik_flare5
{
    light 1
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    deformVertexes autoSprite
    {
        map textures/base_button/rik_flare5.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/effects/squiglow_blu
{
    {
        map $lightmap
    }
    {
        map textures/effects/squiglow_blu.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/squiglow_blu2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/squiglow_red
{
    {
        map $lightmap
    }
    {
        map textures/effects/squiglow_red.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/squiglow_red2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/flaglow_blu_1
{
    {
        map $lightmap
    }
    {
        map textures/effects/flaglow_blu_1.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/flaglow_blu_2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/flaglow_red_1
{
    {
        map $lightmap
    }
    {
        map textures/effects/flaglow_red_1.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/flaglow_red_2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/squi_static_r
{
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull disable
    {
        map textures/effects/squi_static_r.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        map textures/effects/squi_static_r.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/squi_static_b
{
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull disable
    {
        map textures/effects/squi_static_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        map textures/effects/squi_static_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/squi_static_g
{
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull disable
    {
        map textures/effects/squi_static_g.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        map textures/effects/squi_static_g.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/squi_static_y
{
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull disable
    {
        map textures/effects/squi_static_y.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        map textures/effects/squi_static_y.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/squi_elec_blue1
{
	qer_editorimage textures/effects/squi_elec_blue1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull none
	{
	animmap 20 textures/effects/squi_elec_blue1.tga textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	blendfunc add
	rgbGen wave square 0 1 0 2
	}
	{
	animmap 20 textures/effects/squi_elec_blue1.tga textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	blendfunc add
	rgbGen wave square 0 2 .25 1.2
	}
}

textures/effects/squi_elec_red1
{
	qer_editorimage textures/effects/squi_elec_red1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
	animmap 20 textures/effects/squi_elec_red1.tga textures/effects/squi_elec_red2.tga textures/effects/squi_elec_red3.tga textures/effects/squi_elec_red4.tga
	blendfunc add
	rgbGen wave square 0 1 0 2
	}
	{
	animmap 20 textures/effects/squi_elec_red1.tga textures/effects/squi_elec_red2.tga textures/effects/squi_elec_red3.tga textures/effects/squi_elec_red4.tga
	blendfunc add
	rgbGen wave square 0 2 .25 1.2
	}
}

textures/nature/branch1
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/nature/branch1.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/nature/branch2
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/nature/branch2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/common/camera_veiw
{
    qer_editorimage textures/common/camera_veiw.tga
    surfaceparm nolightmap
    portal
    {
        map textures/common/glass2.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen identity
        alphaGen portal 256
        tcGen environment
        tcMod scale 1.5 1.5
    }
    {
        map textures/common/glass1.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 2 2
    }
}

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

