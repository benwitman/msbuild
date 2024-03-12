@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

IF NOT EXIST %_Static_Artifacts_MsBuild%\current mkdir %_Static_Artifacts_MsBuild%\current
copy %_Static_Artifacts_MicrosftBuildTasks%\Microsoft.Common.props %_Static_Artifacts_MsBuild%\current\Microsoft.common.props

IF NOT EXIST %_Static_Intermediate% mkdir %_Static_Intermediate%

IF EXIST %_Static_Intermediate_MetaBuildGraph% rmdir /S/Q %_Static_Intermediate_MetaBuildGraph%
mkdir %_Static_Intermediate_MetaBuildGraph%
IF EXIST %_Static_Intermediate_MetaBuildOutput% rmdir /S/Q %_Static_Intermediate_MetaBuildOutput%
mkdir %_Static_Intermediate_MetaBuildOutput%
IF EXIST %_Static_Intermediate_ProductBuildGraph% rmdir /S/Q %_Static_Intermediate_ProductBuildGraph%
mkdir %_Static_Intermediate_ProductBuildGraph%
IF EXIST %_Static_Intermediate_ProductBuildOutput% rmdir /S/Q %_Static_Intermediate_ProductBuildOutput%
mkdir %_Static_Intermediate_ProductBuildOutput%

IF EXIST %_Static_Source%\bin rmdir /S/Q %_Static_Source%\bin
IF EXIST %_Static_Source%\obj rmdir /S/Q %_Static_Source%\obj
