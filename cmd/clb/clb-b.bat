@echo off
setlocal
call vars-clb-cur.bat
::set IDX_SRC=1
set CTAGS_SRC=1
:: ignored. need to directly call appropriate targets
set BUILD_FXLP=1
::set BUILD_CONNECTORS=1
call clb-b-cmn.bat
endlocal
