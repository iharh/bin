@echo off
setlocal enableextensions
pushd
cd %REPO_ROOT%/%~1

call vars-git-p.bat
:: set PLINK_PROTOCOL=ssh

echo ---------------------------------------------- >> %LOG_FILE%
echo %~1 >> %LOG_FILE%
echo ---------------------------------------------- >> %LOG_FILE%

echo fetching ... %~1
git fetch -v
echo. >> %LOG_FILE%
echo end fetching
git log HEAD..origin --name-status >> %LOG_FILE% 2>&1
echo. >> %LOG_FILE%
git merge origin -q >> %LOG_FILE% 2>&1
echo. >> %LOG_FILE%
echo end updating
echo.

popd
endlocal
