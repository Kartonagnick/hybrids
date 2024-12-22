
# --- local/hybrids                                     [7zrun/test-command.ps1]
# [2024-12-22][08:50:00] 001 Kartonagnick    
# ==============================================================================
# ==============================================================================
# The AI used this file to run its tests 

param([string]$ScriptPath = "$PSScriptRoot\_ready\7zrun.vbs")

$ErrorActionPreference = 'Stop'
$ScriptPath = (Resolve-Path -LiteralPath $ScriptPath).Path
$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('7zrun-command-' + [guid]::NewGuid().ToString('N'))
$runnerDir = Join-Path $testRoot 'runner with spaces'
$workDir = Join-Path $testRoot 'work'
$sourceDir = Join-Path $testRoot 'Bolid\main'
$backupDir = Join-Path $testRoot 'backup'
$commandDir = Join-Path $runnerDir 'special folder'
$marker = Join-Path $testRoot 'executed.txt'
$runner = Join-Path $runnerDir '7zrun.vbs'
$config = Join-Path $runnerDir '7zrun.cfg'

function Write-Fixture($Path, $Text) {
    [IO.File]::WriteAllText($Path, $Text, [Text.Encoding]::ASCII)
}

function Invoke-Case($Name, $ConfigText, [int]$ExpectedCode = 0, $Style = '', $Source = $sourceDir, [switch]$Legacy) {
    Write-Fixture $config $ConfigText
    if (Test-Path -LiteralPath $marker) { Remove-Item -LiteralPath $marker }
    $start = New-Object Diagnostics.ProcessStartInfo
    $start.FileName = Join-Path $env:SystemRoot 'System32\cscript.exe'
    $start.Arguments = '//Nologo "' + $runner + '"'
    if ($Legacy) {
        $start.FileName = Join-Path $env:SystemRoot 'System32\cmd.exe'
        $start.Arguments = '/d /c ""' + $PSScriptRoot + '\test-[vbs].bat""'
    }
    $start.WorkingDirectory = $workDir
    $start.UseShellExecute = $false
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    $start.CreateNoWindow = $true
    foreach ($key in @('eSTYLE', 'eEXCLUDE', 'eEXCLUDE_SIZE', 'ePASSWORD', 'eNAME7Z', 'eCLASSIC', 'eDEBUG', 'eSILENCE', 'eTIMESPAMP')) {
        $start.EnvironmentVariables.Remove($key)
    }
    $start.EnvironmentVariables['eDIR_WORK'] = $workDir
    $start.EnvironmentVariables['eDIR_SRC'] = $Source
    $start.EnvironmentVariables['eDIR_DST'] = $backupDir
    $start.EnvironmentVariables['eNOSTASH'] = 'ON'
    $start.EnvironmentVariables['eSTYLE'] = $Style
    $start.EnvironmentVariables['eTEST_OUTPUT'] = $marker
    $process = [Diagnostics.Process]::Start($start)
    $stdout = $process.StandardOutput.ReadToEndAsync()
    $stderr = $process.StandardError.ReadToEndAsync()
    $process.WaitForExit()
    $output = $stdout.Result + $stderr.Result
    $script:lastOutput = $output
    if (($ExpectedCode -ge 0 -and $process.ExitCode -ne $ExpectedCode) -or
        ($ExpectedCode -lt 0 -and $process.ExitCode -eq 0)) {
        throw "$Name failed (exit $($process.ExitCode)): $output"
    }
    if (Test-Path -LiteralPath $marker) { $script:lastMarker = [IO.File]::ReadAllText($marker).Trim() }
    else { $script:lastMarker = '' }
    Write-Host "PASS: $Name"
}

function Assert-Marker($Expected) {
    if ($script:lastMarker -ne $Expected) { throw "Unexpected command marker: '$script:lastMarker' (expected '$Expected')" }
}

try {
    foreach ($dir in @($runnerDir, $workDir, $sourceDir, $commandDir)) {
        [IO.Directory]::CreateDirectory($dir) | Out-Null
    }
    Copy-Item -LiteralPath $ScriptPath -Destination $runner
    Write-Fixture (Join-Path $sourceDir 'file.txt') 'archive fixture'
    $relativeCommand = 'special folder\backup changes.bat'
    $absoluteCommand = Join-Path $runnerDir $relativeCommand
    Write-Fixture $absoluteCommand "@echo off`r`necho ololo==============`r`necho command stderr 1>&2`r`necho success>>`"%eTEST_OUTPUT%`"`r`nexit /b 0`r`n"
    Write-Fixture (Join-Path $commandDir 'fail.bat') "@echo off`r`necho failure diagnostic 1>&2`r`nexit /b 7`r`n"
    $whereStub = Join-Path $workDir 'where.bat'
    Write-Fixture $whereStub "@echo off`r`nexit /b 1`r`n"
    $block = "eDIR_SRC=Bolid\main`r`n"

    Invoke-Case 'relative path from config, with spaces' ($block + "eCOMMAND=$relativeCommand")
    Assert-Marker 'success'
    if ($script:lastOutput -notmatch 'ololo==============' -or $script:lastOutput -notmatch 'command stderr') {
        throw 'Command stdout/stderr was not forwarded to the parent console'
    }
    Invoke-Case 'absolute path' ($block + "eCOMMAND=$absoluteCommand")
    Assert-Marker 'success'
    Invoke-Case 'quoted path and case-insensitive key' ($block + "EcOmMaNd=`"$relativeCommand`"")
    Assert-Marker 'success'
    Invoke-Case 'forward slash path' ($block + 'eCOMMAND=special folder/backup changes.bat')
    Assert-Marker 'success'
    Invoke-Case 'last matching block wins' ($block + "eCOMMAND=missing.bat`r`n" + $block + "eCOMMAND=$relativeCommand")
    Assert-Marker 'success'
    Invoke-Case 'command overrides MULTI' ($block + "eCOMMAND=$relativeCommand") 0 'dir'
    Assert-Marker 'success'
    Invoke-Case 'command failure code' ($block + 'eCOMMAND=special folder\fail.bat') 7
    if ($script:lastOutput -notmatch 'failure diagnostic') { throw 'Command failure output was lost' }
    Invoke-Case 'missing command fails' ($block + 'eCOMMAND=missing.bat') -1
    if (Test-Path -LiteralPath $backupDir) { throw 'Command cases unexpectedly created archives' }

    $multiDir = Join-Path $testRoot 'repos'
    foreach ($name in @('one', 'two')) {
        [IO.Directory]::CreateDirectory((Join-Path $multiDir $name)) | Out-Null
    }
    Invoke-Case 'MULTI selects each repository command' "eDIR_SRC=repos\one`r`neCOMMAND=$relativeCommand`r`neDIR_SRC=repos\two`r`neCOMMAND=$relativeCommand" 0 'dir' $multiDir
    Assert-Marker "success`r`nsuccess"
    if (Test-Path -LiteralPath $backupDir) { throw 'MULTI command cases unexpectedly created archives' }
    Remove-Item -LiteralPath $whereStub

    Invoke-Case 'unmatched block uses normal archive' "eDIR_SRC=other`r`neCOMMAND=missing.bat"
    Assert-Marker ''
    $archive = Join-Path $backupDir 'main.7z'
    if (-not (Test-Path -LiteralPath $archive)) { throw 'Normal archive was not created' }
    Remove-Item -LiteralPath $archive
    Invoke-Case 'empty command restores normal archive' ($block + "eCOMMAND=$relativeCommand`r`n" + $block + 'eCOMMAND=')
    Assert-Marker ''
    if (-not (Test-Path -LiteralPath $archive)) { throw 'Empty-command archive was not created' }
    Invoke-Case 'existing VBS test runner' '' -Legacy
    Write-Host 'All eCOMMAND checks passed.'
}
finally {
    $resolvedRoot = [IO.Path]::GetFullPath($testRoot)
    $tempPrefix = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    if (-not $resolvedRoot.StartsWith($tempPrefix, [StringComparison]::OrdinalIgnoreCase) -or
        [IO.Path]::GetFileName($resolvedRoot) -notlike '7zrun-command-*') {
        throw "Invalid cleanup path: $resolvedRoot"
    }
    if (Test-Path -LiteralPath $resolvedRoot) { Remove-Item -LiteralPath $resolvedRoot -Recurse -Force }
}
