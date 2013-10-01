@echo off
call vars-bin.bat
set REPO_ROOT=%BIN_ROOT%\Repo
for /f "delims=" %%a in ('strlen.bat "%REPO_ROOT%"') do set REPO_ROOT_PREFIX_LEN=%%a
:: trim double quotes and eat one separator
set /a REPO_ROOT_PREFIX_LEN-=1
:: D/T suffix
for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
