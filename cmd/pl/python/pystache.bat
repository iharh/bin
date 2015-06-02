@echo off
setlocal
call vars-python.bat
%PYTHON_SCRIPTS%/pystache.exe %*
endlocal

