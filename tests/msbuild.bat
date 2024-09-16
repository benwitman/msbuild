@echo off
setlocal
IF "%1" == "" ((echo Usage: msbuild [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_cleanoutputs.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_msbuild.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
