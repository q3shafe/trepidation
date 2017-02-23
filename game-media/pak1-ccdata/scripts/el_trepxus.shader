//////////trepxus STATION shaders by Eric - GIGON - Lessard.

//////////structures:

textures/el_trepxus/s_grille_rail
{
    surfaceparm metalsteps    
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/s_grille_rail.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/s_wall01
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/s_wall01.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/s_wall03
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/s_wall03.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/s_wall_bleue
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/s_wall_bleue.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/s_wall_rouge
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/s_wall_rouge.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

//////////terrain:

textures/el_trepxus/t_terrain0
{
    surfaceparm nosteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/t_terrain0.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

//////////accessoires:

textures/el_trepxus/a_grille01
{
    surfaceparm trans
    surfaceparm playerclip
    cull disable
    {
        map textures/el_trepxus/a_grille01.tga
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

textures/el_trepxus/a_glass_nolightmap
{
    qer_editorimage textures/el_trepxus/a_glass.tga
    qer_trans 0.40
    surfaceparm nolightmap
    surfaceparm trans
    tessSize 48
    {
        map textures/el_trepxus/a_glass.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
    }
    {
        map textures/el_trepxus/a_glass.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
    }
}

textures/el_trepxus/a_crate05
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/a_crate05.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/a_crate06
{
    surfaceparm metalsteps
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/el_trepxus/a_crate06.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/el_trepxus/a_lumiere
{
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/el_trepxus/a_lumiere.tga
    }
}

//////////decalques:

textures/el_trepxus/d_trepxusstation
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_trepxus/d_trepxusstation.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/el_trepxus/d_x
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/el_trepxus/d_x.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

//////////skybox:

textures/el_trepxus/trepxus_sky
{
    qer_editorimage textures/el_treptex01/sh_sky01.tga
    q3map_surfacelight 225
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 0.978189 75 90 90
    skyParms env/coolsky02 512 -
}

//////////FIN.