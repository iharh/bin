@echo off
setlocal
call vars-shell.bat

:: for /f "delims= " %%a in (%~dp0.wcd\alias.wcd) do echo %%a
:: "delims="

:: fzf
:: -i  case insensitive
:: +s  no sort
:: -n1 comma-separated list of field index expressions for limiting search scope. 
:: -e  exact
:: -x  extended
:: --no-extended

::ali=$(cat ~/alias.wcd | 
::    while read line; do
::      echo "$line"
::      # [ -f "${line/\~/$HOME}" ] && echo "$line"
::    done | fzf -i +s -n1 -q "$*" -0 -1)

type %~dp0.wcd\alias.wcd | %SHELL_ROOT%\fzf\fzf-0.15.6-windows_amd64.exe -i +s -n1 -e -q "%*" -0 -1

::%SHELL_ROOT%\wcd\bin\wcdwin64.exe -d D -G
::%~dp0.wcd %*
endlocal

::%~dp0.wcd\wcdgo.bat
