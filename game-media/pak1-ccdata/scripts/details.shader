textures/base_wall/c_met5_2
{

	{
		map textures/base_wall/c_met5_2.tga
		rgbGen identity
	}
	{
		map textures/detail/d_conc.jpg
	        blendFunc GL_DST_COLOR GL_SRC_COLOR
	        detail
	        tcMod scale 3.9 4.2
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}

