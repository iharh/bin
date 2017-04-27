@echo off
setlocal
call vars-oracle.bat
set ORACLE_UNQNAME=ihorcl
call %ORACLE_HOME%\BIN\emctl.bat %*
endlocal
