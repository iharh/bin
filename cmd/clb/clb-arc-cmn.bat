@echo off
setlocal
if %CLB_SRC_ROOT%.==. goto lExit
call vars-arc.bat

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a

set CLB_DEFS="-Dbuild.connectors=true"
set CLB_DEFS=%CLB_DEFS% "-Dbuild.fx=true"
set CLB_DEFS=%CLB_DEFS% "-Dbuild.lp=true"

pushd %CLB_SRC_ROOT%

call antc.bat clean %CLB_DEFS%
call svn-clean.bat

%ARC_HOME%\7-Zip\7z.exe a -bd -w -mx=0 clb-%val_dt%.7z .

popd
:lExit
endlocal
