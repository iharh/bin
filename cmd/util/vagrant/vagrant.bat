@echo off
setlocal
call vars-utils.bat
::call vars-git-p.bat
set VAGRANT_BIN=%UTILS_ROOT%\Vagrant\bin
%VAGRANT_BIN%\vagrant.exe %*
endlocal
