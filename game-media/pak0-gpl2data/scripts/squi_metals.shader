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

///////////////////   FLAGS   //////////////////////

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

textures/squiciene/squi_flag1
{
	qer_editorimage textures/squiciene/squi_flag1.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none
	{
		map textures/squiciene/squi_flag1.tga
		rgbGen identity
	}
	{
		map textures/squiciene/squi_flag1.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/squiciene/squi_flag2
{
	qer_editorimage textures/squiciene/squi_flag2.tga
	tessSize 64
	deformVertexes wave 194 sin 0 3 0 .4
	deformVertexes normal .5 .1
	surfaceparm nomarks
	cull none
	{
		map textures/squiciene/squi_flag2.tga
		rgbGen identity
	}
	{
		map textures/squiciene/squi_flag2.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
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
