@echo off
setlocal
call vars-curl.bat
for /f "delims=" %%a in (%1) do %CURL_ROOT%\curl.exe -O %%a
endlocal
