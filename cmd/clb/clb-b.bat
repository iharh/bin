@echo off
setlocal
set CTAGS_SRC=1
set BUILD_FXLP=1
call vars-clb-cur.bat

call _print-choice-q.bat Build CLB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto lExit

call clb-c-fx.bat

::call clb-b-fx.bat
::call clb-b-cmp.bat

:lExit
endlocal
