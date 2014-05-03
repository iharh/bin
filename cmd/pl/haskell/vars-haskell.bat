@echo off
call vars-pl.bat
call vars-git.bat

call vars-haskell-ver.bat

set _HASKELL_BASE=%PL_ROOT%\Haskell\%_HASKELL_SUBDIR%

set _HASKELL_HOME=%_HASKELL_BASE%\%_HSAKELL_VER%

set HASKELL_CABAL_CACHE_HOME=%_HASKELL_BASE%\cabal
set HASKELL_CABAL_SANDBOXES_HOME=%_HASKELL_BASE%\cabal-sandboxes
