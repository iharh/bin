@echo off
setlocal

call vars-java7-p.bat
call vars-jtools.bat
set GROK_HOME=%JTOOLS_HOME%/opengrok-0.11.1

%JAVA_HOME%/bin/java.exe -jar %GROK_HOME%\lib\opengrok.jar %*
endlocal

