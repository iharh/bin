@echo off
setlocal
:: TODO: unify repo-up and repo-report
call git-repo-report.bat
call svn-repo-report.bat
endlocal
