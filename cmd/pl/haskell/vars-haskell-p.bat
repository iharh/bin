@echo off
call vars-haskell.bat
call vars-path-prepend.bat %_HASKELL_HOME%\lib\extralibs\bin %_HASKELL_HOME%\bin %_HASKELL_HOME%\mingw\bin %_HASKELL_HOME%\perl %HASKELL_CABAL_CACHE_HOME%\cache\cabal\bin
