Scanner
{
	nopicmip

	{
		map gfx/2d/scanner.tga
		blendFunc blend
		alphaFunc GT0
	}
}

ScannerBlip
{
	nopicmip
	q3map_surfacelight 150
	{
		map gfx/2d/ScannerBlip.tga
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 1
	}
}

ScannerBlipUp
{
	nopicmip
	q3map_surfacelight 150
	{
		map gfx/2d/ScannerBlipUp.tga
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 1
	}
}

ScannerBlipDown
{
	nopicmip
	q3map_surfacelight 150
	{
		map gfx/2d/ScannerBlipDown.tga
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 1
	}
}

