@echo off
setlocal
call vars-haskell-p.bat
ghc.exe %*
:: http://www.haskell.org/ghc/docs/latest/html/users_guide/flag-reference.html
endlocal
