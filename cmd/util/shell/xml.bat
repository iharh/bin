@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Shell\xmlstarlet-1.6.1\xml.exe %*
endlocal
