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
set BUILD_FX_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build-fx
mkdir %BUILD_FX_LOG_DIR%

set BUILD_FX_LOG=%BUILD_FX_LOG_DIR%\build-fx.txt
set CTAGS_LOG=%BUILD_FX_LOG_DIR%\ctags.txt

::
:: SVN stuff
::
pushd %CLB_SVN_SRC_ROOT%\fx\fx

if %BUILD_FXLP%.==. goto skipFXLPClean
call antc-cmn.bat clean >>%BUILD_FX_LOG%
::call svn-clean.bat
:skipFXLPClean

if %1.==noskip. goto skipExtraSkips
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.test=true"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.checkstyle=true"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dversion.revision=12345"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dsvn.svnkit=false"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dsvn.javahl=false"
echo CLB_DEFS_B - %CLB_DEFS_B% >%BUILD_FX_LOG%
:skipExtraSkips

if %CTAGS_SRC%.==. goto skipCtagsSvn
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsSvn

if %BUILD_FXLP%.==. goto skipFXLPBuild
call antc-cmn.bat compile %CLB_DEFS_B% >>%BUILD_FX_LOG%
:skipFXLPBuild
popd
:lExit
endlocal
