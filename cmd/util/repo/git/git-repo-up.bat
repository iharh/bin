@echo off
setlocal
call vars-git-repo.bat
set LOG_FILE=%REPO_ROOT%/git-up_%val_dt%.log
for /f "delims=" %%a in (%GIT_DIRS_FILE%) do call _git-up.bat %%a
endlocal
