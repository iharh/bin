@echo off
setlocal
call vars-pg.bat
:: -l logfile
%PG_BIN%\pg_ctl.exe -D %PG_DATA% stop
endlocal
