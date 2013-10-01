@echo off
setlocal
call vars-git-p.bat
:: grep -c '^[DM?]'
:: grep 'modified:' | wc -l
git.exe status -s | findstr /n /r /c:"^ *[DM?]" | %SystemRoot%\System32\find.exe /c ":"
endlocal

