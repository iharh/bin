@echo off
call vars-pl.bat
set MIKTEX_BASE=%PL_ROOT%\TeX\miktex-portable-2_9_4757

set MIKTEX_HOME=%MIKTEX_BASE%\miktex
set MIKTEX_BINDIR=%MIKTEX_HOME%\bin

set MIKTEX_COMMONSTARTUPFILE=%MIKTEX_HOME%\config\miktexstartup.ini
set MIKTEX_USERSTARTUPFILE=%MIKTEX_HOME%\config\miktexstartup.ini
set MIKTEX_GS_LIB=%MIKTEX_BASE%\ghostscript\base;%MIKTEX_BASE%\fonts

call vars-path-append.bat %MIKTEX_BINDIR%

