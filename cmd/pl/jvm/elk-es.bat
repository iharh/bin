@echo off
setlocal
call vars-elk.bat
::%JAVA_HOME%/bin/java.exe -cp %GROK_HOME%\lib\opengrok.jar org.opensolaris.opengrok.search.Search %*
call %ELK_ES_HOME%/bin/elasticsearch.bat
endlocal

