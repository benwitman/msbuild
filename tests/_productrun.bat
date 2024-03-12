@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

echo Executing ProductBuild
%PKGDOMINO%\bxl.exe /c:%_Static_Intermediate_ProductBuildGraph%\config.dsc 
IF ERRORLEVEL 1 exit /B %ERRORLEVEL%
