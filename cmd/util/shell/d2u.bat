@echo off
setlocal
call vars-shell.bat
set GNUWIN32=%SHELL_ROOT%\gnuwin32
%GNUWIN32%\bin\dos2unix %*
endlocal

