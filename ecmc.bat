@echo off
setlocal
call vars-ecm-p.bat
set PROMPT=$p$_$$$S
%ComSpec% %*
endlocal
