@echo off
setlocal
call vars-utils.bat
set PG_HOME=%UTILS_ROOT%\pgsql
set ARGS=--mode unattended --servicename posgresql-x64 --servicepassword PGSQL-123 --superpassword PGSQL-123 --prefix %PG_HOME% --datadir %PG_HOME%\data --serverport 5432 --disable-stackbuilder yes 
F:\data\Install\Development\Database\PostgreSQL\dist\9.1\postgresql-9.1.24-1-windows-x64.exe %ARGS%
endlocal
