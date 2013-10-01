@echo off
setlocal
call vars-ruby.bat
%RUBY_HOME%\bin\ruby.exe %GEM_HOME%\bin\mustache %*
endlocal
