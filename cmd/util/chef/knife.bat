@echo off
setlocal
call vars-chefdk.bat
call %CHEFDK_BIN%\knife.bat %*
::echo done
endlocal
