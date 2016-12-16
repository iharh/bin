@echo off
setlocal

if %CLB_VER%.==. goto lExit
if %CLB_ROOT%.==. goto lExit
if %CLB_SRC_ROOT%.==. goto lExit

echo CLB_ROOT: %CLB_ROOT%
echo CLB_SRC_ROOT: %CLB_SRC_ROOT%

if %CLB_GIT_SRC_ROOT%.==. goto _skipGitSrc
echo CLB_GIT_SRC_ROOT: %CLB_GIT_SRC_ROOT%
:_skipGitSrc

if %IDX_SRC%.==. goto _skipIndexing
echo IDX_SRC: %IDX_SRC%
:_skipIndexing

if %CTAGS_SRC%.==. goto _skipCtags
echo CTAGS_SRC: %CTAGS_SRC%
:_skipCtags

if %BUILD_FXLP%.==. goto _skipFXLP
echo BUILD_FXLP: %BUILD_FXLP%
:_skipFXLP

if %BUILD_CONNECTORS%.==. goto _skipCONNECTORS
echo BUILD_CONNECTORS: %BUILD_CONNECTORS%
:_skipCONNECTORS

if %JAVA_HOME%.==. goto lExit
echo JAVA_HOME: %JAVA_HOME%

call _print-choice-q.bat Build CLB?
set /P CHOICE_TYPE=Your choice: 
if %CHOICE_TYPE%.==q. goto lExit

::goto lExit

for /f "delims=" %%a in ('print-date-time.bat - - _') do set val_dt=%%a
set BUILD_LOG_DIR=%CLB_ROOT%\log\%val_dt%-build-%CLB_VER%
mkdir %BUILD_LOG_DIR%

set BUILD_LOG=%BUILD_LOG_DIR%\build.txt
set SVN_LOG=%BUILD_LOG_DIR%\svn_changes.txt
set GIT_LOG=%BUILD_LOG_DIR%\git_changes.txt
set SVN_LOCAL_LOG=%BUILD_LOG_DIR%\svn_local_changes.txt
set GIT_LOCAL_LOG=%BUILD_LOG_DIR%\git_local_changes.txt
set GROK_LOG=%BUILD_LOG_DIR%\grok.txt
set CTAGS_LOG=%BUILD_LOG_DIR%\ctags.txt

set CLB_DEFS_FXLP=%CLB_DEFS_FXLP% "-Dbuild.fx=true"
set CLB_DEFS_FXLP=%CLB_DEFS_FXLP% "-Dbuild.lp=true"
set CLB_DEFS_CONNECTORS=%CLB_DEFS_CONNECTORS% "-Dbuild.connectors=true"

set CLB_DEFS_C=%CLB_DEFS_FXLP%
echo CLB_DEFS_C - %CLB_DEFS_C% >%BUILD_LOG%

::
:: SVN stuff
::
pushd %CLB_SVN_SRC_ROOT%

call antc-cmn.bat clean %CLB_DEFS_C% >>%BUILD_LOG%
call svn-clean.bat

for /f "delims=" %%a in ('_svn-print-rev.bat') do set old_rev=%%a
if %1.==nosvn. goto skipSvnUp
call svn.bat up -q >%SVN_LOG%
:skipSvnUp
call svn.bat st >%SVN_LOCAL_LOG%
for /f "delims=" %%a in ('_svn-print-rev.bat') do set new_rev=%%a

if %1.==noskip. goto skipExtraSkips
::set CLB_DEFS_B="-Dcustomer=verint"
::set CLB_DEFS_B=%CLB_DEFS_B% "-Dbuild.connectors=true"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.test=true"
set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.checkstyle=true"
::set CLB_DEFS_B=%CLB_DEFS_B% "-Dskip.i18n=true"

set EXTRA_TARGETS=
set EXTRA_CLEAN_TARGETS=
if %BUILD_FXLP%.==. goto skipFXLP
:: obsolete for 6.3.4 and further
set CLB_DEFS_B=%CLB_DEFS_B% %CLB_DEFS_FXLP%
set EXTRA_TARGETS=build-fx build-lp
set EXTRA_CLEAN_TARGETS=clean-fx clean-lp
:skipFXLP

if %BUILD_CONNECTORS%.==. goto skipCONNECTORS
set CLB_DEFS_B=%CLB_DEFS_B% %CLB_DEFS_CONNECTORS%
:skipCONNECTORS

:skipExtraSkips
echo CLB_DEFS_B - %CLB_DEFS_B% >>%BUILD_LOG%

if %old_rev% == %new_rev% goto skipSvnLog
set /A old_revision+=1
call svn.bat log -v -r %old_rev%:%new_rev% >>%SVN_LOG% 2>&1
:skipSvnLog

if %CTAGS_SRC%.==. goto skipCtagsSvn
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsSvn

popd

::
:: GIT stuff
:: 
if %CLB_GIT_SRC_ROOT%.==. goto skipGitStuff
pushd %CLB_GIT_SRC_ROOT%

::call antc-cmn.bat %EXTRA_CLEAN_TARGETS% clean %CLB_DEFS_C% >>%BUILD_LOG%
::call gradlew.bat clean >>%BUILD_LOG%

call git.bat remote -v update --prune
for /f "delims=" %%a in ('git.bat rev-parse --abbrev-ref HEAD') do set git_cur_br=%%a
echo.
echo GIT BRANCH: %git_cur_br%
echo.
call git.bat log %git_cur_br%..origin/%git_cur_br% --name-status >> %GIT_LOG% 2>&1
:: git rebase origin/%git_cur_br%
::call git.bat pull --rebase > %GIT_LOG%
call git.bat rebase origin/%git_cur_br%>> %GIT_LOG%
call git.bat status >%GIT_LOCAL_LOG%

if %CTAGS_SRC%.==. goto skipCtagsGit
call clb-ctags-cmn.bat >%CTAGS_LOG% 2>&1
:skipCtagsGit

popd

:skipGitStuff



pushd %CLB_SRC_ROOT%
::goto lDone

if %IDX_SRC%.==. goto skipIndexing
call clb-gri-cmn.bat 2>%GROK_LOG%
:skipIndexing

if %1.==nobuild. goto lDone
::set CLB_DEFS_B=%CLB_DEFS_B% -Dinstaller.revision=%new_rev%

::call antc-cmn.bat %EXTRA_TARGETS% dist %CLB_DEFS_B% >>%BUILD_LOG%
call gradlew.bat build >>%BUILD_LOG% 2>&1

:lDone
popd
:lExit
endlocal
