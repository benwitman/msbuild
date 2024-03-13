@echo off
IF "%1" == "" ((echo Usage: dominobuild [testname]) & exit /B 1)

set _Static_Vars_Set=1
set _Static_Artifacts_MsBuild=%~dp0..\artifacts\bin\MSBuild.Bootstrap\x64\Debug\net472
set _Static_Artifacts_MicrosftBuildTasks=%~dp0..\artifacts\bin\MSBuild.Bootstrap\x64\Debug\net472
set _Static_Artifacts_MicrosoftBuildTargetLauncher=%~dp0..\artifacts\bin\MSBuild.Bootstrap\x64\Debug\net472
set _Static_Intermediate=%~dp0intermediate\%1
set _Static_Intermediate_MetaBuildGraph=%_Static_Intermediate%\MetaBuildGraph
set _Static_Intermediate_MetaBuildOutput=%_Static_Intermediate%\MetaBuildOutput
set _Static_Intermediate_ProductBuildGraph=%_Static_Intermediate%\ProductBuildGraph
set _Static_Intermediate_ProductBuildOutput=%_Static_Intermediate%\ProductBuildOutput
set _Static_Intermediate_PreProcess=%~dp0intermediate\%1\PreProcess
set _Static_Source=%~dp0%1
