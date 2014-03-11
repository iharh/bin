@echo off
setlocal
call vars-ecm-p.bat

call ss-copy.bat
call all-ap.bat 

call wrk-backup.bat
call yadisk-up.bat
::call bk-up.bat
endlocal

