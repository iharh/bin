@echo off
setlocal

if %CLB_ROOT%.==. goto lExit
if %CLB_SRC_ROOT%.==. goto lExit

echo CLB_ROOT: %CLB_ROOT%
echo CLB_SRC_ROOT: %CLB_SRC_ROOT%

if %CLB_GIT_SRC_ROOT%.==. goto _skipGitSrc
echo CLB_GIT_SRC_ROOT: %CLB_GIT_SRC_ROOT%
:_skipGitSrc

if %CTAGS_SRC%.==. goto _skipCtags
echo CTAGS_SRC: %CTAGS_SRC%
:_skipCtags

if %JAVA_HOME%.==. goto lExit
echo JAVA_HOME: %JAVA_HOME%


for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_CMP_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build-cmp
mkdir %BUILD_CMP_LOG_DIR%

set BUILD_CMP_LOG=%BUILD_CMP_LOG_DIR%\build-cmp.txt
set GIT_LOG=%BUILD_CMP_LOG_DIR%\git-changes.txt
set GIT_LOCAL_LOG=%BUILD_CMP_LOG_DIR%\git-local-changes.txt
set CTAGS_LOG=%BUILD_CMP_LOG_DIR%\ctags.txt

::
:: GIT stuff
:: 
if %CLB_GIT_SRC_ROOT%.==. goto skipGitStuff
pushd %CLB_GIT_SRC_ROOT%

::set CLB_DEFS_CMP=%CLB_DEFS_CMP% -Pmvn.repo=http://epbygomw0039t1.gomel.epam.com:8099/nexus/content/groups/public
echo CLB_DEFS_CMP: %CLB_DEFS_CMP% >%BUILD_CMP_LOG%

::call gradlew.bat clean >>%BUILD_CMP_LOG% 2>&1
call gradle.cmd clean >>%BUILD_CMP_LOG% 2>&1

git.exe remote -v update --prune
for /f "delims=" %%a in ('git.exe rev-parse --abbrev-ref HEAD') do set git_cur_br=%%a
echo.
echo GIT BRANCH: %git_cur_br%
echo.
git.exe log %git_cur_br%..origin/%git_cur_br% --name-status >> %GIT_LOG% 2>&1
git.exe rebase origin/%git_cur_br%>> %GIT_LOG%
git.exe status >%GIT_LOCAL_LOG%

if %CTAGS_SRC%.==. goto skipCtagsGit
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsGit

popd

:skipGitStuff

:: 7.1
pushd %CLB_SRC_ROOT%
::call gradlew.bat build %CLB_DEFS_CMP% >>%BUILD_CMP_LOG% 2>&1
::call gradle.bat build %CLB_DEFS_CMP% >>%BUILD_CMP_LOG% 2>&1
call gradle.cmd build %CLB_DEFS_CMP% >>%BUILD_CMP_LOG% 2>&1
popd
:lExit
endlocal
