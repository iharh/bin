@echo off
setlocal
cabal-dev install svgcairo --enable-documentation --haddock-hyperlink-source
endlocal

