param(
    [string]$ServiceName = "AG-Windows-Server6",
    [string]$DisplayName = "AG-Windows-Server6 - Portafolio1990",
    [string]$BinaryPath = "C:\vsts-agent-win-x64-3.236.0\bin\AgentService.exe",
    [string]$StartType = "Automatic"
)

# Instalar el servicio
New-Service -Name $ServiceName -BinaryPathName $BinaryPath -DisplayName $DisplayName -StartupType $StartType
