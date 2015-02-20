@echo off
setlocal
call vars-elk.bat
call %ELK_LS_HOME%/bin/logstash.bat %*
endlocal

