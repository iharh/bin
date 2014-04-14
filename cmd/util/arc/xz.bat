@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Archiver\xz\xz.exe %*
endlocal
