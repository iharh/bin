@echo off
setlocal
call vars-chefdk-embedded.bat
call %CHEFDK_EMBEDDED_BIN%\irb.cmd %*
::echo done
endlocal
