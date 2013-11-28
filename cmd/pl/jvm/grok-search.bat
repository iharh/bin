@echo off
setlocal
call vars-grok.bat
%JAVA_HOME%/bin/java.exe -cp %GROK_HOME%\lib\opengrok.jar org.opensolaris.opengrok.search.Search %*
endlocal

