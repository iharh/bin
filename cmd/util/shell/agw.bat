@echo off
setlocal
call vars-shell.bat
%SHELL_ROOT%\ag\ag.exe --silent --ignore tags -w %* .
:: --depth 100
endlocal
