@echo off
:: TODO: need only for autopush - move to subfolder later


::
:: Get date/time independent of system locale and regional settings
:: By Helge Klein
:: Based on code by Rob van der Woude (http://www.robvanderwoude.com/files/sortdate5_xp.txt)
::
 
setlocal ENABLEDELAYEDEXPANSION


set dsep=-
if NOT .%1==. set dsep=%1
set tsep=:
if NOT .%2==. set tsep=%2
set dtsep= 
if NOT .%3==. set dtsep=%3

:: Use WMIC to retrieve date and time
for /f "skip=1 tokens=1-6" %%a in ('wmic path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') do (
	if not "%%~f"=="" (
		set /A fdate=10000 * %%f + 100 * %%d + %%a
		set fdate=!fdate:~0,4!%dsep%!fdate:~4,2!%dsep%!fdate:~6,2!

		set /A ftime=10000 * %%b + 100 * %%c + %%e
		set ftime=0000000!ftime!
		set ftime=!ftime:~-6,2!%tsep%!ftime:~-4,2!%tsep%!ftime:~-2,2!
	)
)

:: Display the results - all the vars starting from the formatted
::set formatted

echo %fdate%%dtsep%%ftime%

endlocal
