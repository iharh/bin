@echo off
setlocal
call vars-go.bat
go.exe %*
endlocal
