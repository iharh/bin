@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\NSIS\makensis.exe %*
endlocal
