@echo off
setlocal
call vars-vbox.bat
set VM_NAME=Manjaro-xfce
call %VBOX_HOME%\VBoxManage.exe startvm %VM_NAME%
endlocal

