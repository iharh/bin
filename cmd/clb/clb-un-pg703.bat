@echo off
setlocal
call vars-clb-633.bat

call _print-choice-q.bat Uninstall CLB and Drop PG DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

call clb-un-svc.bat

:: remove soft-link
rmdir %CLB_INST_ROOT%\scripts\groovy

start "clb-uninstaller" /wait %CLB_INST_ROOT%\uninst.exe /S _?=%CLB_INST_ROOT%
del %CLB_INST_ROOT%\uninst.exe

set DROPPG_DIR=%~dp0.clb\pg\
set OS_CODE=win
set PGPASSFILE=%DROPPG_DIR%pgpass.conf
set CONNECT_STR=-h epbygomw0024 -p 5432 -U postgres -d postgres

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a

set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-drop
mkdir %BUILD_LOG_DIR%

set DROP_FILE_NAME=%BUILD_LOG_DIR%\drop_pg.sql
set DROP_OTHER_FILE_NAME=%BUILD_LOG_DIR%\drop_pg_other.sql

call psql.bat %CONNECT_STR% -A -t -f %DROPPG_DIR%pg_drop_detect_%OS_CODE%.sql -o%DROP_FILE_NAME%
call psql.bat %CONNECT_STR% -f %DROP_FILE_NAME% -a -e

call psql.bat %CONNECT_STR% -A -t -f %DROPPG_DIR%pg_drop_detect_other.sql -o%DROP_OTHER_FILE_NAME%
call psql.bat %CONNECT_STR% -f %DROP_OTHER_FILE_NAME% -a -e

:done
endlocal
