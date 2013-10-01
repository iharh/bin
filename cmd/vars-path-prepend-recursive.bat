@echo off
:: TODO: filter dots by   findstr /V /L .
for /d /r %1 %%i in (*) do call %~dp0vars-path-prepend.bat %%i
call %~dp0vars-path-prepend.bat %1
