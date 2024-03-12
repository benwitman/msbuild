@echo off
setlocal
IF "%1" == "" ((echo Usage: dominorerunmeta [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_metarun.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
