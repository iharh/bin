@echo off
setlocal
call vars-ems-p.bat

set MSYSTEM=MINGW64
::set MSYS2_PATH_TYPE=strict
set "CONTITLE=MinGW x64"
set "WD=%MSYS_ROOT%\usr\bin\"
set "ComEmuCommand=%MSYS_ROOT%\opt\bin\ConEmu"

start "%CONTITLE%" "%ComEmuCommand%" /Here /Icon "%WD%..\..\msys2.ico" /cmd "%WD%bash" --login %*
::start "%CONTITLE%" "%WD%mintty" -i /msys2.ico /usr/bin/bash --login %*

endlocal
