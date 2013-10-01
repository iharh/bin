@echo off
setlocal
call vars-git-repo.bat
dir %REPO_ROOT%\git /b /s /ad /on | findstr /e "\%GIT_MIRROR_DIR_SUFFIX%"
endlocal
