@echo off
setlocal

call vars-haskell.bat
call vars-miktex.bat

set PATH=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pandoc\cabal-dev\bin;%PATH%

pandoc a.md --template=my.beamer --from=markdown --to=beamer -o a.pdf
:: --to=docx -o a.docx
:: --to=beamer -o a.pdf
:: --from=markdown+raw_tex
:: -V theme:Warsaw -o a.pdf

endlocal

