#r "System.IO"
#r "System.Linq"
#r "System.Text.RegularExpressions"
using System.IO;
using System.Text.RegularExpressions;
using System.Runtime.CompilerServices;
using System.Diagnostics;
using System;

private static void RunCmd(string commandline)
{
    var process = new Process(); ;
    process.StartInfo.FileName = Environment.GetEnvironmentVariable("COMSPEC");
    process.StartInfo.Arguments = $"/c {commandline}";
    process.StartInfo.CreateNoWindow = true;
    process.Start();
    process.WaitForExit();
    if (process.ExitCode != 0)
        throw new Exception($"Process failed with {process.ExitCode}");
}

private static string GetPath([CallerFilePath] string file = "") => Path.GetDirectoryName(file);

var artifacts = Path.Combine(GetPath(), @"artifacts\packages\Debug\Shipping");

var packages = Directory.GetFiles(artifacts).Where(t => t.EndsWith(".nupkg")).ToList();

var regex = new Regex(@"(?<name>.*?)\.(?<version>(?:\d+\.?){3}(?:-.*?))\.nupkg$");
foreach (var package in packages)
{
    var filename = Path.GetFileName(package);
    var match = regex.Match(filename);
    if (!match.Success)
        throw new Exception($"Failed to get name/version of {package}");

    var directory = Path.Combine(Args[0], match.Groups["name"].Value, match.Groups["version"].Value);
    Directory.CreateDirectory(directory);
    Console.WriteLine($"Publishing {filename} to {directory}");
    RunCmd($"dotnet nuget push {package} -s {Args[0]}");
}
