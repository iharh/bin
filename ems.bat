@echo off
setlocal
call vars-ems-p.bat

::set MSYSTEM=MSYS
set MSYSTEM=MINGW64
rem To activate windows native symlinks uncomment next line
set MSYS=winsymlinks
::set MSYS=winsymlinks:nativestrict
rem Set debugging program for errors
rem set MSYS=error_start:%WD%../../mingw32/bin/qtcreator.exe|-debug|<process-id>
set MSYSCON=mintty.exe

::start %MSYS_ROOT%\usr\bin\mintty -i /msys2.ico /usr/bin/zsh --login %*

start %MSYS_ROOT%\usr\bin\mintty -i /msys2.ico /usr/bin/bash --login %*
:: --login -i
:: -c %USERPROFILE%\.minttyrc

:: Additional packages:
:: msys-man
:: msys-gawk
:: msys-vim
endlocal
