@echo off
setlocal 

call vars-svn.bat

set CUR_DIR=%~dp0
set LOG_FILE=%CUR_DIR%\svn_clean.log

:: cscript.exe %CUR_DIR%\svn_clean_vbs.vbs //Nologo

del /F /Q %LOG_FILE% > nul 2>&1

svn.exe status --no-ignore > %LOG_FILE%

for /f "delims=" %%i in (%LOG_FILE%) do call:doProcess "%%i"
goto:eof



:doProcess

set entry=%~1

if not "%entry:~0,1%" == "?" goto:eof

set entry=%entry:~8%
:: UNIVERSAL WAY IS:
::set tmp_entry=
::for /f "tokens=* delims= " %%a in ("%entry%") do set tmp_entry=%%a
::set entry=%tmp_entry%

echo X ... %entry%

echo n | del /F %entry% 1> nul 2>&1
if %errorlevel% == 0 goto:eof

rmdir /s /q %entry%

goto:eof

endlocal
