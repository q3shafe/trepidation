 // // // // SHADERS FOR OPEN ARENA AMMOBOX POWERUPS 
// // // //  jzero --> johnzero@verizon.net

// 1.machinegun
models/powerups/ammo/machammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 1 1 0 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2.tga
		rgbGen identity
	}
}

// 2.shotgun
models/powerups/ammo/shotammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 1 0.5 0 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2.tga
		rgbGen identity
	}
}

// 3.grenade launcher
models/powerups/ammo/grenammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 0 0.56 0 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/grenammo2
{
	{
		map models/powerups/ammo/grenammo2.tga
		rgbGen identity
	}
}

// 4.lightning gun
models/powerups/ammo/lighammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 1 1 0.69 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/lighammo2
{
	{
		map models/powerups/ammo/lighammo2.tga
		rgbGen identity
	}
}

// 5.plasma gun
models/powerups/ammo/plasammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( .8 0 1 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/plasammo2
{
	{
		map models/powerups/ammo/plasammo2.tga
		rgbGen identity
	}
}

//6.rocket launcher
models/powerups/ammo/rockammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 1 0 0 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2.tga
		rgbGen identity
	}
}

//7. railgun
models/powerups/ammo/railammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 0 1 0 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2.tga
		rgbGen identity
	}
}


//8. BFG
models/powerups/ammo/bfgammo
{
	{	
		map textures/effects/envmap2.tga
		rgbGen identity
		tcGen environment
	}
	{
		map models/powerups/ammo/ammobox.tga
		blendfunc blend
	}
	{
		map models/powerups/ammo/ammolights.tga
		blendfunc blend
		rgbGen const ( 0 0.4 1 )
		alphaGen wave sawtooth 0 1 0 1 
	}
}

models/powerups/ammo/bfgammo2
{
	{
		map models/powerups/ammo/bfgammo2.tga
		rgbGen identity
	}
}
