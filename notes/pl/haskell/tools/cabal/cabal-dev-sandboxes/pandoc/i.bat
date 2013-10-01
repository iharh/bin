@echo off
setlocal
cabal-dev install pandoc --enable-documentation --haddock-hyperlink-source
endlocal

