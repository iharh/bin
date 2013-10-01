@echo off
setlocal
call vars-java-p.bat
call vars-jtools.bat
java -jar %JTOOLS_HOME%\jarscan\jarscan.jar %*
endlocal

