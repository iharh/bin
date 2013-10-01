@echo off
setlocal

for %%i in ("%~dp0..\CMake_2_8") do (set CMAKE_HOME=%%~fi)

set PATH=%PATH%;%CMAKE_HOME%\bin

cmake.exe %*

endlocal
