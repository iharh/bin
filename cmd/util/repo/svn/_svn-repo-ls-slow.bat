@echo off
setlocal
call vars-svn-repo.bat
dir %REPO_ROOT%\svn /b /s /ad /on | findstr /e "\%SVN_MIRROR_DIR_SUFFIX%"
endlocal

