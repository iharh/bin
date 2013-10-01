@echo off
setlocal
call vars-python27.bat
%PYTHON_HOME%\Scripts\pygmentize.exe %*
endlocal
