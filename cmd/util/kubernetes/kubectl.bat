@echo off
setlocal
call vars-utils.bat
set MINIKUBE_BIN=%UTILS_ROOT%\kubectl
set KUBECONFIG="C:\Users\Ihar_Hancharenka\.kube\config"
%MINIKUBE_BIN%\kubectl.exe %*
endlocal
