@echo off
IF "%1" == "" ((echo Usage: buildmsbuildwithdotnet dotnet-location dotnet-version) & exit /B 1)
IF "%2" == "" ((echo Usage: buildmsbuildwithdotnet dotnet-location dotnet-version) & exit /B 1)

call %~dp0buildmsbuild.bat /p:BOOTSTRAP_DOTNET_INSTALL_LOCATION=%1\artifacts\bin\redist\Debug\dotnet /p:BOOTSTRAP_DOTNET_INSTALL_VERSION=%2 /p:BOOTSTRAP_MICROSOFT_DOTNET_MSBUILDSDKRESOLVER=%1\artifacts\bin\Microsoft.DotNet.MSBuildSdkResolver\debug\net472