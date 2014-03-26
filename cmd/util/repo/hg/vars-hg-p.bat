@echo off
call vars-utils.bat
set HG_HOME=%UTILS_ROOT%\VCS\TortoiseHg
call vars-path-prepend.bat %HG_HOME%
