@echo off
setlocal
call vars-vim.bat
start "dummy" /b /wait "%VIM_EXE_DIR%\gvim.exe" -d %*
endlocal

