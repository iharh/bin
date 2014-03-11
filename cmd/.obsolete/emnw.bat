@echo off
setlocal

set EMACS_HOME=%~dp0..\emacs-23.3

set PATH=%PATH%;%EMACS_HOME%\bin

start /MAX emacs.exe -nw %*
:: 

endlocal
