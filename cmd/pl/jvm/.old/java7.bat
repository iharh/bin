@echo off
setlocal

call vars-java7-p.bat

%JAVA_HOME%/bin/java.exe %*

endlocal
