@echo off
setlocal
call vars-arc.bat
%ARC_HOME%\7-Zip\7z.exe %*
endlocal
