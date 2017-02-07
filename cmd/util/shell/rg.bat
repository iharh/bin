@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\rg\rg.exe %*
endlocal
