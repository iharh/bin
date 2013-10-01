@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Archiver\7-Zip\7z.exe %*
endlocal
