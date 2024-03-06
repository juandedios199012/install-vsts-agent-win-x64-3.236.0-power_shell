# Parámetros de configuración
$AzureDevOpsOrganizationUrl = "https://dev.azure.com/Portafolio1990"
$PAT = "xx"  # Personal Access Token para autenticar con Azure DevOps
$PoolName = "SelfHostedAgentPools"
$AgentName = "AG-Windows-Server"
$AgentFolder = "C:\vsts-agent-win-x64-3.236.0"  # Carpeta donde se instalará el agente

# Descargar el agente de compilación
$url = "https://vstsagentpackage.azureedge.net/agent/3.236.0/vsts-agent-win-x64-3.236.0.zip"
$outputFile = "$AgentFolder\vsts-agent-win-x64-3.236.0.zip"
Invoke-WebRequest -Uri $url -OutFile $outputFile

# Extraer el archivo zip
Expand-Archive -Path $outputFile -DestinationPath $AgentFolder

# Configurar el agente
Set-Location -Path "$AgentFolder"
.\config.cmd --unattended --url $AzureDevOpsOrganizationUrl --auth PAT --token $PAT --pool $PoolName --agent $AgentName

# Instalar el agente como servicio de Windows llamando al archivo svc.ps1
Start-Process -FilePath "powershell.exe" -ArgumentList "-File $AgentFolder\svc.ps1" -WorkingDirectory $AgentFolder