@echo off
setlocal
call vars-vbox.bat
set VM_NAME=CentOS-6.5-x86_64
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

