@echo off
setlocal
call vars-vim.bat
"%VIM_EXE_DIR%\vim.exe" %*
endlocal
