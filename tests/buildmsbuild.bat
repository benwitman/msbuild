@echo off

if NOT "%MSBUILD_DOTNET_REPO%" == "" if NOT "%MSBUILD_DOTNET_VER%" == "" (
	echo Using Private .NET SDK %MSBUILD_DOTNET_REPO% %MSBUILD_DOTNET_VER%
	set MSBUILDARGS_DOTNET=/p:BOOTSTRAP_DOTNET_INSTALL_LOCATION=%MSBUILD_DOTNET_REPO%\artifacts\bin\redist\Debug\dotnet /p:BOOTSTRAP_DOTNET_INSTALL_VERSION=%MSBUILD_DOTNET_VER% /p:BOOTSTRAP_MICROSOFT_DOTNET_MSBUILDSDKRESOLVER=%MSBUILD_DOTNET_REPO%\artifacts\bin\Microsoft.DotNet.MSBuildSdkResolver\debug\net472
)

call %~dp0_build.bat -projects %~dp0..\src\MSBuild.Bootstrap\MSBuild.Bootstrap.csproj %MSBUILDARGS_DOTNET% %*
