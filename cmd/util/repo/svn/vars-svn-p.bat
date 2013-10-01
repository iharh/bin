@echo off
call vars-utils.bat
set SUBVERSION_HOME=%UTILS_ROOT%\VCS\TortoiseSVN
call vars-path-prepend.bat %SUBVERSION_HOME%\bin
