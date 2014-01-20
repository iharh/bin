@echo off
setlocal
call vars-curl.bat
%CURL_ROOT%\curl.exe %*

:: https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
::
endlocal
