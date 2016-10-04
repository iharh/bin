@echo off
setlocal
call vars-chefdk.bat
call %CHEFDK_BIN%\foodcritic.bat %*
endlocal
