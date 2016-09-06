@echo off
setlocal

set PG_DIR=%~dp0
set OS_CODE=win
set PGPASSFILE=%PG_DIR%pgpass.conf
set CONNECT_STR=-h epbygomw0024 -p 5432 -U postgres -d postgres

set FILL_FILE_NAME=%PG_DIR%\pg_fill_%OS_CODE%.sql

call psql.bat %CONNECT_STR% -f %FILL_FILE_NAME% -a -e

endlocal

