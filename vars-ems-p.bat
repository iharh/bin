@echo off
set MSYS_ROOT=D:\msys64

rem To activate windows native symlinks uncomment next line
set MSYS=winsymlinks
::set MSYS=winsymlinks:nativestrict
rem Set debugging program for errors
rem set MSYS=error_start:%WD%../../mingw32/bin/qtcreator.exe|-debug|<process-id>
set MSYSCON=mintty.exe

::call %~dp0cmd\vars-path-prepend.bat %~dp0cmd %~dp0cmd/util
::call %~dp0cmd\util\repo\git\vars-git.bat 

::set MINGW_ROOT=%UTILS_ROOT%\Shell\MinGW
::set MSYS_ROOT=%MINGW_ROOT%\msys\1.0

::call %~dp0cmd\vars-path-prepend.bat %GIT_ROOT%\cmd

