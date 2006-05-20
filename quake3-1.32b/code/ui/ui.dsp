# Microsoft Developer Studio Project File - Name="ui" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=ui - Win32 vector
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "ui.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ui.mak" CFG="ui - Win32 vector"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ui - Win32 vector" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ui - Win32 Release TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ui - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ui - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ui - Win32 Debug TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/ui", AOBAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ui - Win32 vector"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\ui___Win32_vector"
# PROP BASE Intermediate_Dir ".\ui___Win32_vector"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\ui___Win32_vector"
# PROP Intermediate_Dir ".\ui___Win32_vector"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\ui___Win32_vector/ui.pch" /Fo".\ui___Win32_vector/" /Fd".\ui___Win32_vector/" /c /GX 
# ADD CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\ui___Win32_vector/ui.pch" /Fo".\ui___Win32_vector/" /Fd".\ui___Win32_vector/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\ui___Win32_vector\ui.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\ui___Win32_vector\ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\ui___Win32_vector\uix86.pdb" /pdbtype:sept /map:".\ui___Win32_vector\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\ui___Win32_vector/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\ui___Win32_vector\uix86.pdb" /pdbtype:sept /map:".\ui___Win32_vector\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\ui___Win32_vector/uix86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

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
# ADD BASE CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/ui.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/ui.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\ui.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\Release_TA\uix86.pdb" /pdbtype:sept /map:".\Release_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\Release_TA/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\Release_TA\uix86.pdb" /pdbtype:sept /map:".\Release_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\Release_TA/uix86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp".\Debug/ui.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp".\Debug/ui.pch" /Fo".\Debug/" /Fd".\Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\ui.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\uix86_new.dll" /incremental:no /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:".\Debug\uix86_new.map" /subsystem:windows /base:"0x40000000" /implib:".\Debug/uix86_new.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\uix86_new.dll" /incremental:no /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:".\Debug\uix86_new.map" /subsystem:windows /base:"0x40000000" /implib:".\Debug/uix86_new.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

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
# ADD BASE CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release/ui.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W3 /O2 /Ob1 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release/ui.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\ui.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\uix86_new.dll" /incremental:no /pdb:".\Release\uix86_new.pdb" /pdbtype:sept /map:".\Release\uix86_new.map" /subsystem:windows /base:"0x40000000" /implib:".\Release/uix86_new.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\uix86_new.dll" /incremental:no /pdb:".\Release\uix86_new.pdb" /pdbtype:sept /map:".\Release\uix86_new.map" /subsystem:windows /base:"0x40000000" /implib:".\Release/uix86_new.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /D "_MBCS" /YX /Fp".\Debug_TA/ui.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /D "_MBCS" /YX /Fp".\Debug_TA/ui.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\ui.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\uix86.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:".\Debug_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\Debug_TA/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\uix86.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:".\Debug_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:".\Debug_TA/uix86.lib" /machine:ix86 

!ENDIF

# Begin Target

# Name "ui - Win32 vector"
# Name "ui - Win32 Release TA"
# Name "ui - Win32 Debug"
# Name "ui - Win32 Release"
# Name "ui - Win32 Debug TA"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\game\bg_lib.c

!IF  "$(CFG)" == "ui - Win32 vector"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\bg_misc.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_math.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_shared.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui.def

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_atoms.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_gameinfo.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_main.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_players.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_shared.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_syscalls.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_util.c

!IF  "$(CFG)" == "ui - Win32 vector"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /D "MISSIONPACK" /FR /GZ /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\game\bg_public.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=keycodes.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\ui\menudef.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_shared.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\surfaceflags.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\cgame\tr_types.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_local.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_public.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_shared.h

!IF  "$(CFG)" == "ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "ui - Win32 Release"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project

