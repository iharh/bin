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
set BUILD_FX_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build-fx-701
mkdir %BUILD_FX_LOG_DIR%

set BUILD_FX_LOG=%BUILD_FX_LOG_DIR%\build-fx.txt
set SVN_LOG=%BUILD_FX_LOG_DIR%\svn-changes.txt
set SVN_LOCAL_LOG=%BUILD_FX_LOG_DIR%\svn-local-changes.txt
set CTAGS_LOG=%BUILD_FX_LOG_DIR%\ctags.txt

::
:: SVN stuff
::
pushd %CLB_SVN_SRC_ROOT%

set CLB_DEFS_FXLP="-Dbuild.fx=true" "-Dbuild.lp=true"
echo CLB_DEFS_FXLP - %CLB_DEFS_FXLP% >%BUILD_FX_LOG%

if %BUILD_FXLP%.==. goto skipFXLPClean
call antc-cmn.bat clean-fx clean-lp %CLB_DEFS_FXLP% >>%BUILD_FX_LOG%
call svn-clean.bat
:skipFXLPClean

for /f "delims=" %%a in ('_svn-print-rev.bat') do set old_rev=%%a
if %1.==nosvn. goto skipSvnUp
call svn.bat up -q >%SVN_LOG%
:skipSvnUp
call svn.bat st >%SVN_LOCAL_LOG%
for /f "delims=" %%a in ('_svn-print-rev.bat') do set new_rev=%%a

if %1.==noskip. goto skipExtraSkips
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.test=true"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.checkstyle=true"
:skipExtraSkips

if %old_rev% == %new_rev% goto skipSvnLog
set /A old_revision+=1
call svn.bat log -v -r %old_rev%:%new_rev% >>%SVN_LOG% 2>&1
:skipSvnLog

if %CTAGS_SRC%.==. goto skipCtagsSvn
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsSvn

if %BUILD_FXLP%.==. goto skipFXLPBuild
pushd %CLB_SVN_SRC_ROOT%\cmp\installer
call antc-cmn.bat build-fx build-lp %CLB_DEFS_FXLP% %CLB_DEFS_B% >>%BUILD_FX_LOG%
popd
:skipFXLPBuild
popd
:lExit
endlocal
