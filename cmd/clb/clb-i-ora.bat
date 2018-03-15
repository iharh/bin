@echo off
setlocal
call vars-clb-cur.bat

set CLB_INSTALLER_DIST_DIR=%CLB_SRC_ROOT%\build
for /f "delims=" %%a in ('dir /B %CLB_INSTALLER_DIST_DIR%\*.exe') do set INST_FILE=%CLB_INSTALLER_DIST_DIR%\%%a
call _print-choice-q.bat Install (%INST_FILE%) and Configure ORA DB ?

set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done
::goto doConfig

xcopy /e /i %CLB_INSTALLER_DIST_DIR%\tmp %CLB_INST_ROOT%
for /r "%CLB_INST_ROOT%" %%i in (extension\*) do %ComSpec% /c "%%i /S /D=%CLB_INST_ROOT%"

:doConfig
call gradle.bat -b "D:/dev/prj/gra/kts/clb/build.gradle.kts" clbCfg
call %~dp0.clb\cfg-win\clb-i-confora.bat
call %~dp0.clb\ora\clb-fillora-win.bat

::call %~dp0clb-un-svc.bat
mklink /d %CLB_INST_ROOT%\scripts\groovy %CLB_SRC_ROOT%\cbtests\tests\groovy
:done
endlocal
