quadDamage
{
	{
		map textures/oafx/quadshell.tga
		tcGen environment 
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		tcGen environment 
	}
}

teleportEffect
{
	deformVertexes autosprite
	{
		clampmap models/powerups/instant/quadlite.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 2 
		tcMod rotate 85
		tcMod stretch sawtooth 0 1.5 0 2 
	}
	{
		clampmap models/powerups/instant/quadlite2.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 2 
		tcMod rotate -73
		tcMod stretch sawtooth 1 -0.7 0 2 
	}
}

quadAura
{
	deformVertexes autosprite
	{
		clampmap models/powerups/instant/quadlite.tga
		blendfunc add
		tcMod rotate 6
		tcMod stretch sin 1 0.1 0 1 
	}
	{
		clampmap models/powerups/instant/quadlite2.tga
		blendfunc add
		tcMod rotate -8
		tcMod stretch sin 1 -0.1 0 1 
	}
}

