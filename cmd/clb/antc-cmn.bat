@echo off
setlocal

if %JAVA_HOME%.==. goto done
if %ANT_HOME%.==. goto done

call vars-clb-cmn.bat

set ANT_OPTS=%ANT_OPTS% -Djsse.enableSNIExtension=false

call %ANT_HOME%/bin/ant.bat %*

:done
endlocal
