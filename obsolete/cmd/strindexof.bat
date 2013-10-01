@echo off
setlocal
set _len=0
set _cur=%~1
echo %~1
set _sub=%~2
for /f "delims=" %%a in ('strlen.bat "%_sub%"') do set _sublen=%%a
set /a _sublen-=2
:iter
	if not defined _cur goto result
	call set _pref=%%_cur:~0,%_sublen%%%
	::echo %_pref%
	if "%_pref%"=="%_sub%" goto result

	:: need the following stuff just to deal with possible > chars
	call set _cur=%%_cur:~1%%

	set /a _len+=1
	goto iter
:result
	echo %_len%
:end
endlocal
