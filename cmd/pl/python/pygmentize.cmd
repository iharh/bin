@echo off
setlocal
call vars-python.bat
%PYTHON_HOME%\Scripts\pygmentize.exe %*
endlocal
