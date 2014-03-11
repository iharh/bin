@echo off
setlocal enableextensions

call %~dp0vars-repo.bat
set LOG_FILE=%~dp0up_hg_%suff_date_time%.log

call:doUp mercurial/mozilla/dehydra
call:doUp mercurial/mozilla/elsa
call:doUp mercurial/mozilla/pork

::call:doUpF mercurial/jdk7/jdk7
::call:doUpF mercurial/jdk6/jdk6

goto:eof



:doUpF

echo updating ... %~1

echo ---------------------------------------------- >> %LOG_FILE%
echo %~1 >> %LOG_FILE%
echo ---------------------------------------------- >> %LOG_FILE%

set PRJ_DIR=%~1

pushd %PRJ_DIR:/=\%

call hg.bat fin --style svn.style >> %LOG_FILE% 2>&1
call hg.bat fpull -u              >> %LOG_FILE% 2>&1

popd

echo. >> %LOG_FILE%
echo. >> %LOG_FILE%

goto:eof



:doUp

echo updating ... %~1

echo ---------------------------------------------- >> %LOG_FILE%
echo %~1 >> %LOG_FILE%
echo ---------------------------------------------- >> %LOG_FILE%

set PRJ_DIR=%~1

pushd %PRJ_DIR:/=\%

call hg.bat in --style svn.style >> %LOG_FILE% 2>&1
call hg.bat pull -u              >> %LOG_FILE% 2>&1

popd

echo. >> %LOG_FILE%
echo. >> %LOG_FILE%

goto:eof



endlocal
