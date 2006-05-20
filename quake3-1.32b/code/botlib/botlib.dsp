# Microsoft Developer Studio Project File - Name="botlib" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=botlib - Win32 Debug TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "botlib.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "botlib.mak" CFG="botlib - Win32 Debug TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "botlib - Win32 Debug TA" (based on "Win32 (x86) Static Library")
!MESSAGE "botlib - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "botlib - Win32 vector" (based on "Win32 (x86) Static Library")
!MESSAGE "botlib - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "botlib - Win32 Release TA" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/botlib", HBAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "BOTLIB" /D "DEBUG" /D "_MBCS" /YX /Fp".\Debug_TA/botlib.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "BOTLIB" /D "DEBUG" /D "_MBCS" /YX /Fp".\Debug_TA/botlib.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Debug_TA\botlib.lib" 
# ADD LIB32 /nologo /out:".\Debug_TA\botlib.lib" 

!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release/botlib.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release/botlib.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Release\botlib.lib" 
# ADD LIB32 /nologo /out:".\Release\botlib.lib" 

!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\botlib___Win32_vector0"
# PROP BASE Intermediate_Dir ".\botlib___Win32_vector0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\botlib___Win32_vector0"
# PROP Intermediate_Dir ".\botlib___Win32_vector0"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\botlib___Win32_vector0/botlib.pch" /Fo".\botlib___Win32_vector0/" /Fd".\botlib___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\botlib___Win32_vector0/botlib.pch" /Fo".\botlib___Win32_vector0/" /Fd".\botlib___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\botlib___Win32_vector0\botlib.lib" 
# ADD LIB32 /nologo /out:".\botlib___Win32_vector0\botlib.lib" 

!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "BOTLIB" /D "DEBUG" /D "_MBCS" /YX /Fp".\Debug/botlib.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_LIB" /D "BOTLIB" /D "DEBUG" /D "_MBCS" /YX /Fp".\Debug/botlib.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Debug\botlib.lib" 
# ADD LIB32 /nologo /out:".\Debug\botlib.lib" 

!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/botlib.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_LIB" /D "BOTLIB" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/botlib.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /win32 
# ADD MTL /nologo /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /out:".\Release_TA\botlib.lib" 
# ADD LIB32 /nologo /out:".\Release_TA\botlib.lib" 

!ENDIF

# Begin Target

# Name "botlib - Win32 Debug TA"
# Name "botlib - Win32 Release"
# Name "botlib - Win32 vector"
# Name "botlib - Win32 Debug"
# Name "botlib - Win32 Release TA"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=be_aas_bspq3.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_cluster.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_debug.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_entity.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_file.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_main.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_move.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_optimize.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_reach.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_route.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_routealt.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_aas_sample.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_char.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_chat.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_gen.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_goal.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_move.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_weap.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ai_weight.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_ea.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=be_interface.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_crc.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_libvar.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_log.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_memory.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_precomp.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_script.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=l_struct.c

!IF  "$(CFG)" == "botlib - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "botlib - Win32 Release TA"

# ADD CPP /nologo /O2 /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=aasfile.h
# End Source File
# Begin Source File

SOURCE=be_aas_bsp.h
# End Source File
# Begin Source File

SOURCE=be_aas_cluster.h
# End Source File
# Begin Source File

SOURCE=be_aas_debug.h
# End Source File
# Begin Source File

SOURCE=be_aas_def.h
# End Source File
# Begin Source File

SOURCE=be_aas_entity.h
# End Source File
# Begin Source File

SOURCE=be_aas_file.h
# End Source File
# Begin Source File

SOURCE=be_aas_funcs.h
# End Source File
# Begin Source File

SOURCE=be_aas_main.h
# End Source File
# Begin Source File

SOURCE=be_aas_move.h
# End Source File
# Begin Source File

SOURCE=be_aas_optimize.h
# End Source File
# Begin Source File

SOURCE=be_aas_reach.h
# End Source File
# Begin Source File

SOURCE=be_aas_route.h
# End Source File
# Begin Source File

SOURCE=be_aas_routealt.h
# End Source File
# Begin Source File

SOURCE=be_aas_sample.h
# End Source File
# Begin Source File

SOURCE=be_ai_weight.h
# End Source File
# Begin Source File

SOURCE=be_interface.h
# End Source File
# Begin Source File

SOURCE=..\game\bg_public.h
# End Source File
# Begin Source File

SOURCE=..\qcommon\cm_public.h
# End Source File
# Begin Source File

SOURCE=..\game\g_public.h
# End Source File
# Begin Source File

SOURCE=l_crc.h
# End Source File
# Begin Source File

SOURCE=l_libvar.h
# End Source File
# Begin Source File

SOURCE=l_log.h
# End Source File
# Begin Source File

SOURCE=l_memory.h
# End Source File
# Begin Source File

SOURCE=l_precomp.h
# End Source File
# Begin Source File

SOURCE=l_script.h
# End Source File
# Begin Source File

SOURCE=l_struct.h
# End Source File
# Begin Source File

SOURCE=l_utils.h
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

SOURCE=..\server\server.h
# End Source File
# Begin Source File

SOURCE=..\game\surfaceflags.h
# End Source File
# End Group
# End Target
# End Project

