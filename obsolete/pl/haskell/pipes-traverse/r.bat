@echo off
setlocal

call vars-haskell.bat

::set GHC_PACKAGE_PATH=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pipes\cabal-dev\packages-%_HASKELL_COMPILER_VER%.conf;

set _RUNGHC_EXTRA_FLAGS=-package-conf --ghc-arg=%HASKELL_CABAL_DEV_SANDBOXES_HOME%\pipes\cabal-dev\packages-%_HASKELL_COMPILER_VER%.conf

runghc %_RUNGHC_EXTRA_FLAGS% p.hs %*

endlocal
