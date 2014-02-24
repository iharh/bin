@echo off
setlocal
pushd %~dp0

call vars-ecm-p.bat

call ss-copydf.bat

call git-ap.bat

call wrk-backup.bat
call yadisk-up.bat
::call bk-up.bat

popd
endlocal

