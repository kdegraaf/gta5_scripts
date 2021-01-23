if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

Write-Host "Disabling network adapter ..."
Disable-NetAdapter -name Ethernet -Confirm:$false
Write-Host -NoNewLine "Disabled, pausing ... "

for ($i=20; $i -gt 0; $i--) {
  Write-Host -NoNewLine $i ' '
  Start-Sleep -Seconds 1
}

Write-Host "Enabling network adapter ..."
Enable-NetAdapter -name Ethernet -Confirm:$false
Write-Host "Enabled."

Start-Sleep -Seconds 2