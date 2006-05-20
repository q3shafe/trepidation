# Microsoft Developer Studio Project File - Name="quake3" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=quake3 - Win32 Release TA
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "quake3.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "quake3.mak" CFG="quake3 - Win32 Release TA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "quake3 - Win32 Release TA" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 Release TA DEMO" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 Debug TA DEMO" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 vector" (based on "Win32 (x86) Application")
!MESSAGE "quake3 - Win32 Debug TA" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/MissionPack/code", CAAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release_TA/quake3.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /FR /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release_TA/quake3.pch" /Fo".\Release_TA/" /Fd".\Release_TA/" /FR /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\quake3.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release_TA\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Release_TA\quake3.exe" /incremental:no /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Release_TA\quake3.exe" /incremental:no /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=Post build processing..
PostBuild_Cmds=rem bash -c "perl .\unix\cons -- release-TA"
# End Special Build Tool

!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug/quake3.pch" /Fo".\Debug/" /Fd".\Debug/" /FR".\Debug/" /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug/quake3.pch" /Fo".\Debug/" /Fd".\Debug/" /FR".\Debug/" /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\quake3.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
# ADD RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Debug\quake3.exe" /incremental:yes /debug /pdb:".\Debug\quake3.pdb" /pdbtype:sept /map:".\Debug\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Debug\quake3.exe" /incremental:yes /debug /pdb:".\Debug\quake3.pdb" /pdbtype:sept /map:".\Debug\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=Post build processing..
PostBuild_Cmds=rem bash -c "perl .\unix\cons -- debug"
# End Special Build Tool

!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\quake3___Win32_Release_TA_DEMO"
# PROP BASE Intermediate_Dir ".\quake3___Win32_Release_TA_DEMO"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\quake3___Win32_Release_TA_DEMO"
# PROP Intermediate_Dir ".\quake3___Win32_Release_TA_DEMO"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /Zd /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "PRE_RELEASE_TADEMO" /D "PRE_RELEASE_DEMO" /GF /Gy /YX /Fp".\quake3___Win32_Release_TA_DEMO/quake3.pch" /Fo".\quake3___Win32_Release_TA_DEMO/" /Fd".\quake3___Win32_Release_TA_DEMO/" /c /GX 
# ADD CPP /nologo /ML /Zd /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "PRE_RELEASE_TADEMO" /D "PRE_RELEASE_DEMO" /GF /Gy /YX /Fp".\quake3___Win32_Release_TA_DEMO/quake3.pch" /Fo".\quake3___Win32_Release_TA_DEMO/" /Fd".\quake3___Win32_Release_TA_DEMO/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\quake3___Win32_Release_TA_DEMO\quake3.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\quake3___Win32_Release_TA_DEMO\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_Release_TA_DEMO\quake3.exe" /incremental:no /debug /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_Release_TA_DEMO\quake3.exe" /incremental:no /debug /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 

!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

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
# ADD BASE CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release/quake3.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD CPP /nologo /ML /W4 /O2 /Ob2 /G6 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\Release/quake3.pch" /Fo".\Release/" /Fd".\Release/" /c /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\quake3.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\Release\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Release\quake3.exe" /incremental:no /debug /pdb:".\Release\quake3.pdb" /pdbtype:sept /map:".\Release\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Release\quake3.exe" /incremental:no /debug /pdb:".\Release\quake3.pdb" /pdbtype:sept /map:".\Release\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 

!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\quake3___Win32_Debug_TA_DEMO"
# PROP BASE Intermediate_Dir ".\quake3___Win32_Debug_TA_DEMO"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\quake3___Win32_Debug_TA_DEMO"
# PROP Intermediate_Dir ".\quake3___Win32_Debug_TA_DEMO"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRE_RELEASE_TADEMO" /D "PRE_RELEASE_DEMO" /YX /Fp".\quake3___Win32_Debug_TA_DEMO/quake3.pch" /Fo".\quake3___Win32_Debug_TA_DEMO/" /Fd".\quake3___Win32_Debug_TA_DEMO/" /FR".\quake3___Win32_Debug_TA_DEMO/" /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "PRE_RELEASE_TADEMO" /D "PRE_RELEASE_DEMO" /YX /Fp".\quake3___Win32_Debug_TA_DEMO/quake3.pch" /Fo".\quake3___Win32_Debug_TA_DEMO/" /Fd".\quake3___Win32_Debug_TA_DEMO/" /FR".\quake3___Win32_Debug_TA_DEMO/" /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\quake3___Win32_Debug_TA_DEMO\quake3.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\quake3___Win32_Debug_TA_DEMO\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
# ADD RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_Debug_TA_DEMO\quake3.exe" /incremental:yes /debug /pdb:".\quake3___Win32_Debug_TA_DEMO\quake3.pdb" /pdbtype:sept /map:"Debug_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_Debug_TA_DEMO\quake3.exe" /incremental:yes /debug /pdb:".\quake3___Win32_Debug_TA_DEMO\quake3.pdb" /pdbtype:sept /map:"Debug_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 

!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\quake3___Win32_vector0"
# PROP BASE Intermediate_Dir ".\quake3___Win32_vector0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\quake3___Win32_vector0"
# PROP Intermediate_Dir ".\quake3___Win32_vector0"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /ML /Zi /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\quake3___Win32_vector0/quake3.pch" /Fo".\quake3___Win32_vector0/" /Fd".\quake3___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD CPP /nologo /ML /Zi /W4 /O2 /Ob2 /G6 /D "_WIN32" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /GF /Gy /YX /Fp".\quake3___Win32_vector0/quake3.pch" /Fo".\quake3___Win32_vector0/" /Fd".\quake3___Win32_vector0/" /c /vec /vec:stats /vec:pii /vec:o10 /vec:yes /GX 
# ADD BASE MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\quake3___Win32_vector0\quake3.tlb" /win32 
# ADD MTL /nologo /D"NDEBUG" /mktyplib203 /tlb".\quake3___Win32_vector0\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "NDEBUG" 
# ADD RSC /l 1033 /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_vector0\quake3.exe" /incremental:no /debug /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\quake3___Win32_vector0\quake3.exe" /incremental:no /debug /pdb:"Release_TA\quake3.pdb" /pdbtype:sept /map:"Release_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 

!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

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
# ADD BASE CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug_TA/quake3.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR".\Debug_TA/" /GZ /c /GX 
# ADD CPP /nologo /MTd /ZI /W3 /Od /G5 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fp".\Debug_TA/quake3.pch" /Fo".\Debug_TA/" /Fd".\Debug_TA/" /FR".\Debug_TA/" /GZ /c /GX 
# ADD BASE MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\quake3.tlb" /win32 
# ADD MTL /nologo /D"_DEBUG" /mktyplib203 /tlb".\Debug_TA\quake3.tlb" /win32 
# ADD BASE RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
# ADD RSC /l 1033 /d "_DEBUG" /fo"win32\winquake.res" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo 
# ADD BSC32 /nologo 
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Debug_TA\quake3.exe" /incremental:yes /debug /pdb:".\Debug_TA\quake3.pdb" /pdbtype:sept /map:"Debug_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib wsock32.lib /nologo /out:".\Debug_TA\quake3.exe" /incremental:yes /debug /pdb:".\Debug_TA\quake3.pdb" /pdbtype:sept /map:"Debug_TA\quake3.map" /subsystem:windows /stack:8388608 /machine:ix86 
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=Post build processing..
PostBuild_Cmds=rem bash -c "perl .\unix\cons -- debug-TA"
# End Special Build Tool

!ENDIF

# Begin Target

# Name "quake3 - Win32 Release TA"
# Name "quake3 - Win32 Debug"
# Name "quake3 - Win32 Release TA DEMO"
# Name "quake3 - Win32 Release"
# Name "quake3 - Win32 Debug TA DEMO"
# Name "quake3 - Win32 vector"
# Name "quake3 - Win32 Debug TA"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=client\cl_cgame.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_cin.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_console.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_input.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_keys.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_main.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_net_chan.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_parse.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_scrn.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\cl_ui.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cm_load.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cm_patch.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cm_polylib.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cm_test.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cm_trace.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cmd.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\common.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\cvar.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\files.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\huffman.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\md4.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\msg.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\net_chan.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=game\q_math.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=game\q_shared.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\snd_adpcm.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\snd_dma.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\snd_mem.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\snd_mix.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=client\snd_wavelet.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_bot.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_ccmds.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_client.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_game.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_init.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_main.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_net_chan.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_snapshot.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=server\sv_world.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\unzip.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\vm.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\vm_interpreted.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=qcommon\vm_x86.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_input.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_main.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_net.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_shared.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_snd.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_syscon.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# Begin Source File

SOURCE=win32\win_wndproc.c

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD CPP /nologo /O2 /FR /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD CPP /nologo /O2 /GX 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD CPP /nologo /Od /FR /GZ /GX 
!ENDIF

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=game\bg_public.h
# End Source File
# Begin Source File

SOURCE=cgame\cg_public.h
# End Source File
# Begin Source File

SOURCE=client\client.h
# End Source File
# Begin Source File

SOURCE=qcommon\cm_local.h
# End Source File
# Begin Source File

SOURCE=qcommon\cm_patch.h
# End Source File
# Begin Source File

SOURCE=qcommon\cm_polylib.h
# End Source File
# Begin Source File

SOURCE=qcommon\cm_public.h
# End Source File
# Begin Source File

SOURCE=game\g_public.h
# End Source File
# Begin Source File

SOURCE=ui\keycodes.h
# End Source File
# Begin Source File

SOURCE=client\keys.h
# End Source File
# Begin Source File

SOURCE=game\q_shared.h
# End Source File
# Begin Source File

SOURCE=qcommon\qcommon.h
# End Source File
# Begin Source File

SOURCE=qcommon\qfiles.h
# End Source File
# Begin Source File

SOURCE=renderer\qgl.h
# End Source File
# Begin Source File

SOURCE=win32\resource.h
# End Source File
# Begin Source File

SOURCE=server\server.h
# End Source File
# Begin Source File

SOURCE=client\snd_local.h
# End Source File
# Begin Source File

SOURCE=client\snd_public.h
# End Source File
# Begin Source File

SOURCE=game\surfaceflags.h
# End Source File
# Begin Source File

SOURCE=renderer\tr_local.h
# End Source File
# Begin Source File

SOURCE=renderer\tr_public.h
# End Source File
# Begin Source File

SOURCE=cgame\tr_types.h
# End Source File
# Begin Source File

SOURCE=ui\ui_public.h
# End Source File
# Begin Source File

SOURCE=qcommon\unzip.h
# End Source File
# Begin Source File

SOURCE=qcommon\vm_local.h
# End Source File
# Begin Source File

SOURCE=win32\win_local.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=win32\cursor2.cur
# End Source File
# Begin Source File

SOURCE=win32\cursor3.cur
# End Source File
# Begin Source File

SOURCE=win32\qe3.ico
# End Source File
# Begin Source File

SOURCE=win32\winquake.rc

!IF  "$(CFG)" == "quake3 - Win32 Release TA"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release TA DEMO"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Release"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA DEMO"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 vector"

# ADD RSC /l 1033 /i "win32" 
!ELSEIF  "$(CFG)" == "quake3 - Win32 Debug TA"

# ADD RSC /l 1033 /i "win32" 
!ENDIF

# End Source File
# End Group
# Begin Source File

SOURCE=unix\ChangeLog
# End Source File
# Begin Source File

SOURCE=unix\Conscript-pk3
# End Source File
# Begin Source File

SOURCE=Construct
# End Source File
# End Target
# End Project

