@echo off
setlocal

call vars-vk.bat

::echo %VK_LOGIN%
::echo %VK_PWD%

%~dp0youtube-dl.bat -u %VK_LOGIN% -p %VK_PWD% %*

endlocal
