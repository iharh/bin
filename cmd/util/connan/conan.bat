@echo off
setlocal
call vars-utils.bat
::call vars-git-p.bat
set CONAN_BIN=%UTILS_ROOT%\Conan\conan
%CONAN_BIN%\conan.exe %*
endlocal
