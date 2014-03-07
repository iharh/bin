@echo off
setlocal
call vars-ecm-p.bat

call ss-copy.bat

call bin-ap.bat 
call notes-ap.bat 

call wrk-backup.bat
call yadisk-up.bat
::call bk-up.bat
endlocal

