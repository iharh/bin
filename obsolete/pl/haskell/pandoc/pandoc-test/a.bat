@echo off
setlocal

call vars-haskell.bat
call vars-miktex.bat

set PATH=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pandoc\cabal-dev\bin;%PATH%

pandoc -t beamer a.md -o a.pdf

endlocal

