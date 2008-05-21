//------------------------------------------------------------------------
models/weapons2/machinegun/ldamg
{   
        {
                map models/weapons2/machinegun/mgfx.jpg       
                tcGen environment
                rgbGen lightingDiffuse
	}   
        {
		map models/weapons2/machinegun/ldamg.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen lightingDiffuse
	}
}