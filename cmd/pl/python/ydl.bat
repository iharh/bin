@echo off
setlocal
::call vars-python.bat
::%PYTHON_SCRIPTS%/youtube-dl.exe --no-check-certificate %*
D:\dev\utils\scoop\apps\youtube-dl\current\youtube-dl.exe --no-check-certificate %*
endlocal

