@echo off
setlocal
call vars-python.bat
%PYTHON_HOME%\Scripts\pip.exe %*
endlocal
