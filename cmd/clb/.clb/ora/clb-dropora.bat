@echo off
setlocal
call %~dp0vars-ora-cred.bat

call _print-choice-q.bat Delete from Oracle DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

set ORA_DIR=%~dp0
set OS_CODE=%1

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set DROP_FILE_NAME=%~dp0drop_%val_dt%.sql

call sqlplus -S -L %CONNECT_STR% "@%ORA_DIR%ora_drop_detect_%OS_CODE%.sql" >%DROP_FILE_NAME%
echo exit; >>%DROP_FILE_NAME%

::del %DROP_FILE_NAME%
::call sqlplus system/System11@ihorcl "@%DROP_FILE_NAME%"

:done
endlocal

