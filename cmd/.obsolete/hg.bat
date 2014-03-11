@echo off
setlocal

set MERCURIAL_HOME=%~dp0..\VCS\Mercurial

call vars-python27.bat 

%MERCURIAL_HOME%\hg.exe %*
endlocal
