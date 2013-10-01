@echo off
call vars-git.bat

call vars-path-prepend.bat %GIT_ROOT%\cmd
call vars-path-prepend.bat %GIT_ROOT%\bin

