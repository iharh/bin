@echo off
setlocal
call vars-pg.bat
call vars-clb-cur.bat
::d:
pushd %CLB_GIT_SRC_ROOT%\cmp
%PG_BIN%\psql.exe -U postgres -d postgres %*
popd
endlocal
