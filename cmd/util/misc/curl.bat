@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Shell\curl\curl.exe %*
endlocal
