@echo off
set _Static_MsBuild_Args=%_Static_MsBuild_Args% /restore
IF NOT EXIST %~dp0.git mkdir %~dp0.git
echo 0000000000000000000000000000000000000000 > %~dp0.git\HEAD