@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\ag\ag.exe %*
endlocal
