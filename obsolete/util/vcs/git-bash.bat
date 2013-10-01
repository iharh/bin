@echo off
setlocal

call vars-git.bat

%GIT_ROOT%\git-bash.bat %*
endlocal
