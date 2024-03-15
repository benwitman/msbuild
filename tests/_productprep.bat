@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

echo Creating ProductBuild
%_Static_Artifacts_MicrosoftBuildTargetLauncher% print %_Static_Intermediate_MetaBuildOutput%\graph.json %_Static_Intermediate_ProductBuildGraph% %_Static_Intermediate_ProductBuildOutput%
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
