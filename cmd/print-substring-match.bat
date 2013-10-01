:: http://stackoverflow.com/questions/7005951/batch-file-find-if-substring-is-in-string-not-in-a-file
@echo off
set orig_str=%1
set sub_str=%2
echo.%orig_str% | findstr /C:"%sub_str%" 1>nul
if errorlevel 1 (echo.0) else (echo.1)
