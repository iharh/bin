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
set BUILD_FX_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build-fxbase
mkdir %BUILD_FX_LOG_DIR%

set BUILD_FX_LOG=%BUILD_FX_LOG_DIR%\build-fxbase.txt
set CTAGS_LOG=%BUILD_FX_LOG_DIR%\ctags.txt

::
:: SVN stuff
::
pushd %CLB_SVN_SRC_ROOT%\fx\base

if %BUILD_FXLP%.==. goto skipFXLPClean
call antc-cmn.bat clean >>%BUILD_FX_LOG%
::call svn-clean.bat
:skipFXLPClean

echo CLB_DEFS_B - %CLB_DEFS_B% >%BUILD_FX_LOG%

if %CTAGS_SRC%.==. goto skipCtagsSvn
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsSvn

if %BUILD_FXLP%.==. goto skipFXLPBuild
:: compile
:: publish-to-nexus
call antc-cmn.bat compile publish-to-nexus %CLB_DEFS_B% >>%BUILD_FX_LOG%
:skipFXLPBuild
popd
:lExit
endlocal
