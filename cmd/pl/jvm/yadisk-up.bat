@echo off
setlocal
call vars-java-p.bat
call vars-jtools.bat
call vars-ydisk.bat

java -jar %JTOOLS_HOME%/webdav_sync/webdav_sync1_1_2.jar -r -up -u https://%YDISK_LOGIN%:%YDISK_PWD%@webdav.yandex.ru/Backup/ -d %YDISK_LOCAL_BACKUP_DIR%
:: -reset
endlocal
