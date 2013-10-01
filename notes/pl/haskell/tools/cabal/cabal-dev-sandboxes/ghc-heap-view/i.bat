@echo off
setlocal
cabal-dev install ghc-heap-view --enable-documentation --haddock-hyperlink-source
endlocal

