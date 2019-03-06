textures/efkungfu/metal_gold
{
    {
        map textures/voyager/basic.jpg
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/efkungfu/shiny_gold.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/efkungfu/metal_slvr
{
    {
        map textures/voyager/basic.jpg
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/efkungfu/shiny_silver.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/efkungfu/metal_black
{
    {
        map textures/voyager/basic.jpg
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/efkungfu/shiny_black.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/efkungfu/metal_red
{
    {
        map textures/voyager/basic.jpg
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/efkungfu/shiny_red.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
        tcMod scale 2 2
    }
}

textures/efkungfu/light_001
{
    q3map_surfacelight 600
    surfaceparm nolightmap
    {
        map textures/efkungfu/light_001.tga
    }
}

models/mapobjects/multiplant/batleaf
{	
    surfaceparm alphashadow
    cull none
    	
	{
		map models/mapobjects/multiplant/batleaf.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models/mapobjects/multiplant/palmfrond
{	
    surfaceparm alphashadow
    cull none
    	
	{
		map models/mapobjects/multiplant/palmfrond.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/efkungfu/light_004
{
    q3map_surfacelight 600
    light 0.5
    surfaceparm nolightmap
    {
        map textures/efkungfu/light_004.jpg
    }
}

textures/efkungfu/whitecrystal
{
    q3map_surfacelight 1000
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/efkungfu/whitecrystal.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/efkungfu/sfx_fire
{
	qer_editorimage textures/efkungfu/sfx_fire01.tga
	surfaceparm nomarks
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull none
	//q3map_surfacelight 7500
	
	{
		animMap 10 textures/efkungfu/sfx_fire01.tga textures/efkungfu/sfx_fire02.tga textures/efkungfu/sfx_fire03.tga textures/efkungfu/sfx_fire04.tga textures/efkungfu/sfx_fire05.tga textures/efkungfu/sfx_fire06.tga textures/efkungfu/sfx_fire07.tga textures/efkungfu/sfx_fire08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10
		
	}	
	{
		animMap 10 textures/efkungfu/sfx_fire01.tga textures/efkungfu/sfx_fire02.tga textures/efkungfu/sfx_fire03.tga textures/efkungfu/sfx_fire04.tga textures/efkungfu/sfx_fire05.tga textures/efkungfu/sfx_fire06.tga textures/efkungfu/sfx_fire07.tga textures/efkungfu/sfx_fire08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
	{
		map textures/efkungfu/sfx_flameball.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .6 .2 0 .6	
	}
}

textures/efkungfu/sfx_flameball1
{
	qer_editorimage textures/efkungfu/sfx_flameball1.tga
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	//q3map_surfacelight 7500
	
	{
		animMap 10 textures/efkungfu/sfx_flameball1.tga textures/efkungfu/sfx_flameball2.tga textures/efkungfu/sfx_flameball3.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10
		
	}	
	{
		animMap 10 textures/efkungfu/sfx_flameball1.tga textures/efkungfu/sfx_fire02.tga textures/efkungfu/sfx_flameball3.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
	{
		map textures/efkungfu/sfx_flameball1.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .6 .2 0 .6	
	}
}

textures/efkungfu/squilant2
{
    surfaceparm trans
    {
        map textures/efkungfu/squilant2.tga
        alphaFunc GE128
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

textures/efkungfu/2513724
{
    surfaceparm trans
    {
        map textures/efkungfu/2513724.tga
        alphaFunc GE128
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

textures/efkungfu/261321571009
{
    surfaceparm trans
    {
        map textures/efkungfu/261321571009.tga
        alphaFunc GE128
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

textures/efkungfu/lat3
{
    q3map_surfacelight 50
    surfaceparm trans
    {
        map textures/efkungfu/lat3.tga
        alphaFunc GE128
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

textures/efkungfu/tassle
{
    light 1
    surfaceparm nolightmap
    surfaceparm nonsolid
    deformVertexes autoSprite
    {
        map textures/efkungfu/tassle.tga
        blendFunc GL_ONE GL_ONE
    }
}
textures/efkungfu/budda2
{
    light 1
    surfaceparm nolightmap
    surfaceparm nonsolid
    deformVertexes autoSprite
    {
        map textures/efkungfu/budda2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/efkungfu/rik_flare2
{
    light 1
    surfaceparm nolightmap
    surfaceparm nonsolid
    deformVertexes autoSprite
    {
        map textures/efkungfu/rik_flare2.tga
        blendFunc GL_ONE GL_ONE
    }
}