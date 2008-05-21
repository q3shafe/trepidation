//------------------------------------------------------------------------
models/weapons2/shotgun/ldasg
{   
        {
                map models/weapons2/shotgun/sgfx.jpg       
                tcGen environment
                rgbGen lightingDiffuse
	}   
        {
		map models/weapons2/shotgun/ldasg.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen lightingDiffuse
	}
}