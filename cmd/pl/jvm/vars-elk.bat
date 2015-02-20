@echo off
call vars-java7-p.bat
::call vars-jtools.bat
::set ELK_HOME=%JTOOLS_HOME%/ELK
call vars-bin.bat
set ELK_ROOT=%BIN_ROOT%\ELK
set ELK_ES_HOME=%ELK_ROOT%\elasticsearch-1.4.4
set ELK_LS_HOME=%ELK_ROOT%\logstash-1.4.2
set ELK_KB_HOME=%ELK_ROOT%\kibana-4.0.0-windows

