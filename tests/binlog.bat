@echo off
setlocal

call %~dp0_logviewer.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

echo Opening %1
start %_Static_MSBuildStructuredLogViewer% %1
