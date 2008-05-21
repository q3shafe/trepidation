//
// this file contains shaders attached models
//
models/mapobjects/console/under
{
	surfaceparm alphashadow
	cull disable
	{
		clampmap models/mapobjects/console/under.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/console/rotate
{
	cull disable
	{
		clampmap models/mapobjects/console/rotate.tga
		blendfunc add
		rgbGen Vertex
		tcMod rotate 40
	}
}

models/mapobjects/console/centercon
{
	cull disable
	{
		map models/mapobjects/console/scrolltext.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0 -0.3
	}
	{
		clampmap models/mapobjects/console/centercon.tga
		blendfunc add
		rgbGen Vertex
		tcMod stretch sin 0.9 0.1 0 0.2 
		tcMod rotate 40
	}
}

models/mapobjects/console/console
{
	cull disable
	{
		map textures/effects/tinfx2c.tga
		rgbGen Vertex
		tcGen environment 
	}
	{
		map models/mapobjects/console/console.tga
		blendfunc blend
		rgbGen Vertex
	}
	{
		map models/mapobjects/console/console2.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
	}
}

models/mapobjects/console/sphere
{
	cull disable
	{
		map models/mapobjects/console/spherex2.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
		tcMod rotate 40
		tcMod scroll 5 0.4
		tcGen environment 
	}
	{
		map models/mapobjects/console/spherex.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 -0.2 
		tcMod rotate 40
		tcMod scroll 5 0.4
		tcGen environment 
	}
}

models/mapobjects/console/sphere2
{
	cull disable
	deformVertexes autosprite
	{
		map models/mapobjects/console/sphere3.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
	}
	{
		map models/mapobjects/console/sphere4.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 -0.2 
	}
	{
		clampmap models/mapobjects/console/sphere2.tga
		rgbGen identity
		tcMod rotate 40
		alphaFunc GE128
	}
}

models/mapobjects/console/jacobs
{
	cull disable
	{
		map textures/effects/tinfxb.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
}

models/mapobjects/console/scrolltext
{
	cull disable
	{
		map models/mapobjects/console/scrolltext.tga
		blendfunc add
		rgbGen Vertex
		tcMod scroll 0 -0.3
	}
}

models/players/slash/yurikoskate
{
	cull disable
	deformVertexes autosprite
	{
		clampmap models/players/slash/yurikoskate.tga
		blendfunc blend
		rgbGen lightingDiffuse
		tcMod rotate 999
	}
	{
		clampmap models/players/slash/yurikoskate.tga
		blendfunc blend
		rgbGen lightingDiffuse
		tcMod stretch sin 0.9 0 0 0 
		tcMod rotate 20
	}
}

models/players/slash/yuriko
{
	{
		map textures/effects/envmaproc.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/slash/yuriko.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/slash/yuriko_h
{
	{
		map textures/effects/envmaproc.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/slash/yuriko_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/hunter/harpy
{
	{
		map textures/effects/envmaproc.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/hunter2.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/hunter/harpy_h
{
	{
		map textures/effects/envmaproc.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/hunter_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/hunter/harpy_f
{
	surfaceparm nodraw
}

models/mapobjects/standlamp2
{
	{
		map textures/effects/tinfx2.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/mapobjects/standlamp2.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/players/uriel/zael
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/uriel/zael.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/mapobjects/pipe/pipe02
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/mapobjects/pipe/pipe02.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/slash/grrl_h
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/slash/grrl_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/mapobjects/pipe/pipe02x
{
	q3map_lightimage textures/sfx/electricslime_old.tga
	cull disable
	q3map_surfacelight 150
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		rgbGen identity
		tcMod scale 1 2
		tcGen environment 
	}
	{
		map textures/sfx/electricslime_old.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 7.2 1
	}
}

models/mapobjects/skull/monkeyhead
{
	cull disable
	nomipmaps
	{
		map models/mapobjects/skull/monkeyhead.tga
		rgbGen Vertex
	}
	{
		map models/mapobjects/skull/monkeyheadb.tga
		blendfunc blend
		rgbGen Vertex
		alphaGen wave sin 0 1 1 0.1 
	}
}

models/mapobjects/skull/monkeyhead2
{
	surfaceparm trans
	cull disable
	nomipmaps
	{
		map models/mapobjects/skull/monkeyhead2.tga
		blendfunc blend
		rgbGen Vertex
		depthWrite
	}
}

models/powerups/armor/shard2
{
	{
		map textures/effects/tinfx2c.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/armor/shard2.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/mapobjects/jets/jet_1
{
	surfaceparm trans
	cull disable
	nomipmaps
	{
		map models/mapobjects/jets/jet_1.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.5 1
		tcMod scroll 6 0
	}
	{
		map models/mapobjects/jets/jet_2.tga
		blendfunc add
		rgbGen wave inversesawtooth -0.3 1.3 0 0.5 
		tcMod scroll 3 -0.5
	}
}

models/mapobjects/jets/jet_as
{
	surfaceparm trans
	nomipmaps
	deformVertexes autosprite2
	deformVertexes wave 100 sin 0 1 0 9 
	{
		map models/mapobjects/jets/jet_as.tga
		blendfunc add
		rgbGen identity
	}
}

models/players/crash/crash_f
{
	{
		map textures/sfx/snow.tga
		rgbGen identity
		tcMod scale 0.5 0.5
		tcMod scroll 9 0.3
	}
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/crash/crash_t
{
	{
		map textures/effects/envmapblue.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/crash/crash_t.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/crash/crash
{
	{
		map textures/effects/envmapblue.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/crash/crash.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/razor/id
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/id.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/razor/h_id
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/h_id.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/mapobjects/cross/cross_skull
{
	surfaceparm alphashadow
	cull disable
	{
		map models/mapobjects/cross/cross_skull.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/cross/cross
{
	q3map_lightimage models/mapobjects/cross/cross_light.tga
	q3map_surfacelight 300
	{
		map textures/sfx/firewalla.tga
		rgbGen identity
		tcMod scale 4 4
		tcMod scroll 0.1 2
	}
	{
		map models/mapobjects/cross/cross.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/mapobjects/baph/baphomet_gold
{
	{
		map textures/sfx/firewalla.tga
		rgbGen identity
		tcMod scroll 0.1 1
	}
	{
		map models/mapobjects/baph/baphomet_gold.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/mapobjects/baph/baphomet
{
	{
		map textures/sfx/firewalla.tga
		rgbGen identity
		tcMod scroll 0.1 1
	}
	{
		map models/mapobjects/baph/baphomet.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/mapobjects/banner/q3banner04
{
	cull disable
	nomipmaps
	{
		map textures/sfx/firegorre2.tga
		tcMod scale 0.05 0.1
		tcMod turb 0 0.25 0 0.6
		tcMod scroll 0.4 0.3
	}
	{
		map textures/sfx/bolts.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
		tcMod scale 0.2 0.2
		tcMod rotate 999
		tcMod scroll 9 9
	}
	{
		map textures/sfx/firegorre2.tga
		blendfunc add
		tcMod scale 5 5
		tcMod scroll 0.09 0.04
		tcGen environment 
	}
}

models/mapobjects/banner/q3banner02
{
	cull disable
	nomipmaps
	{
		map models/mapobjects/banner/q3banner02.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
		tcMod scale 2 1
		tcMod scroll 0.33 0
	}
	{
		map models/mapobjects/banner/q3banner02.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 0.2 
		tcMod scale 3 1
		tcMod scroll -0.45 0
	}
	{
		map models/mapobjects/banner/q3banner02x.tga
		blendfunc add
		tcMod scale 4 1
		tcMod scroll 1 0
	}
}

models/mapobjects/horned/horned
{
	{
		map textures/sfx/firewalla.tga
		tcMod scroll 0.1 1
	}
	{
		map models/mapobjects/horned/horned.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/players/bones/red
{
	cull disable
	{
		map models/players/bones/red.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/bones/blue
{
	cull disable
	{
		map models/players/bones/blue.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/bones/xray
{
	cull disable
	{
		map models/players/bones/xray.tga
		blendfunc add
	}
	{
		map models/mapobjects/bitch/hologirl2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll -6 -0.2
		tcGen environment 
	}
}

models/players/bones/stiff
{
	cull disable
	{
		map models/players/bones/stiff.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/skel/skel
{
	surfaceparm alphashadow
	cull disable
	{
		map models/mapobjects/skel/skel.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/skel/xray
{
	cull disable
	deformVertexes move 0 0 0.7 sin 0 5 0 0.2 
	q3map_surfacelight 300
	{
		map models/mapobjects/skel/xray.tga
		blendfunc add
		rgbGen wave sin 1 0.8 0 0.3 
	}
	{
		map models/mapobjects/bitch/hologirl2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll -6 -0.2
		tcGen environment 
	}
}

models/mapobjects/spotlamp/spotlamp
{
	surfaceparm alphashadow
	cull disable
	{
		map models/mapobjects/spotlamp/spotlamp.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/spotlamp/beam
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	nomipmaps
	{
		map models/mapobjects/spotlamp/beam.tga
		blendfunc add
		tcMod scroll 0.3 0
	}
}

models/mapobjects/spotlamp/spotlamp_l
{
	cull disable
	q3map_surfacelight 200
	{
		map models/mapobjects/spotlamp/spotlamp_l.tga
		rgbGen identity
	}
}

models/players/grunt/stripe_h
{
	{
		map textures/sfx/electricgrade3.tga
		rgbGen identity
		tcMod scroll 0 -0.5
	}
	{
		map models/players/grunt/stripe_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/mapobjects/timlamp/timlamp
{
	surfaceparm alphashadow
	cull disable
	{
		map models/mapobjects/timlamp/timlamp.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/wallhead/lion_m
{
	{
		map models/mapobjects/wallhead/lion_m.tga
		rgbGen Vertex
	}
	{
		map textures/sfx/firewalla.tga
		blendfunc add
		tcMod scroll 0.1 1
	}
	{
		map models/mapobjects/wallhead/lion_m.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/mapobjects/grenadel/grenadelx
{
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	{
		clampmap models/mapobjects/grenadel/grenadelx.tga
		rgbGen identity
		tcMod rotate 10
		depthWrite
		alphaFunc GE128
	}
}

//models/mapobjects/baph/bapho_lamp
//{   
//   
//        {
//                map textures/sfx/specular3b.tga         
//                tcGen environment
//                tcmod scroll .1 0
//                rgbGen identity
//	}  
//        {
//		map models/mapobjects/baph/bapho_lamp.tga
//                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		rgbGen vertex
//	}
//       
//         
//}
models/mapobjects/baph/wrist
{
	surfaceparm trans
	cull disable
	nomipmaps
	{
		map models/mapobjects/baph/wrist.tga
		blendfunc add
		rgbGen identity
		tcMod scale 2 1
		tcMod scroll 3 0
	}
	{
		map models/mapobjects/baph/wrist.tga
		blendfunc add
		rgbGen identity
		tcMod scale 1 1
		tcMod scroll -5 0
	}
}

models/mapobjects/baph/bapholamp_fx
{
	surfaceparm trans
	cull disable
	nomipmaps
	deformVertexes autosprite
	{
		clampmap models/mapobjects/baph/bapholamp_fx.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 333
		tcMod stretch sin 0.9 0.1 0 7 
	}
	{
		clampmap models/mapobjects/baph/bapholamp_fx2.tga
		blendfunc add
		rgbGen identity
		tcMod rotate -301
		tcMod stretch sin 1 0.1 0 9 
	}
}

models/players/biker/cadaver
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/biker/cadaver.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/xaero/xaero
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/xaero/xaero.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/xaero/xaero_h
{
	{
		map models/players/xaero/xaero_h.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/firewalla.tga
		blendfunc add
		tcMod scroll 0.1 1
	}
	{
		map models/players/xaero/xaero_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xaero/xaero_q
{
	cull disable
	{
		map models/players/xaero/xaero_q.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/xaero/xaero_a
{
	{
		map textures/effects/envmapbfg.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map models/players/xaero/xaero_a.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/klesk/klesk_h
{
	{
		map models/players/klesk/klesk_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/klesk_g.tga
		blendfunc add
		rgbGen wave triangle 0.5 1 0 0.5 
	}
}

models/players/uriel/uriel_h
{
	{
		map models/players/uriel/uriel_h.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/proto_zzzt.tga
		blendfunc add
		rgbGen identity
		tcMod scroll -0.2 1
	}
	{
		map models/players/uriel/uriel_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/klesk/flisk
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/flisk.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/klesk/flisk_h
{
	{
		map models/players/klesk/flisk_h.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/bolts.tga
		blendfunc add
		tcMod scale 2 2
		tcMod scroll 2 2
	}
	{
		map models/players/klesk/flisk_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weaphits/bfg01
{
	cull disable
	deformVertexes autosprite
	{
		clampmap models/weaphits/bfg01.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 333
	}
	{
		clampmap models/weaphits/bfg01.tga
		blendfunc add
		rgbGen identity
		tcMod rotate -100
	}
}

models/weaphits/bfg02
{
	cull disable
	nomipmaps
	{
		map models/weaphits/bfg03.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 2 0
	}
	{
		map models/weaphits/bfg02.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 3 0
		tcMod turb 0 0.25 0 1.6
	}
}

models/flags/flagtest
{
	cull disable
	deformVertexes wave 100 sin 4 3 0 0.3 
	deformVertexes wave 30 sin 0 3 0 0.8 
	{
		map models/flags/flagtest.tga
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendfunc filter
		rgbGen identity
		tcGen environment 
	}
}

models/weapons2/grapple/grapple
{
	{
		map models/weapons2/grapple/grapple.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 0.1 0.1
		tcGen environment 
	}
	{
		map models/weapons2/grapple/grapple.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/grapple/grapple_j
{
	cull disable
	{
		map models/weapons2/grapple/grapple_j.tga
		rgbGen identity
		tcMod turb 0 0.5 0 0.7
		tcMod scroll 1 -1
		tcMod scale 0.5 0.5
	}
	{
		map textures/liquids/jello2.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.7 0.7
		tcMod turb 0 0.4 0 0.3
		tcMod scroll 0.7 -0.4
	}
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/weapons2/grapple/grapple_h
{
	cull disable
	{
		map models/weapons2/grapple/grapple_h.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/sarge/krusade
{
	{
		map textures/sfx/firegorre.tga
		rgbGen identity
		tcMod scroll 0 1
		tcMod turb 0 0.25 0 1.6
		tcMod scale 4 4
	}
	{
		map models/players/sarge/krusade.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/sarge/roderic
{
	{
		map textures/sfx/firegorre.tga
		rgbGen identity
		tcMod scroll 0 1
		tcMod turb 0 0.25 0 1.6
		tcMod scale 4 4
	}
	{
		map models/players/sarge/roderic.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/sarge/null
{
	{
		map models/players/sarge/null.tga
		blendfunc add
	}
}

models/players/uriel/null
{
	{
		map models/players/uriel/null.tga
		blendfunc add
	}
}

models/players/major/daemia
{
	{
		map textures/sfx/electricslime.tga
		rgbGen identity
		tcMod scale 3 3
		tcMod turb 0 0.5 0 0.7
		tcMod scroll 1 -1
	}
	{
		map models/players/major/daemia.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/gauntlet/gauntlet2
{
	{
		map textures/sfx/specular.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/weapons2/gauntlet/gauntlet2.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

///////////////
// begin Podium
////////////// 
models/mapobjects/podium/podium
{
	{
		map models/mapobjects/podium/podium.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.2 0.01
		tcGen environment 
	}
	{
		map models/mapobjects/podium/podium.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map models/mapobjects/podium/podiumglo.tga
		blendfunc add
		rgbGen wave sin 1 1 0 0.2 
	}
}

models/mapobjects/podium/podskull
{
	{
		map models/mapobjects/podium/podskull.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/specular.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.2 0.03
		tcGen environment 
	}
	{
		map models/mapobjects/podium/podskull.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map models/mapobjects/podium/podskullfx.tga
		blendfunc add
		rgbGen wave sin 1 1 0 0.2 
	}
}

models/mapobjects/podium/podiumfx1
{
	surfaceparm trans
	cull disable
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.35 0.3 
		tcMod scroll 2 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.35 0.3 
		tcMod scroll -1.7 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.35 0.3 
		tcMod scroll -1.1 -0.3
	}
}

models/mapobjects/podium/podiumfx2
{
	surfaceparm trans
	cull disable
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.7 0.6 
		tcMod scale 1 0.5
		tcMod scroll 0.8 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.7 0.6 
		tcMod scale 1 0.5
		tcMod scroll -1.7 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.7 0.6 
		tcMod scale 1 0.5
		tcMod scroll -1.1 -0.3
	}
}

models/mapobjects/podium/podiumfx3
{
	surfaceparm trans
	cull disable
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 1.1 0.9 
		tcMod scale 1 0.1
		tcMod scroll 1 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 1.1 0.9 
		tcMod scale 1 0.1
		tcMod scroll -1.7 -0.3
	}
	{
		map models/mapobjects/podium/podiumfx1b.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 1.1 0.9 
		tcMod scale 1 0.1
		tcMod scroll -1.1 -0.3
	}
}

///////////////
// End Podium
//////////////
//models/players/ranger/wrack
//{      
//        {
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//        	map models/players/ranger/wrack.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//          
//}
models/players/ranger/wrack
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/ranger/wrack.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/visor/gorre
{
	{
		map textures/sfx/firegorre.tga
		rgbGen identity
		tcMod scroll 0 1
		tcMod turb 0 0.25 0 1.6
		tcMod scale 4 4
	}
	{
		map models/players/visor/gorre.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/armor/newred
{
	{
		map textures/sfx/specular.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/armor/newred.tga
		blendfunc blend
		rgbGen identity
	}
}

models/powerups/armor/newyellow
{
	{
		map textures/sfx/specular.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/armor/newyellow.tga
		blendfunc blend
		rgbGen identity
	}
}

models/players/doom/phobos_f
{
	{
		map textures/effects/tinfx.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/doom/phobos_f.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/doom/phobos
{
	{
		map models/players/doom/phobos_fx.tga
		rgbGen identity
		tcMod scale 7 7
		tcMod scroll 5 -5
		tcMod rotate 360
	}
	{
		map models/players/doom/phobos.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/mapobjects/bat/bat
{
	cull disable
	deformVertexes wave 10 sin 0 3 0 3 
	deformVertexes move 500 0 0 sawtooth 0 5 0 0.1 
	deformVertexes move 0 0 7 sin 0 5 0 0.5 
	{
		map models/mapobjects/bat/bat.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/meteor
{
	deformVertexes move 0 0 10 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	{
		map models/mapobjects/meteor.tga
		rgbGen Vertex
		tcMod scale 4.9 2.234
	}
}

models/mapobjects/corpse/torso
{
	deformVertexes wave 100 sin 0 0.2 0 0.2 
	{
		map textures/liquids/proto_grueldark.tga
		tcMod scale 4 4
		tcMod scroll 0 -0.09
		tcMod turb 0 0.05 0 0.05
	}
	{
		map models/mapobjects/corpse/torso.tga
		blendfunc blend
		rgbGen Vertex
	}
}

models/mapobjects/corpse/chain
{
	cull disable
	{
		map models/mapobjects/corpse/chain.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/corpse/spine
{
	cull disable
	{
		map models/mapobjects/corpse/spine.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/corpse/intestine
{
	cull disable
	{
		map models/mapobjects/corpse/intestine.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/corpse/intestine2
{
	cull disable
	deformVertexes wave 100 sin 0 0.6 0 0.2 
	{
		map models/mapobjects/corpse/intestine2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/players/lucy/h_angel
{
	cull disable
	{
		map models/players/lucy/h_angel.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/mapobjects/bitch/hologirl2.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll -6 -0.2
		tcMod scale 1 1
		tcGen environment 
	}
}

models/players/lucy/angel
{
	cull disable
	{
		map models/players/lucy/angel.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
	{
		map models/mapobjects/bitch/hologirl2.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll -6 -0.2
		tcMod scale 1 1
		tcGen environment 
	}
}

models/mapobjects/lamps/bot_wing2
{
	cull disable
	deformVertexes move 0 0 2 sin 0 5 0 0.3 
	deformVertexes move 0.6 0.8 0 sin 0 9 0 0.1 
	deformVertexes wave 100 sin 0 0.5 0 0.5 
	{
		map models/mapobjects/lamps/bot_wing2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/lamps/bot_lamp2b
{
	cull disable
	deformVertexes move 0 0 2 sin 0 5 0 0.3 
	deformVertexes move 0.6 0.8 0 sin 0 9 0 0.1 
	{
		map models/mapobjects/lamps/bot_lamp2b.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/lamps/bot_light
{
	cull disable
	deformVertexes move 0 0 2 sin 0 5 0 0.3 
	deformVertexes move 0.6 0.8 0 sin 0 9 0 0.1 
	q3map_surfacelight 200
	{
		map models/mapobjects/lamps/bot_light.tga
		rgbGen identity
	}
}

models/mapobjects/lamps/beam
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes move 0 0 2 sin 0 5 0 0.3 
	deformVertexes move 0.6 0.8 0 sin 0 9 0 0.1 
	{
		map models/mapobjects/lamps/beam.tga
		blendfunc add
		tcMod scroll 0.3 0
	}
	{
		map models/mapobjects/lamps/beam.tga
		blendfunc add
		tcMod scroll -0.3 0
	}
}

///////////////////////////////////
/// Start of Floating Skull Bot  //
///////////////////////////////////
models/mapobjects/lamps/bot_flare
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move 0 0 3 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	{
		clampmap models/mapobjects/lamps/bot_flare.tga
		blendfunc add
		tcMod rotate 20
	}
}

models/mapobjects/lamps/bot_flare2
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes move 0 0 3 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	deformVertexes wave 100 sin 0 1 0 9 
	{
		map models/mapobjects/lamps/bot_flare2.tga
		blendfunc add
	}
}

models/mapobjects/lamps/bot_lamp
{
	deformVertexes move 0 0 3 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	{
		map models/mapobjects/lamps/bot_lamp.tga
		rgbGen Vertex
	}
}

models/mapobjects/lamps/bot_lamp2
{
	deformVertexes move 0 0 3 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	{
		map models/mapobjects/lamps/bot_lamp2.tga
		rgbGen Vertex
	}
}

models/mapobjects/lamps/bot_wing
{
	cull disable
	deformVertexes move 0 0 3 sin 0 5 0 0.1 
	deformVertexes move 2 2 0 sin 0 9 0 0.05 
	deformVertexes wave 100 sin 0 0.5 0 0.5 
	{
		map models/mapobjects/lamps/bot_wing.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/gratelamp/gratetorch
{
	cull disable
	{
		map models/mapobjects/gratelamp/gratetorch.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/gratelamp/gratetorch2b
{
	cull disable
	{
		map models/mapobjects/gratelamp/gratetorch2b.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/chain/chain3
{
	{
		map $whiteimage 
		rgbGen identity
	}
	{
		map models/mapobjects/chain/chain3.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
	{
		map models/mapobjects/chain/chain3.tga
		blendfunc filter
		rgbGen identity
	}
}

models/flags/flagbits
{
	cull disable
	{
		map models/flags/flagbits.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/flags/r_flag2
{
	cull disable
	deformVertexes wave 100 sin 4 3 0 0.3 
	deformVertexes wave 30 sin 0 3 0 0.8 
	{
		map models/flags/r_flag2.tga
		rgbGen identity
	}
	{
		map models/flags/red_fx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map models/flags/r_flag2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendfunc filter
		rgbGen identity
		tcGen environment 
	}
}

models/flags/b_flag2
{
	cull disable
	deformVertexes wave 100 sin 4 3 0 0.3 
	deformVertexes wave 30 sin 0 3 0 0.8 
	{
		map models/flags/b_flag2.tga
		rgbGen identity
	}
	{
		map models/flags/blue_fx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map models/flags/b_flag2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendfunc filter
		rgbGen identity
		tcGen environment 
	}
}

models/flags/flag_red
{
	cull disable
	deformVertexes wave 90 sin 1 5.6 1 0.4 
	deformVertexes wave 100 sin 1 2 1 0.9 
	deformVertexes wave 50 sin 1 0.5 1 1 
	{
		map models/flags/flag_red.tga
		blendfunc add
		rgbGen lightingDiffuse
		depthWrite
	}
}

models/mapobjects/bitch/hologirl
{
	cull disable
	deformVertexes move 0 0 0.7 sin 0 5 0 0.2 
	{
		map models/mapobjects/bitch/hologirl.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
	{
		map models/mapobjects/bitch/hologirl2.tga
		blendfunc add
		tcMod scroll -6 -0.2
		tcMod scale 1 1
		tcGen environment 
	}
}

models/mapobjects/bitch/bitch02
{
	cull disable
	{
		map models/mapobjects/bitch/bitch02.tga
		blendfunc add
		tcMod scroll 0 0.3
		tcGen environment 
	}
}

models/mapobjects/barrel/barrel2
{
	{
		map models/mapobjects/barrel/barrel2.tga
		rgbGen Vertex
	}
	{
		clampmap models/mapobjects/barrel/barrel2fx.tga
		blendfunc add
		tcMod rotate 403
	}
	{
		clampmap models/mapobjects/barrel/barrel2fx.tga
		blendfunc add
		tcMod rotate -100
	}
}

models/weaphits/electric
{
	cull disable
	{
		clampmap models/weaphits/electric.tga
		blendfunc add
		rgbGen wave triangle 0.8 2 0 9 
		tcMod rotate 360
	}
	{
		clampmap models/weaphits/electric.tga
		blendfunc add
		rgbGen wave triangle 1 1.4 0 9.5 
		tcMod rotate -202
	}
}

models/mapobjects/flares/electric
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	q3map_surfacelight 200
	{
		clampmap models/mapobjects/flares/electric.tga
		blendfunc add
		rgbGen wave triangle 0.8 2 0 9 
		tcMod rotate 360
	}
	{
		clampmap models/mapobjects/flares/electric.tga
		blendfunc add
		rgbGen wave triangle 1 1.4 0 9.5 
		tcMod rotate -202
	}
}

models/players/anarki/anarki_b
{
	{
		map textures/effects/envmapbfg.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
		tcGen environment 
	}
	{
		map models/players/anarki/anarki_b.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/anarki/anarki_g
{
	{
		map models/players/anarki/anarki_g.tga
	}
	{
		map models/players/anarki/anarki_g_fx.tga
		blendfunc add
		rgbGen wave triangle 0 1 0 0.5 
	}
}

models/mapobjects/wallhead/femhead
{
	cull disable
	deformVertexes wave 100 sin 0 0.7 0 0.2 
	{
		map models/mapobjects/wallhead/femhead3.tga
		rgbGen Vertex
	}
	{
		map models/mapobjects/wallhead/femhead4.tga
		blendfunc blend
		rgbGen Vertex
		alphaGen wave sin 0 1 1 0.1 
	}
}

models/mapobjects/wallhead/wallhead_eye
{
	{
		animmap 0.2 models/mapobjects/wallhead/wallhead_eye.tga models/mapobjects/wallhead/wallhead_eye2.tga 
		rgbGen Vertex
	}
}

models/mapobjects/wallhead/wallhead
{
	{
		map models/mapobjects/wallhead/wallhead.tga
		rgbGen Vertex
	}
}

//models/mapobjects/wallhead/femhead
//{
//   deformVertexes wave 100 sin 0 .7 0 .2
//   cull disable
//    
//          
//        {
//                map models/mapobjects/wallhead/femhead2.tga
//                rgbGen vertex
//        }
//        {
//                map models/mapobjects/wallhead/femhead.tga
//                Blendfunc GL_ONE GL_ONE
//                rgbGen vertex
//                rgbGen wave triangle 0 1 0 .05
//        }
// 
//}
//models/mapobjects/wallhead/tongue
//{
//	{
//		//rgbGen lightingDiffuse
//		map $whiteimage
//                rgbGen vertex
//	}
//	{
//		map models/mapobjects/wallhead/tongue.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}
models/players/mynx/mynx_shiny
{
	{
		map textures/sfx/specular5.tga
		tcGen environment 
	}
	{
		map models/players/mynx/mynx_shiny.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/razor/patriot
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/razor/patriot.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/razor/patriot_gogs
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/mapobjects/scoreboard/s_name
{
	sort additive
	cull disable
	{
		map gfx/2d/bigchars.tga
		blendfunc blend
		rgbGen identity
	}
}

models/mapobjects/scoreboard/s_score
{
	sort additive
	cull disable
	{
		map gfx/2d/bigchars.tga
		blendfunc blend
		rgbGen identity
	}
}

models/weapons2/lightning/crackle1
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/lightning/crackle1.tga models/weapons2/lightning/crackle2.tga models/weapons2/lightning/crackle3.tga models/weapons2/lightning/crackle4.tga models/weapons2/lightning/crackle5.tga models/weapons2/lightning/crackle6.tga models/weapons2/lightning/crackle7.tga models/weapons2/lightning/crackle8.tga 
		blendfunc add
	}
}

models/weapons2/lightning/button
{
	{
		map models/weapons2/lightning/button.tga
		blendfunc add
		rgbGen wave sin 1 1 0 1 
	}
}

models/weapons2/lightning/glass
{
	{
		map models/weapons2/lightning/glass.tga
	}
	{
		map textures/effects/envmapdim.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/weapons2/lightning/trail
{
	{
		map models/weapons2/lightning/trail.tga
		blendfunc add
		rgbGen wave triangle 1 2 0 7 
		tcMod scroll 3.1 1
	}
	{
		map models/weapons2/lightning/trail.tga
		blendfunc add
		rgbGen wave triangle 1 1.1 0 5.1 
		tcMod scroll -1.7 1
	}
}

models/weapons2/lightning/trail2
{
	{
		map models/weapons2/lightning/trail2.tga
		blendfunc add
		rgbGen wave triangle 1 2 0 7 
		tcMod scroll 3.1 1
	}
	{
		map models/weapons2/lightning/trail2.tga
		blendfunc add
		rgbGen wave triangle 1 1.1 0 5.1 
		tcMod scroll -1.7 1
	}
}

models/weapons2/lightning/trail1
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/lightning/trail1.tga models/weapons2/lightning/trail2.tga models/weapons2/lightning/trail3.tga models/weapons2/lightning/trail4.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/weapons2/lightning/ball1
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/lightning/ball1.tga models/weapons2/lightning/ball2.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/slamp/slamp3
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite2
	q3map_surfacelight 100
	{
		map models/mapobjects/slamp/slamp3.tga
		blendfunc add
	}
}

models/mapobjects/slamp/slamp2
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	{
		map models/mapobjects/slamp/slamp2.tga
		blendfunc add
	}
	{
		map textures/effects/envmapdimb.tga
		blendfunc add
		tcGen environment 
	}
}

models/mapobjects/lightning/white/white1
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 1 0 5 
	q3map_surfacelight 3000
	{
		animmap 15 models/mapobjects/lightning/white/white1.tga models/mapobjects/lightning/white/white2.tga models/mapobjects/lightning/white/white3.tga models/mapobjects/lightning/white/white4.tga models/mapobjects/lightning/white/white5.tga models/mapobjects/lightning/white/white6.tga models/mapobjects/lightning/white/white7.tga models/mapobjects/lightning/white/white8.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/lightning/red/red01
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 1 0 5 
	q3map_surfacelight 3000
	{
		animmap 15 models/mapobjects/lightning/red/red01.tga models/mapobjects/lightning/red/red02.tga models/mapobjects/lightning/red/red03.tga models/mapobjects/lightning/red/red04.tga models/mapobjects/lightning/red/red05.tga models/mapobjects/lightning/red/red06.tga models/mapobjects/lightning/red/red07.tga models/mapobjects/lightning/red/red08.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/lightning/yel/yel01
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 1 0 5 
	q3map_surfacelight 3000
	{
		animmap 15 models/mapobjects/lightning/yel/yel01.tga models/mapobjects/lightning/yel/yel02.tga models/mapobjects/lightning/yel/yel03.tga models/mapobjects/lightning/yel/yel04.tga models/mapobjects/lightning/yel/yel05.tga models/mapobjects/lightning/yel/yel06.tga models/mapobjects/lightning/yel/yel07.tga models/mapobjects/lightning/yel/yel08.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/lightning/blu/blu01
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 1 0 5 
	q3map_surfacelight 3000
	{
		animmap 15 models/mapobjects/lightning/blu/blu01.tga models/mapobjects/lightning/blu/blu02.tga models/mapobjects/lightning/blu/blu03.tga models/mapobjects/lightning/blu/blu04.tga models/mapobjects/lightning/blu/blu05.tga models/mapobjects/lightning/blu/blu06.tga models/mapobjects/lightning/blu/blu07.tga models/mapobjects/lightning/blu/blu08.tga 
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/pitted_rust_ps
{
	cull disable
	{
		map models/mapobjects/pitted_rust_ps.tga
		rgbGen Vertex
	}
}

models/mapobjects/signs/bioh
{
	cull disable
	{
		map models/mapobjects/signs/bioh.tga
		rgbGen Vertex
	}
}

models/mapobjects/gratelamp/gratelamp
{
	cull disable
	{
		map models/mapobjects/gratelamp/gratelamp.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/gratelamp/gratelamp_flare
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 300
	{
		map models/mapobjects/gratelamp/gratelamp_flare.tga
		blendfunc add
	}
}

models/weapons2/grenadel/ring
{
	{
		map models/weapons2/grenadel/ring.tga
	}
	{
		map textures/effects/envmapdim.tga
		blendfunc add
		tcGen environment 
	}
}

models/mapobjects/chain/chain
{
	cull disable
	{
		map models/mapobjects/chain/chain.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/chain/chain2
{
	cull disable
	deformVertexes autosprite2
	{
		map models/mapobjects/chain/chain2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/chain/chain2_end
{
	cull disable
	deformVertexes autosprite2
	{
		map models/mapobjects/chain/chain2_end.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/tree/branch
{
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 0 0.1 0 0.2 
	{
		map models/mapobjects/tree/branch.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/players/orbb/orbb_tail
{
	{
		map models/players/orbb/orbb_tail.tga
		blendfunc add
		rgbGen wave sin 0.5 0.25 0 0.5 
		tcMod scroll 0 0.5
	}
}

models/players/orbb/orbb_tail_blue
{
	{
		map models/players/orbb/orbb_tail_blue.tga
		blendfunc add
		rgbGen wave sin 0.5 0.25 0 0.5 
		tcMod scroll 0 0.5
	}
}

models/players/orbb/orbb_light
{
	{
		map models/players/orbb/orbb_light.tga
		rgbGen wave sin 1 1 0 1 
	}
}

models/players/orbb/orbb_light_blue
{
	{
		map models/players/orbb/orbb_light_blue.tga
		rgbGen wave sin 1 1 0 1 
	}
}

models/players/orbb/orbb_h2
{
	{
		map models/players/orbb/orbb_h2.tga
		rgbGen lightingDiffuse
	}
	{
		map textures/effects/tinfx.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/orbb/orbb_h2.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/orbb/red_h
{
	{
		map models/players/orbb/red_h.tga
		rgbGen lightingDiffuse
	}
	{
		clampmap textures/base_floor/techfloor2.tga
		blendfunc blend
		rgbGen lightingDiffuse
		tcMod rotate 90
		tcMod stretch sin 0.8 0.2 0 0.2 
	}
}

models/players/orbb/blue_h
{
	{
		map models/players/orbb/blue_h.tga
		rgbGen lightingDiffuse
	}
	{
		clampmap textures/base_floor/techfloor2.tga
		blendfunc blend
		rgbGen lightingDiffuse
		tcMod rotate 90
		tcMod stretch sin 0.8 0.2 0 0.2 
	}
}

models/mapobjects/teleporter/transparency2
{
	cull disable
	{
		map models/mapobjects/teleporter/transparency2.tga
		blendfunc add
		tcMod scroll 0.1 0.2
	}
}

models/flags/b_flag
{
	cull disable
	deformVertexes wave 100 sin 0 3 0 0.7 
	{
		map models/flags/b_flag.tga
	}
}

models/flags/r_flag
{
	cull disable
	deformVertexes wave 100 sin 0 3 0 0.7 
	{
		map models/flags/r_flag.tga
	}
}

models/flags/pole
{
	{
		map models/flags/skull.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/flags/skull
{
	{
		map models/flags/skull.tga
		rgbGen lightingDiffuse
	}
}

models/players/hunter/hunter_f
{
	cull disable
	deformVertexes wave 100 sin 0 0.3 0 0.2 
	{
		map models/players/hunter/hunter_f.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/hunter/red_f
{
	cull disable
	deformVertexes wave 100 sin 0 0.3 0 0.2 
	{
		map models/players/hunter/red_f.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/uriel/uriel_w
{
	deformVertexes wave 100 sin 0 0.5 0 0.2 
	{
		map models/players/uriel/uriel_w.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/uriel/red_w
{
	deformVertexes wave 100 sin 0 0.5 0 0.2 
	{
		map models/players/uriel/red_w.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/players/uriel/blue_w
{
	deformVertexes wave 100 sin 0 0.5 0 0.2 
	{
		map models/players/uriel/blue_w.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/bitch/orb
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 70
	{
		clampmap models/mapobjects/bitch/orb.tga
		blendfunc add
		tcMod rotate 30
	}
}

models/mapobjects/bitch/forearm
{
	{
		map models/mapobjects/bitch/forearm.tga
		rgbGen Vertex
	}
	{
		map models/mapobjects/bitch/forearm01.tga
		blendfunc add
		tcMod scroll 2.2 0
	}
	{
		map models/mapobjects/bitch/forearm02.tga
		blendfunc add
		tcMod scroll -1.1 0
	}
}

models/players/parkr/parkr_head
{
	{
		map textures/effects/envmap2.tga
		tcGen environment 
	}
}

models/players/parkr/parkr_chest
{
	{
		map models/players/parkr/parkr_chest.tga
	}
	{
		animmap 4 models/players/parkr/parkr_chest_red.tga models/players/parkr/parkr_chest_blu.tga 
		blendfunc add
	}
}

models/mapobjects/teleporter/energy
{
	cull disable
	{
		map models/mapobjects/teleporter/energy.tga
		blendfunc add
		rgbGen wave inversesawtooth -0.3 1.3 0 1.3 
		tcMod scroll 2.2 1.3
	}
	{
		map models/mapobjects/teleporter/energy2.tga
		blendfunc add
		rgbGen wave inversesawtooth -0.2 1.2 0 0.5 
		tcMod scroll -1 0.5
	}
	{
		map models/mapobjects/teleporter/energy3.tga
		blendfunc add
		rgbGen wave triangle 1 1 0 5.3 
		tcMod scroll 3 0
	}
}

models/mapobjects/teleporter/widget
{
	cull disable
	{
		map models/mapobjects/teleporter/widget.tga
		blendfunc add
	}
	{
		map models/mapobjects/teleporter/transparency2.tga
		blendfunc add
		tcMod scroll -0.1 -0.2
	}
}

models/mapobjects/teleporter/transparency
{
	cull disable
	{
		map models/mapobjects/teleporter/transparency.tga
		blendfunc add
	}
	{
		map models/mapobjects/teleporter/transparency2.tga
		blendfunc add
		tcMod scroll 0.1 0.2
	}
}

models/mapobjects/teleporter/teleporter_edge
{
	{
		map models/mapobjects/teleporter/teleporter_edge.tga
		rgbGen Vertex
	}
	{
		map models/mapobjects/teleporter/teleporter_edge2.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0.2 1.5 
	}
}

models/mapobjects/jesus/jesuswall
{
	cull disable
	deformVertexes wave 100 sin 0 0.2 0 0.2 
	{
		map $lightmap 
		tcGen lightmap 
	}
	{
		map models/mapobjects/jesus/jesuswall.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen Vertex
		alphaGen lightingSpecular
	}
}

models/mapobjects/hand
{
	deformVertexes wave 100 sin 0 0.3 0 0.2 
	{
		map models/mapobjects/hand.tga
		rgbGen Vertex
	}
}

models/mapobjects/corpse/corpse
{
	deformVertexes wave 100 sin 0 0.2 0 0.2 
	{
		map models/mapobjects/corpse/corpse.tga
		rgbGen Vertex
	}
}

models/mapobjects/skull/ribcage
{
	sort underwater
	cull disable
	{
		map models/mapobjects/skull/ribcage.tga
		rgbGen Vertex
		alphaFunc GE128
	}
}

//models/mapobjects/flag/banner_eg1
//{
//               cull disable
//               surfaceparm nolightmap
//	       deformVertexes wave 100 sin 0 8 0 8
//		   sort banner
//        {
//                map models/mapobjects/flag/banner_eg1.tga
//                // blendfunc gl_src_alpha gl_one_minus_src_alpha
//                alphaFunc GE128
//                rgbGen vertex
//        }
//
//
//}
models/mapobjects/flag/banner_strgg
{
	surfaceparm alphashadow
	surfaceparm nolightmap
	sort banner
	cull disable
	deformVertexes wave 100 sin 0 3 0 0.7 
	{
		map models/mapobjects/flag/banner_strgg.tga
		blendfunc blend
		rgbGen Vertex
		alphaFunc GE128
	}
}

models/mapobjects/flag/banner02
{
	surfaceparm nolightmap
	cull disable
	deformVertexes wave 100 sin 0 2 0 0.7 
	{
		map models/mapobjects/flag/banner02.tga
	}
}

models/mapobjects/weeds/weed02
{
	surfaceparm nolightmap
	sort underwater
	cull disable
	deformVertexes wave 100 sin 0 2 0 0.7 
	{
		map models/mapobjects/weeds/weed02.tga
		blendfunc blend
	}
}

models/mapobjects/weeds/weed01
{
	surfaceparm nolightmap
	sort additive
	cull disable
	deformVertexes wave 100 sin 0 2 0 0.7 
	{
		map models/mapobjects/weeds/weed01.tga
		blendfunc blend
	}
}

models/mapobjects/portal_2/portal_3_edge
{
	{
		map models/mapobjects/portal_2/portal_3_edge.tga
		rgbGen Vertex
	}
	{
		map models/mapobjects/portal_2/portal_3_edge_glo.tga
		blendfunc add
		tcMod scroll 9.7 0.5
	}
}

models/players/razor/razor_gogs
{
	{
		map models/players/razor/razor_gogs.tga
		tcGen environment 
	}
	{
		map models/players/razor/razor_gogs_fx.tga
		blendfunc add
		tcMod scroll 1.2 9.3
	}
}

models/players/slash/slashskate
{
	sort additive
	cull disable
	{
		clampmap models/players/slash/slashskate.tga
		blendfunc add
		rgbGen identity
		tcMod stretch sin 0.9 0.1 0 1.1 
	}
}

models/mapobjects/colua0/colua0_lght
{
	surfaceparm trans
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		tcGen environment 
	}
}

models/mapobjects/colua0/colua0_flare
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 1000
	{
		map models/mapobjects/colua0/colua0_flare.tga
		blendfunc add
	}
}

models/mapobjects/kmlamp_white
{
	surfaceparm trans
	{
		map textures/effects/tinfxb.tga
		blendfunc add
		tcGen environment 
	}
}

models/mapobjects/lamps/flare03
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 200
	{
		map models/mapobjects/lamps/flare03.tga
		blendfunc add
	}
}

//models/weapons2/chainsaw/f_chainsaw
//{
//	sort nearest
//	cull back
//	{
//		map	models/weapons2/chainsaw/f_chainsaw.tga
//		blendfunc GL_ONE GL_ONE_MINUS_SRC_COLOR
//
//	}
//}
models/players/sarge/cigar
{
	{
		map models/players/sarge/cigar.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/sarge/cigar.glow.tga
		blendfunc add
		rgbGen wave triangle 0.5 1 0 0.2 
	}
}

//
// powerups
//
//
// ammo
//
//models/powerups/ammo/ammo_rail1
//{
//	{
//		map models/powerups/ammo/ammo_rail1.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail1.glow.tga
//		blendfunc GL_ONE GL_ONE
//		rgbGen wave sin 0.75 0.25 0 1
//	}
//}
//models/powerups/ammo/ammo_rail2
//{
//	{
//		map models/powerups/ammo/ammo_rail2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail2.glow.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/bfgammo
{
	cull disable
	{
		map textures/effects/envmapbfg.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/ammo/bfgammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/bfgammo1
{
	{
		map textures/effects/envmapbfg.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/bfgammo2
{
	{
		map models/powerups/ammo/bfgammo2.tga
		rgbGen identity
	}
}

//models/powerups/ammo/bounammo1
//{
//	{
//		map models/powerups/ammo/bounammo1.tga
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/bounammo2
//{
//	{
//		map models/powerups/ammo/bounammo2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/bounammo2.glow.tga
//		blendfunc GL_ONE GL_ONE
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo1
//{
//	{
//		map models/powerups/ammo/flamammo1.tga
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo2
//{
//	{
//		map models/powerups/ammo/flamammo2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/flamammo2.glow.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/grenammo
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/ammo/grenammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/grenammo1
{
	{
		map textures/effects/envmapgren.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/ammo/grenade
{
	{
		map models/ammo/grenade.tga
	}
	{
		animmap 7 models/ammo/grenade_r.tga models/ammo/grenade_g.tga 
		blendfunc add
	}
}

models/powerups/ammo/grenammo2
{
	{
		map models/powerups/ammo/grenammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/lighammo
{
	{
		map textures/effects/envmapligh.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map models/powerups/ammo/lighammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/lighammo1
{
	{
		map textures/effects/envmapligh.tga
		rgbGen lightingDiffuse
		tcMod rotate 6
		tcMod scroll 0.09 0.09
		tcGen environment 
	}
}

models/powerups/ammo/lighammo2
{
	{
		map models/powerups/ammo/lighammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/machammo
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/ammo/machammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/machammo1
{
	{
		map textures/effects/envmapmach.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/plasammo1
{
	{
		map textures/effects/envmapplas.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/plasammo
{
	{
		map textures/effects/envmapplas.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map models/powerups/ammo/plasammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/plasammo2
{
	{
		map models/powerups/ammo/plasammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/railammo1
{
	{
		map textures/effects/envmaprail.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/railammo
{
	{
		map textures/effects/envmaprail.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map models/powerups/ammo/railammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/rockammo
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/ammo/rockammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/rockammo1
{
	{
		map textures/effects/envmaproc.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2.tga
		rgbGen identity
	}
}

models/powerups/ammo/shotammo
{
	{
		map textures/effects/tinfx2c.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/powerups/ammo/shotammo.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/shotammo1
{
	{
		map textures/effects/envmapgold3.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2.tga
		rgbGen identity
	}
}

//
// health
//
models/powerups/health/yellow
{
	{
		map textures/effects/envmapyel.tga
		tcGen environment 
	}
}

models/powerups/health/yellow_sphere
{
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/health/red
{
	{
		map textures/effects/envmapgold.tga
		tcGen environment 
	}
	{
		map textures/sfx/kenelectric.tga
		blendfunc add
		tcMod scale 2 2
		tcMod rotate 333
		tcMod scroll 9 9
	}
}

models/powerups/health/mega2
{
	{
		map textures/effects/envmapblue.tga
		tcGen environment 
	}
	{
		map textures/sfx/kenelectric.tga
		blendfunc add
		tcMod scale 2 2
		tcMod rotate 333
		tcMod scroll 9 9
	}
}

models/powerups/health/mega1
{
	{
		map textures/effects/envmapblue2.tga
		blendfunc add
		tcMod rotate 33
		tcMod scroll 1 1
		tcGen environment 
	}
}

models/powerups/health/red_sphere
{
	{
		map textures/effects/envmapgold2.tga
		blendfunc add
		tcMod rotate 33
		tcMod scroll 1 1
		tcGen environment 
	}
}

models/powerups/health/green
{
	{
		map textures/effects/envmaprail.tga
		tcGen environment 
	}
}

models/powerups/health/green_sphere
{
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/health/blue
{
	{
		map textures/effects/envmapbfg.tga
		tcGen environment 
	}
}

models/powerups/health/blue_sphere
{
	{
		map textures/effects/tinfx2b.tga
		blendfunc add
		tcGen environment 
	}
}

//
// mapobjects
//
models/powerups/armor/energy_red1
{
	{
		map models/powerups/armor/energy_red1.tga
		blendfunc add
		tcMod scroll 7.4 1.3
	}
}

models/powerups/armor/energy_yel1
{
	{
		map models/powerups/armor/energy_yel3.tga
		blendfunc add
		tcMod scroll 7.4 1.3
	}
}

models/powerups/armor/energy_grn1
{
	deformVertexes wave 100 sin 2 0 0 0 
	{
		map textures/effects/envmaprail.tga
		blendfunc add
		rgbGen wave triangle -0.3 1.3 0 0.3 
		tcMod rotate 30
		tcMod scroll 1 1
		tcGen environment 
	}
}

models/mapobjects/lamplight_ys
{
	{
		map models/mapobjects/lamplight_ys.tga
		blendfunc add
	}
}

models/mapobjects/pj_light
{
	cull disable
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen Vertex
		tcGen environment 
	}
	{
		map models/mapobjects/pj_light.tga
		blendfunc add
		rgbGen Vertex
	}
}

models/mapobjects/lamplight_y
{
	cull disable
	q3map_surfacelight 10000
	{
		map textures/effects/envmapmach.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
}

models/mapobjects/arenalogo
{
	deformVertexes wave 100 sin 0.25 0 0 0 
	{
		map textures/effects/quadmap.tga
		blendfunc add
		tcMod turb 0 1 0 0.2
		tcGen environment 
	}
}

//
// weapons
//
models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		map models/weapons2/machinegun/f_machinegun.tga
		blendfunc add
	}
}

models/weapons2/railgun/f_railgun2
{
	sort additive
	cull disable
	{
		map models/weapons2/railgun/f_railgun2.tga
		blendfunc add
		rgbGen entity
	}
}

models/weapons2/railgun/railgun2
{
	sort additive
	cull disable
	{
		map models/weapons2/railgun/railgun2.glow.tga
		blendfunc add
		rgbGen entity
	}
}

models/weapons2/railgun/railgun3
{
	{
		map models/weapons2/railgun/railgun3.tga
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/railgun/railgun3.glow.tga
		blendfunc add
		rgbGen entity
	}
}

models/weapons2/railgun/railgun4
{
	{
		map models/weapons2/railgun/railgun4.tga
		rgbGen entity
		tcMod scroll 0 1
	}
}

models/weapons2/shotgun/f_shotgun
{
	sort additive
	cull disable
	{
		map models/weapons2/shotgun/f_shotgun.tga
		blendfunc add
	}
}

models/weapons2/shotgun/shotgun_laser
{
	{
		map models/weapons2/shotgun/shotgun_laser.tga
		blendfunc add
	}
}

models/weapons2/bfg/f_bfg
{
	sort additive
	cull disable
	{
		clampmap models/weapons2/bfg/f_bfg.tga
		blendfunc add
		tcMod rotate 360
	}
	{
		clampmap models/weapons2/bfg/f_bfg2.tga
		blendfunc add
		tcMod rotate -129
	}
}

models/weapons2/bfg/bfg_e
{
	{
		map textures/effects/envmapbfg.tga
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.4 0.4
		tcMod scroll 0.2 -0.2
	}
	{
		map textures/effects/envmapbfg.tga
		blendfunc add
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.2 0.2
		tcMod scroll 0.3 0.6
	}
	{
		map textures/effects/tinfx.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/weapons2/bfg/bfg
{
	{
		map textures/effects/tinfx2d.tga
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.01
		tcGen environment 
	}
	{
		map models/weapons2/bfg/bfg.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/bfg/bfg_k
{
	{
		map textures/effects/envmapbfg.tga
		rgbGen identity
		tcMod rotate 30
		tcMod scroll 1 1
		tcGen environment 
	}
	{
		map models/weapons2/bfg/bfg_k.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/grenadel/f_grenadel
{
	sort additive
	cull disable
	{
		map models/weapons2/grenadel/f_grenadel.tga
		blendfunc add
	}
}

models/weapons2/lightning/f_lightning
{
	sort additive
	cull disable
	{
		map models/weapons2/lightning/f_lightning.tga
		blendfunc add
	}
}

sprites/plasma1
{
	cull disable
	{
		clampmap sprites/plasmaa.tga
		blendfunc add
		tcMod rotate 931
	}
}

models/ammo/rocket/rockfls1
{
	cull disable
	{
		map models/ammo/rocket/rockfls1.tga
		blendfunc add
	}
}

models/ammo/rocket/rockfls2
{
	cull disable
	{
		map models/ammo/rocket/rockfls2.tga
		blendfunc add
	}
}

models/ammo/rocket/rockflar
{
	cull disable
	{
		map models/ammo/rocket/rockflar.tga
		blendfunc add
	}
}

sprites/plasma2
{
	cull disable
	{
		map sprites/plasma2.tga
		blendfunc add
	}
}

models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		map models/weapons2/plasma/f_plasma.tga
		blendfunc add
	}
}

models/weapons2/flamethrower/f_flamethrower
{
	sort additive
	cull disable
	{
		map models/weapons2/flamethrower/f_flamethrower.tga
		blendfunc add
	}
}

models/weapons2/grapple/f_grapple
{
	sort additive
	cull disable
	{
		map models/weapons2/grapple/f_grapple.tga
		blendfunc add
	}
}

models/weapons2/rocketl/f_rocketl
{
	sort additive
	cull disable
	{
		map models/weapons2/rocketl/f_rocketl.tga
		blendfunc add
	}
}

models/weapons2/gauntlet/gauntlet3
{
	sort additive
	cull disable
	{
		animmap 10 models/weapons2/gauntlet/gauntlet3.tga models/weapons2/gauntlet/gauntlet4.tga 
		blendfunc add
	}
}

// this one can go away eventually
models/weapons2/rocketl/rocketl14
{
	sort additive
	cull disable
	{
		map models/weapons2/rocketl/f_rocketl.tga
		blendfunc add
	}
}

//
// players
//
models/players/tankjr/tankjr
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/tankjr/tankjr.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

//models/players/visorhead
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visorhead.tga
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}
//models/players/visor/visortorso2
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visortorso2.tga
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}
models/players/doom/f_doom
{
	{
		map models/players/doom/f_doom.tga
	}
	{
		map models/players/doom/fx_doom.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/doom/doom_f
{
	{
		map models/players/doom/doom_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/doom_fx.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/xian/xianfacf
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/medium/xian/xianfacf.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/brandon/braneye
{
	{
		map $whiteimage 
		rgbGen lightingDiffuse
	}
	{
		map models/players/light/brandon/braneye.tga
		blendfunc gl_dst_color gl_src_alpha
		rgbGen identity
		alphaGen lightingSpecular
	}
	{
		map models/players/light/brandon/braneye.glow.tga
		blendfunc add
	}
}

models/players/brandon/branhat
{
	{
		map models/players/light/brandon/branhat.tga
	}
	{
		map models/players/light/brandon/branhat.glow.tga
		blendfunc add
	}
}

//
// weapons
//
models/weapons2/plasma/plasma_glass
{
	{
		map textures/effects/tinfxb.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.02
		tcGen environment 
	}
}

models/weapons2/plasma/plasma_glo
{
	{
		map models/weapons2/plasma/plasma_glo.tga
		rgbGen identity
		tcMod rotate 33
		tcMod scroll 0.7 1
	}
	{
		map textures/effects/tinfxb.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 0.01 0.02
		tcGen environment 
	}
}

////////////////////////////
/// Lightning gun Shader ///
////////////////////////////
models/weapons2/lightning/ball
{
	deformVertexes autosprite
	{
		map models/weapons2/lightning/ball.tga
		blendfunc add
		rgbGen wave triangle 1 2 0 7 
		tcMod rotate 360
	}
	{
		map models/weapons2/lightning/ball.tga
		blendfunc add
		rgbGen wave triangle 1 5 1 3 
		tcMod rotate -200
	}
}

//
//
// instant: as seen on the powerups themselves
//
models/powerups/instant/scan
{
	{
		map models/powerups/instant/scan.tga
	}
	{
		map textures/effects/envmapdim.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/instant/quad
{
	{
		map textures/effects/envmapblue.tga
		rgbGen identity
		tcGen environment 
	}
}

models/powerups/instant/enviro
{
	{
		map textures/effects/envmapgold.tga
		rgbGen identity
		tcGen environment 
	}
}

models/powerups/instant/flight
{
	{
		map textures/effects/envmappurp.tga
		rgbGen identity
		tcGen environment 
	}
}

models/powerups/instant/haste
{
	{
		map textures/effects/envmapyel.tga
		rgbGen identity
		tcGen environment 
	}
}

models/powerups/instant/invis
{
	{
		map textures/effects/tinfx2c.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/instant/regen
{
	{
		map textures/effects/envmapred.tga
		rgbGen identity
		tcGen environment 
	}
}

//
// holdable powerups
//
models/powerups/holdable/medkit_base
{
	{
		map textures/effects/envmap.tga
		tcGen environment 
	}
}

models/powerups/holdable/medkit_sphere
{
	{
		map textures/effects/envmapdim.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/holdable/medkit_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/medkit_fluid.tga
		blendfunc add
		tcMod scroll 0 2
	}
}

models/powerups/holdable/teleport_base
{
	{
		map textures/effects/envmap.tga
		tcGen environment 
	}
}

models/powerups/holdable/teleport_sphere
{
	{
		map textures/effects/envmapdim.tga
		blendfunc add
		tcGen environment 
	}
}

models/powerups/holdable/teleport_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/teleport_fluid.tga
		blendfunc add
		tcMod scroll 0 2
	}
}

// Flame Thrower
sprites/flameball
{
	cull disable
	{
		clampmap sprites/flameball.tga
		blendfunc add
		tcMod rotate 931
	}
}

// Devastator
sprites/bfgball
{
	cull disable
	{
		clampmap sprites/bfgsprite.tga
		blendfunc gl_src_alpha gl_one
		rgbGen identityLighting
	}
}

// Turret Fire
sprites/turretfire
{
	cull disable
	{
		clampmap sprites/turretfire.tga
		blendfunc add
		tcMod rotate 931
	}
}

