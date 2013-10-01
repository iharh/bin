@ECHO OFF

:: See if the name alone triggers a hit:
CALL :FIND "%~1"
IF %ERRORLEVEL%==0 EXIT /B 0
:: Split the PATHEXT variable into extensions and pass them to a function that will try each one of them:
FOR /F "delims=; tokens=1-26" %%A IN ("%pathext%") DO (
  CALL :FIND_EXT "%~1" "%%~A" "%%~B" "%%~C" "%%~D" "%%~E" "%%~F" "%%~G" "%%~H" "%%~I" "%%~J" "%%~K" "%%~L" "%%~M" "%%~N" "%%~O" "%%~P" "%%~Q" "%%~R" "%%~S" "%%~T" "%%~U" "%%~V" "%%~W" "%%~X" "%%~Y" "%%~Z"
)
EXIT /B %ERRORLEVEL%

:FIND_EXT &:: Arguments = "given name" pathext1 pathext2 pathext3 ... pathext26
  :: See if there are any extensions left to try:
  IF "%~2"=="" GOTO :NOT_FOUND
  :: See if "given name.pathextX" triggers a hit:
  CALL :FIND "%~1%~2"
  IF %ERRORLEVEL%==0 EXIT /B 0
  :: No; shift arguments = "given name" pathext2 pathext3 ... pathext26, etc... to try next pathext extension
  SHIFT /2
  :: Try next extension
  GOTO :FIND_EXT

:NOT_FOUND
  :: Report that the given name cannot be found
  ECHO "%~1" not found 1>&2
  EXIT /B 1

:FIND &:: Arguments = "name"
  IF "%~s$PATH:1"=="" (
    :: The name cannot be found in the PATH variable, return exit code 1
    EXIT /B 1
  ) ELSE (
    :: Found: print the full path and return exit code 0
    ECHO "%~$PATH:1"
    EXIT /B 0
  )
