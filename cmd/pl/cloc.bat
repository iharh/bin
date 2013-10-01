@echo off
setlocal
call vars-pl.bat
%PL_ROOT%\cloc\cloc-1.56.exe %*
endlocal
