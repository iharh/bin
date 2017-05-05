@echo off
setlocal
call vars-utils.bat
::call vars-git-p.bat
set CMAKE_BIN=%UTILS_ROOT%\cmake\bin
%CMAKE_BIN%\cmake.exe %*
endlocal
