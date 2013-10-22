@echo off
setlocal
call vars-utils.bat
call vars-ydisk.bat

::%UTILS_ROOT%\BitKinex\bitkinex.exe list /result=D:\bk.txt /noinfo /auto_exit https://%YDISK_LOGIN%:%YDISK_PWD%@webdav.yandex.ru/Backup/
%UTILS_ROOT%\BitKinex\bitkinex.exe SYNCHRO /result=%~dp0.bk\bk.txt /binary /skipsz /noinfo /norest /force /auto_exit "%YDISK_LOCAL_BACKUP_DIR%" "https://%YDISK_LOGIN%:%YDISK_PWD%@webdav.yandex.ru/"
:: /skiptmsz
endlocal
