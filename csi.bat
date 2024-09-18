@echo off

if NOT EXIST %CSI% (
	echo set CSI=...
	echo This can be found in the CSI package: `C:\.tools\.nuget\packages\microsoft.net.compilers.toolset\4.11.0-3.24365.8\tasks\net472\csi.exe`
	exit /B 1
)

call %CSI% %*