@echo off
setlocal
call vars-ecm-p.bat

call ss-copy.bat
call all-ap.bat 

call ss-compr.bat
call ss-trim.bat

call yadisk-up.bat
endlocal

