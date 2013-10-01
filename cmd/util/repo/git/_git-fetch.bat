@echo off
echo fetching ... %1
git.exe remote -v update --prune
:: fetch --prune -v --multiple --all
:: fetch --append --prune -v origin
echo end fetching

