@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\es\es.exe %*
endlocal
