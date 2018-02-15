@echo off
setlocal
set CTAGS_SRC=1
::set BUILD_FXLP=1
call vars-clb-cur.bat

call _print-choice-q.bat Build (%BUILD_FXLP%) git CLB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto lExit

::call clb-c-fx.bat

if %BUILD_FXLP%.==. goto skipFXLP
::call clb-b-git-fxba.bat
call clb-b-git-fx.bat
:skipFXLP

call clb-b-cmp.bat

:lExit
endlocal
