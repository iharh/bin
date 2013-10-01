@echo off
setlocal
call vars-sql100.bat
"%SQL100_TOOLS_BIN%\sqlcmd.exe" %*
endlocal
