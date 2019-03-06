textures/base_wall/atech1_alpha
{
	{
		map textures/sfx/hologirl.tga
		rgbGen identity
		tcMod scale 2 0.4
		tcMod scroll 6 0.6
	}
	{
		map textures/base_wall/atech1_alpha.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/atechengine_ax
{
	q3map_lightimage textures/base_wall/atechengine_ax2.tga
	q3map_surfacelight 300
	{
		map textures/sfx/proto_zzztpink.tga
		rgbGen identity
		tcMod rotate 60
		tcMod turb 0 0.5 0 9.6
		tcMod scale 2 2
		tcMod scroll 9 5
	}
	{
		map textures/base_wall/atechengine_ax.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/basewall01_ow
{
	q3map_lightimage textures/base_wall/basewall01_owfx.tga
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/basewall01_ow.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_owfx.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.5 
	}
}

textures/base_wall/basewall01bit
{
	q3map_lightimage textures/base_wall/basewall01bitfx.tga
	q3map_surfacelight 300
	{
		map textures/base_wall/basewall01bit.tga
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01bitfx.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 5 
		tcMod scroll 3.3 1
	}
	{
		map textures/effects/envmap2.tga
		blendfunc add
		rgbGen identity
		tcMod scale 4 4
		tcGen environment 
	}
	{
		map textures/base_wall/basewall01bit.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetal1b_chrome
{
	qer_editorimage textures/base_wall/bluemetal1b_shiny.tga
	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetal1b_shiny.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetal1b_shiny
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetal1b_shiny.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_noisy
{
	qer_editorimage textures/base_wall/bluemetal2_shiny.tga
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_shiny
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_shiny_trans
{
	qer_editorimage textures/base_wall/bluemetal2_shiny.tga
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetalsupport2
{
	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2b
{
	q3map_lightimage textures/base_wall/bluemetalsupport2bglow.tga
	q3map_surfacelight 100
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2b.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2bglow.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
	}
}

textures/base_wall/bluemetalsupport2c
{
	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2c.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2c_1
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2c_1.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2c_1vent
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2c_1vent.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2clight
{
	surfaceparm nomarks
	q3map_surfacelight 500
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2clight.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2clight.glow.tga
		blendfunc add
		rgbGen wave sawtooth 0.6 0.1 0 4 
	}
}

textures/base_wall/bluemetalsupport2d_1
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2d_1.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2e
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2e.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2e2
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2e2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2eye
{
	q3map_lightimage textures/base_wall/bluemetalsupport2eyel.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2eye.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2eyel.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.5 0 0.5 
	}
}

textures/base_wall/bluemetalsupport2f
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2f.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/bluemetalsupport2fline
{
	q3map_lightimage textures/base_wall/bluemetalsupport2fline_glow.tga
	q3map_surfacelight 100
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2fline.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2fline_glow.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 1 
	}
}

textures/base_wall/bluemetalsupport2ftv
{
	q3map_lightimage textures/base_wall/bluemetalsupport2ftv_glow.tga
	q3map_surfacelight 100
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/bluemetalsupport2ftv.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2ftv_glow.tga
		blendfunc add
		rgbGen wave sawtooth 0.4 0.05 0 10 
	}
}

textures/base_wall/blumtlspt2b
{
	q3map_lightimage textures/base_wall/blumtlspt2bglow.tga
	q3map_surfacelight 100
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/blumtlspt2b.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/bluemetalsupport2bglow.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
	}
}

textures/base_wall/c_met5_2_trans
{
	qer_editorimage textures/base_wall/c_met5_2.tga
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/c_met5_2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall/chrome_metal
{
	{
		map textures/base_wall/chrome_env.tga
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/chrome_metal.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.0693 0.0712
		detail
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/comp3
{
	qer_editorimage textures/base_wall/comp3_qer.tga
	q3map_lightimage textures/base_wall/comp3env.tga
	q3map_surfacelight 1000
	{
		map textures/base_wall/comp3text.tga
		rgbGen identity
		tcMod scroll 3 1
	}
	{
		map textures/base_wall/comp3env.tga
		blendfunc add
		rgbGen wave sin 0.98 0.02 0 5 
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one
		tcGen environment 
	}
	{
		map textures/base_wall/comp3.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/comp3b
{
	qer_editorimage textures/base_wall/comp3b_qer.tga
	q3map_lightimage textures/base_wall/comp3textb.tga
	q3map_surfacelight 1000
	{
		map textures/base_wall/comp3textb.tga
		rgbGen identity
		tcMod scroll 3 3
	}
	{
		map textures/base_wall/comp3env.tga
		blendfunc add
		rgbGen wave sin 0.98 0.02 0 5 
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one
		tcGen environment 
	}
	{
		map textures/base_wall/comp3b.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/comp3b_dark
{
	qer_editorimage textures/base_wall/comp3b_qer.tga
	q3map_lightimage textures/base_wall/comp3textb.tga
	q3map_surfacelight 1
	{
		map textures/base_wall/comp3textb.tga
		rgbGen identity
		tcMod scroll 3 3
	}
	{
		map textures/base_wall/comp3env.tga
		blendfunc add
		rgbGen wave sin 0.98 0.02 0 5 
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one
		tcGen environment 
	}
	{
		map textures/base_wall/comp3b.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/comp3c
{
	qer_editorimage textures/base_wall/comp3c_qer.tga
	{
		map textures/base_wall/comp3env.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc add
		tcGen environment 
	}
	{
		map textures/base_wall/comp3c.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/concrete_ow
{
	{
		map textures/sfx/proto_zzztblu2.tga
		rgbGen identity
		tcMod turb 0 0.5 0 9.6
		tcMod scale 2 2
		tcMod scroll 9 5
	}
	{
		map textures/base_wall/concrete_ow.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/dooreye
{
	q3map_lightimage textures/base_wall/dooreyelight.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/dooreye.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_wall/dooreyelight.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.5 0 0.5 
	}
}

textures/base_wall/dooreye2
{
	q3map_lightimage textures/base_wall/dooreyelight.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/dooreye2.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_wall/dooreyelight.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.5 0 0.5 
	}
}

textures/base_wall/dooreye3
{
	q3map_lightimage textures/base_wall/dooreyelight.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/dooreye3.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_wall/dooreyelight.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.5 0 0.5 
	}
}

textures/base_wall/girders1i_yellofin
{
	qer_editorimage textures/base_wall/girders1i_yellodark_fin.tga
	surfaceparm alphashadow
	surfaceparm metalsteps
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/base_wall/girders1i_yellodark_fin.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

textures/base_wall/glass01
{
	qer_editorimage textures/base_wall/shiny3.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/effects/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/glass_frame
{
	surfaceparm alphashadow
	cull disable
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/base_wall/glass_frame.tga
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/grill
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/grill.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/main_q3abanner
{
	q3map_lightimage textures/base_wall/main_q3abanner.tga
	q3map_surfacelight 100
	{
		map textures/base_wall/main_q3abanner.tga
		rgbGen wave square 0 1 0 0.5 
	}
	{
		map textures/base_wall/comp3text.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 3 3
	}
	{
		map textures/base_wall/comp3textb.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 3 3
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map $lightmap 
		blendfunc add
		rgbGen wave sin 0.25 0 0 0 
		tcMod scale 0.5 0.5
		tcGen environment 
	}
}

textures/base_wall/medal_impressive
{
	qer_editorimage textures/base_wall/medal_impressive.tga
	q3map_surfacelight 100
	{
		animmap 0.25 textures/base_wall/medal_impressive.tga textures/base_wall/medal_gauntlet.tga textures/base_wall/medal_excellent.tga textures/base_wall/medal_accuracy.tga textures/base_wall/medal_victory.tga textures/base_wall/medal_frags.tga 
		rgbGen wave sawtooth 0 1 0 0.25 
	}
	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 0.25 
		tcMod scroll 5 0.25
	}
	{
		map textures/base_wall/chrome_env.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.05 0 10 
		tcMod scale 0.5 0.5
		tcGen environment 
	}
	{
		map textures/base_wall/comp3frame.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/metalfloor_wall_14_specular
{
	qer_editorimage textures/base_wall/metalfloor_wall_14_specular.tga
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/metalfloor_wall_14_specular.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/metalfloor_wall_15ow
{
	{
		map textures/base_wall/metalfloor_wall_15ow.tga
		rgbGen identity
	}
	{
		map textures/sfx/hologirl.tga
		blendfunc add
		rgbGen identity
		tcMod scale 2 0.4
		tcMod scroll 6 0.6
	}
	{
		map textures/base_wall/metalfloor_wall_15ow.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
}

textures/base_wall/metaltechgeomtrn
{
	{
		map textures/sfx/fire_ctfblue.tga
		rgbGen identity
		tcMod scroll 0 1
		tcMod turb 0 0.25 0 1.6
		tcMod scale 2 2
	}
	{
		map textures/base_wall/metaltechgeomtrn.tga
		blendfunc blend
		rgbGen identity
		tcMod rotate 30
		tcMod stretch sin 0.8 0.2 0 0.2 
	}
	{
		map textures/base_wall/metaltechgeomtrn2.tga
		blendfunc blend
		rgbGen identity
		tcMod rotate 20
		tcMod stretch sin 0.8 0.2 0 0.1 
	}
	{
		map textures/base_wall/metaltechgeomtrn.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/patch10shiny
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.tga
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/patch10_beatup4_alpha.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/patch10shiny_trans
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.tga
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/patch10_beatup4_alpha.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/protobanner
{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 30 sin 0 3 0 0.2 
	deformVertexes wave 100 sin 0 3 0 0.7 
	tessSize 64
	{
		map textures/base_wall/protobanner.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

textures/base_wall/protobanner_ow
{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 1 0 0.1 
	deformVertexes wave 100 sin 0 1 0 0.2 
	{
		map textures/base_wall/protobanner_ow.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

textures/base_wall/protobanner_still
{
	qer_editorimage textures/base_wall/protobanner.tga
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	tessSize 64
	{
		map textures/base_wall/protobanner.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

textures/base_wall/q3tourneyscreen
{
	qer_editorimage textures/base_wall/q3tourney1.tga
	q3map_surfacelight 100
	{
		animmap 0.25 textures/base_wall/q3tourney1.tga textures/base_wall/q3tourney2.tga textures/base_wall/q3tourney3.tga textures/base_wall/q3tourney4.tga textures/base_wall/q3tourney5.tga 
		rgbGen wave sawtooth 0 1 0 0.25 
	}
	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 0.25 
		tcMod scroll 5 0.25
	}
	{
		map textures/base_wall/chrome_env.tga
		blendfunc add
		rgbGen wave triangle 0.5 0.05 0 10 
		tcMod scale 0.5 0.5
		tcGen environment 
	}
	{
		map textures/base_wall/comp3frame.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/shinybluemetal1
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/shinybluemetal1.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/shinygrate1_4
{
	{
		map $lightmap 
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/base_wall/shinygrate1_4.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/base_wall/steed1gf
{
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/steed1gf.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/symbol_bluelt1
{
	q3map_lightimage textures/base_wall/symbol_bluelt1_mask.tga
	q3map_surfacelight 100
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_wall/symbol_bluelt1.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_wall/symbol_bluelt1_mask.tga
		blendfunc add
		rgbGen wave sawtooth 0.2 0.05 0 7 
	}
}

textures/base_wall/train1
{
	{
		map textures/base_wall/chrome_env.tga
		rgbGen identity
		tcMod scale 0.25 0.1
		tcGen environment 
	}
	{
		map textures/base_wall/train1.tga
		blendfunc gl_one_minus_src_alpha gl_src_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

