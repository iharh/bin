@echo off
setlocal
call vars-vbox-p.bat

set VM_NAME=CentOS-6.5-x86_64
set VDI_NAME=F:\VBoxImages\%VM_NAME%\%VM_NAME%_disk.vdi
set DVD_ISO=F:\vbox-isos\%VM_NAME%-minimal.iso 
set VM_OS_TYPE=RedHat_64 
set MAC_ADDR=
set SHARED_FOLDER=F:\vbox-shared

call _print-choice-q.bat Reinstall %VM_NAME%?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto done

::VBoxManage list ostypes
::VBoxManage list vms --long

VBoxManage unregistervm %VM_NAME% --delete
::goto:done

VBoxManage.exe createvm --name %VM_NAME% --ostype %VM_OS_TYPE% --register
:: SATA controller
VBoxManage.exe storagectl %VM_NAME% --name "SATA Controller" --add sata --controller IntelAHCI --portcount 2 --hostiocache on --bootable on
:: VDI DISK
VBoxManage.exe createhd --filename %VDI_NAME% --size 200000
::VBoxManage.exe modifyhd %VDI_NAME% --resize 500000
:: Attach VDI DISK to VM
VBoxManage.exe storageattach %VM_NAME% --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %VDI_NAME%
:: GuestAdditions
VBoxManage.exe storageattach %VM_NAME% --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --tempeject on --medium %VBOX_HOME%\VBoxGuestAdditions.iso
:: MOTHERBOARD
VBoxManage.exe modifyvm %VM_NAME% --ioapic on
:: BOOTSEQ
VBoxManage.exe modifyvm %VM_NAME% --boot1 dvd --boot2 disk --boot3 none --boot4 none
:: MEMORY
VBoxManage.exe modifyvm %VM_NAME% --memory 4096 --vram 16
:: CPU
VBoxManage.exe modifyvm %VM_NAME% --cpus 2
:: NETWORK
VBoxManage.exe modifyvm %VM_NAME% --nic1 bridged --nictype1 82543GC --nicpromisc1 allow-all --bridgeadapter1 "Intel(R) 82578DM Gigabit Network Connection"
::VBoxManage.exe modifyvm %VM_NAME% --macaddress1 %MAC_ADDR%
:: IDE controller
VBoxManage.exe storagectl %VM_NAME% --name "IDE Controller" --add ide --controller PIIX4 --portcount 2 --hostiocache on --bootable on
:: CDROM
VBoxManage.exe storageattach %VM_NAME% --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium %DVD_ISO%
:: or GuestAdditions
::VBoxManage.exe storageattach %VM_NAME% --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium %VBOX_HOME%\VBoxGuestAdditions.iso
:: --medium additions
:: PORT forwarding
VBoxManage.exe modifyvm %VM_NAME% --natpf1 "guestssh,tcp,,2222,,22"
:: SHARED FOLDER
VBoxManage.exe sharedfolder add %VM_NAME% --name "/vagrant" --hostpath %SHARED_FOLDER% --readonly --automount
:: look at UserManual 4.3.1 Manual mounting
::
:: guestcontrol
::
:done
endlocal
