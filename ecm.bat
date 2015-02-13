@echo off
setlocal
call vars-ecm-p.bat
echo ecm PATH - %PATH%

set PROMPT=$p$_$$$S
start %ComSpec% %* 
endlocal
