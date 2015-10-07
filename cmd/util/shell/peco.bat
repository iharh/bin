@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\peco\peco.exe %*
endlocal
