@echo off
if NOT DEFINED _Static_Vars_Set ((echo Must run _vars.bat first) & exit /B 1)

IF EXIST %_Static_Source%\bin rmdir /S/Q %_Static_Source%\bin
mkdir %_Static_Source%\bin

IF EXIST %_Static_Source%\obj rmdir /S/Q %_Static_Source%\obj
mkdir %_Static_Source%\obj
