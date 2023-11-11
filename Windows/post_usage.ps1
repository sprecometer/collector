# to be started at system startup

$endpoint = "localhost:8280/computer/consumption"
$secondsInterval = 1

$ProgressPreference = 'SilentlyContinue'

while (1 -eq 1) {
    $cpuUsage = "0.$(wmic cpu get loadpercentage | Select -First 3 | Select -Last 1)".Trim()
    Write-Output $cpuUsage
    Invoke-WebRequest -Uri "http://$($endpoint)" -Method POST -Body @{cpu_usage=($cpuUsage)} | Out-Null
    Start-Sleep -Seconds $secondsInterval
}
