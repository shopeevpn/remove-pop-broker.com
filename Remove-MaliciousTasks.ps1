# ==============================================
# Remove-MaliciousTasks.ps1
# Remove malicious tasks and autorun entries
# ==============================================

Write-Host "🛠️ Removing malicious Task Scheduler entries..." -ForegroundColor Cyan

$tasksToRemove = @(
    "\GoogleUpdateDaily",
    "\GoogleUpdateWeekly",
    "\UpdaterChromeApp",
    "\UpdaterChromeApp2"
)

foreach ($task in $tasksToRemove) {
    try {
        schtasks /Delete /TN $task /F | Out-Null
        Write-Host "✅ Removed task: $task"
    } catch {
        Write-Host "⚠️ Not found: $task"
    }
}

Write-Host "`n🧹 Cleaning Registry autorun entries..." -ForegroundColor Cyan

$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
)

foreach ($path in $regPaths) {
    Get-Item $path | Get-ItemProperty | ForEach-Object {
        $_.PSObject.Properties | ForEach-Object {
            if ($_.Value -match "pop-broker|localsys|temp_cleanup|\.ico|\.vbs") {
                Write-Host "🚫 Removing registry: $($_.Name) -> $($_.Value)"
                Remove-ItemProperty -Path $path -Name $_.Name -Force
            }
        }
    }
}

Write-Host "`n🗑️ Removing suspicious files in Temp folder..." -ForegroundColor Cyan

$tempPath = "$env:LOCALAPPDATA\Temp"
$patterns = "*.ico", "*.vbs", "*.bat"

foreach ($pattern in $patterns) {
    Get-ChildItem -Path $tempPath -Recurse -Filter $pattern -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            Remove-Item $_.FullName -Force -ErrorAction Stop
            Write-Host "🗑️ Deleted: $($_.FullName)"
        } catch {
            Write-Host "❌ Failed to delete: $($_.FullName)"
        }
    }
}

Write-Host "`n✅ Cleanup completed. Please restart your computer!" -ForegroundColor Green
