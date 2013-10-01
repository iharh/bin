@echo off
setlocal

for %%i in ("%~dp0..\JavaScript\nodejs") do (set NODEJS_HOME=%%~fi)
set PATH=%PATH%;%NODEJS_HOME%

node.exe %*

endlocal
