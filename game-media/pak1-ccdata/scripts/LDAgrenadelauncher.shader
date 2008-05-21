//------------------------------------------------------------------------
models/weapons2/grenadel/ldagl
{   
        {
                map models/weapons2/grenadel/glfx.jpg       
                tcGen environment
                rgbGen lightingDiffuse
	}   
        {
		map models/weapons2/grenadel/ldagl.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen lightingDiffuse
	}
}