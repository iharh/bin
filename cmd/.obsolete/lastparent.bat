@echo off
setlocal
:: set FULL_PATH=%~dp0
:: !!! use %% instead of %
:: for %a in ("%FULL_PATH:~0,-1%") do set "LAST_FOLDER=%~nxa"
set FULL_PATH=%CD%
for %%a in ("%FULL_PATH%") do set "LAST_FOLDER=%%~nxa"
echo %LAST_FOLDER%
endlocal
