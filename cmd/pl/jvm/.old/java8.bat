@echo off
setlocal

call vars-java8-p.bat

%JAVA_HOME%/bin/java.exe %*

endlocal
