textures/holodeck_temple/water1f
{
    qer_trans 0.25
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm water
    surfaceparm pointlight
    deformVertexes wave 100 sin 0 4 0 0.75
    tessSize 192
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.05 -0.03
    }
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.045 0.05
    }
}