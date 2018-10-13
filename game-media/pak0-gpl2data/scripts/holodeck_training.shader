textures/holodeck_training/fog
{
    qer_editorimage textures/borg/fog.tga
    qer_nocarve
    surfaceparm fog
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    surfaceparm nodrop
    cull back
    fogparms ( 0.55 0.4 0.2 ) 768
}

textures/holodeck_training/target
{
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/holodeck_training/target.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 0.25 0 1
    }
}

textures/holodeck_training/lava2
{
    surfaceparm lava
    surfaceparm nolightmap
    surfaceparm nosteps
    surfaceparm trans
    cull disable
    deformVertexes wave 200 sin 0 1 0 0.25
    tessSize 96
    {
        map textures/holodeck_training/lava2.tga
        rgbGen identity
        tcMod scroll -0.02 -0.01
    }
    {
        map textures/holodeck_training/lava2_mult.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
        tcMod scale 2 2
        tcMod scroll 0.01 0.02
    }
    {
        map textures/holodeck_training/lava2_mult.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcMod scale 3 3
        tcMod scroll -0.015 -0.025
    }
}

