@echo off
setlocal
call vars-clb-cur.bat

set CLB_INSTALLER_DIST_DIR=%CLB_SRC_ROOT%\cmp\installer\dist

for /f "delims=" %%a in ('dir /B %CLB_INSTALLER_DIST_DIR%\*.exe') do set INST_FILE=%CLB_INSTALLER_DIST_DIR%\%%a

call _print-choice-q.bat Install (%INST_FILE%) and Configure Oracle DB ?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

start "clb-installer" /wait %INST_FILE% /S /D=%CLB_INST_ROOT%

call %~dp0.clb\cfg-win\clb-i-confora.bat
call %~dp0.clb\ora\clb-fillora-win.bat

call %~dp0clb-un-svc.bat
mklink /d %CLB_INST_ROOT%\scripts\groovy %CLB_SRC_ROOT%\cbtests\tests\groovy

:done
endlocal
