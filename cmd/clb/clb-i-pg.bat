@echo off
setlocal
call vars-clb-cur.bat

set CLB_INSTALLER_DIST_DIR=%CLB_SRC_ROOT%\build
for /f "delims=" %%a in ('dir /B %CLB_INSTALLER_DIST_DIR%\*.exe') do set INST_FILE=%CLB_INSTALLER_DIST_DIR%\%%a
call _print-choice-q.bat Install (%INST_FILE%) and Configure PG DB ?

set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

start "clb-installer" /wait %INST_FILE% /S /D=%CLB_INST_ROOT%

call %~dp0.clb\cfg-win\clb-i-confpg.bat
call %~dp0.clb\pg\clb-fillpg-win.bat

call %~dp0clb-un-svc.bat
mklink /d %CLB_INST_ROOT%\scripts\groovy %CLB_SRC_ROOT%\cbtests\tests\groovy
:done
endlocal
