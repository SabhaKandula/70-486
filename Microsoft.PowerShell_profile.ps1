# this file is placed in `C:\Users\{username}\Documents\WindowsPowerShell`

Import-Module posh-git
#! the start-sshagent does seem to be working anymore - need to figure this out
# Start-SshAgent
Set-Location ~

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
