@echo off
setlocal

call vars-clb.bat

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build
mkdir %BUILD_LOG_DIR%

set BUILD_LOG=%BUILD_LOG_DIR%\build.txt

set CLB_DEFS="-Dversion.revision=11111"
set CLB_DEFS=%CLB_DEFS% "-Dbuild.connectors=true"
set CLB_DEFS=%CLB_DEFS% "-Dbuild.fx=true"
set CLB_DEFS=%CLB_DEFS% "-Dbuild.lp=true"
set CLB_DEFS=%CLB_DEFS% "-Dskip.test=true"
set CLB_DEFS=%CLB_DEFS% "-Dskip.checkstyle=true"
set CLB_DEFS=%CLB_DEFS% "-Dskip.i18n=true"

pushd %CLB_SRC_ROOT%\fx\fx
echo CLB_DEFS_CLEAN - %CLB_DEFS% >%BUILD_LOG%
call antc.bat clean %CLB_DEFS% >>%BUILD_LOG%
popd

pushd %CLB_SRC_ROOT%
call svn-clean.bat
call antc build-fx %CLB_DEFS% >>%BUILD_LOG%
:: "-d"
popd

endlocal
