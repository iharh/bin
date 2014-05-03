@echo off
setlocal
call vars-ruby.bat
%RUBY_HOME%/bin/ruby.exe %RUBY_HOME%\bin\gem %*
endlocal
