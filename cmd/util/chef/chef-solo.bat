@echo off
setlocal
call vars-chefdk.bat
call %CHEFDK_BIN%\chef-solo.bat %*
::echo done
endlocal
