@echo off
setlocal enabledelayedexpansion

:begin
	call :set_dir git.bat
	::if exist !dir! goto git_found

	echo !dir!
	goto end
:set_dir
	set "dir=%~$PATH:1"
	goto end

:end
endlocal
