@echo off
call vars-utils.bat
set DOCKER_ROOT=%UTILS_ROOT%\docker
call vars-path-append.bat %DOCKER_ROOT%
