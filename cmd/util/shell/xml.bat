@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\Shell\xmlstarlet-1.5.0\xml.exe %*
endlocal
