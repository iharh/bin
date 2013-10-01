@echo off
setlocal
call vars-svn-repo.bat

if exist %SVN_DIRS_FILE% del %SVN_DIRS_FILE%
for /f "delims=" %%a in ('_svn-repo-ls-slow.bat') do call:print-abs                  %%a >> %SVN_DIRS_FILE%

if exist %SVN_REPORT_FILE% del %SVN_REPORT_FILE%
for /f "delims=" %%a in (%SVN_DIRS_FILE%)         do call _svn-repo-single-print.bat %%a >> %SVN_REPORT_FILE%

endlocal
goto:eof

:print-abs
	set repo_abs=%~1
	call echo %%repo_abs:~%REPO_ROOT_PREFIX_LEN%,-%SVN_MIRROR_DIR_SUFFIX_LEN%%%
	goto:eof
