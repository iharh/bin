@echo off
setlocal
call vars-docker-p.bat
docker.exe %*
endlocal
