powerups/invisibility
{
	cull disable
	deformVertexes wave 64 sin 0 1 0 1 
	{
		map textures/oafx/inviso.tga
		blendfunc gl_dst_color gl_src_color
		tcMod rotate 53
	}
	{
		map textures/oafx/inviso.tga
		blendfunc gl_dst_color gl_src_color
		tcMod rotate -86
	}
}

powerups/quadi
{
	//deformVertexes wave 64 sin 0 1 0 1 
	{
		map textures/oafx/quadmultshell.tga
		blendfunc gl_dst_color gl_src_color
		tcMod rotate 53
	}
}

powerups/quad
{
	//deformVertexes wave 64 sin 0 1 0 1 
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/oafx/quadshell.tga
		blendfunc add
		tcMod rotate 75
	}
	
}

powerups/quadWeapon
{
	//deformVertexes wave 64 sin 0 1 0 1 
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/oafx/quadshell.tga
		blendfunc add
		tcMod rotate 75
	}
	
}
powerups/battleSuit
{
	//deformVertexes wave 64 sin 0 1 0 1 
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/oafx/suitshell.tga
		blendfunc add
		tcMod rotate 75
	}
	
}

powerups/battleWeapon
{
	//deformVertexes wave 64 sin 0 1 0 1 
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/oafx/suitshell.tga
		blendfunc add
		tcMod rotate 75
	}
	
}
powerups/regen
{
	//deformVertexes wave 64 sin 0 1 0 1 
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/oafx/regenshell.tga
		blendfunc add
		tcMod rotate 75
	}
	
}

