@echo off
setlocal

call vars-haskell.bat
call vars-miktex.bat

set PATH=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pandoc\cabal-dev\bin;%PATH%

pandoc --print-default-template=beamer

endlocal

