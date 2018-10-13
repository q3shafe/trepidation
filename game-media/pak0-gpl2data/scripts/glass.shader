textures/effects/squi_elec_blue1
{
	qer_editorimage textures/effects/squi_elec_blue1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
	animmap 20 textures/effects/squi_elec_blue1.tga textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	blendfunc add
	rgbGen wave square 0 1 0 2
	}
	{
	animmap 20 textures/effects/squi_elec_blue1.tga textures/effects/squi_elec_blue2.tga textures/effects/squi_elec_blue3.tga textures/effects/squi_elec_blue4.tga
	blendfunc add
	rgbGen wave square 0 2 .25 1.2
	}
}

textures/effects/squi_elec_red1
{
	qer_editorimage textures/effects/squi_elec_red1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
    surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
	animmap 20 textures/effects/squi_elec_red1.tga textures/effects/squi_elec_red2.tga textures/effects/squi_elec_red3.tga textures/effects/squi_elec_red4.tga
	blendfunc add
	rgbGen wave square 0 1 0 2
	}
	{
	animmap 20 textures/effects/squi_elec_red1.tga textures/effects/squi_elec_red2.tga textures/effects/squi_elec_red3.tga textures/effects/squi_elec_red4.tga
	blendfunc add
	rgbGen wave square 0 2 .25 1.2
	}
}