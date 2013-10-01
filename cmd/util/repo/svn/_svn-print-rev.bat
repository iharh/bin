@echo off

call vars-svn-p.bat

:: svn.exe info | findstr "Revision: "
for /f "delims=" %%a in ('svn.exe info ^| findstr "Revision: "') do set cur_revision=%%a
echo %cur_revision:~10%
set cur_revision=

