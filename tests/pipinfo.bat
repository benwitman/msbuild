@echo off
IF "%1" == "" ((echo Usage: pipinfo [testname] [Meta^|Product] [PipNNNNNNNN]) & exit /B 1)
IF "%2" == "" ((echo Usage: pipinfo [testname] [Meta^|Product] [PipNNNNNNNN]) & exit /B 1)
IF "%3" == "" ((echo Usage: pipinfo [testname] [Meta^|Product] [PipNNNNNNNN]) & exit /B 1)

%PKGDOMINO%\bxlanalyzer.exe /m:DumpPip /pip:%3 /xl:%~dp0intermediate\%1\%2BuildGraph\Out\Logs\BuildXL.xlg /pip:%3 /o:%~dp0intermediate\%1\%2BuildGraph\%3.html
echo %~dp0intermediate\%1\%2BuildGraph\%3.html