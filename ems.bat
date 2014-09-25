@echo off
setlocal
::call vars-ems-p.bat

set MSYS_ROOT=D:\msys64


set MSYSTEM=MSYS
rem To activate windows native symlinks uncomment next line
set MSYS=winsymlinks:nativestrict
rem Set debugging program for errors
rem set MSYS=error_start:%WD%../../mingw32/bin/qtcreator.exe|-debug|<process-id>
set MSYSCON=mintty.exe

start %MSYS_ROOT%\usr\bin\mintty -i /msys2.ico /usr/bin/bash --login %*

::start %MSYS_ROOT%\bin\mintty.exe --exec "%MSYS_ROOT%\bin\bash.exe" --login -i
:: -c %USERPROFILE%\.minttyrc

:: Additional packages:
:: msys-man
:: msys-gawk
:: msys-vim
endlocal
