@echo off
setlocal
set MINGW_HOME=D:\MMM
set BASH=%MINGW_HOME%\msys\1.0\bin\bash.exe 
set BUILD_ARGS=ARCH=x86-64 STATIC_STDCPLUS=yes
set VIM_SRC_DIR=/d/dev/src/vim74/src

%BASH% --login -c "pushd %VIM_SRC_DIR%; mingw32-make.exe -f Make_ming.mak %BUILD_ARGS% GUI=no                       vim.exe; popd"
%BASH% --login -c "pushd %VIM_SRC_DIR%; mingw32-make.exe -f Make_ming.mak %BUILD_ARGS% GUI=yes OLE=yes NETBEANS=no gvim.exe; popd"
::--login -i
endlocal
