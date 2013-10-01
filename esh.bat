@echo off
setlocal

set PLINK_PROTOCOL=ssh
set TERM=msys

if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
  SET ComSpec=%WINDIR%\SysWOW64\cmd.exe
)

if "x%MSYSTEM%" == "x" set MSYSTEM=MINGW32
if "%1" == "MSYS" set MSYSTEM=MSYS

if NOT "x%DISPLAY%" == "x" set DISPLAY=

call %~dp0cmd\util\vars-git.bat
	
call %COMSPEC% /c %GIT_ROOT%\bin\bash --login -i

endlocal

