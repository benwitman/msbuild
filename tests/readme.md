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
Set these vars:
```
set MSBUILD_DOTNET_REPO=<repo-root>
set MSBUILD_DOTNET_VER=<version>
```

This will do two things: 

### (1) Incorporate Private .NET SDK into MsBuild

It will cause `buildmsbuild.bat` to build `MsBuild.Bootstrap` with these properties to copy over various bits that are colocated with MsBuild (with the appopriate path and .NET install version):
```
/p:BOOTSTRAP_DOTNET_INSTALL_LOCATION=<...>artifacts\bin\redist\Debug\dotnet
/p:BOOTSTRAP_DOTNET_INSTALL_VERSION=8.0.400-dev
/p:BOOTSTRAP_MICROSOFT_DOTNET_MSBUILDSDKRESOLVER=<...>\artifacts\bin\Microsoft.DotNet.MSBuildSdkResolver\debug\net472
```

### (2) Execute Using Private .NET SDK
It will cause the test scripts here to redirect the final SDK resolution to the private directory at runtime by setting:
```
set TEST_CUSTOM_DOTNET=<...>\artifacts\bin\redist\debug\dotnet
set TEST_CUSTOM_DOTNET_VERSION=8.0.400-dev
```

which in turn sets:
```
set DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR=<sdk-dir>
set DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=<dotnet.exe-dir>
```

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
`copy-list`: single target with Copy task determining inputs/outputs automatically
`assigntargetpath-message`: single target that uses a custom task using ITaskStatic
`calltarget`: single target using special CallTarget Task to re-use another target
`ConsoleApp1`: VS .NET Framework Template
`ConsoleApp1HintPath`: VS .NET Framework Template with a Reference using a HintPath
`msbuild-task-echo`: Runs two targets, one in a recursive MsBuild task and one in the top-level MsBuild task.
`target-batch`: Target that does batching over an ItemGroup
