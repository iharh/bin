@echo off
setlocal
call vars-haskell-p.bat
runghc.exe %*
:: results to the following:
:: ghc -ignore-dot-ghci -x "hs" -e ":set prog \"program.hs\"" -e ":main [\"param1\",\"param2\"]" program.hs
:: -ignore-dot-ghci - ignore local ghci config
:: -x - set suffix
:: -e - evaluate
endlocal
