textures/common/nolightmap
{
    surfaceparm nolightmap
}

textures/common/nodrawnonsolid
{
    surfaceparm nodraw
    surfaceparm nonsolid
}

textures/common/invisible
{
    surfaceparm nolightmap
    {
        map textures/common/invisible.tga
        alphaFunc GE128
        depthWrite
        rgbGen vertex
    }
}

textures/common/teleporter
{
    q3map_lightimage textures/sfx/powerupshit.tga
    q3map_surfacelight 800
    surfaceparm noimpact
    surfaceparm nolightmap
    {
        //tcMod scale 5 5
        map textures/sfx/powerupshit.tga
        tcGen environment
        tcMod turb 0 0.015 0 0.3
    }
}

textures/common/nodrop
{
    qer_nocarve
    qer_trans 0.5
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    surfaceparm nodrop
    cull disable
}

textures/common/weapclip
{
    qer_trans 0.4
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm trans
}

textures/common/clip
{
    //surfaceparm 	nolightmap //proto_addition 11/08/99
    qer_trans 0.4
    surfaceparm nodraw
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm playerclip
}

textures/common/full_clip
{
    qer_trans 0.4
    surfaceparm nodraw
    surfaceparm playerclip
}

textures/common/missileclip
{
    //surfaceparm nonsolid
    qer_trans 0.4
    surfaceparm nodamage
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm playerclip
}

//*****************************************
//**   I've reduced the transparency on most editor-only brushes here.
//**   If the transparent textures are still too pale for
//**   things like clip, hint, trigger, etc.,
//**   Please make an editorimage to suit your needs.
//******************************************
textures/common/cushion
{
    qer_nocarve
    qer_trans 0.5
    surfaceparm nodamage
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm trans
}

textures/common/hint
{
    qer_nocarve
    qer_trans 0.3
    surfaceparm nodraw
    surfaceparm noimpact
    surfaceparm nonsolid
    surfaceparm structural
    surfaceparm trans
}

textures/common/skip
{
    qer_nocarve
    qer_trans 0.4
    surfaceparm nodraw
    surfaceparm nonsolid
    surfaceparm structural
    surfaceparm trans
}

textures/common/slick
{
    qer_trans 0.5
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm slick
    surfaceparm trans
}

textures/common/origin
{
    qer_nocarve
    surfaceparm nodraw
    surfaceparm nonsolid
    surfaceparm origin
}

textures/common/noimpact
{
    surfaceparm noimpact
}

textures/common/areaportal
{
    qer_trans 0.5
    surfaceparm areaportal
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm structural
    surfaceparm trans
}

//bot specific cluster portal
textures/common/clusterportal
{
    qer_trans 0.5
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm trans
    surfaceparm detail
    surfaceparm clusterportal
}

//bot specific "do not enter" brush
textures/common/donotenter
{
    qer_trans 0.5
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm trans
    surfaceparm detail
    surfaceparm donotenter
}

textures/common/trigger
{
    qer_nocarve
    qer_trans 0.5
    surfaceparm nodraw
}

textures/common/caulk
{
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nolightmap
}

textures/common/nodraw
{
    surfaceparm nodraw
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm trans
}

textures/common/mirror1
{
    qer_editorimage textures/common/qer_mirror.tga
    surfaceparm nolightmap
    portal
    {
        map textures/common/mirror1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
}

textures/common/mirror2
{
    qer_editorimage textures/common/qer_mirror.tga
    surfaceparm nolightmap
    portal
    {
        map textures/common/mirror1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map textures/sfx/mirror.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
    }
}

textures/common/energypad
{
    qer_editorimage textures/common/bluegoal.tga
    surfaceparm nolightmap
    cull disable
    {
        map textures/common/bluegoal.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        tcGen environment
        tcMod turb 0 0.25 0 0.05
    }
}

textures/common/portal
{
    qer_editorimage textures/common/qer_portal.tga
    surfaceparm nolightmap
    portal
    {
        //map textures/common/portal.tga
        //blendFunc GL_ONE GL_SRC_ALPHA
        map textures/common/mirror1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        tcMod turb 0 0.25 0 0.05
    }
}

textures/common/timportal
{
    qer_editorimage textures/common/qer_portal.tga
    surfaceparm nolightmap
    portal
    {
        map textures/common/portal.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        depthWrite
        tcMod turb 0 0.25 0 0.05
    }
}

//Shafe - Trepidation - Laddersupport
textures/common/ladderclip
{
    q3map_globaltexture
    qer_trans 0.4
    surfaceparm nodraw
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm playerclip
    surfaceparm ladder
}

textures/sfx/portal_sfx
{
    //*************************************************
    //*      	Portal Inside Effect 			*
    //*      	April 29				*
    //*	Please Comment Changes			*
    //*************************************************
    surfaceparm nolightmap
    deformVertexes wave 100 sin 0 2 0 0.5
    portal
    {
        //This blend function is not working on RagePro drivers Mac only
        //when it is used on top of portals
        map textures/sfx/portal_sfx3.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map textures/sfx/portal_sfx1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        tcMod rotate 360
    }
    {
        map textures/sfx/portal_sfx.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 0.5 0.2 0.5
    }
    {
        //* sin 0 .5 0 1
        map textures/sfx/portalfog.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen identityLighting
        alphaGen portal 256
        tcMod turb 0 1 0 1
        tcMod rotate 0.1
        tcMod scroll 0.01 0.03
    }
}

textures/sfx/portal2_sfx
{
    //*************************************************
    //*      	Portal Inside Effect 			*
    //*      	April 29				*
    //*	Please Comment Changes			*
    //*************************************************
    surfaceparm nolightmap
    deformVertexes wave 100 sin 0 2 0 0.5
    portal
    {
        //This blend function is not working on RagePro drivers Mac only
        //when it is used on top of portals
        map textures/sfx/portal_sfx3.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map textures/sfx/portal_sfx1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        tcMod rotate 360
    }
    {
        map textures/sfx/portal_sfx.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 0.5 0.2 0.5
    }
    {
        //alphagen portal 128
        //* sin 0 .5 0 1
        map textures/sfx/portalfog.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen identityLighting
        tcMod turb 0 1 0 1
        tcMod rotate 0.1
        tcMod scroll 0.01 0.03
    }
}

//Flame Thrower
sprites/flameball
{
    cull disable
    {
        clampmap sprites/flameball.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 931
    }
}

