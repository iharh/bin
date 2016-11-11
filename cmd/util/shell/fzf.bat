@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\fzf\fzf-0.15.6-windows_amd64.exe %*
endlocal
