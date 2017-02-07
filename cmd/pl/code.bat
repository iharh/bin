@echo off
setlocal
call vars-rust.bat
start "dummy" /b "D:\dev\pl\vscode\Code.exe" %*
endlocal
