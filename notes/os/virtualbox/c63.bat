@echo off
setlocal
call vars-vbox.bat
call vars-path-append.bat %VBOX_HOME%

set VM_NAME=centos63x64
set VDI_NAME=F:\VBoxImages\%VM_NAME%\%VM_NAME%_disk.vdi
set DVD_ISO=F:\vbox-isos\CentOS-6.3-x86_64-minimal.iso 

::VBoxManage list ostypes
::VBoxManage list vms --long

::VBoxManage.exe createvm --name %VM_NAME% --ostype RedHat_64 --register
:: SATA controller
::VBoxManage storagectl %VM_NAME% --name "SATA Controller" --add sata --controller IntelAHCI --portcount 1 --hostiocache on --bootable on
:: VDI DISK
::VBoxManage createhd --filename %VDI_NAME% --size 100000
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
::VBoxManage modifyvm %VM_NAME% --nic1 bridged --nictype1 82543GC --nicpromisc1 allow-all --bridgeadapter1 "Intel(R) 82578DM Gigabit Network Connection" --macaddress1 0800271A8C4B
:: IDE controller
::VBoxManage storagectl %VM_NAME% --name "IDE Controller" --add ide --controller PIIX4 --portcount 2 --hostiocache on --bootable on
:: CDROM
::VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium %DVD_ISO%
:: or GuestAdditions
::VBoxManage storageattach %VM_NAME% --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium D:\dev\Utils\VirtualBox\VBoxGuestAdditions.iso
:: --medium additions
endlocal
