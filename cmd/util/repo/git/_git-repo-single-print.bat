@echo off
setlocal
call vars-git-repo.bat

set repo_rel=%~1

pushd %REPO_ROOT%\%repo_rel%%GIT_MIRROR_DIR_SUFFIX%
for /f "delims=" %%a in ('git config --get remote.origin.url') do set _remote_orig_url=%%a
popd

echo %repo_rel% %GIT_REPORT_SEP:~1,-1% %_remote_orig_url%
endlocal
