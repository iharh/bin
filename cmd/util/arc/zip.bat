@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Archiver\zip\zip.exe %*
endlocal
