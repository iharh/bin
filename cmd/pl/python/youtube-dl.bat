@echo off
setlocal
call vars-python.bat
%PYTHON_SCRIPTS%/youtube-dl.exe --no-check-certificate %*
endlocal

