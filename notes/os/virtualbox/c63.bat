@echo off
setlocal
call vars-vbox-p.bat

set VM_NAME=centos63x64
set VDI_NAME=F:\VBoxImages\%VM_NAME%\%VM_NAME%_disk.vdi
set DVD_ISO=F:\vbox-isos\CentOS-6.3-x86_64-minimal.iso 
set VM_OS_TYPE=RedHat_64 
set MAC_ADDR=0800271A8C4B
set SHARED_FOLDER=F:\vbox-shared

::VBoxManage list ostypes
::VBoxManage list vms --long

::VBoxManage unregistervm %VM_NAME% --delete

::VBoxManage.exe createvm --name %VM_NAME% --ostype %VM_OS_TYPE% --register
:: SATA controller
::VBoxManage storagectl %VM_NAME% --name "SATA Controller" --add sata --controller IntelAHCI --portcount 1 --hostiocache on --bootable on
:: VDI DISK
::VBoxManage createhd --filename %VDI_NAME% --size 200000
::VBoxManage modifyhd %VDI_NAME% --resize 500000
:: Attach VDI DISK to VM
::VBoxManage storageattach %VM_NAME% --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %VDI_NAME%
:: MOTHERBOARD
::VBoxManage modifyvm %VM_NAME% --ioapic on
:: BOOTSEQ
::VBoxManage modifyvm %VM_NAME% --boot1 dvd --boot2 disk --boot3 none --boot4 none
:: MEMORY
::VBoxManage modifyvm %VM_NAME% --memory 4096 --vram 16
:: CPU
::VBoxManage modifyvm %VM_NAME% --cpus 2
:: NETWORK
::VBoxManage modifyvm %VM_NAME% --nic1 bridged --nictype1 82543GC --nicpromisc1 allow-all --bridgeadapter1 "Intel(R) 82578DM Gigabit Network Connection" --macaddress1 %MAC_ADDR%
:: IDE controller
::VBoxManage storagectl %VM_NAME% --name "IDE Controller" --add ide --controller PIIX4 --portcount 2 --hostiocache on --bootable on
:: CDROM
::VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium %DVD_ISO%
:: or GuestAdditions
::VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium %VBOX_HOME%\VBoxGuestAdditions.iso
:: --medium additions
:: PORT forwarding
::VBoxManage modifyvm %VM_NAME% --natpf1 "guestssh,tcp,,2222,,22"
:: SHARED FOLDER
::VBoxManage sharedfolder add %VM_NAME% --name "/vagrant" --hostpath %SHARED_FOLDER% --readonly --automount
:: look at UserManual 4.3.1 Manual mounting
::
:: guestcontrol
::
endlocal
