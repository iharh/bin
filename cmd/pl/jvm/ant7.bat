@echo off
setlocal
call vars-java7-p.bat
call vars-ant.bat
call %ANT_HOME%/bin/ant.bat %*
endlocal
