# Microsoft Developer Studio Project File - Name="game" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=game - Win32 Debug TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "game.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "game.mak" CFG="game - Win32 Debug TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "game - Win32 Debug TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "game - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "game - Win32 Release Alpha" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "game - Win32 Debug Alpha" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "game - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "game - Win32 Release TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/game", CYAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "game - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /YX /Fp".\Debug_TA/game.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /YX /Fp".\Debug_TA/game.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\game.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Debug_TA\qagamex86.dll" /incremental:no /def:".\game.def" /debug /pdb:".\Debug_TA\qagamex86.pdb" /pdbtype:sept /map:".\Debug_TA\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Debug_TA/qagamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Debug_TA\qagamex86.dll" /incremental:no /def:".\game.def" /debug /pdb:".\Debug_TA\qagamex86.pdb" /pdbtype:sept /map:".\Debug_TA\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Debug_TA/qagamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "game - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /YX /Fp".\Debug/game.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /YX /Fp".\Debug/game.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\game.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Debug\qagamex86.dll" /incremental:no /def:".\game.def" /debug /pdb:".\Debug\qagamex86.pdb" /pdbtype:sept /map:".\Debug\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Debug/qagamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Debug\qagamex86.dll" /incremental:no /def:".\game.def" /debug /pdb:".\Debug\qagamex86.pdb" /pdbtype:sept /map:".\Debug\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Debug/qagamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\..\ReleaseAXP"
# PROP BASE Intermediate_Dir ".\ReleaseAXP"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\ReleaseAXP"
# PROP Intermediate_Dir ".\ReleaseAXP"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /Zd /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GF /Gy /YX /Fp".\ReleaseAXP/game.pch" /Fo".\ReleaseAXP/" /Fd".\ReleaseAXP/" /c /QA21164 /GX 
# ADD CPP /nologo /ML /Zd /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GF /Gy /YX /Fp".\ReleaseAXP/game.pch" /Fo".\ReleaseAXP/" /Fd".\ReleaseAXP/" /c /QA21164 /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\..\ReleaseAXP\game.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\..\ReleaseAXP\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\ReleaseAXP\qagameaxp.dll" /incremental:no /def:".\game.def" /pdb:".\..\ReleaseAXP\qagameaxp.pdb" /pdbtype:sept /subsystem:windows /base:"0x20000000" /implib:".\..\ReleaseAXP/qagameaxp.lib" 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\ReleaseAXP\qagameaxp.dll" /incremental:no /def:".\game.def" /pdb:".\..\ReleaseAXP\qagameaxp.pdb" /pdbtype:sept /subsystem:windows /base:"0x20000000" /implib:".\..\ReleaseAXP/qagameaxp.lib" 

!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\..\DebugAxp"
# PROP BASE Intermediate_Dir ".\DebugAxp"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\DebugAxp"
# PROP Intermediate_Dir ".\DebugAxp"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MLd /Zi /W3 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /YX /Fp".\DebugAxp/game.pch" /Fo".\DebugAxp/" /Fd".\DebugAxp/" /GZ /c /QA21164 /MTd /GX 
# ADD CPP /nologo /MLd /Zi /W3 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /YX /Fp".\DebugAxp/game.pch" /Fo".\DebugAxp/" /Fd".\DebugAxp/" /GZ /c /QA21164 /MTd /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\..\DebugAxp\game.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\..\DebugAxp\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\DebugAxp\qagameaxp.dll" /incremental:no /def:".\game.def" /debug /pdb:".\..\DebugAxp\qagameaxp.pdb" /pdbtype:sept /subsystem:windows /base:"0x20000000" /implib:".\..\DebugAxp/qagameaxp.lib" 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\DebugAxp\qagameaxp.dll" /incremental:no /def:".\game.def" /debug /pdb:".\..\DebugAxp\qagameaxp.pdb" /pdbtype:sept /subsystem:windows /base:"0x20000000" /implib:".\..\DebugAxp/qagameaxp.lib" 

!ELSEIF  "$(CFG)" == "game - Win32 Release"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GF /Gy /YX /Fp".\Release/game.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GF /Gy /YX /Fp".\Release/game.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\game.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Release\qagamex86.dll" /incremental:no /def:".\game.def" /pdb:".\Release\qagamex86.pdb" /pdbtype:sept /map:".\Release\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Release/qagamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Release\qagamex86.dll" /incremental:no /def:".\game.def" /pdb:".\Release\qagamex86.pdb" /pdbtype:sept /map:".\Release\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Release/qagamex86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GF /Gy /YX /Fp".\Release_TA/game.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GF /Gy /YX /Fp".\Release_TA/game.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\game.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\game.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Release_TA\qagamex86.dll" /incremental:no /def:".\game.def" /pdb:".\Release_TA\qagamex86.pdb" /pdbtype:sept /map:".\Release_TA\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Release_TA/qagamex86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /dll /out:"..\Release_TA\qagamex86.dll" /incremental:no /def:".\game.def" /pdb:".\Release_TA\qagamex86.pdb" /pdbtype:sept /map:".\Release_TA\qagamex86.map" /subsystem:windows /base:"0x20000000" /implib:".\Release_TA/qagamex86.lib" /machine:ix86 

!ENDIF

# Begin Target

# Name "game - Win32 Debug TA"
# Name "game - Win32 Debug"
# Name "game - Win32 Release Alpha"
# Name "game - Win32 Debug Alpha"
# Name "game - Win32 Release"
# Name "game - Win32 Release TA"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=ai_chat.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_cmd.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_dmnet.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_dmq3.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_main.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_team.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ai_vcmd.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=bg_lib.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=bg_misc.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=bg_pmove.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=bg_slidemove.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_active.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_arenas.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_bot.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_client.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_cmds.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_combat.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_items.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_main.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_mem.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_misc.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_missile.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_mover.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_session.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_spawn.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_svcmds.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_syscalls.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_target.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_team.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_trigger.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_utils.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=g_weapon.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=game.def

!IF  "$(CFG)" == "game - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=q_math.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=q_shared.c

!IF  "$(CFG)" == "game - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "MISSIONPACK" /D "QAGAME" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "BUILDING_REF_GL" /D "DEBUG" /D "GLOBALRANK" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release Alpha"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "C_ONLY" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Debug Alpha"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "C_ONLY" /GZ /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GLOBALRANK" /GX 
!ELSEIF  "$(CFG)" == "game - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "MISSIONPACK" /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=ai_chat.h
# End Source File
# Begin Source File

SOURCE=ai_cmd.h
# End Source File
# Begin Source File

SOURCE=ai_dmnet.h
# End Source File
# Begin Source File

SOURCE=ai_dmq3.h
# End Source File
# Begin Source File

SOURCE=ai_main.h
# End Source File
# Begin Source File

SOURCE=ai_team.h
# End Source File
# Begin Source File

SOURCE=ai_vcmd.h
# End Source File
# Begin Source File

SOURCE=be_aas.h
# End Source File
# Begin Source File

SOURCE=be_ai_char.h
# End Source File
# Begin Source File

SOURCE=be_ai_chat.h
# End Source File
# Begin Source File

SOURCE=be_ai_gen.h
# End Source File
# Begin Source File

SOURCE=be_ai_goal.h
# End Source File
# Begin Source File

SOURCE=be_ai_move.h
# End Source File
# Begin Source File

SOURCE=be_ai_weap.h
# End Source File
# Begin Source File

SOURCE=be_ea.h
# End Source File
# Begin Source File

SOURCE=bg_local.h
# End Source File
# Begin Source File

SOURCE=bg_public.h
# End Source File
# Begin Source File

SOURCE=botlib.h
# End Source File
# Begin Source File

SOURCE=chars.h
# End Source File
# Begin Source File

SOURCE=g_local.h
# End Source File
# Begin Source File

SOURCE=g_public.h
# End Source File
# Begin Source File

SOURCE=g_team.h
# End Source File
# Begin Source File

SOURCE=inv.h
# End Source File
# Begin Source File

SOURCE=match.h
# End Source File
# Begin Source File

SOURCE=q_shared.h
# End Source File
# Begin Source File

SOURCE=surfaceflags.h
# End Source File
# Begin Source File

SOURCE=syn.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project

