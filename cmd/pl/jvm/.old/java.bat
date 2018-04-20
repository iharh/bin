@echo off
setlocal

call vars-java-p.bat

%JAVA_HOME%/bin/java.exe %*

endlocal
