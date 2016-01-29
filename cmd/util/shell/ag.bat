@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\ag\ag.exe -p %USERPROFILE%\.agignore %*
endlocal
