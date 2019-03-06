//q3map_sun <red> <green> <blue> <intensity> <degrees> <elevation>
//color will be normalized, so it doesn't matter what range you use
//intensity falls off with angle but not distance 100 is a fairly bright sun
//degree of 0 = from the east, 90 = north, etc.  altitude of 0 = sunrise/set, 90 = noon
//skyparms work like this:
textures/skies/redsky
{
    qer_editorimage textures/sky/redsky.tga
    q3map_surfacelight 500
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 0 0 150 30 60
    {
        map textures/sky/redsky.tga
        depthWrite
        tcMod scale 3 2
        tcMod scroll 0.15 0.15
    }
}

