@echo off
setlocal
cabal-dev install cairo --enable-documentation --haddock-hyperlink-source
endlocal

