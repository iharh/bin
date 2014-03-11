@echo off
setlocal
call vars-vagrant.bat
call vars-git-p.bat
call %VAGRANT_HOME%\bin\vagrant.bat %*
endlocal

