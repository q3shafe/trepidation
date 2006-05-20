# Microsoft Developer Studio Project File - Name="q3_ui" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=q3_ui - Win32 Debug TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "q3_ui.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "q3_ui.mak" CFG="q3_ui - Win32 Debug TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "q3_ui - Win32 Debug TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "q3_ui - Win32 Release TA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "q3_ui - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "q3_ui - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code/q3_ui", VFLAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp"Debug/q3_ui.pch" /Fo"Debug/" /Fd"Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp"Debug/q3_ui.pch" /Fo"Debug/" /Fd"Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\q3_ui.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\q3_ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\uix86_old.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug_TA\ui.pdb" /pdbtype:sept /map:"Debug_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:"Debug_TA/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug_TA\uix86_old.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug_TA\ui.pdb" /pdbtype:sept /map:"Debug_TA\uix86.map" /subsystem:windows /base:"0x40000000" /implib:"Debug_TA/uix86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

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
# ADD BASE CPP /nologo /MT /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/q3_ui.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD CPP /nologo /MT /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release_TA/q3_ui.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\q3_ui.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\q3_ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86_old.dll" /incremental:no /def:".\ui.def" /pdb:".\Release_TA\uix86_old.pdb" /pdbtype:sept /subsystem:windows /implib:"Release_TA/q3_ui.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release_TA\uix86_old.dll" /incremental:no /def:".\ui.def" /pdb:".\Release_TA\uix86_old.pdb" /pdbtype:sept /subsystem:windows /implib:"Release_TA/q3_ui.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

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
# ADD BASE CPP /nologo /MT /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release/q3_ui.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /MT /W3 /O2 /Ob1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /D "_MBCS" /GF /Gy /YX /Fp".\Release/q3_ui.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\q3_ui.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\q3_ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\Release\uix86.pdb" /pdbtype:sept /subsystem:windows /implib:".\Release/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Release\uix86.dll" /incremental:no /def:".\ui.def" /pdb:".\Release\uix86.pdb" /pdbtype:sept /subsystem:windows /implib:".\Release/uix86.lib" /machine:ix86 

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\q3_ui___Win32_Debug"
# PROP BASE Intermediate_Dir ".\q3_ui___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\q3_ui___Win32_Debug"
# PROP Intermediate_Dir ".\q3_ui___Win32_Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp"Debug/q3_ui.pch" /Fo"Debug/" /Fd"Debug/" /FR /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_USRDLL" /D "UI_EXPORTS" /D "_MBCS" /YX /Fp"Debug/q3_ui.pch" /Fo"Debug/" /Fd"Debug/" /FR /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\q3_ui___Win32_Debug\q3_ui.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\q3_ui___Win32_Debug\q3_ui.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" 
# ADD RSC /l 1033 /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\uix86.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:"Debug\uix86.map" /subsystem:windows /base:"0x40000000" /implib:"Debug/uix86.lib" /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib odbc32.lib odbccp32.lib /nologo /dll /out:"..\Debug\uix86.dll" /incremental:no /def:".\ui.def" /debug /pdb:"..\Debug\ui.pdb" /pdbtype:sept /map:"Debug\uix86.map" /subsystem:windows /base:"0x40000000" /implib:"Debug/uix86.lib" /machine:ix86 

!ENDIF

# Begin Target

# Name "q3_ui - Win32 Debug TA"
# Name "q3_ui - Win32 Release TA"
# Name "q3_ui - Win32 Release"
# Name "q3_ui - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\game\bg_misc.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_math.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_shared.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui.def

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_addbots.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_atoms.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_cdkey.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_cinematics.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_confirm.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_connect.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_controls2.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_credits.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_demo2.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_display.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_gameinfo.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_ingame.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_loadconfig.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_main.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_menu.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_mfield.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_mods.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_network.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_options.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_playermodel.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_players.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_playersettings.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_preferences.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_qmenu.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_removebots.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_saveconfig.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_serverinfo.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_servers2.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_setup.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_sound.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_sparena.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_specifyserver.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_splevel.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_sppostgame.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_spreset.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_spskill.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_startserver.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=..\ui\ui_syscalls.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_team.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_teamorders.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_video.c

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release"

# ADD CPP /nologo /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "Q3_UI_EXPORTS" /GX 
!ELSEIF  "$(CFG)" == "q3_ui - Win32 Debug"

# ADD CPP /nologo /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "UI_EXPORTS" /FR /GZ /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=keycodes.h

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\game\q_shared.h

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_local.h

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# Begin Source File

SOURCE=ui_public.h

!IF  "$(CFG)" == "q3_ui - Win32 Debug TA"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "q3_ui - Win32 Release TA"

# PROP Exclude_From_Build 1

!ENDIF

# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project

