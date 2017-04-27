@echo off
setlocal
call vars-oracle.bat
call %ORACLE_HOME%\BIN\dbca.bat %*
endlocal
