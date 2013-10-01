@echo off
setlocal
cabal-dev install glib --enable-documentation --haddock-hyperlink-source
endlocal

