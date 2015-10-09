@echo off
setlocal
call vars-java8.bat
call vars-antc8.bat
call antc-cmn.bat %*
endlocal
