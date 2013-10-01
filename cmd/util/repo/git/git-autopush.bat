@echo off
setlocal
call vars-github-p.bat

:: if this is a real git repo?
if not exist .git goto:eof

:: are there any changes ?
for /f "delims=" %%a in ('_print-git-st-local-num.bat') do set local_num=%%a
if %local_num%.==0. goto:eof

:: are we going to commit changes?
for /f "delims=" %%a in ('print-date-time.bat') do set val_dt=%%a
set git_status_flags=-s

for /f "delims=" %%a in ('git.exe log -1 "--pretty=format:%%H"') do set old_sha=%%a
git.exe status %git_status_flags%
call _print-choice-q.bat Commit this (%val_dt%) to staging?
:: choice command seems to unable deal with <CR>
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto:eof

git.exe add --all
git.exe commit -a -m "autocommit %val_dt%"

:: are we going to push changes?
for /f "delims=" %%a in ('git.exe log -1 "--pretty=format:%%H"') do set new_sha=%%a
git.exe log %old_sha%..%new_sha% --name-status
call _print-choice-q.bat Push this (%val_dt%) to remote?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto:eof

git.exe push origin master

endlocal
