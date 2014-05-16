@echo off
setlocal
call vars-vbox.bat
set VM_NAME=Manjaro-openbox
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

