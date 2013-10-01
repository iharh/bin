@echo off
setlocal
call vars-r.bat
%R_HOME%\bin\x64\Rterm.exe %*
endlocal

