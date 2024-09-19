# Tests Readme
This folder is self-contained MsBuild project files used for testing things

## CSC Server
Sometimes you may not see file accesses due to VBCSCompiler.exe.
Setting UseSharedCompilation property to false disables this.

## Seting up BuildXL
You need to set an env var to point to BuildXL, this is installed via a packagereference in MsBuild's project for now.

```
set PKGDOMINO=C:\.tools\.nuget\packages\microsoft.buildxl.win-x64\0.1.0-20240825.1
```

## Using Private .NET SDK
Building MsBuild Bootstrap you can use these properties to use a custom .NET build+sdk (with the appopriate path and .NET install version):
```
/p:DOTNET_INSTALL_DIR=<...>artifacts\bin\redist\Debug\dotnet /p:DOTNET_INSTALL_VERSION=8.0.400-dev
```

You can also set this to redirect the final SDK resolution to the private directory:
```
set TEST_CUSTOM_DOTNET=<..>\artifacts\bin\redist\debug\dotnet
set TEST_CUSTOM_DOTNET_VERSION=8.0.202-dev
```

```
set MicrosoftNETBuildExtensionsTargets=C:\r\dotnet.sdk\artifacts\bin\redist\Debug\dotnet\sdk\8.0.400-dev\Microsoft\Microsoft.NET.Build.Extensions\Microsoft.NET.Build.Extensions.targets
```

Setting `/p:MSBUILD_CUSTOM_MICROSOFT_DOTNET_MSBUILDSDKRESOLVER=<...>\artifacts\bin\Microsoft.DotNet.MSBuildSdkResolver\debug\net472` during the build of `MsBuild.Bootstrap` will use  Microsoft.DotNet.MSBuildSdkResolver from the other build instead of using the one from the current MsBuild install.

## Commands
The batch files are used to interact with tests:

`msbuild`: runs regular msbuild on a test case
`msbuildbl`: runs regular msbuild on a test case with binarly logging
`msbuildpp`: runs the msbuild preprocessor on a test case
`dominobuild`: runs the test case end to end
`piplist`: gets all the pips in the test case
`piprun`: runs a pip by itself (usually found from piplist above) and usually done with `dbgonlaunchon` so you can attach
`dbgonlaunchon`: turns on debugging at boot for msbuild.exe and tasklauncher.exe usually during a `piprun`
`dbgonlaunchoff`: turns off debugging at boot (usually do this before a dominobuild to prevent a bunch of popups)
`pipbat`: generates a processrunscript (used by `piprun`)
`pipcachedump`: generates a cache dump for a pip
`dominorerunmeta`: re-runs a metabuild for a given test usually to expirement/debug the buildxl build.
`dominorerunproduct`: re-runs a productbuild for a given test usually to expirement/debug the buildxl build.

`binlog`: opens a binary log with the structured viewer.
`binlogmeta`: opens the binary log(s) from the MetaBuild with the structured viewer.

## Tests
These are the tests in increasing complexity:

`exec`: single target with single Exec and no outputs
`exec-two`: single target with two Execs and no outputs
`exec-in-out`: single target with declared input and output running an exec to do a copy
`copy-list`: single target with declared many inputs and outputs using Copy task to do the copy
`assigntargetpath-message`: single target that uses a custom task using ITaskStatic
`calltarget`: single target using special CallTarget Task to re-use another target
`ConsoleApp1`: VS .NET Framework Template
`ConsoleApp1HintPath`: VS .NET Framework Template with a Reference using a HintPath
`msbuild-task-echo`: Runs two targets, one in a recursive MsBuild task and one in the top-level MsBuild task.
`target-batch`: Target that does batching over an ItemGroup
