@echo off
call vars-pl.bat
set RUST_ROOT=%PL_ROOT%\rust
set RUSTUP_HOME=%RUST_ROOT%\.rustup
set CARGO_HOME=%RUST_ROOT%\.cargo
call vars-path-append.bat %CARGO_HOME%\bin
