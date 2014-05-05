@echo off
setlocal
call vars-vbox.bat
set VM_NAME=CentOS-latest
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

