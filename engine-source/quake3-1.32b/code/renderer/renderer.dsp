# Microsoft Developer Studio Project File - Name="renderer" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=renderer - Win32 Debug TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "renderer.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "renderer.mak" CFG="renderer - Win32 Debug TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "renderer - Win32 Debug TA" (based on "Win32 (x86) Static Library")
!MESSAGE "renderer - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "renderer - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "renderer - Win32 Release TA" (based on "Win32 (x86) Static Library")
!MESSAGE "renderer - Win32 vector" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/renderer", EJBAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug_TA"
# PROP BASE Intermediate_Dir ".\Debug_TA"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug_TA"
# PROP Intermediate_Dir ".\Debug_TA"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "_MBCS" /YX /Fp".\Debug_TA/renderer.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "_MBCS" /YX /Fp".\Debug_TA/renderer.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Debug_TA\renderer.lib" 
# ADD LIB32 /nologo /out:".\Debug_TA\renderer.lib" 

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release/renderer.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release/renderer.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Release\renderer.lib" 
# ADD LIB32 /nologo /out:".\Release\renderer.lib" 

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "_MBCS" /YX /Fp".\Debug/renderer.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "_MBCS" /YX /Fp".\Debug/renderer.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Debug\renderer.lib" 
# ADD LIB32 /nologo /out:".\Debug\renderer.lib" 

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release_TA"
# PROP BASE Intermediate_Dir ".\Release_TA"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release_TA"
# PROP Intermediate_Dir ".\Release_TA"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/renderer.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/renderer.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Release_TA\renderer.lib" 
# ADD LIB32 /nologo /out:".\Release_TA\renderer.lib" 

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\renderer___Win32_vector0"
# PROP BASE Intermediate_Dir ".\renderer___Win32_vector0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\renderer___Win32_vector0"
# PROP Intermediate_Dir ".\renderer___Win32_vector0"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\renderer___Win32_vector0/renderer.pch" /Fo".\renderer___Win32_vector0/" /Fd".\renderer___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "_MBCS" /GF /Gy /YX /Fp".\renderer___Win32_vector0/renderer.pch" /Fo".\renderer___Win32_vector0/" /Fd".\renderer___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\renderer___Win32_vector0\renderer.lib" 
# ADD LIB32 /nologo /out:".\renderer___Win32_vector0\renderer.lib" 

!ENDIF

# Begin Target

# Name "renderer - Win32 Debug TA"
# Name "renderer - Win32 Release"
# Name "renderer - Win32 Debug"
# Name "renderer - Win32 Release TA"
# Name "renderer - Win32 vector"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=ref_trin.def
# End Source File
# Begin Source File

SOURCE=tr_animation.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_backend.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_bsp.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_cmds.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_curve.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_flares.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_font.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_image.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_init.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_light.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_main.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_marks.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_mesh.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_model.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_noise.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_scene.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_shade.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_shade_calc.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_shader.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_shadows.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_sky.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_surface.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=tr_world.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\win32\win_gamma.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\win32\win_glimp.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\win32\win_qgl.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\qcommon\cm_public.h
# End Source File
# Begin Source File

SOURCE=..\win32\glw_win.h
# End Source File
# Begin Source File

SOURCE=..\game\q_shared.h
# End Source File
# Begin Source File

SOURCE=..\qcommon\qcommon.h
# End Source File
# Begin Source File

SOURCE=..\qcommon\qfiles.h
# End Source File
# Begin Source File

SOURCE=qgl.h
# End Source File
# Begin Source File

SOURCE=..\game\surfaceflags.h
# End Source File
# Begin Source File

SOURCE=tr_local.h
# End Source File
# Begin Source File

SOURCE=tr_public.h
# End Source File
# Begin Source File

SOURCE=..\cgame\tr_types.h
# End Source File
# Begin Source File

SOURCE=..\win32\win_local.h
# End Source File
# End Group
# Begin Group "jpeg"

# PROP Default_Filter ""
# Begin Group "Source Files No. 1"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\jpeg-6\jcapimin.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jccoefct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jccolor.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcdctmgr.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jchuff.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcinit.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcmainct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcmarker.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcmaster.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcomapi.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcparam.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcphuff.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcprepct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jcsample.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jctrans.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdapimin.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdapistd.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdatadst.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdatasrc.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdcoefct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdcolor.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jddctmgr.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdhuff.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdinput.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdmainct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdmarker.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdmaster.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdpostct.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdsample.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdtrans.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jerror.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jfdctflt.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jidctflt.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jmemmgr.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jmemnobs.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jutils.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files No. 1"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\jpeg-6\jchuff.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jconfig.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdct.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jdhuff.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jerror.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jinclude.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jmemsys.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jmorecfg.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jpegint.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jpeglib.h
# End Source File
# Begin Source File

SOURCE=..\jpeg-6\jversion.h
# End Source File
# End Group
# End Group
# Begin Group "FreeType2"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\ft2\ahangles.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahglobal.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahglyph.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahhint.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahmodule.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahoptim.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftcalc.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftdebug.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftextend.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftglyph.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftgrays.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftinit.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftlist.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftmm.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftnames.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftobjs.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftoutln.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftraster.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftrend1.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftsmooth.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftstream.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftsystem.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\sfdriver.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\sfobjs.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttcmap.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttdriver.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttgload.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttinterp.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttload.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttobjs.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttpload.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttpost.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttsbit.c

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Group "Include files"

# PROP Default_Filter "*.h"
# Begin Source File

SOURCE=..\ft2\ahangles.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahglobal.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahglyph.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahhint.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahloader.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahmodule.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahoptim.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ahtypes.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\autohint.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\freetype.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftbbox.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftcalc.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftconfig.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftdebug.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftdriver.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\fterrors.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftextend.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftglyph.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftimage.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftlist.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftmemory.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftmm.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftmodule.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftnames.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftobjs.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftoption.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftoutln.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftrender.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftstream.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ftsystem.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\fttypes.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\psnames.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\sfnt.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\t1errors.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\t1tables.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\t1types.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\t2errors.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\t2types.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttdriver.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\tterrors.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttgload.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttinterp.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttnameid.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttobjs.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\ttpload.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\tttables.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\tttags.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ft2\tttypes.h

!IF  "$(CFG)" == "renderer - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "renderer - Win32 vector"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# End Group
# End Group
# End Target
# End Project

