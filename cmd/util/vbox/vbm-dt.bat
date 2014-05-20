@echo off
setlocal
call vars-vbox.bat
set VM_NAME=Debian-testing
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

