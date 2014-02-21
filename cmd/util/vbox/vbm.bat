@echo off
setlocal
call vars-vbox.bat
call %VBOX_HOME%\VBoxManage.exe %*
endlocal

