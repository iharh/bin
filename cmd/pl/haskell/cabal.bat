@echo off
setlocal
call vars-haskell-cabal-p.bat
cabal.exe %*
endlocal
