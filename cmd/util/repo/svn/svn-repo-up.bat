@echo off
setlocal
call vars-svn-repo.bat
set LOG_FILE=%REPO_ROOT%/svn_up_%val_dt%.log
for /f "delims=" %%a in (%SVN_DIRS_FILE%) do call _svn-up.bat %%a
endlocal
