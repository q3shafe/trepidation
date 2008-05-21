////////////////////////////Systeme:

textures/el_junction/sy_abyss
{
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    {
        map textures/el_junction/sy_abyss.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
}

////////////////////////////Environement:

textures/el_junction/junctionsky
{
        
	q3map_lightimage textures/el_junction/sy_lightref00.tga
        qer_editorimage textures/el_junction/sy_junctionsky.tga
        q3map_surfacelight 450
        surfaceparm noimpact
	surfaceparm nomarks
        surfaceparm nolightmap
        surfaceparm sky
        q3map_sun 1 1 1 75 90 90 
	skyParms env/junctionsky 512 -
}

textures/el_junction/fx_lava
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
        map textures/el_junction/fx_lava.tga
        rgbGen identity
        tcMod scroll -0.02 -0.01
    }
    {
        map textures/el_junction/fx_lava00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
        tcMod scale 2 2
        tcMod scroll 0.01 0.02
    }
    {
        map textures/el_junction/fx_lava00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcMod scale 3 3
        tcMod scroll -0.015 -0.025
    }
}

////////////////////////////alpha chanel textures:

textures/el_junction/b_grille00
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_junction/b_grille00.tga
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

textures/el_junction/b_grille01
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_junction/b_grille01.tga
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

textures/el_junction/b_grille02
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_junction/b_grille02.tga
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

////////////////////////////structures/buildings:

textures/el_junction/b_metal00
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_junction/b_metal00.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_junction/sy_rust00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        tcMod scale 3.2 1.7
    }
}

textures/el_junction/s_fancyfloor00
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_junction/s_fancyfloor00.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_junction/sy_rust00.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        tcMod scale 3.2 1.7
    }
}

textures/el_junction/b_trim02
{
    qer_editorimage textures/el_junction/b_trim02
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_junction/b_trim02.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_junction/b_trim02_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll -0.46 0
    }
    {
        map textures/el_junction/b_trim02_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0.46 0
    }
}

textures/el_junction/b_spring
{
    qer_editorimage textures/el_junction/b_spring
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_junction/b_spring.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_junction/b_spring_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -0.5
    }
    {
        map textures/el_junction/b_spring_a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 0.5
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

////////////////////////////décalques:

textures/el_junction/d_exit
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_junction/d_exit.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_junction/d_corsouth
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_junction/d_corsouth.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_junction/d_cornorth
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_junction/d_cornorth.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

////////////////////////////worker_droid:

textures/el_junction/wd_eyes
{
    q3map_surfacelight 600
    surfaceparm nolightmap
    {
        map textures/el_junction/wd_eyes.tga
    }
}

textures/el_junction/wd_antigrav
{
    q3map_surfacelight 1600
    surfaceparm nolightmap
    {
        map textures/el_junction/wd_antigrav.tga
    }
}

////////////////////////////FIN:

