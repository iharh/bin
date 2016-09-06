@echo off
setlocal
call vars-prj.bat
pushd %PRJ_ROOT%\sbt\clb
call sbt.bat unsvc
popd
endlocal
