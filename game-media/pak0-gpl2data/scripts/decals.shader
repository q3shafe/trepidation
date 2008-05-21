gfx/misc/tracer
{
	cull disable
	{
		map gfx/misc/tracer2.tga
		blendfunc add
	}
}

bloodMark
{
	nopicmip
	polygonoffset
	{
		clampmap textures/oafx/bloodsplatmult.tga
		blendfunc gl_dst_color gl_src_color
		alphaGen Vertex
	}
}

bloodTrail
{
	nopicmip
	{
		clampmap textures/oafx/bloodmult.tga
		blendfunc gl_dst_color gl_src_color
		alphaGen Vertex
	}
}

gfx/damage/bullet_mrk
{
	polygonoffset
	{
		map gfx/damage/bulletmult.tga
		blendfunc gl_dst_color gl_src_color
		alphaGen Vertex
	}
}

oldgfx/damage/bullet_mrk
{
	polygonoffset
	{
		map gfx/damage/bullet_mrk.tga
		blendfunc gl_zero gl_one_minus_src_color
		rgbGen Vertex
	}
}

gfx/damage/burn_med_mrk
{
	polygonoffset
	{
		map gfx/damage/burn_med_mrk.tga
		blendfunc gl_zero gl_one_minus_src_color
		rgbGen Vertex
	}
}

gfx/damage/hole_lg_mrk
{
	polygonoffset
	{
		map gfx/damage/hole_lg_mrk.tga
		blendfunc gl_zero gl_one_minus_src_color
		rgbGen Vertex
	}
}

gfx/damage/plasma_mrk
{
	polygonoffset
	{
		map gfx/damage/plasma_mrk.tga
		blendfunc blend
		rgbGen Vertex
		alphaGen Vertex
	}
}

markShadow
{
	polygonoffset
	{
		map gfx/damage/shadow.tga
		blendfunc gl_zero gl_one_minus_src_color
		rgbGen Vertex
	}
}

projectionShadow
{
	polygonoffset
	{
		map $whiteimage 
		rgbGen wave square 0 0 0 0 
	}
}

wake
{
	{
		clampmap sprites/splash.tga
		blendfunc add
		rgbGen wave sin 0.7 0.3 0.25 0.5 
		tcMod rotate 250
		tcMod stretch sin 0.9 0.1 0 0.7 
	}
	{
		clampmap sprites/splash.tga
		blendfunc add
		rgbGen wave sin 0.7 0.3 0.25 0.4 
		tcMod rotate -230
		tcMod stretch sin 0.9 0.05 0 0.9 
	}
}

viewBloodBlend
{
	sort nearest
	{
		map textures/oafx/bloodscreenmult.tga
		blendfunc gl_dst_color gl_src_color
		alphaGen Vertex
	}
}

waterBubble
{
	sort underwater
	cull disable
	{
		map sprites/bubble.tga
		blendfunc blend
		rgbGen Vertex
		alphaGen Vertex
	}
}

sgTrail
{
	sort underwater
	cull disable
	{
		map sprites/sgtrail.tga
		blendfunc blend
		rgbGen Vertex
		alphaGen Vertex
	}
}

