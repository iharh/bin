@echo off
setlocal
set _len=0
set _str=%*
set _subs=%_str%
:getlen
	if not defined _subs goto result
	call set _subs=%%_subs:~1%%
	set /a _len+=1
	goto getlen
:result
	echo %_len%
:end
endlocal
