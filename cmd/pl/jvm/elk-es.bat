@echo off
setlocal
call vars-elk.bat
call %ELK_ES_HOME%/bin/elasticsearch.bat %*
endlocal

