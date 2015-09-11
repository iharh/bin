@echo off
setlocal
call vars-java8.bat
call vars-scala.bat
set SBT_HOME=%SCALA_TOOLS_HOME%/sbt

set SBT_OPTS=-Xms9G -Xmx9G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:ReservedCodeCacheSize=128m -Dsbt.log.format=true -Dfile.encoding=UTF-8

%JAVA_HOME%/bin/java %SBT_OPTS% -jar "%SBT_HOME%/sbt-launch.jar" "-Dsbt.boot.directory=%SBT_HOME%/boot" "-Dsbt.ivy.home=%SBT_HOME%/.ivy2" %*
endlocal

