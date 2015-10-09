@echo off
setlocal
for /f "delims=" %%a in ('git.bat rev-parse --abbrev-ref HEAD') do set git_cur_br=%%a
echo %git_cur_br%
endlocal
