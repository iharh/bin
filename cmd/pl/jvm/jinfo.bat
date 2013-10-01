@echo off
setlocal

call vars-java-p.bat

%JAVA_HOME%/bin/jinfo.exe %*

endlocal
