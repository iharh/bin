@echo off
setlocal

call vars-java-p.bat
call vars-maven.bat

call %M2_HOME%\bin\mvn.bat %*

:: --batch-mode, B

endlocal
