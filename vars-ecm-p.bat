@echo off
::echo 1
::pause
call %~dp0cmd\vars-path-prepend-recursive.bat %~dp0cmd
call %~dp0cmd\vars-path-prepend-recursive.bat %~dp0wrk
::echo 2
::pause
