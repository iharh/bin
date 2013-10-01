@echo off
call vars-repo.bat

set GIT_MIRROR_DIR_SUFFIX=.git
for /f "delims=" %%a in ('strlen.bat %GIT_MIRROR_DIR_SUFFIX%') do set GIT_MIRROR_DIR_SUFFIX_LEN=%%a

set GIT_REPORT_FILE=%~dp0git-repo-report.log
:: TODO: make common
set GIT_REPORT_SEP="-^>"

set GIT_DIRS_FILE=%~dp0git-repo-subdirs.log
