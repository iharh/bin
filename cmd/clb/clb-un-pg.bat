@echo off
setlocal
call vars-clb-cur.bat

call _print-choice-q.bat Uninstall CLB and Drop PG DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

call clb-un-svc.bat

:: remove soft-link
rmdir %CLB_INST_ROOT%\scripts\groovy

for /r "%CLB_INST_ROOT%" %%i in (uninstall_*) do %ComSpec% /c "%%i /S"
rd /s /q "%CLB_INST_ROOT%\"
mkdir "%CLB_INST_ROOT%"

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
