@echo off
setlocal
call vars-scala.bat
set SBT_HOME=%SCALA_TOOLS_HOME%/sbt
set SBT_OPTS=-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M
%JAVA_HOME%/bin/java %SBT_OPTS% -jar "%SBT_HOME%/sbt-launch.jar" "-Dsbt.boot.directory=%SBT_HOME%/boot" "-Dsbt.ivy.home=%SBT_HOME%/.ivy2" %*
endlocal

