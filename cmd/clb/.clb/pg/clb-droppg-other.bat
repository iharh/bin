@echo off
setlocal

set PG_DIR=%~dp0
set PGPASSFILE=%PG_DIR%pgpass.conf
set CONNECT_STR=-h epbygomw0024 -p 5432 -U postgres -d postgres

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a

::set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-drop
::mkdir %BUILD_LOG_DIR%
::set DROP_FILE_NAME=%BUILD_LOG_DIR%\...
set DROP_OTHER_FILE_NAME=%PG_DIR%\drop_pg_other.sql

call psql.bat %CONNECT_STR% -A -t -f %PG_DIR%pg_drop_detect_other.sql -o%DROP_OTHER_FILE_NAME%
call psql.bat %CONNECT_STR% -f %DROP_OTHER_FILE_NAME% -a -e

:: -a echo all input from script
:: -e echo queries and commands sent to server
:: -A unalligned table output mode
:: -t tuples only

endlocal
