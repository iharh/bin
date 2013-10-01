@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\VCS\Darcs\darcs.exe %*
endlocal
