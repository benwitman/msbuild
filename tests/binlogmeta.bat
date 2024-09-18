@echo off
setlocal

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_logviewer.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

for /F %%i in ('dir /S/B %_Static_Intermediate_MetaBuildOutput%\*.binlog') do (
	echo Opening %%i
	start %_Static_MSBuildStructuredLogViewer% %%i
)