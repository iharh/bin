@echo off
setlocal

REM Usage: ParseHeapDump.bat <path/to/dump.hprof> [report]*
REM 
REM The leak report has the id org.eclipse.mat.api:suspects
REM 

:: org.eclipse.mat.api:suspects
:: org.eclipse.mat.api:top_components
%~dp0..\java\jtools\mat\MemoryAnalyzer.exe -consoleLog -application org.eclipse.mat.api.parse -keep_unreachable_objects  %*
:: org.eclipse.mat.api:suspects org.eclipse.mat.api:top_components
:: 

endlocal
