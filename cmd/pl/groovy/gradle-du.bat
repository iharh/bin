@echo off
setlocal
call vars-gradle.bat
call %GRADLE_HOME%\bin\gradle.bat dependencyUpdates -Drevision=release %*
endlocal
