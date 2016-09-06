@echo off
setlocal
call %~dp0vars-ora-cred.bat

set ORA_DIR=%~dp0
set OS_CODE=win

set FILL_FILE_NAME=%ORA_DIR%\ora_fill_%OS_CODE%.sql

call sqlplus.bat -S -L %CONNECT_STR% "@%FILL_FILE_NAME%"

endlocal

