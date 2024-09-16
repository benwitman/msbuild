@echo off
setlocal
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

for /F %%i in ('dir /B %_Static_Source%\*proj') do (set _Static_Source_Project=%_Static_Source%\%%i)

%_Static_Artifacts_MsBuild% %_Static_MsBuild_Verbosity% %_Static_MsBuild_Args% %MSBUILDARGS% %_Static_Source_Project%
