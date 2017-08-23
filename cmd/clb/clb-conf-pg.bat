@echo off
setlocal
call vars-clb-cur.bat

call _print-choice-q.bat Configure PG DB ?

set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

:: inst/configurerc/onfigurer-cmp.properties
:: directory.install=D\:/clb/inst
call %~dp0.clb\cfg-win\clb-i-confpg.bat
call %~dp0.clb\pg\clb-fillpg-win.bat

::call %~dp0clb-un-svc.bat
mklink /d %CLB_INST_ROOT%\scripts\groovy %CLB_SRC_ROOT%\cbtests\tests\groovy
:done
endlocal
