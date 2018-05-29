@echo off
setlocal
call vars-scoop.bat
%SCOOP_SHIMS%\youtube-dl.exe --no-check-certificate %*
endlocal

