@echo off
setlocal
call vars-clb-cur.bat
::set ANT_HOME=%JTOOLS_HOME%/apache-ant-1.9.4
::set IDX_SRC=1
set CTAGS_SRC=1
:: ignored. need to directly call appropriate targets
::set BUILD_CONNECTORS=1
set BUILD_FXLP=1
call clb-b-cmn.bat
endlocal
