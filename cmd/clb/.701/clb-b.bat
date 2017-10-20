@echo off
setlocal
::set CTAGS_SRC=1
set BUILD_FXLP=1
call vars-clb-701.bat

call _print-choice-q.bat Build CLB 701?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto lExit

call clb-b-fx-701.bat

:lExit
endlocal
