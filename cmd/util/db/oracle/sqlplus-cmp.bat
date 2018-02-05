@echo off
setlocal
call vars-oracle.bat
%ORACLE_HOME%\bin\sqlplus.exe -S -L %CONNECT_STR% %*
::-S
endlocal
