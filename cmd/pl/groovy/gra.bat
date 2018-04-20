@echo off
setlocal
set GRADLE_USER_HOME=D:\.gradle
::call vars-java8.bat
::set GRADLE_HOME=%PL_ROOT%\groovy\tools\gradle-4.6
::call %GRADLE_HOME%\bin\gradle.bat %*
gradle -Pjboss.home=D:/clb/inst/server %*
endlocal
