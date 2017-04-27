@echo off
setlocal
if %CLB_INST_ROOT%.==. goto lExit
:: TODO: parameterize in the future
set DB_ID=pg

set CLB_CONFIG_DIR=%CLB_INST_ROOT%\configurer
:: TODO: use REPLACE in the future
copy %~dp0\%DB_ID%CommandLineConfig.properties %CLB_CONFIG_DIR%\commandLineConfig.properties
copy %~dp0\service.properties %CLB_CONFIG_DIR%

pushd %CLB_CONFIG_DIR%
call java.bat -XX:+HeapDumpOnOutOfMemoryError -mx512m -Dfile.encoding=UTF-8 -jar configurer-cmp.jar run.xml run 0 1
::upgrade.lp=true
::upgrade.lp.mode=force

:: run_fx.bat
call java.bat -XX:+HeapDumpOnOutOfMemoryError -mx512m -Dfile.encoding=UTF-8 -jar configurer-cmp.jar run.xml run 7 1
popd
:lExit
endlocal
