//////////liquides:

textures/el_treptex01/t_lava01
{
    surfaceparm lava
    qer_trans 0.8
    q3map_surfacelight 150
    surfaceparm nolightmap
    surfaceparm nosteps
    surfaceparm trans
    cull disable
    deformVertexes wave 200 sin 0 1 0 0.25
    tessSize 96
    {
        map textures/el_treptex01/t_lava01.tga
        rgbGen identity
        tcMod scroll -0.02 -0.01
    }
    {
        map textures/el_treptex01/t_lava01.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
        tcMod scale 2 2
        tcMod scroll 0.01 0.02
    }
}

textures/el_treptex01/t_pool01
{
	qer_editorimage textures/el_treptex01/t_water01.tga
	qer_trans .5
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	cull disable
	tesssize 64
	deformVertexes wave 100 sin 1 1 1 .1	
	{
	map textures/el_treptex01/t_water01.tga
	blendfunc GL_ONE GL_SRC_COLOR	
	tcMod scale .03 .03
	tcMod scroll .001 .001
	}	
	{
	map textures/el_treptex01/t_water02.tga
	blendfunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 0 .01
	tcMod scale .5 .5
	tcMod scroll -.025 .02
	}
}

//////////Metal sound:

textures/el_treptex01/b_floor01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_floor01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_galv_darkgreen01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_galv_darkgreen01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_rustysteel01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_rustysteel01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_rustysteel02
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_rustysteel02.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_rustysteel03
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_rustysteel03.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_ubeam01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_ubeam01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_treptex01/b_ubeam02
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_treptex01/b_ubeam02.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

//////////lights:

textures/el_treptex01/f_light01
{
	qer_editorimage textures/el_treptex01/f_light01.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_treptex01/f_light01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_treptex01/f_light01_glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 1
	}	
}

//////////Glass:

textures/el_treptex01/f_glass01
{
	qer_editorimage textures/el_treptex01/f_glass01.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/el_treptex01/f_glass01.tga
		blendfunc gl_dst_color gl_one
	}
}

//////////skybox:

textures/el_treptex01/sky01
{
	q3map_lightimage textures/el_treptex01/sy_lightref01.tga     
	qer_editorimage textures/el_treptex01/sh_sky01.tga
        q3map_surfacelight 60
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/coolsky01 512 -
}

textures/el_treptex01/sky02
{        
	q3map_lightimage textures/el_treptex01/sy_lightref01.tga
        qer_editorimage textures/el_treptex01/sh_sky01.tga
        q3map_surfacelight 50
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/coolsky02 512 -
}

textures/el_treptex01/sky03
{        
	q3map_lightimage textures/el_treptex01/sy_lightref01.tga
        qer_editorimage textures/el_treptex01/sh_sky01.tga
        q3map_surfacelight 50
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/coolsky03 512 -
}

textures/el_treptex01/sky_noir
{        
	q3map_lightimage textures/el_treptex01/sy_lightref01.tga
        qer_editorimage textures/el_treptex01/sh_sky01.tga
        q3map_surfacelight 50
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/noir 512 -
}

textures/el_treptex01/gg_starssky01
{        
	q3map_lightimage textures/el_treptex01/sy_lightref02.tga
        qer_editorimage textures/el_treptex01/sh_sky01.tga
        q3map_surfacelight 80
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/gg_starssky01 512 -
}

textures/el_treptex01/sky_warp
{
    qer_editorimage textures/el_treptex01/fx_colorwarp01.tga
    surfaceparm nolightmap
    surfaceparm nonsolid
    {
        map textures/el_treptex01/fx_effect01.tga
        blendFunc GL_ONE GL_ZERO
        tcMod scale 6 3
        tcMod scroll 0.025 0.75
    }
    {
        map textures/el_treptex01/fx_effect01.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcMod scale 11 4
        tcMod scroll 0.033 1
    }
    {
        map textures/el_treptex01/fx_colorwarp01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

//////////The end...