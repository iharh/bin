@echo off
setlocal
call vars-d2m.bat
%DM_ROOT%\docker-machine %*
endlocal
