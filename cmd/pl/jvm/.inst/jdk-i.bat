@echo off
setlocal
call vars-pl.bat
set JDK_INST_DIR=F:\data\Install\Development\Java\jdk\Standard

set MAJOR_NUM=7
set UPDATE_NUM=76
set JAVA_HOME=%PL_ROOT%\java\jdk64\jdk1.%MAJOR_NUM%.0_%UPDATE_NUM%
set INST_FILE=jdk-%MAJOR_NUM%u%UPDATE_NUM%-windows-x64.exe

%JDK_INST_DIR%\%MAJOR_NUM%\%INST_FILE% /s ADDLOCAL="ToolsFeature,SourceFeature" INSTALLDIR="%JAVA_HOME%"
::TODO: extract javadocs also
endlocal

