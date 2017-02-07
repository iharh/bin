@echo off
setlocal
call vars-rust.bat
rustup.exe %*
endlocal
