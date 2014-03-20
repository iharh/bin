@echo off
setlocal
call vars-haskell-cabal-p.bat
:: configure just tells about missing deps
cabal.exe sandbox init
cabal.exe install --dry-run -v3 --enable-tests --enable-benchmarks --flags=documentation --only-dependencies %*
:: --dep --dry
endlocal
