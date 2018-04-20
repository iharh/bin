@echo off
setlocal

call vars-java-p.bat

%JAVA_HOME%/bin/jvisualvm.exe %*

::java\lib\visualvm\etc\visualvm.conf
::default_options="-J-client -J-Xms24m -J-Xmx1024m -J-Dsun.jvmstat.perdata.syncWaitMs=10000 -J-Dsun.java2d.noddraw=true -J-Dsun.java2d.d3d=false"


endlocal
