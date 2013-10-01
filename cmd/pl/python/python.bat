@echo off
setlocal
call vars-python.bat
%PYTHON_HOME%\python.exe %*
endlocal
