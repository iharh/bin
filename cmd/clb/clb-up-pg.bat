@echo off
setlocal
call vars-clb-cur.bat

set CLB_INSTALLER_DIST_DIR=%CLB_SRC_ROOT%\cmp\installer\dist
for /f "delims=" %%a in ('dir /B %CLB_INSTALLER_DIST_DIR%\*.exe') do set INST_FILE=%CLB_INSTALLER_DIST_DIR%\%%a

call _print-choice-q.bat Upgrade (%INST_FILE%) CLB and PG DB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

start "clb-installer" /wait %INST_FILE% /S /D=%CLB_INST_ROOT%

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-upgrade
mkdir %BUILD_LOG_DIR%

call %~dp0.clb\cfg-win\clb-up-confpg.bat

call %~dp0clb-un-svc.bat
:done
endlocal
