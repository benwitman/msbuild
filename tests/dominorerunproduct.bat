@echo off
setlocal
IF "%1" == "" ((echo Usage: dominorerunproduct [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_productrun.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
