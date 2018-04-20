@echo off
setlocal
call vars-nvim.bat
"%NVIM_EXE_DIR%\nvim.exe" %*
endlocal
