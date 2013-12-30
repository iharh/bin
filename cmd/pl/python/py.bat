@echo off
setlocal
call vars-python33.bat
%PYTHON_HOME%\py.exe %*
endlocal
