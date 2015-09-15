@echo off
call vars-conda.bat
call %CONDA_ROOT%\Scripts\deactivate.bat %*
