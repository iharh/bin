@echo off
setlocal
call vars-utils.bat
set MINIKUBE_BIN=%UTILS_ROOT%\minikube
%MINIKUBE_BIN%\minikube-windows-amd64.exe %*
endlocal
