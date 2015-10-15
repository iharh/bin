@echo off
setlocal
call vars-d2m.bat
%DM_ROOT%\docker-machine -s %DM_VBOX_ROOT% create --driver virtualbox --virtualbox-cpu-count 2 --virtualbox-memory 12288 --virtualbox-disk-size 200000 %D2M_NAME%
::--debug
endlocal
