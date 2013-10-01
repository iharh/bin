@echo off
setlocal
call vars-git-repo.bat

if exist %GIT_DIRS_FILE% del %GIT_DIRS_FILE%
for /f "delims=" %%a in ('_git-repo-ls-slow.bat') do call:print-abs                  %%a >> %GIT_DIRS_FILE%

if exist %GIT_REPORT_FILE% del %GIT_REPORT_FILE%
for /f "delims=" %%a in (%GIT_DIRS_FILE%)         do call _git-repo-single-print.bat %%a >> %GIT_REPORT_FILE%

endlocal
goto:eof

:print-abs
	set repo_abs=%~1
	call echo %%repo_abs:~%REPO_ROOT_PREFIX_LEN%,-%GIT_MIRROR_DIR_SUFFIX_LEN%%%
	goto:eof
