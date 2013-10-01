@echo off
setlocal

::set CYGWIN=nodosfilewarning

set CYGWIN_DRIVE=C:
set CYGWIN_HOME=%CYGWIN_DRIVE%\cygwin

%CYGWIN_HOME%/bin/dos2unix.exe %*

endlocal
