$process = Get-Process gta5 -ErrorAction SilentlyContinue
if ($process) {
  & 'C:\Program Files\PSTools\pssuspend' gta5.exe
  for ($i=10; $i -gt 0; $i--) {
    Write-Host -NoNewLine $i ' '
    Start-Sleep -Seconds 1
  }
  Write-Host
  & 'C:\Program Files\PSTools\pssuspend' -r gta5.exe
  Write-Host "Hopefully, that gave you a clean public session.  Have fun!"
  Start-Sleep -Seconds 2
}
else {
  Write-Host "Cannot find process gta5.exe, sorry."
}
Remove-Variable process
