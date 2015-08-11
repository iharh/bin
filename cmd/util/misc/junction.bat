@echo off
setlocal
call vars-utils.bat
%UTILS_ROOT%\System\SysInternals\junction\junction.exe %*
endlocal
