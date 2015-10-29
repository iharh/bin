@echo off
setlocal
call vars-ems-p.bat

set MSYSTEM=MSYS

start %MSYS_ROOT%\usr\bin\mintty -i /msys2.ico /usr/bin/bash --login %*
endlocal
