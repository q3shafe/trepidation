textures/base_button/sqpan
{
    qer_editorimage textures/base_button/sqpan.tga
    {
        map $lightmap
    }
    {
        map textures/base_button/sqpan.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        animMap 2 textures/base_button/sqpan_1.tga textures/base_button/sqpan_2.tga textures/base_button/sqpan_3.tga   
        blendFunc GL_ONE GL_ONE
    }
}

textures/base_button/sqpan2
{
    qer_editorimage textures/base_button/sqpan2.tga
    {
        map $lightmap
    }
    {
        map textures/base_button/sqpan2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        animMap 2 textures/base_button/sqpan_4.tga textures/base_button/sqpan_5.tga textures/base_button/sqpan_6.tga   
        blendFunc GL_ONE GL_ONE
    }
}

textures/base_button/radarbase1
{
	qer_editorimage textures/base_button/radarbase1.tga
	q3map_lightimage textures/base_button/radararm1.tga
	surfaceparm nomarks
	q3map_surfacelight 100

	{
		map textures/base_button/radarbase1.tga
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/base_button/radararm1.tga
		tcMod rotate 75
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_button/radarbase2
{
	qer_editorimage textures/base_button/radarbase2.tga
	q3map_lightimage textures/base_button/radararm2.tga
	surfaceparm nomarks
	q3map_surfacelight 100

	{
		map textures/base_button/radarbase2.tga
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/base_button/radararm2.tga
		tcMod rotate 75
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_button/keyb_005
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/base_button/keyb_005.jpg
    }
}

textures/base_button/keyb_003
{
    q3map_surfacelight 500
    light 0.5
    surfaceparm nolightmap
    {
        map textures/base_button/keyb_003.jpg
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



