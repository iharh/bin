@echo off
setlocal

set FULL_PATH=%CD%
for %%a in ("%FULL_PATH%") do set "hub_repo_name=%%~nxa"

::echo %hub_repo_name%
::goto:eof

:: TODO: check the parents also
if exist .git goto:eof

call vars-github-p.bat
for /f "delims=" %%a in ('print-date-time.bat') do set val_dt=%%a
set git_status_flags=-uall

git.exe init

git.exe status %git_status_flags%
echo.
echo Commit this (%val_dt%) to staging?
echo q     - for quit
echo other - continue
set /P CHOICE_TYPE=Your Choice: 
if "%CHOICE_TYPE%" equ "q" goto:eof

git.exe add --all
git.exe commit -a -m "initial commit %val_dt%"

git.exe status %git_status_flags%
echo.
echo Push this (%val_dt%) to remote?
echo q     - for quit
echo other - continue
set /P CHOICE_TYPE=Your Choice: 
if "%CHOICE_TYPE%" equ "q" goto:eof

git.exe remote add origin https://github.com/%hub_user_name%/%hub_repo_name%.git
git.exe push -u origin master

endlocal
