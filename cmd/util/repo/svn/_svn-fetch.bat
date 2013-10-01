@echo off
svn.exe up --depth=empty -q %extra_svn_opts% >> %LOG_FILE% 2>&1

