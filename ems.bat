@echo off
setlocal
call vars-ems-p.bat

start %MSYS_ROOT%\bin\mintty.exe --exec "%MSYS_ROOT%\bin\bash.exe" --login -i
:: -c %USERPROFILE%\.minttyrc

:: Additional packages:
:: msys-man
:: msys-gawk
:: msys-vim
endlocal
