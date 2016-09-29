@echo off
setlocal
call vars-chefdk.bat
call %CHEFDK_BIN%\chef-shell.bat %*
endlocal
