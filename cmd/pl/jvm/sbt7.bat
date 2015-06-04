@echo off
setlocal
call vars-java7.bat
call vars-scala.bat
set SBT_HOME=%SCALA_TOOLS_HOME%/sbt

set SBT_OPTS=-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:ReservedCodeCacheSize=128m -Dsbt.log.format=true
set SBT_OPTS=-XX:MaxPermSize=256M %SBT_OPTS%

%JAVA_HOME%/bin/java %SBT_OPTS% -jar "%SBT_HOME%/sbt-launch.jar" "-Dsbt.boot.directory=%SBT_HOME%/boot" "-Dsbt.ivy.home=%SBT_HOME%/.ivy2" %*
endlocal

