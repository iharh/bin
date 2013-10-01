@echo off
setlocal

call vars-haskell.bat
::set GHC_PACKAGE_PATH=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pipes\cabal-dev\packages-%_HASKELL_COMPILER_VER%.conf;

set _GHC_EXTRA_FLAGS=-package-conf %HASKELL_CABAL_DEV_SANDBOXES_HOME%\pipes\cabal-dev\packages-%_HASKELL_COMPILER_VER%.conf


ghc -fhpc %_GHC_EXTRA_FLAGS% p.hs

:: run the p.exe and
:: hpc markup p.exe.tix

endlocal
