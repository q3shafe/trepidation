textures/squiciene/newbasic
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
        tcmod rotate 30
		tcMod turb 0 0.2 0 .2
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

textures/squiciene/arrow_green
{
    {
        map $lightmap
    }
    {
        map textures/squiciene/arrow_green.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/squiciene/arrow_gr.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/el_trep_war_ring/jumppad1
{
    qer_editorimage textures/el_trep_war_ring/jumppad1.tga
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trep_war_ring/jumppad1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_trep_war_ring/jumppad2.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 360
    }
    {
        map textures/el_trep_war_ring/jumppad2.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate -360
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

textures/effects/squimap2
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/squimap2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/squimap2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/quadmap2
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/quadmap2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/quadmap2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/quadmapred
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/quadmapred.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/quadmapred.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_green1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_green1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_green1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_bandw
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_bandw.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_bandw.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_blue1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_blue1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_blue1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_orange1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_orange1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_orange1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_red1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_red1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_red1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_purp1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_purp1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_purp1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/effects/portal_yellow1
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/effects/portal_yellow1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/effects/portal_yellow1.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}


textures/liquids/lavafloor2
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/liquids/lavafloor2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/liquids/lavafloor2.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

textures/liquids/lavafloor
{
    q3map_surfacelight 700
    light 1
    surfaceparm nolightmap
    surfaceparm trans
    {
        //scrollparms 0.25 0.25 0.1 0.2
        map textures/liquids/lavafloor.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        //scrollparms 0.25 0.25 -0.2 -0.1
        map textures/liquids/lavafloor.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
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

textures/nature/frond_s01
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/nature/frond_s01.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/2513724
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/2513724.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/261321571009
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/261321571009.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
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

textures/effects/blkr
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/effects/blkr
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/effects/arrowsr.tga
		blendfunc add
		tcMod scroll 0.0 2.0
	}
}

textures/effects/blkb
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/effects/blkb
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/effects/arrowsb.tga
		blendfunc add
		tcMod scroll 0.0 2.0
	}
}

textures/oa_bases/p97439_2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/oa_bases/p97439_2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/squiciene/newlogo_prototype2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/squiciene/newlogo_prototype2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.10 1 0 0.05
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

textures/el_station144/weap_marker
{
	qer_editorimage textures/el_station144/weap_marker.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/el_station144/weap_marker.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/el_station144/item_marker
{
	qer_editorimage textures/el_station144/item_marker.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/el_station144/item_marker.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
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

textures/effects/border_b
{
    {
        map $lightmap
    }
    {
        map textures/effects/border_b
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/border_b2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/effects/border_r
{
    {
        map $lightmap
    }
    {
        map textures/effects/border_r.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/effects/border_r2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/el_station144/d_s145
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/el_station144/d_s145.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_station144/f_pipe02
{
    qer_editorimage textures/el_station144/f_pipe01
    surfaceparm nomarks
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/f_pipe02.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_station144/f_pipe01a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -0.46
    }
}

textures/el_trepxus/trep_station_1
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_trepxus/trep_station_1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_trepxus/trep_station_2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_trepxus/trep_station_2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_trepxus/d_xsqui
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_trepxus/d_xsqui.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_trepxus/squi_light1
{
	qer_editorimage textures/el_trepxus/squi_light1.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_trepxus/squi_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/el_trepxus/squi_light1.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/el_junction/squi_light2
{
	qer_editorimage textures/el_junction/squi_light2.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_junction/squi_light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/el_junction/squi_light2.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/squiciene/flag_metal_silver
{
	qer_editorimage textures/squiciene/flag_metal_silver.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none
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
		map textures/squiciene/flag_shiny_silver.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/flag_metal_gold
{
	qer_editorimage textures/squiciene/flag_metal_gold.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none
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
		map textures/squiciene/flag_shiny_gold.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/squiciene/squi_harringbone
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/squiciene/squi_harringbone.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/sjtfolder/latuice_top_orng
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/sjtfolder/latuice_top_orng.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/sjtfolder/latuice_top_purp
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/sjtfolder/latuice_top_purp.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/sjtfolder/latuice_top_blk
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/sjtfolder/latuice_top_blk.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/sjtfolder/latuice_top_wht
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
	        map textures/sjtfolder/latuice_top_wht.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map textures/sjtfolder/latuice_top_wht.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/oa_bases/lattice_01
{
    surfaceparm nomarks
    surfaceparm nolightmap
	cull disable
    {
        map textures/oa_bases/lattice_01.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/detail/maint_blu
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/detail/maint_blu.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/detail/maint_red
{
    surfaceparm nomarks
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/detail/maint_red.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

//////////////  NEW METALS  ///////////////

textures/effects/metal_newgold
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newgold.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newsilver
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newsilver.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newred
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newred.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newblu
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newblu.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newgrn
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/effects/shiny_newgrn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/effects/metal_newblack
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newblack.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newprpl
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newprpl.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newblugrn
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newblugrn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newpink
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newpink.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_neworange
{
     surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_neworange.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/effects/metal_newbrn
{
    surfaceparm nolightmap
	{
		map textures/squiciene/basic.tga
	    blendFunc GL_ONE GL_ZERO 
	}
	{
	    map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
		map textures/effects/shiny_newbrn.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
	}
}

textures/oa_bases/tassle
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/tassle_blu
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle_blu.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/tassle_grn
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle_grn.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/tassle_orange
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle_orange.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/tassle_purp
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle_purp.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/oa_bases/tassle_red
{
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	cull disable
	{
		map textures/oa_bases/tassle_red.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


