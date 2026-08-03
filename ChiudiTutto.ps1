# Elenco processi di sistema da NON toccare
$esclusi = @(
    "explorer", "powershell", "pwsh", "cmd",
    "TextInputHost", "ShellExperienceHost", "SearchHost",
    "StartMenuExperienceHost", "SystemSettings", "ApplicationFrameHost"
)

Get-Process | Where-Object {
    $_.MainWindowTitle -ne "" -and ($esclusi -notcontains $_.ProcessName)
} | ForEach-Object {
    Write-Host "Chiudo: $($_.ProcessName) - $($_.MainWindowTitle)"
    $_.CloseMainWindow() | Out-Null
}

Start-Sleep -Seconds 2
