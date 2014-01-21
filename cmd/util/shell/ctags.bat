@echo off
setlocal
call vars-ctags.bat
%CTAGS_ROOT%\ctags.exe %*
endlocal
