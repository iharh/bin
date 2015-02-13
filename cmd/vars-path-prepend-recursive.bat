@echo off
::for /d /r %1 %%i in (*) do call %~dp0vars-path-prepend.bat %%i
::for /f "delims=" %%i in ('dir /A:D /B /S %~dp0 ^| findstr /V /L .') do call %~dp0vars-path-prepend.bat %%i
for /f "delims=" %%i in ('dir /A:D /B /S %1 ^| findstr /V /L .') do call %~dp0vars-path-prepend.bat %%i
call %~dp0vars-path-prepend.bat %1
