@echo off
setlocal
call vars-clb-cmn.bat

call _print-choice-q.bat Uninstall CLB and Drop Oracle DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done
::goto doUn

call clb-un-svc.bat

:: remove soft-link
:::rmdir %CLB_INST_ROOT%\scripts\groovy

for /r "%CLB_INST_ROOT%" %%i in (uninstall_*) do %ComSpec% /c "%%i /S"
rd /s /q "%CLB_INST_ROOT%\"
mkdir "%CLB_INST_ROOT%"
::start "clb-uninstaller" /wait %CLB_INST_ROOT%\uninst.exe /S _?=%CLB_INST_ROOT%
::del %CLB_INST_ROOT%\uninst.exe

:doUn
set DROP_DIR=%~dp0.clb\ora\
set OS_CODE=win
set CONNECT_STR=system/System11@ihorcl

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a

set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-drop
mkdir %BUILD_LOG_DIR%

set DROP_FILE_NAME=%BUILD_LOG_DIR%\drop_ora.sql
set DROP_OTHER_FILE_NAME=%BUILD_LOG_DIR%\drop_ora_other.sql

call sqlplus.bat -S -L %CONNECT_STR% "@%DROP_DIR%ora_drop_detect_%OS_CODE%.sql" >%DROP_FILE_NAME%
echo exit; >>%DROP_FILE_NAME%
call sqlplus.bat -S -L %CONNECT_STR% "@%DROP_FILNAME%"

call sqlplus.bat -S -L %CONNECT_STR% "@%DROP_DIR%ora_drop_detect_other.sql" >%DROP_OTHER_FILE_NAME%
echo exit; >>%DROP_OTHER_FILE_NAME%
call sqlplus.bat -S -L %CONNECT_STR% "@%DROP_OTHER_FILE_NAME%"

:done
endlocal
