@echo off
setlocal
call vars-java7.bat
call vars-clue.bat

%JAVA_HOME%/bin/java.exe -cp %CLUE_HOME%\elasticsearch-1.0.0.jar;%CLUE_HOME%\lucene-suggest-4.6.1.jar;%CLUE_HOME%\clue-all-0.0.5.jar com.senseidb.clue.ClueApplication %*
endlocal
