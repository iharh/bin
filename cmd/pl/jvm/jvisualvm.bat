@echo off
setlocal

call vars-java-p.bat

%JAVA_HOME%/bin/jvisualvm.exe %*

endlocal
