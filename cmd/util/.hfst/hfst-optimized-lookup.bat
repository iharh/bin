@echo off
setlocal
call vars-utils.bat
chcp 65001 && %UTILS_ROOT%\HFST\hfst-optimized-lookup.exe %*
endlocal
