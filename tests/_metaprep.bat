@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

echo Creating MetaBuild
%_Static_Artifacts_MicrosoftBuildTargetLauncher%\Microsoft.Build.TaskLauncher.exe meta %_Static_Source% %_Static_Artifacts_MsBuild%\MSBuild.exe %_Static_Intermediate_MetaBuildGraph% %_Static_Intermediate_MetaBuildOutput% 
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
