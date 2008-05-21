models/weapons2/plasma/LDApg
{
	{
		map models/weapons2/plasma/LDApgfx0.jpg
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.03
		tcGen environment 
	}
	{
		map models/weapons2/plasma/LDApg.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen lightingDiffuse
		tcGen lightmap 
	}
}

models/weapons2/plasma/ldapgfx1
{
	{
		map models/weapons2/plasma/ldapgfx1.jpg
		rgbGen wave sin 0.1 0.2 99 7 
		tcMod scroll 3 -0.3
	}
	{
		map models/weapons2/plasma/ldapgfx2.jpg
		blendfunc add
		rgbGen identity
		tcMod scroll -1 2
		tcMod turb 0.05 0.1 0 1
	}
	{
		map models/weapons2/plasma/ldapgfx0.jpg
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 0.03 0.01
		tcGen environment 
	}
}