@echo off
set local_sep=;
set local_path=%~dp0

:iter
if %1.==. goto:done

:: http://stackoverflow.com/questions/636381/what-is-the-best-way-to-do-a-substring-in-a-batch-file
set local1=%~dpf1
shift

for /f "delims=" %%a in ('%local_path%print-substring-match.bat "%PATH%%local_sep%" "%local1%%local_sep%"') do set local_present=%%a
if %local_present%.==1. goto:iter

set PATH=%PATH%%local_sep%%local1%

goto:iter

:done
set local1=
set local_path=
set local_present=
set local_sep=
