@echo off
setlocal
call vars-docker-p.bat
for /f %%i in ('docker.exe images -q -f "dangling=true"') do docker.exe rmi %%i
endlocal
