@echo off
setlocal
call vars-java8.bat
call vars-clb-cmn.bat
pushd %CLB_INST_ROOT%\server\bin
call startup.bat
popd
endlocal
