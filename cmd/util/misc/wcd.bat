@echo off
setlocal
call vars-utils.bat
call vars-wcd-scan.bat
%UTILS_ROOT%\Shell\wcd\bin\wcdwin64.exe -G %~dp0.wcd %*
endlocal

%~dp0.wcd\wcdgo.bat
