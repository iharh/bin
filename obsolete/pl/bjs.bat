@echo off
setlocal

set BOOST_UTILS_DIR=%~dp0boost

set BJAM_HOME=%BOOST_UTILS_DIR%

::rem create boost-build.jam file here for additional options
set BOOST_BUILD_PATH=D:\Knova\Cross\ksupportsuite\dist\boost

set BOOST_OPTIONS=--toolset=msvc-9.0
:: variant=release --toolset=msvc stage
set BOOST_EXTRA_OPTIONS=preserve-test-targets=on
:: --debug-configuration -s vvv=value1

:: echo OPTIONS are %*
:: echo OPTION 1 is %1

%BJAM_HOME%\bjam %BOOST_OPTIONS% %BOOST_EXTRA_OPTIONS% %*

endlocal
