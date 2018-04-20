@echo off
setlocal
call vars-vim.bat
start "dummy" /b "%VIM_EXE_DIR%\gvim.exe" --remote-silent %*
:: -V20... -V8D:\vimlog.txt 
:: if NOT .%1==.-f goto noforkarg
:::noforknt
::start "dummy" /b /wait "%VIM_EXE_DIR%\gvim.exe"  %*
endlocal

