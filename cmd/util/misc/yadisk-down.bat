@echo off
setlocal
call vars-java-p.bat
call vars-jtools.bat
call vars-ydisk.bat

java -jar %JTOOLS_HOME%/webdav_sync/webdav_sync1_1_4.jar -down -u https://%YDISK_LOGIN%:%YDISK_PWD%@webdav.yandex.ru/backup/ -d %YDISK_LOCAL_BACKUP_DIR%
:: -r -reset
endlocal
