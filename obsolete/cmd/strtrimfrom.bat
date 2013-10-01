@echo off
setlocal
set _str=%~1
for /f "delims=" %%a in ('strindexof.bat "%~1" "%~2"') do set _sepidx=%%a
echo %_sepidx%
call echo %%_str:~0,%_sepidx%%%
endlocal
