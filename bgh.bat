@echo off
setlocal
pushd %~dp0

call vars-ecm-p.bat

call git-autopush.bat

call wrk-backup.bat
::call yadisk-up.bat
call bk-up.bat

popd
endlocal

