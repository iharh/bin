@echo off
setlocal
call vars-python.bat
%PYTHON_HOME%\Scripts\easy_install.exe %*
endlocal
