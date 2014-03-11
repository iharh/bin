@echo off
setlocal

set CYGWIN=nodosfilewarning
:: notitle glob

set CYGWIN_DRIVE=C:
set CYGWIN_HOME=%CYGWIN_DRIVE%\cygwin

%CYGWIN_DRIVE%
chdir %CYGWIN_HOME%/bin

zsh --login -i %*
endlocal
