@echo off
setlocal
::call vars-java8-p.bat
call vars-jtools.bat
java.exe -jar "%JTOOLS_HOME%/jd-cli/jd-cli.jar" %*
endlocal
