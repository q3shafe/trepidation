models/players/zveeep/default
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/default.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/red
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/red.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/blue
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/blue.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/murder
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/murder.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/hijinx
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/hijinx.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/shimmer
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/zveeep/shimmer.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

models/players/zveeep/detect
{
	{
		map models/players/zveeep/detect.tga
		rgbGen identity
	}
	{
		map models/players/zveeep/scan.tga
		blendfunc filter
		rgbGen identity
		tcMod scroll 3 -0.1
		tcMod stretch sin 3 0.2 0 0.5 
	}
}

models/players/zveeep/detect_b
{
	{
		map models/players/zveeep/detect_b.tga
		rgbGen identity
	}
	{
		map models/players/zveeep/scan_b.tga
		blendfunc filter
		rgbGen identity
		tcMod scroll 3 -0.1
		tcMod stretch sin 3 0.2 0 0.5 
	}
}

models/players/zveeep/detect_g
{
	{
		map models/players/zveeep/detect_g.tga
		rgbGen identity
	}
	{
		map models/players/zveeep/scan_g.tga
		blendfunc filter
		rgbGen identity
		tcMod scroll 3 -0.1
		tcMod stretch sin 3 0.2 0 0.5 
	}
}

models/players/zveeep/gods_elect
{
	{
		map models/players/zveeep/gods_elect.tga
		blendfunc add
		rgbGen vertex
		tcMod scroll 0 -3
	}
	{
		map models/players/zveeep/gods_elect.tga
		blendfunc add
		rgbGen vertex
		tcMod scroll 0 -1
	}
}

models/players/zveeep/gods_elect_b
{
	{
		map models/players/zveeep/gods_elect_b.tga
		blendfunc add
		rgbGen vertex
		tcMod scroll 0 -3
	}
	{
		map models/players/zveeep/gods_elect_b.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0 -1
	}
}

models/players/zveeep/gods_elect_r
{
	{
		map models/players/zveeep/gods_elect_r.tga
		blendfunc add
		rgbGen vertex
		tcMod scroll 0 -3
	}
	{
		map models/players/zveeep/gods_elect_r.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0 -1
	}
}

models/players/zveeep/gods_elect_g
{
	{
		map models/players/zveeep/gods_elect_g.tga
		blendfunc add
		rgbGen vertex
		tcMod scroll 0 -3
	}
	{
		map models/players/zveeep/gods_elect_g.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0 -1
	}
}