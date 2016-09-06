@echo off
setlocal

call vars-clb.bat

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build
mkdir %BUILD_LOG_DIR%

set BUILD_LOG=%BUILD_LOG_DIR%\build.txt
set REPO_LOG=%BUILD_LOG_DIR%\svn_changes.txt
set LOCAL_LOG=%BUILD_LOG_DIR%\local_changes.txt

set CLB_DEFS_C=%CLB_DEFS_C% "-Dbuild.fx=true"
set CLB_DEFS_C=%CLB_DEFS_C% "-Dbuild.lp=true"

pushd %CLB_SRC_ROOT%

echo CLB_DEFS_C - %CLB_DEFS_C% >%BUILD_LOG%
call antc.bat clean %CLB_DEFS_C% >>%BUILD_LOG%
call svn-clean.bat
::goto skipLog

for /f "delims=" %%a in ('_svn-print-rev.bat') do set old_rev=%%a
call svn.bat up -q >%REPO_LOG%
call svn.bat st >%LOCAL_LOG%
for /f "delims=" %%a in ('_svn-print-rev.bat') do set new_rev=%%a

if %old_rev% == %new_rev% goto skipLog
set /A old_revision+=1
call svn.bat log -v -r %old_rev%:%new_rev% >>%REPO_LOG% 2>&1
:skipLog

popd
endlocal
