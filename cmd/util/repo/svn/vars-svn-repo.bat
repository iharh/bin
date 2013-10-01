@echo off
call vars-repo.bat

set SVN_MIRROR_DIR_SUFFIX=.svn
for /f "delims=" %%a in ('strlen.bat %SVN_MIRROR_DIR_SUFFIX%') do set SVN_MIRROR_DIR_SUFFIX_LEN=%%a
:: adding one because of path-separator since .svn is one-level deeper
set /a SVN_MIRROR_DIR_SUFFIX_LEN+=1

set SVN_REPORT_FILE=%~dp0svn-repo-report.log
:: TODO: make common
set SVN_REPORT_SEP="-^>"

set SVN_DIRS_FILE=%~dp0svn-repo-subdirs.log

