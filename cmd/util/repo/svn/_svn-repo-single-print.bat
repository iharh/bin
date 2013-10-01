@echo off
setlocal
call vars-svn-repo.bat

set URL_PREFIX=URL:
::todo: calc this, adding one for space
set URL_PREFIX_LEN=5

set repo_rel=%~1

pushd %REPO_ROOT%\%repo_rel%
for /f "delims=" %%a in ('svn info ^| findstr "^%URL_PREFIX%"') do set _remote_orig_url=%%a
call set _remote_orig_url=%%_remote_orig_url:~%URL_PREFIX_LEN%%%
popd

echo %repo_rel% %SVN_REPORT_SEP:~1,-1% %_remote_orig_url%
endlocal
