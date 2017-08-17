@echo off
setlocal
set BUILD_FXLP=1
call vars-clb-cur.bat
call gra.bat %CLB_DEFS_CMP% %*
endlocal
