@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\pt\pt.exe %*
::-p %USERPROFILE%\.agignore
endlocal
