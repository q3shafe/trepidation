////////////////////concrete_station shaders by Gigon:

////////////////////Skybox:

textures/el_concrete_station/concrete_station_skybox
{
    q3map_lightimage textures/el_concrete_station/lightref1.tga
      qer_editorimage textures/common/sky.tga
      q3map_surfacelight 280
      surfaceparm noimpact
    surfaceparm nomarks
      surfaceparm nolightmap
      surfaceparm sky
      q3map_sun 1 1 1 80 90 90
    skyParms env/stars 512 -
}

////////////////////lights:

textures/el_concrete_station/f_light01
{
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/el_concrete_station/f_light01.tga
    }
}

textures/el_concrete_station/f_light02
{
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/el_concrete_station/f_light02.tga
    }
}

textures/el_concrete_station/f_light03
{
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/el_concrete_station/f_light03.tga
    }
}

////////////////////shines:

textures/el_concrete_station/s_bleue_plain
{
    {
        map textures/el_concrete_station/s_bleue_plain.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_concrete_station/sh_shine.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

textures/el_concrete_station/s_rouge_plain
{
    {
        map textures/el_concrete_station/s_rouge_plain.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_concrete_station/sh_shine.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

textures/el_concrete_station/s_gray02
{
    {
        map textures/el_concrete_station/s_gray02.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_concrete_station/sh_shine.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

////////////////////Alpha:

textures/el_concrete_station/a_grille01
{
    surfaceparm metalsteps
    surfaceparm trans
    cull disable
    {
        map textures/el_concrete_station/a_grille01.tga
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

////////////////////Water:

textures/el_concrete_station/t_water
{
    qer_trans 0.55
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm water
    cull disable
    {
        map textures/el_concrete_station/t_water.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.006 -0.008
    }
    {
        map textures/el_concrete_station/t_water.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.004 0.005
    }
}

////////////////////glass:

textures/el_concrete_station/f_glass_nolightmap
{
    qer_editorimage textures/el_concrete_station/f_glass.tga
    qer_trans 0.40
    surfaceparm nolightmap
    surfaceparm trans
    tessSize 48
    {
        map textures/el_concrete_station/f_glass.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
    }
    {
        map textures/el_concrete_station/f_glass.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
    }
}

////////////////////Floor metal sound:

textures/el_concrete_station/s_floor_bleue
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_concrete_station/s_floor_bleue.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_concrete_station/s_floor_gris
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_concrete_station/s_floor_gris.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_concrete_station/s_floor_rouge
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_concrete_station/s_floor_rouge.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

////////////////////Decalques:

textures/el_concrete_station/d_concrete_station01
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_concrete_station/d_concrete_station01.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_concrete_station/d_teamblue
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_concrete_station/d_teamblue.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_concrete_station/d_teamred
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_concrete_station/d_teamred.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

////////////////////F/X:

textures/el_concrete_station/fx_teleport_red
{  
    qer_editorimage textures/el_concrete_station/fx_teleport_red.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm forcefield
    {
	map textures/el_concrete_station/fx_teleport_red.tga
        blendFunc GL_ONE GL_ONE
        depthWrite 
	tcMod scroll 1292.7 11233.9
    }
}

textures/el_concrete_station/fx_teleport_blue
{  
    qer_editorimage textures/el_concrete_station/fx_teleport_blue.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm forcefield
    {
	map textures/el_concrete_station/fx_teleport_blue.tga
        blendFunc GL_ONE GL_ONE
        depthWrite 
	tcMod scroll 1292.7 11233.9
    }
}

////////////////////System:

textures/el_concrete_station/sy_metal_clip

{
surfaceparm metalsteps
qer_trans 0.3
surfaceparm nodraw
surfaceparm noimpact
surfaceparm nomarks
surfaceparm nolightmap
surfaceparm nonsolidsurfaceparm playerclip  
surfaceparm trans
surfaceparm monsterclip
}

////////////////////the end.