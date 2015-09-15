@echo off
::call vars-python.bat
::call %PYTHON_HOME%\Scripts\activate.bat %*
call vars-conda.bat
call %CONDA_ROOT%\Scripts\activate.bat %*
