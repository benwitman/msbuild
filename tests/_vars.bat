@echo off
IF "%1" == "" ((echo Usage: dominobuild [testname]) & exit /B 1)

set _Static_Bootstrap=%~dp0..\artifacts\bin\bootstrap\net472\MSBuild\Current\Bin
set _Static_Vars_Set=1
set _Static_Artifacts_MsBuild=%_Static_Bootstrap%
set _Static_Artifacts_MicrosoftBuildTargetLauncher=%_Static_Bootstrap%
set _Static_Intermediate=%~dp0intermediate\%1
set _Static_Intermediate_MetaBuildGraph=%_Static_Intermediate%\MetaBuildGraph
set _Static_Intermediate_MetaBuildOutput=%_Static_Intermediate%\MetaBuildOutput
set _Static_Intermediate_ProductBuildGraph=%_Static_Intermediate%\ProductBuildGraph
set _Static_Intermediate_ProductBuildOutput=%_Static_Intermediate%\ProductBuildOutput
set _Static_Intermediate_PreProcess=%~dp0intermediate\%1\PreProcess
set _Static_Source=%~dp0%1
