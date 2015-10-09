@echo off
setlocal
call vars-shell.bat
call vars-wcd.bat

%SHELL_ROOT%\wcd\bin\wcdwin64.exe -d D -G %~dp0.wcd %*
endlocal

%~dp0.wcd\wcdgo.bat
