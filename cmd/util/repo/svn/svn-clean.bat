@echo off
setlocal
call vars-svn-p.bat
cscript.exe %~dp0svn-clean-vbs.vbs //Nologo
endlocal
