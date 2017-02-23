//-------------------
//Lightsaber
//By CheapAlert
//------------------
//
//welcome to the lightsaber shader file!
//the only texture used here is glow.tga, which in turn,
//is the lightsaber glow, by 1 texture. so people can easily
//make custom glow skins for the saber that take approx. 2kb
//of space. smart thinking, eh?
//
//---------------
//appears 3 times at the base of the saber, to give some sort of glow effect.
models/weapons2/gauntlet/flare2
{
	deformVertexes autosprite
//	q3map_flare models/weapons2/gauntlet/flare2
	{
		map models/weapons2/gauntlet/glow.tga
		blendfunc add
	rgbGen wave sin 0.07 0.02 0 15 
	}
}

//this shader rules. made my lightsaber look 93% of the one in the movie. (episode IV)
//basically a bunch of sprites that go across the blade of the saber.
//i put many of them across to avoid spoiling that it's really a bunch of sprites,
//but it looks like a true smooth glow to the viewer.
models/weapons2/gauntlet/flare
{
	deformVertexes autosprite
//	q3map_flare models/weapons2/gauntlet/flare
	{
		map models/weapons2/gauntlet/glow.tga
		blendfunc add
		rgbGen wave sin 0.08 0.02 0 15 
	}
}

//this is the blade part of the saber. no sprites used here.
models/weapons2/gauntlet/glow
{
//	deformVertexes autosprite2 // don't do this! because I hate it.
	{
		map models/weapons2/gauntlet/glow.tga
		blendfunc add
		rgbGen wave sin 1 0.1 0 15 
	}
}





