@echo off
for /F %%i in ('dir /B %LOCALAPPDATA%\MSBuildStructuredLogViewer\*app*') do (set _Static_MSBuildStructuredLogViewer=%LOCALAPPDATA%\MSBuildStructuredLogViewer\%%i\StructuredLogViewer.exe)
if NOT EXIST %_Static_MSBuildStructuredLogViewer% (
	echo Failed to find MSBuildStructuredLogViewer, please install
	exit /b 1
)