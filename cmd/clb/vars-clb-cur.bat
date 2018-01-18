::@echo off
call vars-clb-cmn.bat
set CLB_VER=main
call vars-java8.bat
call vars-antc8.bat
call vars-gradle.bat

::echo before vars-clb-cmn-after.bat BUILD_FXLP: %BUILD_FXLP% !!!
:: call vars-clb-cmn-after.bat
set CLB_SVN_SRC_ROOT=%CLB_SRC%\%CLB_VER%

set CLB_SRC_ROOT=%CLB_SVN_SRC_ROOT%

set BUILD_TYPE=continuous
if %BUILD_FXLP%.==. goto skipFXLPbt
set BUILD_TYPE=nlp
set CLB_DEFS_CMP=%CLB_DEFS_CMP% -Pnlp.workspace=%CLB_SVN_SRC_ROOT%

set CLB_DEFS_CMP_VER=-Pfx.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.english.version=+
:: ...
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.indonesian.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.russian.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.french.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.spanish.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.italian.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.portuguese.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.thai.version=+
set CLB_DEFS_CMP_VER=%CLB_DEFS_CMP_VER% -Plp.unknown.version=+
:: ...
:: +
:: 7.3.0.3
:skipFXLPbt

set CLB_DEFS_CMP=%CLB_DEFS_CMP% -Pbuild.type=%BUILD_TYPE%
set CLB_DEFS_CMP=%CLB_DEFS_CMP% %CLB_DEFS_CMP_VER%
echo CLB_DEFS_CMP: %CLB_DEFS_CMP%

::echo after call vars-clb-cmn-after.bat !!!

set CLB_GIT_SRC_ROOT=%CLB_SRC%\platform
set CLB_SRC_ROOT=%CLB_GIT_SRC_ROOT%
call vars-git-p.bat
