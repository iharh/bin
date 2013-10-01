@echo off
setlocal
call vars-haskell-p.bat
ghc-pkg.exe %*
endlocal
