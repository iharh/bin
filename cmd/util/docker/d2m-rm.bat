@echo off
setlocal
call vars-d2m.bat
%DM_ROOT%\docker-machine -s %DM_VBOX_ROOT% rm %D2M_NAME%
endlocal
