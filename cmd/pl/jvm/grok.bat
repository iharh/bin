@echo off
setlocal
call vars-grok.bat
%JAVA_HOME%/bin/java.exe -jar %GROK_HOME%\lib\opengrok.jar %*
endlocal

