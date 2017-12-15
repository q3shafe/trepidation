textures/squiciene/newbasic
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
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

textures/squiciene/arrow_blue
{
    {
        map $lightmap
    }
    {
        map textures/squiciene/arrow_blue.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/squiciene/arrow_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/squiciene/arrow_red
{
    {
        map $lightmap
    }
    {
        map textures/squiciene/arrow_red.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/squiciene/arrow_r.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/squi_elec_blue2
{
	qer_editorimage textures/effects/squi_elec_blue2.tga
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull diable
	{
	animmap 20 textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	tcMod rotate 20
	blendfunc add
	rgbGen wave square 0 1 0 2
	}
	{
	animmap 20 textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	tcMod rotate -30
	blendfunc add
	rgbGen wave square 0 2 .25 1.2
	}
}

textures/el_trep_war_ring/jumppad4
{
    qer_editorimage textures/el_trep_war_ring/jumppad4.tga
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trep_war_ring/jumppad4.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_trep_war_ring/jumppad3.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 360
    }
    {
        map textures/el_trep_war_ring/jumppad3.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate -360
    }
}

//////////////  METALS  ///////////////

textures/squiciene/metal_gold
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_gold.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_silver
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_silver.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_red
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_red.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_blu
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_blu.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_brn
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_brn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_grn
{
    {
	    map $lightmap
        map textures/squiciene/basic.jpg
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/squiciene/shiny_grn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/squiciene/metal_black
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_black.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_prpl
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_prpl.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_blugrn
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_blugrn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_pink
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_pink.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/metal_orange
{
	{
	    map $lightmap
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
		rgbGen identity 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/squiciene/shiny_orange.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

////////////////////  GLASS  /////////////////////////////////

textures/glass/squiglass_green
{
	qer_editorimage textures/glass/squiglass_green.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm nomarks
	cull none
	{
		map textures/glass/squiglass_green.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

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

///////////////   LIGHTS   ///////////////

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



///////////////////   LOGOS   //////////////////////

textures/squiciene/trep_logo_02
{
	qer_editorimage textures/squiciene/trep_logo_02.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none

	{
		map textures/squiciene/trep_logo_02.tga
		rgbGen identity
	}
	{
		map textures/squiciene/trep_logo_02.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/squiciene/trep_logo_02a
{
	qer_editorimage textures/squiciene/trep_logo_01b.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none

	{
		map textures/squiciene/trep_logo_01b.tga
		rgbGen identity
	}
	{
		map textures/squiciene/trep_logo_01b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/squiciene/pool3d_3z
	{
		qer_editorimage textures/squiciene/pool3d_3z.tga
		qer_trans .5
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		deformVertexes wave 90 sin 0 3 0 0.80	
	    tessSize 192
		{ 
		  	map $lightmap
			map textures/liquids/pool3d_5.tga
			blendFunc GL_dst_color GL_one
		    detail
			rgbgen identity
			tcmod scroll -.05 .04
		}
				{ 
			map textures/liquids/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 -.001
		}
}

textures/squiciene/buttondark
{
    qer_editorimage textures/squiciene/buttondark.tga
    {
        map $lightmap
        map textures/squiciene/buttondark.tga
        blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity	
    }
    {
        animMap 2 textures/squiciene/buttondark.tga textures/squiciene/button.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/squiciene/b_trim02
{
    qer_editorimage textures/squiciene/b_trim02
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/squiciene/b_trim02.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/squiciene/b_trim02_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll -0.46 0
    }
    {
        map textures/squiciene/b_trim02_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.46 0
    }
}

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
