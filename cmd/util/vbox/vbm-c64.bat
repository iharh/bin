@echo off
setlocal
call vars-vbox.bat
call %VBOX_HOME%\VBoxManage.exe startvm centos-64_default_1378982796
endlocal

