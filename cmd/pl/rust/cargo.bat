@echo off
setlocal
call vars-rust.bat
cargo.exe %*
endlocal
