@echo off
setlocal
call vars-haskell-cabal-p.bat
pushd %~dp0
cabal.exe update %*
popd
endlocal
