@echo off
setlocal
call vars-r.bat
%R_HOME%\bin\x64\Rscript.exe %*
endlocal

