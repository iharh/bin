@echo off
setlocal
call vars-vbox.bat
set VM_NAME=UbuntuDesk1304
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

