@echo off
setlocal
call vars-npp.bat
"%NPP_HOME%\notepad++.exe" %*
endlocal
