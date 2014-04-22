@echo off
setlocal
call vars-vbox-p.bat

set VM_NAME=centos63x64

::VBoxManage list dvds
::VBoxManage list ostypes
::VBoxManage list vms --long
VBoxManage showvminfo "%VM_NAME%"

endlocal
