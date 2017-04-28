@echo off
setlocal

if %JAVA_HOME%.==. goto done
if %ANT_HOME%.==. goto done

call vars-clb-cmn.bat

set CLB_EXTRA_DEFS="-Dvs.base=D:/Program Files (x86)/Microsoft Visual Studio 10.0"
set CLB_EXTRA_DEFS=%CLB_EXTRA_DEFS% "-Dsdk.base=C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A"
set CLB_EXTRA_DEFS=%CLB_EXTRA_DEFS% "-Dhelp.workshop.base=C:/Program Files (x86)/HTML Help Workshop"
set CLB_EXTRA_DEFS=%CLB_EXTRA_DEFS% "-Djava.base=%JAVA_HOME%"
set ANT_OPTS=%ANT_OPTS% %CLB_EXTRA_DEFS% -Djsse.enableSNIExtension=false

::echo CLB_EXTRA_DEFS=%CLB_EXTRA_DEFS%
call %ANT_HOME%/bin/ant.bat %*

:done
endlocal
