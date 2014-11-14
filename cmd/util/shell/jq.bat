@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\jq\jq.exe %*
endlocal
