@echo off
set local_sep=;
set local_path=%~dp0

:iter
if %1.==. goto:done

:: http://stackoverflow.com/questions/636381/what-is-the-best-way-to-do-a-substring-in-a-batch-file
if .%~n1==. (
  shift
  goto:iter
)
set full_param_name=%~dpf1
shift

for /f "delims=" %%a in ('%local_path%print-substring-match.bat "%PATH%%local_sep%" "%full_param_name%%local_sep%"') do set local_present=%%a
if %local_present%.==1. goto:iter

set PATH=%full_param_name%%local_sep%%PATH%

goto:iter

:done
set full_param_name=
set local_path=
set local_present=
set local_sep=
