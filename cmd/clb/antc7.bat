@echo off
setlocal
call vars-java7.bat
call vars-antc7.bat
call antc-cmn.bat %*
endlocal
