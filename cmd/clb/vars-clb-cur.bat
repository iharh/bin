@echo off
call vars-clb-cmn.bat

set CLB_VER=main

call vars-java8.bat
call vars-antc8.bat

call vars-clb-cmn-after.bat

set CLB_GIT_SRC_ROOT=%CLB_SRC%\platform
set CLB_SRC_ROOT=%CLB_GIT_SRC_ROOT%
call vars-git-p.bat

