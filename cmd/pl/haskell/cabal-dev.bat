@echo off
setlocal
call vars-haskell-cabal-p.bat
cabal-dev.exe %*
endlocal
