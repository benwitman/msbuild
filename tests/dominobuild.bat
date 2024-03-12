setlocal
@echo off
IF "%1" == "" ((echo Usage: dominobuild [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_clean.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_cleanoutputs.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_metaprep.bat 
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_metarun.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_productprep.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_productrun.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
