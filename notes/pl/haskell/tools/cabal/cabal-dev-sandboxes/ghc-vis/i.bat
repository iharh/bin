@echo off
setlocal
cabal-dev install ghc-vis --enable-documentation --haddock-hyperlink-source
endlocal

