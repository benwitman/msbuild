@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

echo Creating MetaBuild
%_Static_Artifacts_MicrosoftBuildTargetLauncher% meta %_Static_Source% %_Static_Bootstrap% %_Static_Artifacts_MsBuild% %_Static_Intermediate_MetaBuildGraph% %_Static_Intermediate_MetaBuildOutput% 
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
