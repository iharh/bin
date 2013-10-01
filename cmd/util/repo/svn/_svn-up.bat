@echo off
setlocal enableextensions
pushd %REPO_ROOT%\%~1

call vars-svn-p.bat

set extra_svn_opts=
::--ignore-externals

echo updating ... %~1

echo ---------------------------------------------- >> %LOG_FILE%
echo %~1 >> %LOG_FILE%
echo ---------------------------------------------- >> %LOG_FILE%

for /f "delims=" %%a in ('_svn-print-rev.bat') do set old_rev=%%a
call _svn-fetch.bat %~1
for /f "delims=" %%a in ('_svn-print-rev.bat') do set new_rev=%%a



if %old_rev% == %new_rev% goto upFinish

set /A old_revision+=1
svn.exe log -v -r %old_rev%:%new_rev% >> %LOG_FILE% 2>&1
:upFinish

echo. >> %LOG_FILE%
echo. >> %LOG_FILE%

popd
endlocal
