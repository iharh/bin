@echo off
setlocal
call vars-pg.bat
%PG_BIN%\psql.exe %*
endlocal
