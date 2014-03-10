@echo off
setlocal enableextensions
pushd %REPO_ROOT%\%~1.git

call vars-git-p.bat
:: set PLINK_PROTOCOL=ssh
set GIT_ASK_YESNO=false

echo ---------------------------------------------- >> %LOG_FILE%
echo %~1 >> %LOG_FILE%
echo ---------------------------------------------- >> %LOG_FILE%

for /f "delims=" %%a in ('_git-print-rev.bat') do set old_rev=%%a

call _git-fetch.bat %~1

for /f "delims=" %%a in ('_git-print-rev.bat') do set new_rev=%%a

echo. >> %LOG_FILE%
git.exe log %old_rev%..%new_rev% --name-status >> %LOG_FILE% 2>&1
echo. >> %LOG_FILE%

echo end log dumping
echo.

popd
endlocal
