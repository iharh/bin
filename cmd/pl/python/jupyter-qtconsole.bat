@echo off
setlocal
call vars-python.bat
%PYTHON_SCRIPTS%/jupyter-qtconsole.exe %*
endlocal

