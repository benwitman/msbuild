@echo off
setlocal
IF "%1" == "" ((echo Usage: dominobuild [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_cleanoutputs.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

IF NOT EXIST %_Static_Intermediate% mkdir %_Static_Intermediate%

IF EXIST %_Static_Intermediate_PreProcess% rmdir /S/Q %_Static_Intermediate_PreProcess%
mkdir %_Static_Intermediate_PreProcess%

%_Static_Artifacts_MsBuild%\MSBuild.exe %_Static_Source%\project.proj /bl:%_Static_Intermediate_PreProcess%\project.binlog
echo %_Static_Intermediate_PreProcess%\project.binlog

for /F %%i in ('dir /B %LOCALAPPDATA%\MSBuildStructuredLogViewer\*app*') do (set _Static_MSBuildStructuredLogViewer=%LOCALAPPDATA%\MSBuildStructuredLogViewer\%%i\StructuredLogViewer.exe)
if EXIST %_Static_MSBuildStructuredLogViewer% start %_Static_MSBuildStructuredLogViewer% %_Static_Intermediate_PreProcess%\project.binlog
