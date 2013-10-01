@echo off
setlocal

if exist .git goto:eof

if .%1==. goto:eof
set hub_repo_name=%1

call vars-github.bat
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
