# Windows cmd stuff
## Bat-files exit codes
In order to track exit code - put the following snippet right after the appropriate command:
```Batchfile
set _EXIT_CODE_=%ERRORLEVEL%
```
Then - use the following one right before exit:
```Batchfile
exit /b %_EXIT_CODE_%

```
