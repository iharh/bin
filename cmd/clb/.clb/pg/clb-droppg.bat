@echo off
setlocal
call _print-choice-q.bat Delete from PostgreSQL DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

set PG_DIR=%~dp0
set OS_CODE=%1
set PGPASSFILE=%PG_DIR%pgpass.conf
set CONNECT_STR=-h epbygomw0024 -p 5432 -U postgres -d postgres

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a

set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-drop
mkdir %BUILD_LOG_DIR%

set DROP_FILE_NAME=%BUILD_LOG_DIR%\drop_pg.sql

call psql.bat %CONNECT_STR% -A -t -f %PG_DIR%pg_drop_detect_%OS_CODE%.sql -o%DROP_FILE_NAME%
call psql.bat %CONNECT_STR% -f %DROP_FILE_NAME% -a -e

:done
endlocal
