@echo off
setlocal

if %CLB_ROOT%.==. goto lExit
echo CLB_ROOT: %CLB_ROOT%

if %CLB_SVN_SRC_ROOT%.==. goto lExit
echo CLB_SVN_SRC_ROOT: %CLB_SVN_SRC_ROOT%

if %BUILD_FXLP%.==. goto _skipFXLP
echo BUILD_FXLP: %BUILD_FXLP%
:_skipFXLP

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_FX_LOG_DIR=%CLB_ROOT%\log\%val_dt%-clean-fx
mkdir %BUILD_FX_LOG_DIR%

set BUILD_FX_LOG=%BUILD_FX_LOG_DIR%\clean-fx.txt

::
:: SVN stuff
::
pushd %CLB_SVN_SRC_ROOT%

set CLB_DEFS_FXLP="-Dbuild.fx=true" "-Dbuild.lp=true"
echo CLB_DEFS_FXLP - %CLB_DEFS_FXLP% >%BUILD_FX_LOG%

if %BUILD_FXLP%.==. goto skipFXLPClean
:: call antc-cmn.bat clean-fx clean-lp %CLB_DEFS_FXLP% >>%BUILD_FX_LOG%
call svn-clean.bat
:skipFXLPClean

popd
:lExit
endlocal
