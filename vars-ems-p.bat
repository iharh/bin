@echo off
call %~dp0cmd\vars-path-prepend.bat %~dp0cmd %~dp0cmd/util
call %~dp0cmd\util\repo\git\vars-git.bat 

set MINGW_ROOT=%UTILS_ROOT%\Shell\MinGW
set MSYS_ROOT=%MINGW_ROOT%\msys\1.0

call %~dp0cmd\vars-path-prepend.bat %GIT_ROOT%\cmd

