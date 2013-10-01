@echo off
setlocal
cabal-dev install vacuum --enable-documentation --haddock-hyperlink-source
endlocal

