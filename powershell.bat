@echo off
setlocal
::call vars-ecm-p.bat
::set PROMPT=$p$_$$$S
::%ComSpec% %*
D:\dev\utils\PowerShell\6.0.2\pwsh.exe %*
endlocal
