@echo off
setlocal
call vars-pg.bat
%PG_BIN%\pgAdmin3.exe %*
endlocal
