# Tests Readme
This folder is self-contained MsBuild project files used for testing things

## Commands
The batch files are used to interact with tests:

`dominobuild`: runs the test case end to end
`piplist`: gets all the pips in the test case
`piprun`: runs a pip by itself (usually found from piplist above) and usually done with `dbgonlaunchon` so you can attach
`dbgonlaunchon`: turns on debugging at boot for msbuild.exe and tasklauncher.exe usually during a `piprun`
`dbgonlaunchoff`: turns off debugging at boot (usually do this before a dominobuild to prevent a bunch of popups)
`pipbat`: generates a processrunscript (used by `piprun`)
`dominorerunmeta`: re-runs a metabuild for a given test usually to expirement/debug the buildxl build.
`dominorerunproduct`: re-runs a productbuild for a given test usually to expirement/debug the buildxl build.

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