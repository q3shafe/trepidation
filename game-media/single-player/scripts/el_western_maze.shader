////////////////////western_maze shaders by Gigon:

////////////////////Skybox:

textures/el_western_maze/western_maze_skybox
{
    q3map_lightimage textures/el_western_maze/lightref1.tga
      qer_editorimage textures/common/sky.tga
      q3map_surfacelight 265
      surfaceparm noimpact
    surfaceparm nomarks
      surfaceparm nolightmap
      surfaceparm sky
      q3map_sun 1 1 1 80 270 75
    skyParms textures/el_western_maze/western_maze-sky 512 -
}

////////////////////terrain:

textures/el_western_maze/t_grassdirt
{
    surfaceparm nosteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_western_maze/t_grassdirt.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_western_maze/t_water
{
    qer_trans 0.55
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm water
    cull disable
    {
        map textures/el_western_maze/t_water.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.006 -0.008
    }
    {
        map textures/el_western_maze/t_water.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.004 0.005
    }
}

////////////////////shines:

textures/el_western_maze/f_orange
{
    {
        map textures/el_western_maze/f_orange.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/el_western_maze/sh_shine.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
}

////////////////////end: