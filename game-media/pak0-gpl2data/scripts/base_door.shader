
textures/base_door/shinymetaldoor
{

	{
		//map $lightmap
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

textures/base_door/shinymetaldoor_outside
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

textures/base_door/shinymetaldoor_outside3a2
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside3a2.tga
		blendFunc blend
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}

	{
		map textures/base_door/shinymetaldoor_outside3glow.tga
		blendFunc add
		rgbGen wave sin .9 .1 0 5
	}
		
} 

textures/liquids/new_water1
{
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	surfaceparm nolightmap
	tessSize 48
	cull disable
	deformVertexes wave 128 sin 0 2 0 0.75
	{
		map textures/holodeck_temple/water1f.tga
		blendfunc GL_DST_COLOR GL_SRC_COLOR
		tcMod scale 2 2
		tcMod turb .1 .05 .25 .08
		tcMod scroll 2.05 0.03
	}
    
    {
        map textures/holodeck_temple/water1f.tga
        blendfunc GL_DST_COLOR GL_ONE
        tcMod scale .5 .5
        tcMod turb .1 .075 .5 .05
        tcMod scroll 1.5 .1
    } 
}

textures/liquids/squi_water1
{
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	tessSize 48
	cull disable
	deformVertexes wave 128 sin 0 2 0 0.75
    {
        map textures/liquids/squi_water1.tga
        blendfunc GL_DST_COLOR GL_SRC_COLOR
		tcMod turb .1 .05 .25 .08
        tcMod scroll 0.05 -0.03
    }
    {
        map textures/holodeck_temple/water1f.tga
        blendfunc GL_DST_COLOR GL_SRC_COLOR
        tcMod turb .1 .075 .5 .05
        tcMod scroll 0.045 0.05
    }
}

