@echo off
setlocal
call vars-clojure.bat
%LEIN_HOME%\lein.bat %*
endlocal
