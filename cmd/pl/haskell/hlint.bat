@echo off
setlocal
call vars-haskell-p.bat
call vars-path-prepend.bat %HASKELL_CABAL_SANDBOXES_HOME%\hlint\.cabal-sandbox\bin
hlint %*
:: --hint=Default
:: --hint=Generalise
:: --hint=Dollar
:: . --report
:: http://pl.reddit.com/r/haskell/comments/14csf5/24_days_of_hackage_hlint/
:: If you have a HLint.hs file in the working directory, HLint picks it up automatically. Usefully put under version control in your project root.
:: If you use the -h/--hint option, HLint will look in the working directory and in its own data-files included with the hlint Cabal package, unless you pass it an absolute path.
endlocal

