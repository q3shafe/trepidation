////////////////////////////////////////lights:

textures/el_station144/f_biglight01
{
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/el_station144/f_biglight01.tga
    }
}

textures/el_station144/f_trimlight01
{
	qer_editorimage textures/el_station144/f_trimlight01.tga
	q3map_surfacelight 500
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_station144/f_trimlight01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_station144/f_trimlight01-blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 0.05
	}	
}

textures/el_station144/f_trimlight02
{
	qer_editorimage textures/el_station144/f_trimlight02.tga
	q3map_surfacelight 500
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/el_station144/f_trimlight02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}	
	{
		map textures/el_station144/f_trimlight02-blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0 0.05
	}	
}

////////////////////////////////////////f/x:

textures/el_station144/f_pipe01
{
    qer_editorimage textures/el_station144/f_pipe01
    surfaceparm nomarks
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/f_pipe01.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_station144/f_pipe01a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -0.46
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

////////////////////////////////////////alpha:

textures/el_station144/al_geojute
{
    surfaceparm trans
    cull disable
    {
        map textures/el_station144/al_geojute.tga
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

textures/el_station144/al_liftcrate
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_station144/al_liftcrate.tga
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

////////////////////////////////////////decalc:

textures/el_station144/d_s144htts
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/el_station144/d_s144htts.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
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

textures/el_station144/d_arrow01
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    nopicmip
    polygonOffset
    {
        map textures/el_station144/d_arrow01.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

///////////////////////////////////////

textures/el_station144/b_gray01
{
    {
        map textures/el_station144/b_gray01.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_station144/sy_shine00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

textures/el_station144/b_gray02
{
    {
        map textures/el_station144/b_gray02.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_station144/sy_shine00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

textures/el_station144/b_trim01
{
    {
        map textures/el_station144/b_trim01.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_station144/sy_shine00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

////////////////////////////////////////metal sound:

textures/el_station144/b_floor01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/b_floor01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_station144/b_floor02
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/b_floor02.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_station144/b_floor03
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/b_floor03.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_station144/b_gray01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/b_gray01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_station144/b_gray02
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_station144/b_gray02.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_station144/sy_metalclip
{
    surfaceparm metalsteps
    qer_trans 0.3
    surfaceparm nodraw
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm playerclip
    surfaceparm trans   
    surfaceparm monsterclip
}

textures/el_station144/s144_sky01
{    
	q3map_lightimage textures/el_station144/sy_lightref01.tga
        qer_editorimage textures/el_station144/sy_skybox.tga
        q3map_surfacelight 600
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/s144sky01 512 -
}
