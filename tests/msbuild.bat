@echo off
setlocal
IF "%1" == "" ((echo Usage: dominobuild [testname]) & exit /B 1)

call %~dp0_vars.bat %1
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

call %~dp0_cleanoutputs.bat
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%

%_Static_Artifacts_MsBuild%\MSBuild.exe %MSBUILDVERBOSITY% %_Static_Source%\project.proj
