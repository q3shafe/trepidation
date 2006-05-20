# Microsoft Developer Studio Project File - Name="cgame" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=cgame - Win32 Release TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "cgame.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cgame.mak" CFG="cgame - Win32 Release TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cgame - Win32 Release TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "cgame - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "cgame - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "cgame - Win32 Debug TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/cgame", NPAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "cgame - Win32 Release TA"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GF /Gy /YX /Fp".\Release_TA/cgame.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GF /Gy /YX /Fp".\Release_TA/cgame.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\cgame.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\cgame.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\cgamex86.dll" /incremental:no /def:".\cgame.def" /pdb:".\Release_TA\cgamex86.pdb" /pdbtype:sept /map:".\Release_TA\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Release_TA/cgamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\cgamex86.dll" /incremental:no /def:".\cgame.def" /pdb:".\Release_TA\cgamex86.pdb" /pdbtype:sept /map:".\Release_TA\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Release_TA/cgamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug/cgame.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug/cgame.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\cgame.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\cgame.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\cgamex86.dll" /incremental:no /def:".\cgame.def" /debug /pdb:".\Debug\cgamex86.pdb" /pdbtype:sept /map:".\Debug\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Debug/cgamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\cgamex86.dll" /incremental:no /def:".\cgame.def" /debug /pdb:".\Debug\cgamex86.pdb" /pdbtype:sept /map:".\Debug\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Debug/cgamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release/cgame.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release/cgame.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\cgame.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\cgame.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\cgamex86.dll" /incremental:no /def:".\cgame.def" /pdb:".\Release\cgamex86.pdb" /pdbtype:sept /map:".\Release\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Release/cgamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\cgamex86.dll" /incremental:no /def:".\cgame.def" /pdb:".\Release\cgamex86.pdb" /pdbtype:sept /map:".\Release\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Release/cgamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /YX /Fp".\Debug_TA/cgame.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /YX /Fp".\Debug_TA/cgame.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\cgame.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\cgame.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\cgamex86.dll" /incremental:no /def:".\cgame.def" /debug /pdb:".\Debug_TA\cgamex86.pdb" /pdbtype:sept /map:".\Debug_TA\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Debug_TA/cgamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\cgamex86.dll" /incremental:no /def:".\cgame.def" /debug /pdb:".\Debug_TA\cgamex86.pdb" /pdbtype:sept /map:".\Debug_TA\cgamex86.map" /subsystem:windows /base:"0x30000000" /implib:".\Debug_TA/cgamex86.lib" /machine:ix86 

!ENDIF

# Begin Target

# Name "cgame - Win32 Release TA"
# Name "cgame - Win32 Debug"
# Name "cgame - Win32 Release"
# Name "cgame - Win32 Debug TA"
# Begin Group "Source Files"

# PROP Default_Filter "c"
# Begin Source File

SOURCE=..\game\bg_lib.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\bg_misc.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\bg_pmove.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\bg_slidemove.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_consolecmds.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_draw.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_drawtools.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_effects.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_ents.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_event.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_info.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_localents.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_main.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_marks.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_newDraw.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_players.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_playerstate.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_predict.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_scoreboard.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_servercmds.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_snapshot.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_syscalls.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_view.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=cg_weapons.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_math.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_shared.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ui\ui_shared.c

!IF  "$(CFG)" == "cgame - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GX 
!ELSEIF  "$(CFG)" == "cgame - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h"
# Begin Source File

SOURCE=..\game\bg_public.h
# End Source File
# Begin Source File

SOURCE=cg_local.h
# End Source File
# Begin Source File

SOURCE=cg_public.h
# End Source File
# Begin Source File

SOURCE=..\game\q_shared.h
# End Source File
# Begin Source File

SOURCE=..\game\surfaceflags.h
# End Source File
# End Group
# Begin Source File

SOURCE=cgame.def

!IF  "$(CFG)" == "cgame - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# End Target
# End Project

