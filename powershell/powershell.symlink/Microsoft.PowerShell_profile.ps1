$profileHomes = @(
    $PSScriptRoot,
    (Join-Path $PSScriptRoot $([Environment]::OSVersion.Platform)))

if ($env:USERPROFILE) {
    $profileHomes += $env:USERPROFILE;
    $profileHomes += (Join-Path $env:USERPROFILE $([Environment]::OSVersion.Platform))
}
foreach ($profileHome in $profileHomes) {
    $profilePath = Join-Path $profileHome "profile.ps1";
    if (Test-Path $profilePath -ErrorAction SilentlyContinue) {
        $stopWatch = [System.Diagnostics.Stopwatch]::StartNew()
        . $profilePath
        Write-Host "Loading $profilePath took $($stopWatch.ElapsedMilliseconds)ms."
    }
}


Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
    Import-Module Get-ChildItemColor

    Set-Alias l Get-ChildItem -option AllScope
    Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
}
